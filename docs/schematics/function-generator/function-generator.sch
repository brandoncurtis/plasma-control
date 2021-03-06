EESchema Schematic File Version 2
LIBS:74xgxx
LIBS:74xx
LIBS:ac-dc
LIBS:actel
LIBS:adc-dac
LIBS:allegro
LIBS:Altera
LIBS:analog_devices
LIBS:analog_switches
LIBS:atmel
LIBS:audio
LIBS:battery_management
LIBS:bbd
LIBS:bc
LIBS:bosch
LIBS:brooktre
LIBS:cmos4000
LIBS:cmos_ieee
LIBS:conn
LIBS:contrib
LIBS:cypress
LIBS:dc-dc
LIBS:device
LIBS:digital-audio
LIBS:diode
LIBS:display
LIBS:dsp
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:infineon
LIBS:intel
LIBS:interface
LIBS:intersil
LIBS:ir
LIBS:Lattice
LIBS:leds
LIBS:LEM
LIBS:linear
LIBS:logo
LIBS:maxim
LIBS:mechanical
LIBS:memory
LIBS:microchip
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic24mcu
LIBS:microchip_pic32mcu
LIBS:microcontrollers
LIBS:modules
LIBS:motor_drivers
LIBS:motorola
LIBS:motors
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:opto
LIBS:Oscillators
LIBS:philips
LIBS:power
LIBS:powerint
LIBS:Power_Management
LIBS:pspice
LIBS:references
LIBS:regul
LIBS:relays
LIBS:rfcom
LIBS:RFSolutions
LIBS:sensors
LIBS:silabs
LIBS:siliconi
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:texas
LIBS:transf
LIBS:transistors
LIBS:triac_thyristor
LIBS:ttl_ieee
LIBS:valves
LIBS:video
LIBS:wiznet
LIBS:Worldsemi
LIBS:Xicor
LIBS:xilinx
LIBS:zetex
LIBS:Zilog
LIBS:EXAR
LIBS:function-generator-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L XR2206 U?
U 1 1 591CE9A9
P 4650 5200
F 0 "U?" H 5170 5870 60  0000 C CNN
F 1 "XR2206" H 5000 5970 60  0000 C CNN
F 2 "" H 4650 5200 60  0000 C CNN
F 3 "" H 4650 5200 60  0000 C CNN
	1    4650 5200
	1    0    0    -1  
$EndComp
$Comp
L MCP4922 U?
U 1 1 5936F944
P 2350 3250
F 0 "U?" H 1950 3650 50  0000 L CNN
F 1 "MCP4922" H 2500 3650 50  0000 L CNN
F 2 "" H 2350 3250 50  0001 C CIN
F 3 "" H 2350 3250 50  0001 C CNN
	1    2350 3250
	-1   0    0    1   
$EndComp
$Comp
L 4066 U?
U 1 1 5936FB83
P 6750 2225
F 0 "U?" H 6950 2076 50  0000 C CNN
F 1 "4066" H 6950 2375 50  0000 C CNN
F 2 "" H 6750 2225 60  0001 C CNN
F 3 "" H 6750 2225 60  0001 C CNN
	1    6750 2225
	1    0    0    -1  
$EndComp
$Comp
L LM339 U?
U 1 1 5936FB85
P 6025 2375
F 0 "U?" H 6025 2575 50  0000 L CNN
F 1 "LM339" H 6025 2175 50  0000 L CNN
F 2 "" H 5975 2475 50  0001 C CNN
F 3 "" H 6075 2575 50  0001 C CNN
	1    6025 2375
	1    0    0    -1  
$EndComp
$Comp
L LM339 U?
U 1 1 5936FB86
P 6025 3125
F 0 "U?" H 6025 3325 50  0000 L CNN
F 1 "LM339" H 6025 2925 50  0000 L CNN
F 2 "" H 5975 3225 50  0001 C CNN
F 3 "" H 6075 3325 50  0001 C CNN
	1    6025 3125
	1    0    0    -1  
$EndComp
$Comp
L Arduino_UNO_R3 A?
U 1 1 5936FB87
P 4425 2325
F 0 "A?" H 4225 3375 50  0000 R CNN
F 1 "Arduino_UNO_R3" H 4225 3275 50  0000 R CNN
F 2 "Modules:Arduino_UNO_R3" H 4575 1275 50  0001 L CNN
F 3 "" H 4225 3375 50  0001 C CNN
	1    4425 2325
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR?
U 1 1 5936FB88
P 5450 1425
F 0 "#PWR?" H 5450 1275 50  0001 C CNN
F 1 "+9V" H 5450 1565 50  0000 C CNN
F 2 "" H 5450 1425 50  0001 C CNN
F 3 "" H 5450 1425 50  0001 C CNN
	1    5450 1425
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5936FB89
P 5450 2125
F 0 "#PWR?" H 5450 1875 50  0001 C CNN
F 1 "GND" H 5450 1975 50  0000 C CNN
F 2 "" H 5450 2125 50  0001 C CNN
F 3 "" H 5450 2125 50  0001 C CNN
	1    5450 2125
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR?
U 1 1 5936FB8C
P 5925 2075
F 0 "#PWR?" H 5925 1925 50  0001 C CNN
F 1 "+9V" H 5925 2215 50  0000 C CNN
F 2 "" H 5925 2075 50  0001 C CNN
F 3 "" H 5925 2075 50  0001 C CNN
	1    5925 2075
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR?
U 1 1 5936FB8D
P 5725 2825
F 0 "#PWR?" H 5725 2675 50  0001 C CNN
F 1 "+9V" H 5725 2965 50  0000 C CNN
F 2 "" H 5725 2825 50  0001 C CNN
F 3 "" H 5725 2825 50  0001 C CNN
	1    5725 2825
	1    0    0    -1  
$EndComp
$Comp
L -9V #PWR?
U 1 1 5936FB8E
P 5925 3425
F 0 "#PWR?" H 5925 3275 50  0001 C CNN
F 1 "-9V" H 5925 3565 50  0000 C CNN
F 2 "" H 5925 3425 50  0001 C CNN
F 3 "" H 5925 3425 50  0001 C CNN
	1    5925 3425
	-1   0    0    1   
$EndComp
$Comp
L -9V #PWR?
U 1 1 5936FB8F
P 6075 2675
F 0 "#PWR?" H 6075 2525 50  0001 C CNN
F 1 "-9V" H 6075 2815 50  0000 C CNN
F 2 "" H 6075 2675 50  0001 C CNN
F 3 "" H 6075 2675 50  0001 C CNN
	1    6075 2675
	-1   0    0    1   
$EndComp
Text GLabel 7325 2625 2    60   Output ~ 0
AMP_IN
Entry Wire Line
	3600 2825 3700 2925
Entry Wire Line
	3600 2725 3700 2825
Entry Wire Line
	3600 2925 3700 3025
Entry Wire Line
	3600 2625 3700 2725
Text Label 3700 2725 0    60   ~ 0
cs1
Text Label 3700 2625 0    60   ~ 0
cs2
Text Label 3700 2825 0    60   ~ 0
mosi
Text Label 3700 2925 0    60   ~ 0
miso
Text Label 3700 3025 0    60   ~ 0
sck
Text Label 2950 3250 0    60   ~ 0
cs1
Text Label 2950 3350 0    60   ~ 0
sck
Text Label 2950 3450 0    60   ~ 0
mosi
$Comp
L GND #PWR?
U 1 1 59372688
P 3375 3150
F 0 "#PWR?" H 3375 2900 50  0001 C CNN
F 1 "GND" H 3375 3000 50  0000 C CNN
F 2 "" H 3375 3150 50  0001 C CNN
F 3 "" H 3375 3150 50  0001 C CNN
	1    3375 3150
	1    0    0    -1  
$EndComp
Entry Wire Line
	3200 3250 3300 3350
Entry Wire Line
	3200 3350 3300 3450
Entry Wire Line
	3200 3450 3300 3550
$Comp
L GND #PWR?
U 1 1 59372DC9
P 4525 3550
F 0 "#PWR?" H 4525 3300 50  0001 C CNN
F 1 "GND" H 4525 3400 50  0000 C CNN
F 2 "" H 4525 3550 50  0001 C CNN
F 3 "" H 4525 3550 50  0001 C CNN
	1    4525 3550
	1    0    0    -1  
$EndComp
Entry Wire Line
	3600 2525 3700 2625
$Comp
L C C?
U 1 1 593746D0
P 5450 5000
F 0 "C?" V 5525 5050 50  0000 L CNN
F 1 "1µF" V 5525 4800 50  0000 L CNN
F 2 "" H 5488 4850 50  0001 C CNN
F 3 "" H 5450 5000 50  0001 C CNN
	1    5450 5000
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 59375633
P 4650 5950
F 0 "#PWR?" H 4650 5700 50  0001 C CNN
F 1 "GND" H 4650 5800 50  0000 C CNN
F 2 "" H 4650 5950 50  0001 C CNN
F 3 "" H 4650 5950 50  0001 C CNN
	1    4650 5950
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR?
U 1 1 59375656
P 4650 4300
F 0 "#PWR?" H 4650 4150 50  0001 C CNN
F 1 "+24V" H 4650 4440 50  0000 C CNN
F 2 "" H 4650 4300 50  0001 C CNN
F 3 "" H 4650 4300 50  0001 C CNN
	1    4650 4300
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 593756DC
P 5350 4550
F 0 "R?" V 5425 4550 50  0000 C CNN
F 1 "15k" V 5350 4550 50  0000 C CNN
F 2 "" V 5280 4550 50  0001 C CNN
F 3 "" H 5350 4550 50  0001 C CNN
	1    5350 4550
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 59375980
P 5450 5650
F 0 "C?" H 5475 5750 50  0000 L CNN
F 1 "1µF" H 5475 5550 50  0000 L CNN
F 2 "" H 5488 5500 50  0001 C CNN
F 3 "" H 5450 5650 50  0001 C CNN
	1    5450 5650
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 59375F96
P 3750 5400
F 0 "R?" V 3700 5175 50  0000 C CNN
F 1 "150" V 3750 5400 50  0000 C CNN
F 2 "" V 3680 5400 50  0001 C CNN
F 3 "" H 3750 5400 50  0001 C CNN
	1    3750 5400
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 59376126
P 3700 4650
F 0 "C?" H 3725 4750 50  0000 L CNN
F 1 "10nF" H 3725 4550 50  0000 L CNN
F 2 "" H 3738 4500 50  0001 C CNN
F 3 "" H 3700 4650 50  0001 C CNN
	1    3700 4650
	1    0    0    -1  
$EndComp
NoConn ~ 4100 5100
NoConn ~ 4100 5200
$Comp
L R R?
U 1 1 59376492
P 3225 4850
F 0 "R?" V 3305 4850 50  0000 C CNN
F 1 "6.8k" V 3225 4850 50  0000 C CNN
F 2 "" V 3155 4850 50  0001 C CNN
F 3 "" H 3225 4850 50  0001 C CNN
	1    3225 4850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 593764DB
P 3225 4700
F 0 "#PWR?" H 3225 4450 50  0001 C CNN
F 1 "GND" H 3225 4550 50  0000 C CNN
F 2 "" H 3225 4700 50  0001 C CNN
F 3 "" H 3225 4700 50  0001 C CNN
	1    3225 4700
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 59376594
P 2950 5000
F 0 "R?" V 3030 5000 50  0000 C CNN
F 1 "12k" V 2950 5000 50  0000 C CNN
F 2 "" V 2880 5000 50  0001 C CNN
F 3 "" H 2950 5000 50  0001 C CNN
	1    2950 5000
	0    1    1    0   
$EndComp
NoConn ~ 4100 5600
NoConn ~ 4100 5700
$Comp
L R R?
U 1 1 59377318
P 5950 5200
F 0 "R?" V 6030 5200 50  0000 C CNN
F 1 "6.8k" V 5950 5200 50  0000 C CNN
F 2 "" V 5880 5200 50  0001 C CNN
F 3 "" H 5950 5200 50  0001 C CNN
	1    5950 5200
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 59377492
P 5950 5550
F 0 "R?" V 6030 5550 50  0000 C CNN
F 1 "6.8k" V 5950 5550 50  0000 C CNN
F 2 "" V 5880 5550 50  0001 C CNN
F 3 "" H 5950 5550 50  0001 C CNN
	1    5950 5550
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5937783E
P 5725 5375
F 0 "R?" V 5805 5375 50  0000 C CNN
F 1 "100k" V 5725 5375 50  0000 C CNN
F 2 "" V 5655 5375 50  0001 C CNN
F 3 "" H 5725 5375 50  0001 C CNN
	1    5725 5375
	0    1    1    0   
$EndComp
$Comp
L OPA340P U?
U 1 1 59378A02
P 1050 4225
F 0 "U?" H 1050 4475 50  0000 L CNN
F 1 "OPA340P" H 1050 4375 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 1050 4075 50  0001 L CNN
F 3 "" H 1200 4375 50  0001 C CNN
	1    1050 4225
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 59378E94
P 1425 4375
F 0 "R?" V 1505 4375 50  0000 C CNN
F 1 "150k" V 1425 4375 50  0000 C CNN
F 2 "" V 1355 4375 50  0001 C CNN
F 3 "" H 1425 4375 50  0001 C CNN
	1    1425 4375
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 593791C3
P 750 4750
F 0 "R?" V 830 4750 50  0000 C CNN
F 1 "100k" V 750 4750 50  0000 C CNN
F 2 "" V 680 4750 50  0001 C CNN
F 3 "" H 750 4750 50  0001 C CNN
	1    750  4750
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR?
U 1 1 59379919
P 950 3875
F 0 "#PWR?" H 950 3725 50  0001 C CNN
F 1 "+9V" H 950 4015 50  0000 C CNN
F 2 "" H 950 3875 50  0001 C CNN
F 3 "" H 950 3875 50  0001 C CNN
	1    950  3875
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 593799D2
P 950 4950
F 0 "#PWR?" H 950 4700 50  0001 C CNN
F 1 "GND" H 950 4800 50  0000 C CNN
F 2 "" H 950 4950 50  0001 C CNN
F 3 "" H 950 4950 50  0001 C CNN
	1    950  4950
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR?
U 1 1 5937A35D
P 4325 1325
F 0 "#PWR?" H 4325 1175 50  0001 C CNN
F 1 "+9V" H 4325 1465 50  0000 C CNN
F 2 "" H 4325 1325 50  0001 C CNN
F 3 "" H 4325 1325 50  0001 C CNN
	1    4325 1325
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 2225 7150 2225
Wire Wire Line
	7150 2225 7150 2975
Wire Wire Line
	7150 2975 7050 2975
Wire Wire Line
	7325 2625 7150 2625
Connection ~ 7150 2625
Wire Wire Line
	3925 1925 3750 1925
Wire Wire Line
	3750 1925 3750 3800
Wire Wire Line
	5625 2275 5625 3800
Wire Wire Line
	5625 2275 5725 2275
Wire Wire Line
	5725 3225 5625 3225
Connection ~ 5625 3225
Wire Wire Line
	5450 1725 5450 1825
Wire Wire Line
	5450 1750 5350 1750
Wire Wire Line
	5350 1750 5350 3025
Connection ~ 5450 1750
Wire Wire Line
	5350 3025 5725 3025
Wire Wire Line
	5725 2475 5350 2475
Connection ~ 5350 2475
Wire Wire Line
	5725 2825 5925 2825
Wire Wire Line
	5925 2675 6075 2675
Wire Wire Line
	2250 3800 2250 3750
Wire Wire Line
	2450 3800 2450 3750
Connection ~ 2250 3800
Connection ~ 2450 3800
Wire Wire Line
	3700 2725 3925 2725
Wire Wire Line
	3700 2825 3925 2825
Wire Wire Line
	3700 2925 3925 2925
Wire Wire Line
	3700 3025 3925 3025
Wire Wire Line
	3700 2625 3925 2625
Wire Wire Line
	2950 3450 3200 3450
Wire Wire Line
	2950 3350 3200 3350
Wire Wire Line
	2950 3250 3200 3250
Wire Wire Line
	2950 3150 3375 3150
Wire Wire Line
	2450 2750 3300 2750
Wire Wire Line
	3300 2750 3300 3150
Connection ~ 3300 3150
Wire Wire Line
	3500 3050 2950 3050
Wire Wire Line
	3500 3800 3500 1150
Wire Wire Line
	4325 3500 4325 3425
Wire Wire Line
	4525 3425 4525 3550
Wire Wire Line
	4425 3500 4425 3425
Connection ~ 4525 3500
Wire Wire Line
	4325 3500 4525 3500
Connection ~ 4425 3500
Wire Bus Line
	3300 3350 3300 3600
Wire Bus Line
	3300 3600 3600 3600
Wire Bus Line
	3600 3600 3600 2525
Wire Wire Line
	5625 3800 3750 3800
Wire Wire Line
	2250 3800 3500 3800
Wire Wire Line
	3500 1150 4625 1150
Wire Wire Line
	4625 1150 4625 1325
Connection ~ 3500 3050
Wire Wire Line
	2250 2750 2250 2650
Wire Wire Line
	2250 2650 3500 2650
Connection ~ 3500 2650
Wire Wire Line
	3600 5400 3600 5500
Wire Wire Line
	3600 5500 4100 5500
Wire Wire Line
	4650 4300 4650 4400
Wire Wire Line
	5300 4700 5350 4700
Wire Wire Line
	5350 4400 5350 4350
Wire Wire Line
	4650 4350 5950 4350
Connection ~ 4650 4350
Wire Wire Line
	5200 5500 5450 5500
Wire Wire Line
	3900 5400 4100 5400
Wire Wire Line
	3700 4800 4100 4800
Wire Wire Line
	4100 4700 4100 4500
Wire Wire Line
	4100 4500 3700 4500
Wire Wire Line
	750  3050 1750 3050
Wire Wire Line
	3100 5000 4100 5000
Connection ~ 3225 5000
Wire Wire Line
	4100 5300 1625 5300
Wire Wire Line
	1750 3450 1750 5000
Wire Wire Line
	1750 5000 2800 5000
Wire Wire Line
	4650 5900 4650 5950
Wire Wire Line
	4650 5950 5950 5950
Wire Wire Line
	5450 5950 5450 5800
Wire Wire Line
	5950 5400 5950 5350
Wire Wire Line
	5875 5375 5950 5375
Connection ~ 5950 5375
Connection ~ 5350 4350
Wire Wire Line
	5300 5375 5575 5375
Wire Wire Line
	5950 4350 5950 5050
Wire Wire Line
	5300 5375 5300 5100
Wire Wire Line
	5950 5950 5950 5700
Connection ~ 5450 5950
Wire Wire Line
	1350 4225 1625 4225
Wire Wire Line
	1425 4525 1425 4600
Wire Wire Line
	1425 4600 750  4600
Wire Wire Line
	750  4600 750  4325
Wire Wire Line
	750  3050 750  4125
Wire Wire Line
	1625 4225 1625 5300
Connection ~ 1425 4225
Wire Wire Line
	950  3925 950  3875
Wire Wire Line
	950  4950 950  4525
Wire Wire Line
	750  4900 950  4900
Connection ~ 950  4900
$Comp
L 4066 U?
U 1 1 5936FB84
P 6750 2975
F 0 "U?" H 6950 2826 50  0000 C CNN
F 1 "4066" H 6950 3125 50  0000 C CNN
F 2 "" H 6750 2975 60  0001 C CNN
F 3 "" H 6750 2975 60  0001 C CNN
	1    6750 2975
	1    0    0    -1  
$EndComp
Wire Wire Line
	6325 2375 6450 2375
Wire Wire Line
	6325 3125 6450 3125
Wire Wire Line
	6450 2975 6375 2975
Wire Wire Line
	6375 2225 6375 5000
Wire Wire Line
	6375 2225 6450 2225
Wire Wire Line
	6375 5000 5600 5000
Connection ~ 6375 2975
$Comp
L +9V #PWR?
U 1 1 5937AD08
P 6750 1975
F 0 "#PWR?" H 6750 1825 50  0001 C CNN
F 1 "+9V" H 6750 2115 50  0000 C CNN
F 2 "" H 6750 1975 50  0001 C CNN
F 3 "" H 6750 1975 50  0001 C CNN
	1    6750 1975
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR?
U 1 1 5937AD48
P 6750 2725
F 0 "#PWR?" H 6750 2575 50  0001 C CNN
F 1 "+9V" H 6750 2865 50  0000 C CNN
F 2 "" H 6750 2725 50  0001 C CNN
F 3 "" H 6750 2725 50  0001 C CNN
	1    6750 2725
	1    0    0    -1  
$EndComp
$Comp
L -9V #PWR?
U 1 1 5937AD88
P 6750 3225
F 0 "#PWR?" H 6750 3075 50  0001 C CNN
F 1 "-9V" H 6750 3365 50  0000 C CNN
F 2 "" H 6750 3225 50  0001 C CNN
F 3 "" H 6750 3225 50  0001 C CNN
	1    6750 3225
	-1   0    0    1   
$EndComp
$Comp
L -9V #PWR?
U 1 1 5937AE58
P 6925 2475
F 0 "#PWR?" H 6925 2325 50  0001 C CNN
F 1 "-9V" H 6925 2615 50  0000 C CNN
F 2 "" H 6925 2475 50  0001 C CNN
F 3 "" H 6925 2475 50  0001 C CNN
	1    6925 2475
	-1   0    0    1   
$EndComp
Wire Wire Line
	6750 2475 6925 2475
$Comp
L R R?
U 1 1 5937B0A8
P 5450 1975
F 0 "R?" V 5530 1975 50  0000 C CNN
F 1 "8.2k" V 5450 1975 50  0000 C CNN
F 2 "" V 5380 1975 50  0001 C CNN
F 3 "" H 5450 1975 50  0001 C CNN
	1    5450 1975
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5937B191
P 5450 1575
F 0 "R?" V 5530 1575 50  0000 C CNN
F 1 "2.2k" V 5450 1575 50  0000 C CNN
F 2 "" V 5380 1575 50  0001 C CNN
F 3 "" H 5450 1575 50  0001 C CNN
	1    5450 1575
	1    0    0    -1  
$EndComp
$EndSCHEMATC
