#/usr/bin/env python

"""
Oscilloscope Interface

This script grabs data from the Rigol oscilloscope and saves to a file
"""

import numpy as np
from matplotlib import pyplot as plt
import datetime
import time
import os
import argparse
import usbtmc
import visa

TIMEOUT = 0.5
DATALENGTH = 16000
READWAIT = 0.150 # wait time between oscilloscope read and write, seconds
XUNIT = 's' # x-axis label
YUNIT = {1:'potential,volts',2:'potential,volts',3:'potential,volts',4:'potential,volts'} # y-units for each channel

def get_opts():
    parser = argparse.ArgumentParser(description="collects and logs data from the Rigol oscilloscope",
			    epilog="Example: python oscilloscope.py --chan 1 4 --loop")
    parser.add_argument("--chan", nargs='+', type=int, help="oscillocope channels to acquire",
                            action="store",dest="channels",required=True)
    parser.add_argument("--platform", default="visa",
                            help="platform for connecting to oscilloscope")
    parser.add_argument("--plot", help="plot the acquired waveforms as they are collected",
                            action="store_true")
    parser.add_argument("--loop", help="continuously log data",
                            action="store_true")
    parser.add_argument("--dir", type=str, default="data",
                            help="<optional> relative path to save the data")
    opts = parser.parse_args()
    print_opts(opts)
    return opts

def print_opts(opts):
    print("interfacing with: {}".format(opts.platform))
    print("acquiring channels: {}".format(opts.channels))
    if opts.plot:
        print("plotting waveforms")
    if opts.loop:
        print("continuously acquiring data")

def savedir_setup(directory):
    # path to the directory to save files
    savedir = os.path.join(os.getcwd(),directory,"oscilloscope")
    if not os.path.exists(savedir):
        print("Creating directory: {}".format(savedir))
        os.makedirs(savedir)
    return savedir

def get_oscilloscope(platform):
    if platform == 'visa':
        # create device manager object
        try:
            rm = visa.ResourceManager()
        except:
            rm = visa.ResourceManager('@py')
        # create instrument object
        # rm.list_resources()
        # chamber jet
        # instr = rm.open_resource('USB0::0x1AB1::0x04CE::DS1ZA164457681::INSTR')
        # control jet
        instr = rm.open_resource('USB0::0x1AB1::0x04CE::DS1ZA170603287::INSTR',
                                    timeout=2000, chunk_size=102400)
        print("device info: {}".format(instr.query("*IDN?")))
        print("device timeout: {}".format(instr.timeout))
        print("device chunk size: {}".format(instr.chunk_size))
    else:
        instr = usbtmc.Instrument(0x1ab1, 0x04ce)
        instr.open()
        while not (instr.timeout == TIMEOUT and instr.rigol_quirk == False):
            instr.timeout = TIMEOUT
            instr.rigol_quirk = False
        id = ''
        while not id:
            try:
                id = instr.ask("*IDN?")
            except Exception as e: # USBError
                print("{} in get_oscilloscope".format(e))
                time.sleep(1)
        print("device info: {}".format(id))
        print("device timeout: {}".format(instr.timeout))
    return instr

def read_from_channel(instr,platform,channel,preamble):
    """reads from specified oscilloscope channel;
       returns numpy array containing scaled (x,y) data"""
    instr.write(":WAV:SOUR CHAN{}".format(channel))
    ydata = []
    while len(ydata) < 1200:
        if platform == 'visa':
            ydata = instr.query_ascii_values(":WAV:DATA?",separator=wave_clean,container=np.array)
        else:
            rawdata = ''
            while len(rawdata) < DATALENGTH:
                try:
                    rawdata = instr.ask(":WAV:DATA?")
                except Exception as e:
                    print("{} in read_from_channel".format(e))
                    #read_from_channel(instr,platform,channel,preamble)
                    #capture_oscilloscope()
                    instr.write(":RUN")
                    time.sleep(0.1)
                    instr.write(":STOP")
                    #break
            ydata = np.fromstring(rawdata[11:],dtype=float,sep=',')
    xdata = generate_xdata(len(ydata),preamble)
    yscaled = ydata #wavscale(measured=ydata,pre=preamble)
    data = np.array(list(zip(xdata,yscaled)), dtype=[('x',float),('y',float)])
    return data

def plot_data(data,ylabel,fname,savedir):
    print("plotting {}.png".format(fname))
    fig = plt.figure()
    ax = fig.add_subplot(1,1,1)
    ax.plot(data['x'],data['y'],linestyle='none',marker='.',markersize=5)
    ax.set_title(fname)
    ax.set_ylabel(ylabel)
    ax.set_xlabel("time, {}".format(XUNIT))
    ax.grid(True)
    ax.get_xaxis().get_major_formatter().set_powerlimits((0, 0))
    fig.savefig(os.path.join(savedir,"{}.png".format(fname)),dpi=300)
    plt.show()
    plt.close(fig)

def save_data(data,fname,savedir):
    print("saving {}.csv".format(os.path.join(savedir,fname)))
    np.savetxt(os.path.join(savedir,"{}.csv".format(fname)),data,delimiter=',',fmt='%.5e')

def generate_xdata(points,pre):
    xincr = pre[4]
    xorig = pre[5]
    xref = pre[6]
    x = np.linspace(xorig,xincr*points,points)
    return x

#def scale_waveform(measured,pre):
#    yincr = pre[7]
#    yorig = pre[8]
#    yref = pre[9]
#    scaled = (measured - yorig - yref) * yincr
#    return measured

def preamble_clean(s):
    return filter(None, s.split('\n')[0].split(','))

def wave_clean(s):
    return filter(None, s[11:].split('\n')[0].split(','))

def instr_query(instrument, platform, msg):
    time.sleep(0.15)
    reply = ''
    while not reply:
        if platform == "visa":
            reply = instrument.query(msg)
        else:
            try:
                reply = instrument.ask(msg)
            except Exception as e:
                print("{} in instr_query".format(e))
                time.sleep(1)
    return reply

def instr_run(instrument, platform):
    setrun = False
    while not setrun:
        instrument.write(":RUN")
        status = instr_query(instrument, platform, ":TRIG:STAT?").strip()
        setrun = (status != "STOP")

def capture_oscilloscope():
    opts = get_opts()
    instr = get_oscilloscope(opts.platform)
    savedir = savedir_setup(opts.dir)

    #wavscale = np.vectorize(scale_waveform, excluded=['pre'])
    instr.write(":WAV:MODE NORMAL")
    instr.write(":WAV:FORMAT ASCII")
    instr_run(instr, opts.platform)
    run = True

    # for each channel, grab the preamble containing the oscilloscope scaling information
    # save to a dictionary for future playing!
    preambles = {}

    for channel in opts.channels:
        instr.write(":WAV:SOUR CHAN{}".format(channel))
        if (opts.platform == 'visa'):
            preamble = instr.query_ascii_values(":WAV:PRE?",separator=preamble_clean)
        else:
            instr.write(":WAV:PRE?")
            rawdata = instr.read_raw()
            preamble = np.fromstring(rawdata,dtype=float,sep=',')
        preambles[str(channel)] = preamble

    while run:
        instr.write(":STOP")
        curtime = datetime.datetime.now().strftime("%Y-%m-%d_%H%M%S.%f")
        print("current time: {}".format(curtime))
        for channel in opts.channels:
            data = read_from_channel(instr,opts.platform,channel,preambles[str(channel)])
            fname = "{}_chan{}".format(curtime,channel)
            if opts.plot:
                ylabel = YUNIT[channel]
                plot_data(data,ylabel,fname,savedir)
            save_data(data,fname,savedir)
        print("DONE.")

        instr_run(instr, opts.platform)
        run = opts.loop

if __name__ == "__main__":
    capture_oscilloscope()

