char junk;
/* http://arduino.cc/en/Hacking/LibraryTutorial */
/* http://ww1.microchip.com/downloads/en/DeviceDoc/22250A.pdf */
// Brandon: WORKS 2017-04-19

// running with 24V power supply for op amp and function generator

/* This minimal example shows how to get single-shot range
measurements from the VL6180X.
The range readings are in units of mm. */

// DEFINES
#define DEBUG false

// IMPORTS
#include <Wire.h>
#include <VL6180X.h>  // library: VL6180X proximity sensor
#include <avr/wdt.h>  // library: watchdog timer
#include <MCP4922.h>  // library: DAC
#include <SPI.h>
#include <Wire.h>

// GLOBAL VARS
VL6180X proxsensor;
//MCP4922 DAC(51,52,53,5);    // (MOSI,SCK,CS,LDAC) define Connections for MEGA_board
MCP4922 DAC_FXN(11,13,10,5);  // (MOSI,SCK,CS,LDAC) define Connections for UNO_board
MCP4922 DAC_MFC(11,13,9,5);   // (MOSI,SCK,CS,LDAC) define Connections for UNO_board
String inputString = "";         // a string to hold incoming data

const int read_num = 100;
int read_data[read_num];
float read_average = 0;
int read_index = 0;
int read_total = 0;

// GLOBAL CONSTANTS
const double SERIAL_BAUD = 38400;
const int PROXIMITY_TIMEOUT = 25;
const int LOOPDELAY = 1; // milliseconds
const int DACSTEPS = 4096;

// PINOUT
const int PIN_PHOTO_A = 0;
const int PIN_PHOTO_B = 1;
const int PIN_DAC_A = 2; 
const int PIN_DAC_B = 3;

namespace data {
  int dac_a;
  int dac_b;
  int dist;
  int photo_a;
  int photo_b;
}

namespace setpoint {
  float voltage = 0;
  float frequency = 10;
  float flowrate = 0;
}

void setup_serial() {
  // set up serial connection
  // initialize serial communication at specified baudrate
  Serial.begin(SERIAL_BAUD);
  #if DEBUG
    Serial.println();
    Serial.println();
    Serial.println("Serial connection established!");
  #endif
}

void setup_watchdog() {
  // enable the watchdog timer
  // if Arduino stops responding, auto-resets
  // Watchdog Timeouts: WDTO_{1,2,4,8}s
  // WDTO_{15,30,60,120,250,500}MS
  // http://www.megunolink.com/articles/how-to-detect-lockups-using-the-arduino-watchdog/
  #if DEBUG
    Serial.println("enabling watchdog timer...");
  #endif
  wdt_enable(WDTO_250MS);
  #if DEBUG
    Serial.println("watchdog timer enabled!");
  #endif
}

void get_serial() {
  // gets manual input from the serial port
  #if DEBUG
    Serial.println("getting serial input...");
  #endif

  boolean stringComplete = false;  // whether the string is complete

  while (Serial.available() > 0) {

    // get the new byte:
    char inChar = (char)Serial.read();
    
    #if DEBUG
      Serial.println(String(inChar));
    #endif
    
    // add it to the inputString:
    inputString += inChar;
    
    // if the incoming character is a newline, set a flag
    // so the main loop can do something about it:
    if (inChar == '\n') {
      stringComplete = true;
      break;
    }
  }

  if ( stringComplete == true && inputString.length() > 0 ) {
    // if you have a non-blank input string and it's complete...
    #if DEBUG
      Serial.print("got serial input: ");
      Serial.print(inputString);
      Serial.println();
    #endif
    // process it with your manual_input function!
    manual_input(inputString);
    inputString = "";
  }
}

void manual_input(String input) {
  // process the manual request recieved via serial
  #if DEBUG
    Serial.println("processing serial input!");
  #endif

  switch( input.charAt(0) ) {
    case 'v' :
      // you sent v,###
      setpoint::voltage = input.substring(2).toFloat();
      #if DEBUG
        Serial.println("voltage set!");
      #endif
      actuate_inputs();
      break;
  
    case 'f' :
      // you sent f,###
      setpoint::frequency = input.substring(2).toFloat();
      #if DEBUG
        Serial.println("frequency set!");
      #endif
      actuate_inputs();
      break;
      
    case 'q' :
      // you sent q,###
      setpoint::flowrate = input.substring(2).toFloat();
      #if DEBUG
        Serial.println("flowrate set!");
      #endif
      actuate_inputs();
      break;
  }
}

void actuate_inputs() {
  // actuates the system inputs via the DACs
  #if DEBUG
    Serial.println("actuating inputs...");
  #endif
  //DAC_FXN.Set(mapfloat(setpoint::voltage,0,10,0,DACSTEPS-1), mapfloat(setpoint::frequency,0,10,DACSTEPS-1,0));
  //DAC_FXN.Set(mapfloat(setpoint::voltage,0,10,((float) 6 / 10)*DACSTEPS,((float) 2 / 10)*DACSTEPS), mapfloat(setpoint::frequency,0,10,DACSTEPS-1,0));
  
  // tuned for Brandon's development setup on 24V supply:
  //DAC_FXN.Set(mapfloat(setpoint::voltage,0,10,0.96*(DACSTEPS-1),0.55*(DACSTEPS-1)), 
  //        mapfloat(setpoint::frequency,10,20,0.92*(DACSTEPS-1),0.1*(DACSTEPS-1)));

  // tuned for the control jet setup on 24V supply:
  DAC_FXN.Set(mapfloat(setpoint::voltage,0,10,0.96*(DACSTEPS-1),0.55*(DACSTEPS-1)), 
          mapfloat(setpoint::frequency,10,20,0.90*(DACSTEPS-1),0.085*(DACSTEPS-1)));
          
  DAC_MFC.Set(mapfloat(setpoint::flowrate,0,10,0,4095),0);
  
}

float mapfloat(float x, long in_min, long in_max, long out_min, long out_max)
{
 return (x - in_min) * ((float)out_max - out_min) / ((float)in_max - in_min) + out_min;
}

void addRead(int value)
{
  read_total = read_total - read_data[read_index];
  read_data[read_index] = value;
  read_total = read_total + read_data[read_index];
  read_average = ((float)read_total) / read_num;
  read_index++;
  if (read_index >= read_num)
  {
    read_index = 0;
  }
}


void setup()
{
  setup_serial();
  setup_watchdog();
  SPI.begin();
  Wire.begin();

  // set up VL6180X sensor
  proxsensor.init();
  proxsensor.configureDefault();
  proxsensor.setTimeout(PROXIMITY_TIMEOUT);

  actuate_inputs();
}

void loop()
{
  // reset the watchdog timer
  // if this doesn't occur within WDTO_X, system resets
  wdt_reset();
  
  if (Serial.available() > 0) {
    #if DEBUG
      Serial.println("bytes available: " + String(Serial.available()));
    #endif
    get_serial();
  }
  
  // read and save data from sensors
  data::dac_a = analogRead(PIN_DAC_A);
  data::dac_b = analogRead(PIN_DAC_B);
  data::photo_a = analogRead(PIN_PHOTO_A);
  data::photo_b = analogRead(PIN_PHOTO_B);

  
  // read VL6180X distance and add to averaging array
  data::dist = proxsensor.readRangeSingleMillimeters();
  //addRead(data::dist);
  
  Serial.print(millis());
  Serial.print(",\t");
  Serial.print(setpoint::voltage);
  Serial.print(",\t");
  Serial.print(setpoint::frequency);
  Serial.print(",\t");
  Serial.print(setpoint::flowrate);
  Serial.print(",\t");
  Serial.print(data::dist); // print distance
  Serial.print(",\t");
  Serial.print(data::photo_a); // print optical intensity
  Serial.print(",\t");
  Serial.print(data::photo_b); // print optical intensity
  Serial.print(",\t");
  if (proxsensor.timeoutOccurred()) { Serial.print(" TIMEOUT"); }
  Serial.println();
  delay(LOOPDELAY);
}

