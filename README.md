# DE1 project 2: Door lock system with PIN (4-digit) terminal, 4x3 push buttons, 4-digit 7-segment display, relay for door lock control

### Team members

- Jan Čada
- Artem Denisov
- Milan Drahozal
- Adrián Dúbravka

[Link to GitHub project folder](http://github.com/xcadaj00/DE1_project)

### Project objectives

Write your text here.


## Hardware description

Used components are connected to Arty A7 board as shield. PCB is designed in easyEDA. 

### Schematics



### Table(s) of pins and ports



### Table(s) of components

| **Name** | **Indication** | **Vaule** | **Case** | **Amount** | **Link** | 
| :-: | :-: | :-: | :-: | :-: | :-: |
| 40P Male header | | pitch 2,54mm  | - | 2 | [GMe.cz](https://www.gme.cz/oboustranny-kolik-s1g40-2-54mm) |
| 5V Relay | Relay | 120VAC/15A | - | 1 | [GMe.cz](https://www.gme.cz/relras0515) |
| Screw terminal 3P | | 16A/250V | - | 1 | [GMe.cz](https://www.gme.cz/svorkovnice-sroubovaci-do-dps-ark508-3p) |
| Diode | D1 | 1000V/1A | SOD-123FL | 1 | [GMe.cz](https://www.gme.cz/dioda-1n4007w) |
| PNP transistor | T1-T4 | 0,5A/0,25W | SOT23 | 4 | [GMe.cz](https://www.gme.cz/bipolarni-tranzistor-bc807-16-sot23) |
| NPN transistor | T5-T6 | 0,5A/0,25W | SOT23 | 2 | [GMe.cz](https://www.gme.cz/bipolarni-tranzistor-bc817-40-sot23) |
| Resistor| R1 - R3 | 10K | 0805 | 3 | [GMe.cz](https://www.gme.cz/r0805-10k-5-yageo) | 
| Resistor |R4 - R11 | 100R | 0805 | 8 | [GMe.cz](https://www.gme.cz/tc-0104) |
| Resistor | R12 - R17 | 1K | 0805 | 6 | [GMe.cz](https://www.gme.cz/r0805-100r-1-yageo) |
| Resistor | R18 | 68R | 1206 | 1 | [GMe.cz](https://www.gme.cz/r1206-68r-5-yageo) |
| Resistor | R19 | 56R | 0805 | 1 | [GMe.cz](https://www.gme.cz/r0805-56r-1-yageo) |
| Microswitch || 0,05A | -| 12 | [GMe.cz](https://www.gme.cz/tc-0104) | 
| LED red/green | LED1 | 30 mA | T1 3/4 | 1 | [GMe.cz](https://www.gme.cz/led-5mm-rg-cc-45-45-50-led-beg204) |
| LED display red | Display | 30 mA | - | 1 | [GMe.cz](https://www.gme.cz/led-display-14-2mm-red-hd-m514rd) |
| Siren  | Siren | 5V | -| 1 | [GMe.cz](https://www.gme.cz/sirenka-kingstate-kxg-0905c) |



### Used parts list

- 2 pcs 40P Male header [GMe.cz](https://www.gme.cz/oboustranny-kolik-s1g40-2-54mm)
- 1 pcs 5V Relay RAS-05-15 [GMe.cz](https://www.gme.cz/relras0515)
- 1 pcs Screw terminal 3P [GMe.cz](https://www.gme.cz/svorkovnice-sroubovaci-do-dps-ark508-3p)
- 1 pcs Diode 1N4007 [GMe.cz](https://www.gme.cz/dioda-1n4007w)
- 4 pcs PNP transistor BC807 [GMe.cz](https://www.gme.cz/bipolarni-tranzistor-bc807-16-sot23)
- 2 pcs NPN transistor BC817 [GMe.cz](https://www.gme.cz/bipolarni-tranzistor-bc817-40-sot23)
- 6 pcs Resistor 1K [GMe.cz](https://www.gme.cz/r0805-1k0-5-yageo)
- 12 pcs Microswitch TC-0104-T [GMe.cz](https://www.gme.cz/tc-0104)
- 3 pcs Resistor 10K [GMe.cz](https://www.gme.cz/r0805-10k-5-yageo)
- 8 pcs Resistor 100R [GMe.cz](https://www.gme.cz/r0805-100r-1-yageo)
- 1 pcs 5mm LED red/green (common cathode) [GMe.cz](https://www.gme.cz/led-5mm-rg-cc-45-45-50-led-beg204)
- 1 pcs LED display red HD-M514RD (common anode) [GMe.cz](https://www.gme.cz/led-display-14-2mm-red-hd-m514rd)
- 1 pcs 5V Siren KXG0905C [GMe.cz](https://www.gme.cz/sirenka-kingstate-kxg-0905c)
- Resistors for red&green LED (both needs to be calculated separately according to datasheet of used LED, consider it is powered by 3.3V)

### PCB design

[PCB design project](https://oshwlab.com/jan.cada/de1_project)

#### Top layer

![](pcb/top.png)

#### Bottom layer

![](pcb/bottom.png)

#### Rendered top

![](pcb/rendertop.png)

#### Rendered bottom

![](pcb/renderbottom.png)

#### Connection of button matrix to FPGA [1]

![](images/matrix.png)



## VHDL modules description and simulations

Write your text here.


## TOP module description and simulations

Write your text here.


## Video

*Write your text here*


## References

   1. Pantech. (2020, May 04). Vhdl-Code-For-Matrix-Keypad with -fpga and output shown in led,s. Retrieved April 09, 2021, from https://www.pantechsolutions.net/blog/vhdl-code-for-matrix-keypad/
