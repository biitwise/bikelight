EESchema Schematic File Version 4
LIBS:Bikelight-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Rovenso:AL8860WT IC4
U 1 1 5BAFFBD7
P 10200 4950
F 0 "IC4" H 10200 4650 60  0000 C CNN
F 1 "AL8860WT" H 10200 5250 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 10200 4950 60  0001 C CNN
F 3 "" H 10200 4950 60  0001 C CNN
	1    10200 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 5BAFFC4A
P 10800 4950
F 0 "R13" V 10880 4950 50  0000 C CNN
F 1 "0.58" V 10800 4950 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10730 4950 50  0001 C CNN
F 3 "" H 10800 4950 50  0001 C CNN
	1    10800 4950
	-1   0    0    1   
$EndComp
$Comp
L Device:C C9
U 1 1 5BAFFCC3
P 8750 4950
F 0 "C9" H 8775 5050 50  0000 L CNN
F 1 "4u7" H 8775 4850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8788 4800 50  0001 C CNN
F 3 "" H 8750 4950 50  0001 C CNN
	1    8750 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D8
U 1 1 5BAFFE50
P 10200 4400
F 0 "D8" H 10200 4500 50  0000 C CNN
F 1 "D_Schottky" H 10200 4300 50  0000 C CNN
F 2 "Diodes_SMD:D_SMA_Handsoldering" H 10200 4400 50  0001 C CNN
F 3 "" H 10200 4400 50  0001 C CNN
	1    10200 4400
	-1   0    0    1   
$EndComp
$Comp
L Bikelight-rescue:Screw_Terminal_1x02 J1
U 1 1 5BB000FB
P 800 5050
F 0 "J1" H 800 5300 50  0000 C TNN
F 1 "Screw_Terminal_1x02" V 650 5050 50  0000 C TNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 800 4825 50  0001 C CNN
F 3 "" H 775 5050 50  0001 C CNN
	1    800  5050
	1    0    0    1   
$EndComp
$Comp
L Bikelight-rescue:Screw_Terminal_1x02 J4
U 1 1 5BB00149
P 11000 5400
F 0 "J4" H 11000 5650 50  0000 C TNN
F 1 "Screw_Terminal_1x02" V 10850 5400 50  0000 C TNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 11000 5175 50  0001 C CNN
F 3 "" H 10975 5400 50  0001 C CNN
	1    11000 5400
	-1   0    0    -1  
$EndComp
$Comp
L Bikelight-rescue:D_Bridge_+-AA D5
U 1 1 5BB00D8C
P 8250 4950
F 0 "D5" H 8300 5225 50  0000 L CNN
F 1 "D_Bridge_+-AA" H 8300 5150 50  0000 L CNN
F 2 "Diodes_SMD:Diode_Bridge_DFS" H 8250 4950 50  0001 C CNN
F 3 "" H 8250 4950 50  0001 C CNN
	1    8250 4950
	0    -1   -1   0   
$EndComp
$Comp
L Device:L_Core_Ferrite L3
U 1 1 5BB011B7
P 10300 5500
F 0 "L3" V 10250 5500 50  0000 C CNN
F 1 "100uH" V 10410 5500 50  0000 C CNN
F 2 "Inductors_SMD:L_12x12mm_h8mm" H 10300 5500 50  0001 C CNN
F 3 "" H 10300 5500 50  0001 C CNN
	1    10300 5500
	0    1    1    0   
$EndComp
$Comp
L Device:C C10
U 1 1 5BB013C6
P 8950 4950
F 0 "C10" H 8975 5050 50  0000 L CNN
F 1 "4u7" H 8975 4850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8988 4800 50  0001 C CNN
F 3 "" H 8950 4950 50  0001 C CNN
	1    8950 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5BB0149D
P 9150 4950
F 0 "C11" H 9175 5050 50  0000 L CNN
F 1 "4u7" H 9175 4850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9188 4800 50  0001 C CNN
F 3 "" H 9150 4950 50  0001 C CNN
	1    9150 4950
	1    0    0    -1  
$EndComp
$Comp
L Rovenso:AL8860WT IC3
U 1 1 5BB0172D
P 10200 3350
F 0 "IC3" H 10200 3050 60  0000 C CNN
F 1 "AL8860WT" H 10200 3650 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 10200 3350 60  0001 C CNN
F 3 "" H 10200 3350 60  0001 C CNN
	1    10200 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5BB01733
P 10800 3350
F 0 "R12" V 10880 3350 50  0000 C CNN
F 1 "0.33" V 10800 3350 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10730 3350 50  0001 C CNN
F 3 "" H 10800 3350 50  0001 C CNN
	1    10800 3350
	-1   0    0    1   
$EndComp
$Comp
L Device:D_Schottky D7
U 1 1 5BB01739
P 10200 2800
F 0 "D7" H 10200 2900 50  0000 C CNN
F 1 "D_Schottky" H 10200 2700 50  0000 C CNN
F 2 "Diodes_SMD:D_SMA_Handsoldering" H 10200 2800 50  0001 C CNN
F 3 "" H 10200 2800 50  0001 C CNN
	1    10200 2800
	-1   0    0    1   
$EndComp
$Comp
L Bikelight-rescue:Screw_Terminal_1x02 J3
U 1 1 5BB0173F
P 11000 3800
F 0 "J3" H 11000 4050 50  0000 C TNN
F 1 "Screw_Terminal_1x02" V 10850 3800 50  0000 C TNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 11000 3575 50  0001 C CNN
F 3 "" H 10975 3800 50  0001 C CNN
	1    11000 3800
	-1   0    0    -1  
$EndComp
$Comp
L Device:L_Core_Ferrite L2
U 1 1 5BB01751
P 10300 3900
F 0 "L2" V 10250 3900 50  0000 C CNN
F 1 "100uH" V 10410 3900 50  0000 C CNN
F 2 "Inductors_SMD:L_12x12mm_h8mm" H 10300 3900 50  0001 C CNN
F 3 "" H 10300 3900 50  0001 C CNN
	1    10300 3900
	0    1    1    0   
$EndComp
$Comp
L Bikelight-rescue:ATTINY24A-SSU U1
U 1 1 5BB02C96
P 4000 3450
F 0 "U1" H 3150 4200 50  0000 C CNN
F 1 "ATTINY24A-SSU" H 4650 2700 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-14_3.9x8.7mm_Pitch1.27mm" H 4000 3250 50  0001 C CIN
F 3 "" H 4000 3450 50  0001 C CNN
	1    4000 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5BB035AA
P 2800 3100
F 0 "C5" H 2825 3200 50  0000 L CNN
F 1 "100n" H 2825 3000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2838 2950 50  0001 C CNN
F 3 "" H 2800 3100 50  0001 C CNN
	1    2800 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5BB037C7
P 1200 3100
F 0 "C2" H 1225 3200 50  0000 L CNN
F 1 "100n" H 1225 3000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1238 2950 50  0001 C CNN
F 3 "" H 1200 3100 50  0001 C CNN
	1    1200 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5BB04865
P 6100 4350
F 0 "R7" V 6180 4350 50  0000 C CNN
F 1 "1k" V 6100 4350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6030 4350 50  0001 C CNN
F 3 "" H 6100 4350 50  0001 C CNN
	1    6100 4350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 5BB04929
P 5700 4350
F 0 "R5" V 5780 4350 50  0000 C CNN
F 1 "2k2" V 5700 4350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5630 4350 50  0001 C CNN
F 3 "" H 5700 4350 50  0001 C CNN
	1    5700 4350
	0    -1   -1   0   
$EndComp
$Comp
L Bikelight-rescue:CONN_02X03 J2
U 1 1 5BB07EC1
P 7450 2600
F 0 "J2" H 7450 2800 50  0000 C CNN
F 1 "CONN_02X03" H 7450 2400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 7450 1400 50  0001 C CNN
F 3 "" H 7450 1400 50  0001 C CNN
	1    7450 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5BB08500
P 7850 2750
F 0 "#PWR04" H 7850 2500 50  0001 C CNN
F 1 "GND" H 7850 2600 50  0000 C CNN
F 2 "" H 7850 2750 50  0001 C CNN
F 3 "" H 7850 2750 50  0001 C CNN
	1    7850 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 4750 10700 4750
Wire Wire Line
	10800 4250 10800 4400
Wire Wire Line
	10800 4400 10800 4750
Wire Wire Line
	10800 4750 10800 4800
Wire Wire Line
	10700 5150 10800 5150
Wire Wire Line
	10800 5100 10800 5150
Wire Wire Line
	10800 5150 10800 5300
Connection ~ 10800 4750
Wire Wire Line
	9700 4750 9550 4750
Wire Wire Line
	9550 4400 9550 4750
Wire Wire Line
	9550 4750 9550 5500
Wire Wire Line
	9550 4400 10050 4400
Wire Wire Line
	10350 4400 10800 4400
Connection ~ 10800 4400
Wire Wire Line
	9700 4950 9350 4950
Wire Wire Line
	9350 4950 9350 5400
Wire Wire Line
	8250 4550 8250 4650
Wire Wire Line
	8250 5250 8250 5400
Wire Wire Line
	8750 5100 8750 5400
Wire Wire Line
	8250 5400 8600 5400
Wire Wire Line
	8750 5400 8950 5400
Wire Wire Line
	8950 5400 9150 5400
Wire Wire Line
	9150 5400 9350 5400
Connection ~ 8750 5400
Wire Wire Line
	8750 4250 8750 4550
Wire Wire Line
	8750 4550 8750 4800
Wire Wire Line
	8250 4550 8600 4550
Wire Wire Line
	8750 4550 8950 4550
Wire Wire Line
	8950 4550 9150 4550
Connection ~ 8750 4550
Connection ~ 10800 5150
Wire Wire Line
	10800 5500 10450 5500
Wire Wire Line
	9550 5500 10150 5500
Connection ~ 9550 4750
Wire Wire Line
	8950 4550 8950 4800
Wire Wire Line
	8950 5100 8950 5400
Connection ~ 8950 5400
Wire Wire Line
	9150 4550 9150 4800
Connection ~ 8950 4550
Wire Wire Line
	9150 5100 9150 5400
Connection ~ 9150 5400
Wire Wire Line
	10800 3150 10700 3150
Wire Wire Line
	10800 2650 10800 2800
Wire Wire Line
	10800 2800 10800 3150
Wire Wire Line
	10800 3150 10800 3200
Wire Wire Line
	10700 3550 10800 3550
Wire Wire Line
	10800 3500 10800 3550
Wire Wire Line
	10800 3550 10800 3700
Connection ~ 10800 3150
Wire Wire Line
	9700 3150 9550 3150
Wire Wire Line
	9550 2800 9550 3150
Wire Wire Line
	9550 3150 9550 3900
Wire Wire Line
	9550 2800 10050 2800
Wire Wire Line
	10350 2800 10800 2800
Connection ~ 10800 2800
Wire Wire Line
	9350 3350 9700 3350
Connection ~ 10800 3550
Wire Wire Line
	10800 3900 10450 3900
Wire Wire Line
	9550 3900 10150 3900
Connection ~ 9550 3150
Wire Wire Line
	10800 2650 9250 2650
Wire Wire Line
	2800 2350 2800 2850
Wire Wire Line
	2800 2850 2800 2950
Connection ~ 2800 2850
Wire Wire Line
	1200 2850 1200 2950
Wire Wire Line
	1250 2850 1200 2850
Connection ~ 1200 2850
Wire Wire Line
	9700 5150 9600 5150
Wire Wire Line
	9600 5150 9600 4350
Wire Wire Line
	5850 4350 5900 4350
Wire Wire Line
	5900 4350 5950 4350
Connection ~ 5900 4350
Wire Wire Line
	6250 4350 6300 4350
Wire Wire Line
	2800 2850 2950 2850
Wire Wire Line
	5450 4550 5450 4350
Wire Wire Line
	5450 4350 5550 4350
Wire Wire Line
	7700 2500 7850 2500
Wire Wire Line
	7850 2500 7850 2350
Wire Wire Line
	7850 2750 7850 2700
Wire Wire Line
	7850 2700 7700 2700
Wire Wire Line
	7200 2500 6950 2500
Wire Wire Line
	7000 3250 7000 2600
Wire Wire Line
	7000 2600 7200 2600
Wire Wire Line
	7200 2700 7050 2700
Wire Wire Line
	7050 2700 7050 3300
Wire Wire Line
	7050 3300 6050 3300
Wire Wire Line
	6050 3300 6050 4050
Wire Wire Line
	7700 2600 7950 2600
Wire Wire Line
	5650 3550 5650 3950
$Comp
L Device:R R6
U 1 1 5BB08AF8
P 6050 2700
F 0 "R6" V 6130 2700 50  0000 C CNN
F 1 "10k" V 6050 2700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5980 2700 50  0001 C CNN
F 3 "" H 6050 2700 50  0001 C CNN
	1    6050 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2550 6050 2350
Connection ~ 6050 2350
Wire Wire Line
	6050 2850 6050 3300
Connection ~ 6050 3300
NoConn ~ 5050 3750
NoConn ~ 5050 3850
$Comp
L Rovenso:MCP1642B IC2
U 1 1 5BB87EF3
P 5500 1750
F 0 "IC2" H 5500 1385 50  0000 C CNN
F 1 "MCP1642B" H 5500 1476 50  0000 C CNN
F 2 "Housings_SSOP:MSOP-8_3x3mm_Pitch0.65mm" H 5500 1750 50  0001 C CNN
F 3 "" H 5500 1750 50  0001 C CNN
	1    5500 1750
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C6
U 1 1 5BB89D98
P 3500 1700
F 0 "C6" H 3618 1746 50  0000 L CNN
F 1 "3F3" H 3618 1655 50  0000 L CNN
F 2 "SCap:SuperCapL25W12.5P18" H 3538 1550 50  0001 C CNN
F 3 "~" H 3500 1700 50  0001 C CNN
	1    3500 1700
	-1   0    0    1   
$EndComp
$Comp
L Device:L L1
U 1 1 5BB8F851
P 4700 1750
F 0 "L1" H 4659 1704 50  0000 R CNN
F 1 "744025004" H 4659 1795 50  0000 R CNN
F 2 "Inductors_SMD:L_Taiyo-Yuden_NR-30xx_HandSoldering" H 4700 1750 50  0001 C CNN
F 3 "~" H 4700 1750 50  0001 C CNN
	1    4700 1750
	-1   0    0    1   
$EndComp
$Comp
L Device:C C7
U 1 1 5BB94D4A
P 3800 1700
F 0 "C7" H 3915 1746 50  0000 L CNN
F 1 "4u7" H 3915 1655 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3838 1550 50  0001 C CNN
F 3 "~" H 3800 1700 50  0001 C CNN
	1    3800 1700
	-1   0    0    1   
$EndComp
$Comp
L Device:C C8
U 1 1 5BB94DEC
P 4050 1700
F 0 "C8" H 4165 1746 50  0000 L CNN
F 1 "100n" H 4165 1655 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4088 1550 50  0001 C CNN
F 3 "~" H 4050 1700 50  0001 C CNN
	1    4050 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	5750 3150 5050 3150
$Comp
L Device:CP C4
U 1 1 5BBAD705
P 2600 3100
F 0 "C4" H 2718 3146 50  0000 L CNN
F 1 "478-9009-1-ND" H 2718 3055 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-A_EIA-3216-18_Reflow" H 2638 2950 50  0001 C CNN
F 3 "~" H 2600 3100 50  0001 C CNN
	1    2600 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2850 2400 2850
Wire Wire Line
	2600 2950 2600 2850
Connection ~ 2600 2850
Wire Wire Line
	2600 2850 2800 2850
$Comp
L Device:R R3
U 1 1 5BBDD26C
P 3100 1900
F 0 "R3" V 2893 1900 50  0000 C CNN
F 1 "33" V 2984 1900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3030 1900 50  0001 C CNN
F 3 "~" H 3100 1900 50  0001 C CNN
	1    3100 1900
	0    1    1    0   
$EndComp
$Comp
L Device:D D2
U 1 1 5BB04751
P 1800 4550
F 0 "D2" H 1800 4650 50  0000 C CNN
F 1 "TS4148" H 1800 4450 50  0000 C CNN
F 2 "Diodes_SMD:D_0603" H 1800 4550 50  0001 C CNN
F 3 "" H 1800 4550 50  0001 C CNN
	1    1800 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 4050 2800 4050
Wire Wire Line
	2800 3250 2800 3450
Wire Wire Line
	1200 3450 1800 3450
Wire Wire Line
	1200 3250 1200 3450
Connection ~ 2800 3450
Wire Wire Line
	2800 3450 2800 4050
Wire Wire Line
	1800 3350 1800 3450
Connection ~ 1800 3450
Wire Wire Line
	2600 3250 2600 3450
Connection ~ 2600 3450
Wire Wire Line
	2600 3450 2700 3450
Wire Wire Line
	1800 4400 1800 3900
Wire Wire Line
	1800 3900 1500 3900
Wire Wire Line
	650  3900 650  2850
$Comp
L Device:C C1
U 1 1 5BC12BC2
P 1000 3100
F 0 "C1" H 1115 3146 50  0000 L CNN
F 1 "4u7" H 1115 3055 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1038 2950 50  0001 C CNN
F 3 "~" H 1000 3100 50  0001 C CNN
	1    1000 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 2950 1000 2850
Connection ~ 1000 2850
Wire Wire Line
	1000 2850 1200 2850
Wire Wire Line
	1000 3250 1000 3450
Wire Wire Line
	1000 3450 1200 3450
Connection ~ 1200 3450
Wire Wire Line
	8750 4250 9250 4250
Wire Wire Line
	9350 3350 9350 4950
Connection ~ 9350 4950
Wire Wire Line
	9250 2650 9250 4250
Connection ~ 9250 4250
Wire Wire Line
	9250 4250 10800 4250
Wire Wire Line
	5000 1800 4850 1800
Connection ~ 2700 3450
Wire Wire Line
	2700 3450 2800 3450
Wire Wire Line
	5000 1700 4850 1700
Wire Wire Line
	4850 1700 4850 1800
Connection ~ 4850 1800
Wire Wire Line
	4850 1800 4250 1800
Wire Wire Line
	5000 1900 4700 1900
Wire Wire Line
	2800 1900 2800 2350
Connection ~ 2800 2350
Connection ~ 4700 1900
Wire Wire Line
	5000 1600 4700 1600
Wire Wire Line
	2700 1450 3500 1450
Wire Wire Line
	4250 1450 4250 1800
Wire Wire Line
	2700 1450 2700 3450
Wire Wire Line
	2800 1900 2950 1900
Wire Wire Line
	3250 1900 3500 1900
Wire Wire Line
	3500 1850 3500 1900
Connection ~ 3500 1900
Wire Wire Line
	3500 1900 3800 1900
Wire Wire Line
	3800 1850 3800 1900
Connection ~ 3800 1900
Wire Wire Line
	3800 1900 4050 1900
Wire Wire Line
	4050 1850 4050 1900
Connection ~ 4050 1900
Wire Wire Line
	4050 1900 4700 1900
Wire Wire Line
	4050 1550 4050 1450
Connection ~ 4050 1450
Wire Wire Line
	4050 1450 4250 1450
Wire Wire Line
	3800 1550 3800 1450
Connection ~ 3800 1450
Wire Wire Line
	3800 1450 4050 1450
Wire Wire Line
	3500 1550 3500 1450
Connection ~ 3500 1450
Wire Wire Line
	3500 1450 3800 1450
Wire Wire Line
	6000 1600 8750 1600
Wire Wire Line
	8750 1600 8750 4250
Connection ~ 8750 4250
$Comp
L power:GND #PWR07
U 1 1 5BD09946
P 8750 5450
F 0 "#PWR07" H 8750 5200 50  0001 C CNN
F 1 "GND" H 8755 5277 50  0000 C CNN
F 2 "" H 8750 5450 50  0001 C CNN
F 3 "" H 8750 5450 50  0001 C CNN
	1    8750 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 5450 8750 5400
$Comp
L power:GND #PWR02
U 1 1 5BD15F69
P 4850 2000
F 0 "#PWR02" H 4850 1750 50  0001 C CNN
F 1 "GND" H 4855 1827 50  0000 C CNN
F 2 "" H 4850 2000 50  0001 C CNN
F 3 "" H 4850 2000 50  0001 C CNN
	1    4850 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2000 4850 1800
Wire Wire Line
	1000 5150 7700 5150
Wire Wire Line
	1800 3450 2400 3450
$Comp
L power:GND #PWR01
U 1 1 5BD222B4
P 1800 3450
F 0 "#PWR01" H 1800 3200 50  0001 C CNN
F 1 "GND" H 1805 3277 50  0000 C CNN
F 2 "" H 1800 3450 50  0001 C CNN
F 3 "" H 1800 3450 50  0001 C CNN
	1    1800 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:D D3
U 1 1 5BD22DB5
P 5450 4700
F 0 "D3" H 5450 4800 50  0000 C CNN
F 1 "TS4148" H 5450 4600 50  0000 C CNN
F 2 "Diodes_SMD:D_0603" H 5450 4700 50  0001 C CNN
F 3 "" H 5450 4700 50  0001 C CNN
	1    5450 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	5450 4850 5450 4950
$Comp
L Device:R R4
U 1 1 5BD465E9
P 5500 2100
F 0 "R4" V 5580 2100 50  0000 C CNN
F 1 "10k" V 5500 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5430 2100 50  0001 C CNN
F 3 "" H 5500 2100 50  0001 C CNN
	1    5500 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	6350 2100 6350 1900
Wire Wire Line
	6350 1900 6000 1900
Wire Wire Line
	5650 2100 5750 2100
Wire Wire Line
	5350 2100 4700 2100
Wire Wire Line
	4700 2100 4700 1900
Connection ~ 5750 2100
Wire Wire Line
	5750 2100 6350 2100
NoConn ~ 6000 1700
$Comp
L Device:R R10
U 1 1 5BBADA83
P 8350 2500
F 0 "R10" V 8430 2500 50  0000 C CNN
F 1 "1k" V 8350 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 8280 2500 50  0001 C CNN
F 3 "" H 8350 2500 50  0001 C CNN
	1    8350 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 5BBAF4D9
P 8350 2900
F 0 "R11" V 8430 2900 50  0000 C CNN
F 1 "1k" V 8350 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 8280 2900 50  0001 C CNN
F 3 "" H 8350 2900 50  0001 C CNN
	1    8350 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2350 8100 2350
Connection ~ 7850 2350
$Comp
L power:GND #PWR06
U 1 1 5BBBD81D
P 8350 3050
F 0 "#PWR06" H 8350 2800 50  0001 C CNN
F 1 "GND" H 8355 2877 50  0000 C CNN
F 2 "" H 8350 3050 50  0001 C CNN
F 3 "" H 8350 3050 50  0001 C CNN
	1    8350 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2650 8350 2700
Wire Wire Line
	8350 2700 9000 2700
Wire Wire Line
	9000 2700 9000 3550
Connection ~ 8350 2700
Wire Wire Line
	8350 2700 8350 2750
$Comp
L Device:R R8
U 1 1 5BBD8E6E
P 8100 2500
F 0 "R8" V 8180 2500 50  0000 C CNN
F 1 "1k" V 8100 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 8030 2500 50  0001 C CNN
F 3 "" H 8100 2500 50  0001 C CNN
	1    8100 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5BBD8E75
P 8100 2900
F 0 "R9" V 8180 2900 50  0000 C CNN
F 1 "1k" V 8100 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 8030 2900 50  0001 C CNN
F 3 "" H 8100 2900 50  0001 C CNN
	1    8100 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5BBD8E7C
P 8100 3050
F 0 "#PWR05" H 8100 2800 50  0001 C CNN
F 1 "GND" H 8105 2877 50  0000 C CNN
F 2 "" H 8100 3050 50  0001 C CNN
F 3 "" H 8100 3050 50  0001 C CNN
	1    8100 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 2650 8100 2700
Connection ~ 8100 2350
Wire Wire Line
	8100 2350 7850 2350
Wire Wire Line
	8100 2700 8250 2700
Wire Wire Line
	8250 2700 8250 4350
Wire Wire Line
	8250 4350 9600 4350
Connection ~ 8100 2700
Wire Wire Line
	8100 2700 8100 2750
Connection ~ 9000 3550
Wire Wire Line
	8000 3500 8000 2700
Wire Wire Line
	8000 2700 8100 2700
Wire Wire Line
	9000 3550 9700 3550
$Comp
L power:GND #PWR03
U 1 1 5BC20AB4
P 6300 4350
F 0 "#PWR03" H 6300 4100 50  0001 C CNN
F 1 "GND" H 6305 4177 50  0000 C CNN
F 2 "" H 6300 4350 50  0001 C CNN
F 3 "" H 6300 4350 50  0001 C CNN
	1    6300 4350
	1    0    0    -1  
$EndComp
$Comp
L Rovenso:RT9058 IC1
U 1 1 5BC73FB3
P 1800 2850
F 0 "IC1" H 1800 3137 60  0000 C CNN
F 1 "RT9058" H 1800 3031 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 1800 2850 60  0001 C CNN
F 3 "" H 1800 2850 60  0001 C CNN
	1    1800 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 5BF8DE85
P 2400 3100
F 0 "C3" H 2518 3146 50  0000 L CNN
F 1 "EEE-HA1A471UP" H 2518 3055 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_8x10.5" H 2438 2950 50  0001 C CNN
F 3 "~" H 2400 3100 50  0001 C CNN
	1    2400 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2950 2400 2850
Connection ~ 2400 2850
Wire Wire Line
	2400 2850 2600 2850
Wire Wire Line
	2400 3250 2400 3450
Connection ~ 2400 3450
Wire Wire Line
	2400 3450 2600 3450
Wire Wire Line
	6050 2350 7850 2350
Wire Wire Line
	1000 4950 1200 4950
Wire Wire Line
	2800 2350 6050 2350
NoConn ~ 5050 2850
NoConn ~ 5050 2950
$Comp
L Device:D_Zener D4
U 1 1 5BF2B761
P 6050 4150
F 0 "D4" V 6004 4229 50  0000 L CNN
F 1 "DDZ3V3ASF-7" V 6095 4229 50  0000 L CNN
F 2 "Diodes_SMD:D_SOD-323F" H 6050 4150 50  0001 C CNN
F 3 "~" H 6050 4150 50  0001 C CNN
	1    6050 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3500 5600 3550
Wire Wire Line
	5600 3550 5050 3550
Connection ~ 5900 4150
Wire Wire Line
	5900 4150 5900 4350
Wire Wire Line
	5900 3050 5900 4150
Wire Wire Line
	6200 4150 6300 4150
Wire Wire Line
	6300 4150 6300 4350
Connection ~ 6300 4350
Wire Wire Line
	5050 4050 6050 4050
Wire Wire Line
	5050 3950 5650 3950
Wire Wire Line
	5650 3550 9000 3550
Wire Wire Line
	5600 3500 8000 3500
Wire Wire Line
	5050 3250 7000 3250
Wire Wire Line
	5050 3050 5900 3050
Wire Wire Line
	5750 2100 5750 3150
Wire Wire Line
	6950 2500 6950 3350
Wire Wire Line
	6950 3350 5050 3350
Wire Wire Line
	5050 3450 7950 3450
Wire Wire Line
	7950 3450 7950 2600
Wire Wire Line
	1800 4950 5450 4950
Wire Wire Line
	1800 4700 1800 4750
Connection ~ 1000 3450
Wire Wire Line
	1000 3450 800  3450
Wire Wire Line
	800  3450 800  3300
Wire Wire Line
	800  2850 1000 2850
Wire Wire Line
	650  2850 800  2850
Connection ~ 800  2850
Wire Wire Line
	800  3000 800  2850
$Comp
L Device:D_Zener D1
U 1 1 5BEDF117
P 800 3150
F 0 "D1" V 754 3229 50  0000 L CNN
F 1 "DDZ8V2ASF-7" V 845 3229 50  0000 L CNN
F 2 "Diodes_SMD:D_SOD-323F" H 800 3150 50  0001 C CNN
F 3 "~" H 800 3150 50  0001 C CNN
	1    800  3150
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D6
U 1 1 5C09015C
P 8600 4950
F 0 "D6" V 8554 5029 50  0000 L CNN
F 1 "SMBJ5346B-TP" V 8645 5029 50  0000 L CNN
F 2 "Diodes_SMD:D_SMB" H 8600 4950 50  0001 C CNN
F 3 "~" H 8600 4950 50  0001 C CNN
	1    8600 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	8600 4800 8600 4550
Connection ~ 8600 4550
Wire Wire Line
	8600 4550 8750 4550
Wire Wire Line
	8600 5100 8600 5400
Connection ~ 8600 5400
Wire Wire Line
	8600 5400 8750 5400
$Comp
L Device:R R1
U 1 1 5C0BFB53
P 1200 3900
F 0 "R1" V 993 3900 50  0000 C CNN
F 1 "33" V 1084 3900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1130 3900 50  0001 C CNN
F 3 "~" H 1200 3900 50  0001 C CNN
	1    1200 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 3900 900  3900
$Comp
L Device:R R2
U 1 1 5C0C2685
P 1200 4050
F 0 "R2" V 993 4050 50  0000 C CNN
F 1 "33" V 1084 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1130 4050 50  0001 C CNN
F 3 "~" H 1200 4050 50  0001 C CNN
	1    1200 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 4050 1500 4050
Wire Wire Line
	1500 4050 1500 3900
Connection ~ 1500 3900
Wire Wire Line
	1500 3900 1350 3900
Wire Wire Line
	1050 4050 900  4050
Wire Wire Line
	900  4050 900  3900
Connection ~ 900  3900
Wire Wire Line
	900  3900 650  3900
$Comp
L Switch:SW_SPDT SW1
U 1 1 5C0DC55D
P 1400 4850
F 0 "SW1" H 1400 5135 50  0000 C CNN
F 1 "200USP1T1A1M6RE" H 1400 5044 50  0000 C CNN
F 2 "SCap:SW0.2x0.2" H 1400 4850 50  0001 C CNN
F 3 "" H 1400 4850 50  0001 C CNN
	1    1400 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 4850 1200 4950
Wire Wire Line
	1600 4750 1800 4750
Connection ~ 1800 4750
Wire Wire Line
	1800 4750 1800 4950
Wire Wire Line
	8550 4950 8550 4450
Wire Wire Line
	8550 4450 6600 4450
Wire Wire Line
	6600 4450 6600 4950
Wire Wire Line
	6600 4950 5450 4950
Connection ~ 5450 4950
Wire Wire Line
	7950 4950 7700 4950
Wire Wire Line
	7700 4950 7700 5150
NoConn ~ 1600 4950
$EndSCHEMATC
