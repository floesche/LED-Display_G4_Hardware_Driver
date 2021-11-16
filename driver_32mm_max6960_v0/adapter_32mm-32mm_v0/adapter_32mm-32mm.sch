EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "12 apr 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 7700 2050 0    60   ~ 0
ROW8
Text Label 7700 1900 0    60   ~ 0
ROW7
Text Label 7700 1750 0    60   ~ 0
ROW6
Text Label 7700 1600 0    60   ~ 0
ROW5
Text Label 7700 1450 0    60   ~ 0
ROW4
Text Label 7700 1300 0    60   ~ 0
ROW3
Text Label 7700 1150 0    60   ~ 0
ROW2
Text Label 7700 1000 0    60   ~ 0
ROW1
Text Label 5300 2050 2    60   ~ 0
COL8
Text Label 5300 1900 2    60   ~ 0
COL7
Text Label 5300 1750 2    60   ~ 0
COL6
Text Label 5300 1600 2    60   ~ 0
COL5
Text Label 5300 1450 2    60   ~ 0
COL4
Text Label 5300 1300 2    60   ~ 0
COL3
Text Label 5300 1150 2    60   ~ 0
COL2
Text Label 5300 1000 2    60   ~ 0
COL1
Wire Wire Line
	7700 2050 7150 2050
Wire Wire Line
	7150 2050 7150 1700
Wire Wire Line
	7150 1700 6750 1700
Wire Wire Line
	7700 1750 7250 1750
Wire Wire Line
	7250 1750 7250 1500
Wire Wire Line
	7250 1500 6750 1500
Wire Wire Line
	7700 1450 7350 1450
Wire Wire Line
	7350 1450 7350 1300
Wire Wire Line
	7350 1300 6750 1300
Wire Wire Line
	7700 1150 7450 1150
Wire Wire Line
	7450 1150 7450 1100
Wire Wire Line
	7450 1100 6750 1100
Wire Wire Line
	5300 2050 5850 2050
Wire Wire Line
	5850 2050 5850 1700
Wire Wire Line
	5850 1700 6250 1700
Wire Wire Line
	5300 1750 5750 1750
Wire Wire Line
	5750 1750 5750 1500
Wire Wire Line
	5750 1500 6250 1500
Wire Wire Line
	5300 1450 5650 1450
Wire Wire Line
	5650 1450 5650 1300
Wire Wire Line
	5650 1300 6250 1300
Wire Wire Line
	5300 1150 5550 1150
Wire Wire Line
	5550 1150 5550 1100
Wire Wire Line
	5550 1100 6250 1100
Wire Wire Line
	3300 2050 3750 2050
Wire Wire Line
	3300 1750 3750 1750
Wire Wire Line
	3300 1450 3750 1450
Wire Wire Line
	3300 1150 3750 1150
Wire Wire Line
	1950 2050 1550 2050
Wire Wire Line
	1950 1750 1550 1750
Wire Wire Line
	1950 1450 1550 1450
Wire Wire Line
	1950 1150 1550 1150
Wire Wire Line
	1950 1000 1550 1000
Wire Wire Line
	1950 1300 1550 1300
Wire Wire Line
	1950 1600 1550 1600
Wire Wire Line
	1950 1900 1550 1900
Wire Wire Line
	3300 1300 3750 1300
Wire Wire Line
	3300 1600 3750 1600
Wire Wire Line
	3300 1900 3750 1900
Wire Wire Line
	3300 1000 3750 1000
Wire Wire Line
	6250 1000 5300 1000
Wire Wire Line
	6250 1200 5600 1200
Wire Wire Line
	5600 1200 5600 1300
Wire Wire Line
	5600 1300 5300 1300
Wire Wire Line
	6250 1400 5700 1400
Wire Wire Line
	5700 1400 5700 1600
Wire Wire Line
	5700 1600 5300 1600
Wire Wire Line
	6250 1600 5800 1600
Wire Wire Line
	5800 1600 5800 1900
Wire Wire Line
	5800 1900 5300 1900
Wire Wire Line
	6750 1000 7700 1000
Wire Wire Line
	6750 1200 7400 1200
Wire Wire Line
	7400 1200 7400 1300
Wire Wire Line
	7400 1300 7700 1300
Wire Wire Line
	6750 1400 7300 1400
Wire Wire Line
	7300 1400 7300 1600
Wire Wire Line
	7300 1600 7700 1600
Wire Wire Line
	6750 1600 7200 1600
Wire Wire Line
	7200 1600 7200 1900
Wire Wire Line
	7200 1900 7700 1900
Text Label 3750 2050 0    60   ~ 0
ROW8
Text Label 3750 1900 0    60   ~ 0
ROW7
Text Label 3750 1750 0    60   ~ 0
ROW6
Text Label 3750 1600 0    60   ~ 0
ROW5
Text Label 3750 1450 0    60   ~ 0
ROW4
Text Label 3750 1300 0    60   ~ 0
ROW3
Text Label 3750 1150 0    60   ~ 0
ROW2
Text Label 3750 1000 0    60   ~ 0
ROW1
Text Label 1550 2050 2    60   ~ 0
COL8
Text Label 1550 1900 2    60   ~ 0
COL7
Text Label 1550 1750 2    60   ~ 0
COL6
Text Label 1550 1600 2    60   ~ 0
COL5
Text Label 1550 1450 2    60   ~ 0
COL4
Text Label 1550 1300 2    60   ~ 0
COL3
Text Label 1550 1150 2    60   ~ 0
COL2
Text Label 1550 1000 2    60   ~ 0
COL1
$Comp
L Connector_Generic:Conn_02x08_Odd_Even P1
U 1 1 516833F3
P 6450 1300
F 0 "P1" H 6450 1750 60  0000 C CNN
F 1 "CONN_8X2" V 6450 1300 50  0000 C CNN
F 2 "" H 6450 1300 50  0001 C CNN
F 3 "" H 6450 1300 50  0001 C CNN
	1    6450 1300
	1    0    0    -1  
$EndComp
$Comp
L led-matrix-8x8:LED-MATRIX-8X8 M1
U 1 1 516833D2
P 2650 1500
F 0 "M1" H 2350 2200 60  0000 C CNN
F 1 "LED-MATRIX-8X8" H 2650 750 60  0000 C CNN
F 2 "" H 2650 1500 50  0001 C CNN
F 3 "" H 2650 1500 50  0001 C CNN
	1    2650 1500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
