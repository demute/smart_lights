EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "CDM324 Daughter board for Turtleboard"
Date "2020-12-18"
Rev "A"
Comp "Manne Tallmarken / Innovatima"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L daughterboard-rescue:GND-cdm324-rescue #PWR010
U 1 1 58A96976
P 5050 3250
F 0 "#PWR010" H 5050 3000 50  0001 C CNN
F 1 "GND" H 5050 3100 50  0000 C CNN
F 2 "" H 5050 3250 50  0000 C CNN
F 3 "" H 5050 3250 50  0000 C CNN
	1    5050 3250
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:R-cdm324-rescue R7
U 1 1 58A96ABC
P 6300 3025
F 0 "R7" V 6380 3025 50  0000 C CNN
F 1 "4k7" V 6300 3025 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6230 3025 50  0001 C CNN
F 3 "" H 6300 3025 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/yageo/RC0805FR-074K7L/311-4.70KCRCT-ND/730876" V 6300 3025 60  0001 C CNN "Field4"
	1    6300 3025
	0    -1   -1   0   
$EndComp
$Comp
L daughterboard-rescue:R-cdm324-rescue R10
U 1 1 58A992DF
P 8575 3500
F 0 "R10" V 8655 3500 50  0000 C CNN
F 1 "590k" V 8575 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8505 3500 50  0001 C CNN
F 3 "" H 8575 3500 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF5903V/P590KCCT-ND/119773" V 8575 3500 60  0001 C CNN "Field4"
	1    8575 3500
	0    1    -1   0   
$EndComp
$Comp
L daughterboard-rescue:C-cdm324-rescue C8
U 1 1 58A9A1BB
P 4100 3025
F 0 "C8" H 4125 3125 50  0000 L CNN
F 1 "10u" H 4125 2925 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4138 2875 50  0001 C CNN
F 3 "" H 4100 3025 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" H 4100 3025 60  0001 C CNN "Field4"
	1    4100 3025
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:GND-cdm324-rescue #PWR09
U 1 1 58A9A334
P 4100 3250
F 0 "#PWR09" H 4100 3000 50  0001 C CNN
F 1 "GND" H 4100 3100 50  0000 C CNN
F 2 "" H 4100 3250 50  0000 C CNN
F 3 "" H 4100 3250 50  0000 C CNN
	1    4100 3250
	1    0    0    -1  
$EndComp
Text Notes 7275 6250 0    60   ~ 0
Copyright Manne Tallmarken, 2020\n\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.2.\n\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.2. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF MERCHANTABILITY,\nSATISFACTORY QUALITY AND FITNESS FOR A PARTICULAR PURPOSE. \nPlease see the CERN OHL v.1.2 for applicable conditions\n
$Comp
L a_manne:Turtle_adapter U3
U 1 1 5FE68DD1
P 1975 5900
F 0 "U3" H 1975 6837 60  0000 C CNN
F 1 "Turtle_adapter" H 1975 6731 60  0000 C CNN
F 2 "a_manne:turtleboard" H 1825 6350 60  0001 C CNN
F 3 "" H 1825 6350 60  0001 C CNN
	1    1975 5900
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:+5V-cdm324-rescue #PWR01
U 1 1 58A96172
P 2475 1575
F 0 "#PWR01" H 2475 1425 50  0001 C CNN
F 1 "+5V" H 2475 1715 50  0000 C CNN
F 2 "" H 2475 1575 50  0000 C CNN
F 3 "" H 2475 1575 50  0000 C CNN
	1    2475 1575
	1    0    0    -1  
$EndComp
Wire Wire Line
	2475 1675 2475 1575
$Comp
L power:+5V #PWR011
U 1 1 5FF11B89
P 2625 5200
F 0 "#PWR011" H 2625 5050 50  0001 C CNN
F 1 "+5V" H 2640 5373 50  0000 C CNN
F 2 "" H 2625 5200 50  0001 C CNN
F 3 "" H 2625 5200 50  0001 C CNN
	1    2625 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5FF122DE
P 2625 5400
F 0 "#PWR016" H 2625 5150 50  0001 C CNN
F 1 "GND" H 2630 5227 50  0000 C CNN
F 2 "" H 2625 5400 50  0001 C CNN
F 3 "" H 2625 5400 50  0001 C CNN
	1    2625 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5FF14B46
P 775 5400
F 0 "#PWR015" H 775 5150 50  0001 C CNN
F 1 "GND" H 780 5227 50  0000 C CNN
F 2 "" H 775 5400 50  0001 C CNN
F 3 "" H 775 5400 50  0001 C CNN
	1    775  5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2425 5350 2625 5350
Wire Wire Line
	2425 5250 2625 5250
Wire Wire Line
	2625 5250 2625 5200
Wire Wire Line
	2625 5400 2625 5350
Wire Wire Line
	3525 6825 3650 6825
Wire Wire Line
	3525 6725 3650 6725
Text GLabel 3525 6825 0    60   Input ~ 0
GPS_TX
Text GLabel 3525 6725 0    60   Input ~ 0
GPS_RX
Wire Wire Line
	3250 6625 3250 6575
Wire Wire Line
	3650 6625 3250 6625
Wire Wire Line
	3250 6925 3250 7025
Wire Wire Line
	3650 6925 3250 6925
$Comp
L power:+5V #PWR021
U 1 1 5FF232B4
P 3250 6575
F 0 "#PWR021" H 3250 6425 50  0001 C CNN
F 1 "+5V" H 3265 6748 50  0000 C CNN
F 2 "" H 3250 6575 50  0001 C CNN
F 3 "" H 3250 6575 50  0001 C CNN
	1    3250 6575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5FF22E6D
P 3250 7025
F 0 "#PWR022" H 3250 6775 50  0001 C CNN
F 1 "GND" H 3255 6852 50  0000 C CNN
F 2 "" H 3250 7025 50  0001 C CNN
F 3 "" H 3250 7025 50  0001 C CNN
	1    3250 7025
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J3
U 1 1 5FF217C2
P 3850 6825
F 0 "J3" H 3822 6707 50  0000 R CNN
F 1 "Conn_01x04_Male" H 3822 6798 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Horizontal" H 3850 6825 50  0001 C CNN
F 3 "~" H 3850 6825 50  0001 C CNN
	1    3850 6825
	-1   0    0    1   
$EndComp
$Comp
L daughterboard-rescue:R-cdm324-rescue R1
U 1 1 5FFEFC71
P 2475 1900
F 0 "R1" V 2555 1900 50  0000 C CNN
F 1 "47k" V 2475 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2405 1900 50  0001 C CNN
F 3 "" H 2475 1900 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/yageo/RC0805FR-0710KL/311-10.0KCRCT-ND/730482" V 2475 1900 60  0001 C CNN "Field4"
	1    2475 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2475 1675 2475 1750
Wire Wire Line
	1525 5450 1425 5450
$Comp
L a_manne:cdm324 U2
U 1 1 5FE8E70A
P 4625 3025
F 0 "U2" V 4188 3017 60  0000 C CNN
F 1 "cdm324" V 4294 3017 60  0000 C CNN
F 2 "a_manne:cdm324" H 4625 3225 60  0001 C CNN
F 3 "" H 4625 3225 60  0001 C CNN
	1    4625 3025
	0    -1   1    0   
$EndComp
Wire Wire Line
	4925 3125 5050 3125
Wire Wire Line
	5050 3125 5050 3250
Wire Wire Line
	4925 2925 5050 2925
$Comp
L daughterboard-rescue:C-cdm324-rescue C9
U 1 1 58A969C4
P 5900 3025
F 0 "C9" V 5950 3125 50  0000 L CNN
F 1 "10u" V 5950 2825 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5938 2875 50  0001 C CNN
F 3 "" H 5900 3025 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" V 5900 3025 60  0001 C CNN "Field4"
	1    5900 3025
	0    1    1    0   
$EndComp
Wire Wire Line
	2475 2050 2475 2125
Wire Wire Line
	2475 2125 2775 2125
Wire Wire Line
	2775 2125 2775 1975
Wire Wire Line
	2475 1675 2575 1675
$Comp
L Device:Q_PMOS_GSD Q1
U 1 1 5FFE4A72
P 2775 1775
F 0 "Q1" V 3117 1775 50  0000 C CNN
F 1 "Q_PMOS_GSD" V 3026 1775 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2975 1875 50  0001 C CNN
F 3 "~" H 2775 1775 50  0001 C CNN
	1    2775 1775
	0    1    -1   0   
$EndComp
Connection ~ 2475 1675
Wire Wire Line
	2975 1675 3100 1675
Connection ~ 3475 2500
Wire Wire Line
	4175 2200 4400 2200
Connection ~ 4175 2200
Connection ~ 3950 2200
Connection ~ 3725 2200
Wire Wire Line
	3725 2200 3950 2200
Wire Wire Line
	4175 1675 4400 1675
Connection ~ 4175 1675
Wire Wire Line
	3950 1675 4175 1675
Connection ~ 3950 1675
Connection ~ 3725 1675
Wire Wire Line
	3725 1675 3950 1675
Wire Wire Line
	4400 2075 4400 2200
Wire Wire Line
	4400 1775 4400 1675
$Comp
L daughterboard-rescue:C-cdm324-rescue C5
U 1 1 5FE49C0D
P 4400 1925
F 0 "C5" H 4425 2025 50  0000 L CNN
F 1 "100u" H 4425 1825 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4438 1775 50  0001 C CNN
F 3 "" H 4400 1925 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" H 4400 1925 60  0001 C CNN "Field4"
	1    4400 1925
	1    0    0    -1  
$EndComp
Wire Wire Line
	4175 2075 4175 2200
Wire Wire Line
	4175 1775 4175 1675
$Comp
L daughterboard-rescue:C-cdm324-rescue C4
U 1 1 5FE46B15
P 4175 1925
F 0 "C4" H 4200 2025 50  0000 L CNN
F 1 "100u" H 4200 1825 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4213 1775 50  0001 C CNN
F 3 "" H 4175 1925 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" H 4175 1925 60  0001 C CNN "Field4"
	1    4175 1925
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2075 3950 2200
Wire Wire Line
	3950 1775 3950 1675
$Comp
L daughterboard-rescue:C-cdm324-rescue C3
U 1 1 5FE43E54
P 3950 1925
F 0 "C3" H 3975 2025 50  0000 L CNN
F 1 "100u" H 3975 1825 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3988 1775 50  0001 C CNN
F 3 "" H 3950 1925 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" H 3950 1925 60  0001 C CNN "Field4"
	1    3950 1925
	1    0    0    -1  
$EndComp
Wire Wire Line
	3475 2550 3475 2500
Wire Wire Line
	3475 2500 3475 2075
Wire Wire Line
	3725 2500 3475 2500
Wire Wire Line
	3725 2075 3725 2200
Wire Wire Line
	3475 1675 3725 1675
Connection ~ 3475 1675
Wire Wire Line
	3475 1775 3475 1675
Wire Wire Line
	3725 1775 3725 1675
Wire Wire Line
	3400 1675 3475 1675
$Comp
L daughterboard-rescue:C-cdm324-rescue C2
U 1 1 5FE0C317
P 3725 1925
F 0 "C2" H 3750 2025 50  0000 L CNN
F 1 "100u" H 3750 1825 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3763 1775 50  0001 C CNN
F 3 "" H 3725 1925 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" H 3725 1925 60  0001 C CNN "Field4"
	1    3725 1925
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:C-cdm324-rescue C1
U 1 1 5FE09E80
P 3475 1925
F 0 "C1" H 3500 2025 50  0000 L CNN
F 1 "100u" H 3500 1825 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3513 1775 50  0001 C CNN
F 3 "" H 3475 1925 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" H 3475 1925 60  0001 C CNN "Field4"
	1    3475 1925
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 5FE0674C
P 3250 1675
F 0 "L1" V 3440 1675 50  0000 C CNN
F 1 "100u" V 3349 1675 50  0000 C CNN
F 2 "a_manne:pa4319" H 3250 1675 50  0001 C CNN
F 3 "~" H 3250 1675 50  0001 C CNN
	1    3250 1675
	0    -1   -1   0   
$EndComp
$Comp
L daughterboard-rescue:GND-cdm324-rescue #PWR05
U 1 1 58A97536
P 3475 2550
F 0 "#PWR05" H 3475 2300 50  0001 C CNN
F 1 "GND" H 3475 2400 50  0000 C CNN
F 2 "" H 3475 2550 50  0000 C CNN
F 3 "" H 3475 2550 50  0000 C CNN
	1    3475 2550
	1    0    0    -1  
$EndComp
Text GLabel 1425 5450 0    60   Input ~ 0
GPS_TX
Wire Wire Line
	4125 5250 4125 5200
Wire Wire Line
	5975 5250 5975 5200
Wire Wire Line
	4725 5550 4725 5650
$Comp
L power:+5V #PWR014
U 1 1 5FED2FA9
P 5275 4475
F 0 "#PWR014" H 5275 4325 50  0001 C CNN
F 1 "+5V" H 5290 4648 50  0000 C CNN
F 2 "" H 5275 4475 50  0001 C CNN
F 3 "" H 5275 4475 50  0001 C CNN
	1    5275 4475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5FED2BC8
P 4725 5850
F 0 "#PWR018" H 4725 5600 50  0001 C CNN
F 1 "GND" H 4730 5677 50  0000 C CNN
F 2 "" H 4725 5850 50  0001 C CNN
F 3 "" H 4725 5850 50  0001 C CNN
	1    4725 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5FED1FD1
P 6575 5875
F 0 "#PWR020" H 6575 5625 50  0001 C CNN
F 1 "GND" H 6580 5702 50  0000 C CNN
F 2 "" H 6575 5875 50  0001 C CNN
F 3 "" H 6575 5875 50  0001 C CNN
	1    6575 5875
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 5FECC9C0
P 4125 5200
F 0 "#PWR013" H 4125 5050 50  0001 C CNN
F 1 "+5V" H 4140 5373 50  0000 C CNN
F 2 "" H 4125 5200 50  0001 C CNN
F 3 "" H 4125 5200 50  0001 C CNN
	1    4125 5200
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_A J2
U 1 1 5FE5E9B8
P 6175 5550
F 0 "J2" V 6278 5879 50  0000 L CNN
F 1 "USB_A" V 6187 5879 50  0000 L CNN
F 2 "a_manne:usb-a" H 6325 5500 50  0001 C CNN
F 3 " ~" H 6325 5500 50  0001 C CNN
	1    6175 5550
	0    -1   -1   0   
$EndComp
$Comp
L Connector:USB_B_Micro J1
U 1 1 5FE5E1FE
P 4325 5550
F 0 "J1" V 4428 5880 50  0000 L CNN
F 1 "USB_B_Micro" V 4337 5880 50  0000 L CNN
F 2 "a_manne:usb-micro" H 4475 5500 50  0001 C CNN
F 3 "~" H 4475 5500 50  0001 C CNN
	1    4325 5550
	0    -1   -1   0   
$EndComp
Text GLabel 2475 2325 3    60   Input ~ 0
RADAR_ON
Text GLabel 1425 5950 0    60   Input ~ 0
LIGHT_ON
Wire Wire Line
	775  5350 775  5400
Wire Wire Line
	775  5350 1525 5350
Wire Wire Line
	6575 5550 6575 5650
Connection ~ 4725 5650
Wire Wire Line
	4725 5650 4725 5850
Wire Wire Line
	3250 5650 3250 5850
Wire Wire Line
	3250 5200 3250 5350
$Comp
L power:+5V #PWR012
U 1 1 5FF4C537
P 3250 5200
F 0 "#PWR012" H 3250 5050 50  0001 C CNN
F 1 "+5V" H 3265 5373 50  0000 C CNN
F 2 "" H 3250 5200 50  0001 C CNN
F 3 "" H 3250 5200 50  0001 C CNN
	1    3250 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5FF4BD2C
P 3250 5850
F 0 "#PWR017" H 3250 5600 50  0001 C CNN
F 1 "GND" H 3255 5677 50  0000 C CNN
F 2 "" H 3250 5850 50  0001 C CNN
F 3 "" H 3250 5850 50  0001 C CNN
	1    3250 5850
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:C-cdm324-rescue C13
U 1 1 5FF36059
P 3250 5500
F 0 "C13" H 3275 5600 50  0000 L CNN
F 1 "100u" H 3275 5400 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3288 5350 50  0001 C CNN
F 3 "" H 3250 5500 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" H 3250 5500 60  0001 C CNN "Field4"
	1    3250 5500
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:R-cdm324-rescue R11
U 1 1 60355D35
P 5275 5425
F 0 "R11" V 5355 5425 50  0000 C CNN
F 1 "47k" V 5275 5425 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5205 5425 50  0001 C CNN
F 3 "" H 5275 5425 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/yageo/RC0805FR-0710KL/311-10.0KCRCT-ND/730482" V 5275 5425 60  0001 C CNN "Field4"
	1    5275 5425
	-1   0    0    -1  
$EndComp
Text GLabel 5275 6275 3    60   Input ~ 0
LIGHT_ON
Wire Wire Line
	3950 2200 4175 2200
$Comp
L daughterboard-rescue:R-cdm324-rescue R4
U 1 1 5FE0ED7D
P 3725 2350
F 0 "R4" V 3805 2350 50  0000 C CNN
F 1 "1R0" V 3725 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3655 2350 50  0001 C CNN
F 3 "" H 3725 2350 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/yageo/RC0805FR-0710KL/311-10.0KCRCT-ND/730482" V 3725 2350 60  0001 C CNN "Field4"
	1    3725 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 1675 5050 1675
Connection ~ 4400 1675
Wire Wire Line
	1425 5850 1525 5850
Wire Wire Line
	6050 3025 6150 3025
Wire Wire Line
	4100 3175 4100 3250
Text GLabel 9125 3700 2    60   Input ~ 0
RADAR_OUT2
$Comp
L daughterboard-rescue:C-cdm324-rescue C6
U 1 1 58A9A56B
P 8425 2000
F 0 "C6" H 8450 2100 50  0000 L CNN
F 1 "10u" H 8450 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8463 1850 50  0001 C CNN
F 3 "" H 8425 2000 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" H 8425 2000 60  0001 C CNN "Field4"
	1    8425 2000
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:GND-cdm324-rescue #PWR03
U 1 1 58A9A5DA
P 8425 2275
F 0 "#PWR03" H 8425 2025 50  0001 C CNN
F 1 "GND" H 8425 2125 50  0000 C CNN
F 2 "" H 8425 2275 50  0000 C CNN
F 3 "" H 8425 2275 50  0000 C CNN
	1    8425 2275
	1    0    0    -1  
$EndComp
$Comp
L a_manne:OPA2365 U1
U 1 1 6042453E
P 6950 2925
F 0 "U1" H 6908 2978 60  0001 L CNN
F 1 "OPA2365" H 6750 3150 60  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6950 2925 60  0001 C CNN
F 3 "" H 6950 2925 60  0001 C CNN
	1    6950 2925
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:GND-cdm324-rescue #PWR04
U 1 1 6043A8B8
P 8850 2275
F 0 "#PWR04" H 8850 2025 50  0001 C CNN
F 1 "GND" H 8850 2125 50  0000 C CNN
F 2 "" H 8850 2275 50  0000 C CNN
F 3 "" H 8850 2275 50  0000 C CNN
	1    8850 2275
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 2925 8900 3500
Wire Wire Line
	8900 3700 8725 3700
Wire Wire Line
	8900 3500 8725 3500
Connection ~ 8900 3500
Wire Wire Line
	8900 3500 8900 3700
$Comp
L daughterboard-rescue:C-cdm324-rescue C10
U 1 1 58A98CBE
P 7525 3025
F 0 "C10" V 7575 3125 50  0000 L CNN
F 1 "10u" V 7575 2825 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7563 2875 50  0001 C CNN
F 3 "" H 7525 3025 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" V 7525 3025 60  0001 C CNN "Field4"
	1    7525 3025
	0    -1   -1   0   
$EndComp
$Comp
L daughterboard-rescue:R-cdm324-rescue R8
U 1 1 58A98F99
P 7925 3025
F 0 "R8" V 8005 3025 50  0000 C CNN
F 1 "4k7" V 7925 3025 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7855 3025 50  0001 C CNN
F 3 "" H 7925 3025 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/yageo/RC0805FR-074K7L/311-4.70KCRCT-ND/730876" V 7925 3025 60  0001 C CNN "Field4"
	1    7925 3025
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4925 3025 5750 3025
Connection ~ 6550 3500
Wire Wire Line
	6550 3700 6550 3500
Wire Wire Line
	6775 3700 6550 3700
Wire Wire Line
	6550 3025 6650 3025
Wire Wire Line
	6550 3500 6550 3025
Wire Wire Line
	6775 3500 6550 3500
Wire Wire Line
	7250 3500 7250 3700
Connection ~ 7250 3500
Wire Wire Line
	7075 3500 7250 3500
Wire Wire Line
	7250 3700 7075 3700
Wire Wire Line
	7250 2925 7250 3025
$Comp
L a_manne:OPA2365 U1
U 2 1 60422D12
P 8600 2925
F 0 "U1" H 8575 2925 60  0000 C CNN
F 1 "OPA2365" H 8600 3175 60  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 8600 2925 60  0001 C CNN
F 3 "" H 8600 2925 60  0001 C CNN
	2    8600 2925
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:C-cdm324-rescue C11
U 1 1 58A96CA5
P 6925 3700
F 0 "C11" V 6975 3800 50  0000 L CNN
F 1 "270p" V 6975 3450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6963 3550 50  0001 C CNN
F 3 "" H 6925 3700 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/yageo/CC0805JRNPO9BN271/311-1116-1-ND/303026" V 6925 3700 60  0001 C CNN "Field4"
	1    6925 3700
	0    1    -1   0   
$EndComp
$Comp
L daughterboard-rescue:R-cdm324-rescue R9
U 1 1 58A96BD8
P 6925 3500
F 0 "R9" V 7005 3500 50  0000 C CNN
F 1 "590k" V 6925 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6855 3500 50  0001 C CNN
F 3 "" H 6925 3500 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF5903V/P590KCCT-ND/119773" V 6925 3500 60  0001 C CNN "Field4"
	1    6925 3500
	0    1    -1   0   
$EndComp
Wire Wire Line
	7675 3025 7775 3025
Wire Wire Line
	8200 3025 8200 3500
Wire Wire Line
	8075 3025 8200 3025
Wire Wire Line
	8200 3025 8300 3025
Connection ~ 8200 3025
Wire Wire Line
	8200 2825 8300 2825
Wire Wire Line
	8425 3500 8200 3500
Connection ~ 8200 3500
Wire Wire Line
	8200 3500 8200 3700
Wire Wire Line
	8425 3700 8200 3700
Wire Wire Line
	6450 3025 6550 3025
Connection ~ 6550 3025
Wire Wire Line
	6650 2825 6550 2825
Wire Wire Line
	8425 2275 8425 2150
Wire Wire Line
	8850 1675 8425 1675
Wire Wire Line
	8425 1675 8425 1850
$Comp
L daughterboard-rescue:GND-cdm324-rescue #PWR06
U 1 1 58A97863
P 5600 2600
F 0 "#PWR06" H 5600 2350 50  0001 C CNN
F 1 "GND" H 5600 2450 50  0000 C CNN
F 2 "" H 5600 2600 50  0000 C CNN
F 3 "" H 5600 2600 50  0000 C CNN
	1    5600 2600
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:C-cdm324-rescue C7
U 1 1 58A971B9
P 5900 2525
F 0 "C7" V 5950 2600 50  0000 L CNN
F 1 "10u" V 5950 2325 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5938 2375 50  0001 C CNN
F 3 "" H 5900 2525 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" H 5900 2525 60  0001 C CNN "Field4"
	1    5900 2525
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 2825 6550 2525
Wire Wire Line
	6450 2525 6550 2525
Wire Wire Line
	5600 2600 5600 2525
Wire Wire Line
	5600 2525 5750 2525
Wire Wire Line
	4100 2525 4100 2875
$Comp
L a_manne:OPA2365 U1
U 3 1 604237DE
P 8950 1975
F 0 "U1" H 8925 1975 60  0000 C CNN
F 1 "OPA2365" H 8950 2225 60  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 8950 1975 60  0001 C CNN
F 3 "" H 8950 1975 60  0001 C CNN
	3    8950 1975
	1    0    0    -1  
$EndComp
Wire Wire Line
	7375 3025 7250 3025
Connection ~ 7250 3025
Wire Wire Line
	7250 3025 7250 3500
Wire Wire Line
	8200 2525 8200 2825
Wire Wire Line
	5050 1675 5050 2525
Wire Wire Line
	4100 2525 5050 2525
Connection ~ 5050 2525
Wire Wire Line
	5050 2525 5050 2925
$Comp
L daughterboard-rescue:C-cdm324-rescue C12
U 1 1 58A99245
P 8575 3700
F 0 "C12" V 8625 3800 50  0000 L CNN
F 1 "270p" V 8625 3450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8613 3550 50  0001 C CNN
F 3 "" H 8575 3700 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/yageo/CC0805JRNPO9BN271/311-1116-1-ND/303026" V 8575 3700 60  0001 C CNN "Field4"
	1    8575 3700
	0    1    -1   0   
$EndComp
$Comp
L daughterboard-rescue:R-cdm324-rescue R5
U 1 1 58A98335
P 6300 2525
F 0 "R5" V 6380 2525 50  0000 C CNN
F 1 "4k7" V 6300 2525 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6230 2525 50  0001 C CNN
F 3 "" H 6300 2525 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/yageo/RC0805FR-074K7L/311-4.70KCRCT-ND/730876" V 6300 2525 60  0001 C CNN "Field4"
	1    6300 2525
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2475 2325 2475 2125
Connection ~ 2475 2125
$Comp
L Device:Q_PMOS_GSD Q2
U 1 1 606A6C4F
P 5650 5300
F 0 "Q2" V 5992 5300 50  0000 C CNN
F 1 "Q_PMOS_GSD" V 5901 5300 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5850 5400 50  0001 C CNN
F 3 "~" H 5650 5300 50  0001 C CNN
	1    5650 5300
	0    1    -1   0   
$EndComp
Wire Wire Line
	5450 5200 5275 5200
Connection ~ 5275 5200
Wire Wire Line
	5275 5200 5275 5275
Wire Wire Line
	5650 5500 5650 5650
Wire Wire Line
	5650 5650 5275 5650
Wire Wire Line
	5275 5575 5275 5650
Connection ~ 5275 5650
Wire Wire Line
	6575 5650 6575 5875
Connection ~ 6575 5650
Wire Wire Line
	5850 5200 5975 5200
Text GLabel 1425 5650 0    60   Input ~ 0
RADAR_ON
Wire Wire Line
	1425 5650 1525 5650
$Comp
L a_manne:emi_shield U4
U 1 1 5FE0C5AE
P 2100 4000
F 0 "U4" H 2042 4287 60  0000 C CNN
F 1 "emi_shield" H 2042 4181 60  0000 C CNN
F 2 "a_manne:sms-202c" H 2100 4000 60  0001 C CNN
F 3 "" H 2100 4000 60  0001 C CNN
	1    2100 4000
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:GND-cdm324-rescue #PWR0101
U 1 1 5FE0CB3E
P 1650 4050
F 0 "#PWR0101" H 1650 3800 50  0001 C CNN
F 1 "GND" H 1655 3877 50  0000 C CNN
F 2 "" H 1650 4050 50  0000 C CNN
F 3 "" H 1650 4050 50  0000 C CNN
	1    1650 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 4050 1750 4050
Wire Wire Line
	2900 5650 2900 5850
Wire Wire Line
	2900 5200 2900 5350
$Comp
L power:+5V #PWR0102
U 1 1 5FE17446
P 2900 5200
F 0 "#PWR0102" H 2900 5050 50  0001 C CNN
F 1 "+5V" H 2915 5373 50  0000 C CNN
F 2 "" H 2900 5200 50  0001 C CNN
F 3 "" H 2900 5200 50  0001 C CNN
	1    2900 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5FE1744C
P 2900 5850
F 0 "#PWR0103" H 2900 5600 50  0001 C CNN
F 1 "GND" H 2905 5677 50  0000 C CNN
F 2 "" H 2900 5850 50  0001 C CNN
F 3 "" H 2900 5850 50  0001 C CNN
	1    2900 5850
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:C-cdm324-rescue C14
U 1 1 5FE17453
P 2900 5500
F 0 "C14" H 2925 5600 50  0000 L CNN
F 1 "10u" H 2925 5400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2938 5350 50  0001 C CNN
F 3 "" H 2900 5500 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" H 2900 5500 60  0001 C CNN "Field4"
	1    2900 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5FE5ED16
P 5475 4475
F 0 "#PWR07" H 5475 4325 50  0001 C CNN
F 1 "+5V" H 5490 4648 50  0000 C CNN
F 2 "" H 5475 4475 50  0001 C CNN
F 3 "" H 5475 4475 50  0001 C CNN
	1    5475 4475
	1    0    0    -1  
$EndComp
$Comp
L daughterboard-rescue:C-cdm324-rescue C15
U 1 1 5FE5ED23
P 5475 4625
F 0 "C15" H 5500 4725 50  0000 L CNN
F 1 "100u" H 5500 4525 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5513 4475 50  0001 C CNN
F 3 "" H 5475 4625 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21B106KOQNNNE/1276-2872-1-ND/3890958" H 5475 4625 60  0001 C CNN "Field4"
	1    5475 4625
	1    0    0    -1  
$EndComp
Wire Wire Line
	5275 4475 5275 5200
$Comp
L power:GND #PWR0104
U 1 1 5FE85611
P 5475 4775
F 0 "#PWR0104" H 5475 4525 50  0001 C CNN
F 1 "GND" H 5480 4602 50  0000 C CNN
F 2 "" H 5475 4775 50  0001 C CNN
F 3 "" H 5475 4775 50  0001 C CNN
	1    5475 4775
	1    0    0    -1  
$EndComp
$Comp
L a_manne:REF20xx U5
U 1 1 60022B7F
P 5725 1775
F 0 "U5" H 5725 2122 60  0000 C CNN
F 1 "REF20xx" H 5725 2016 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5725 1775 60  0001 C CNN
F 3 "" H 5725 1775 60  0001 C CNN
	1    5725 1775
	1    0    0    -1  
$EndComp
Connection ~ 8425 1675
$Comp
L daughterboard-rescue:GND-cdm324-rescue #PWR02
U 1 1 58A96461
P 5300 1950
F 0 "#PWR02" H 5300 1700 50  0001 C CNN
F 1 "GND" H 5300 1800 50  0000 C CNN
F 2 "" H 5300 1950 50  0000 C CNN
F 3 "" H 5300 1950 50  0000 C CNN
	1    5300 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5375 1775 5300 1775
Wire Wire Line
	5300 1775 5300 1675
Connection ~ 5300 1675
Wire Wire Line
	5300 1675 5375 1675
Wire Wire Line
	5050 1675 5300 1675
Connection ~ 5050 1675
Wire Wire Line
	5375 1875 5300 1875
Wire Wire Line
	5300 1875 5300 1950
Wire Wire Line
	6050 2525 6100 2525
Wire Wire Line
	6100 2525 6100 1875
Wire Wire Line
	6100 1875 6075 1875
Connection ~ 6100 2525
Wire Wire Line
	6100 2525 6150 2525
Wire Wire Line
	6075 1675 8425 1675
Wire Wire Line
	6550 2525 8200 2525
Connection ~ 6550 2525
Text GLabel 7400 3700 2    60   Input ~ 0
RADAR_OUT1
Wire Wire Line
	8900 3700 9125 3700
Connection ~ 8900 3700
Wire Wire Line
	7250 3700 7400 3700
Connection ~ 7250 3700
Text GLabel 1400 6975 0    60   Input ~ 0
RADAR_OUT1
Text GLabel 2550 6250 2    60   Input ~ 0
GPS_RX
Text GLabel 1425 5850 0    60   Input ~ 0
RADAR_OUT2
Wire Wire Line
	2425 6250 2550 6250
Wire Wire Line
	1425 6150 1525 6150
Wire Wire Line
	1425 5950 1525 5950
Text GLabel 1425 6150 0    60   Input ~ 0
RADAR_OUT1
$Comp
L daughterboard-rescue:R-cdm324-rescue R2
U 1 1 600BCD2A
P 5275 5975
F 0 "R2" V 5355 5975 50  0000 C CNN
F 1 "500" V 5275 5975 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5205 5975 50  0001 C CNN
F 3 "" H 5275 5975 50  0000 C CNN
F 4 "http://www.digikey.com/product-detail/en/yageo/RC0805FR-0710KL/311-10.0KCRCT-ND/730482" V 5275 5975 60  0001 C CNN "Field4"
	1    5275 5975
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5275 5650 5275 5825
Wire Wire Line
	5275 6125 5275 6275
$EndSCHEMATC
