---
title: Driver
parent: Acquisition
grand_parent: Generation 4
nav_order: 1
---

1. TOC
{:toc}

# Driver PCB

The driver board measures 40×40mm² and has four 4×4 male pins (>=v0.2) or two 2×6 female sockets (v0.1) on the bottom layer. The top of the driver board is either covered in LEDs (>=v1.0) or has connectors to off-the-shelf LED matrices. [Version 2](#driver-v2) makes the use of different colors easier, but is functionally very similar to [version 1](#driver-v1).

Historically, the driver used four off-the-shelf LED panels for each of the quadrants (<=v0.3). Since then, each of the quadrants has its own micro controller unit (MCU) that handles a matrix of 8×8 LEDs. The panels with two 2×6 connectors use I²C for the communication between comm and driver, since version v0.2 SPI was used for this internal communication as well. The MCUs translate the brightness commands for pixels into pulse-width modulation for individual LEDs.

![Driver version 2.0 vs version 1.0](assets/driver_v2p0_back_wiring_photo.jpg){:standalone .ifr .clear data-img-class="pop"}

The difference between driver-v2 and driver-v1 is the internal wiring of individual columns. The image on the right shows the LEDs on a driver with an overlay on how they are connected. The cyan and magenta lines show, which LEDs belong to a single column in driver-v2.x, the yellow lines on the right show the connections in driver-v1.x. Currently, we only share the design files for a driver-v1.x.

If you intend to use one-colored drivers, we recommend driver-v1 as they are slightly easier to debug on a hardware level, should that be necessary. Currently, we have not shared the driver-v2 designs, but please [get in contact]({{site.baseurl}}/Contact) if you would like to have them.

## Panel Driver PCB v2.x (40mm) {#driver-v2}

![Driver version 2.0](assets/driver_v2p0_front_photo.jpg){:standalone .ifr .clear data-img-class="pop"}

Driver boards >=v2.0 are PCBs measuring 40×40mm² and with the same connectors as the driver-v1.x. The strongest visible difference is in the location of the MCUs: in version-2.x the four square ATmega328 chips positioned in a straight line. The difference is in how the LEDs are connected: the first LED from the first row is connected to the second LED in the second row, the first in the third row,  the second in the fourth row, and so on. Basically, two neighboring columns are interleaved. This positioning increases the color resolution for multicolored displays especially with two colors. In most matrices, individual LEDs are addressed by closing a circuit for a row and column at the same time. The LED at the intersection of the activated row and column then turns on. Either the row or column needs to provide the current limiting resistor that is specific to the type of LED it connects to.

For the G4 drivers, a column of eight LEDs within a quadrant is connected to such a resistor. This means, all LEDs of a column need to be of the same type. If you want to use differently colored LEDs, then they need to be organized by columns with their according resistor. For a bi-colored panel where the electrical columns are organized in physical columns, even columns would have one color *A*, odd columns another *B*. A moving bar of color *A* would therefore move from column 1 to 3 to 5 and so on, skipping the columns of different color. By interweaving the colors in such a checkerboard layout, a moving bar of color *A* could move at a higher resolution from columns 1 to 2 to 3 and so on. This comes at the cost of density, so driver-v1.x and driver-v2.x are for different use cases.

Functionally, the driver-v2.x is very similar to the driver-v1.x. During the creation of visual patterns, a [configuration option has to be set]({{site.baseurl}}/Generation%204/Display_Tools/docs/pattern-generator.html#checkerboard), everything is the same for setting up and running an arena with either driver-v1.x or driver-v2.x. But because of this small difference, mixing different versions of driver-boards in the same arena is currently not supported.

## Panel Driver PCB v1.x (40mm) {#driver-v1}

![Driver version 1.2](assets/driver_v1p2_front_photo.jpg){:standalone .ifr .clear data-img-class="pop"}

Driver boards >=v1.2 are 6 layer PCBs measuring 40×40mm². Note the different position of the MCUs, which makes this version easily distinguishable from driver-v2.x. The most recent production files are archived in `driver_40mm_atmega_v1/production_v1/driver-v1p8.zip` with a changelog available in the `driver_40mm_atmega_v1/production_v1/README.mdown` file.

The Panel Driver PCBs are built from 6 layers. The BOTTOM layer contains all LEDs, followed by the GND layer, two logic layers, a power layer, and the TOP layer for the electronic components such as the MCUs and connectors. All components are SMD with the smallest component measuring 0402 (imperial) or 1005 (metric). Therefore factory assembly is recommended.

### Function

This paragraph is a high-level description of what is detailed in the [schematics](assets/driver_40mm_atmega_v1_schematic.pdf). The driver PCB receives signals on the four connectors (J1…J4), one for each quadrant. Each quadrant uses an ATmega328P-MU (U1…U4) to turn the LEDs (D1…256) on and off. The LEDs in each of the four quadrants are organized in an 8×8 matrix. The ATmega use a row-scan algorithm, where at each point in time a single row is active. From this row any of the 8 LEDs can be turned on or off. Brightness is regulated through pulse width modulation. Each column uses its own resistor, therefore LEDs of different colors can be used for each column.

### Design

Notice, that the second to the bottom layer is a ground layer. This design choice was intended to keep the electrical noise for ephys experiments down. So far we can't quantify if it worked, but we wanted to point out one of the not so obvious design choices.

The driver board was designed in-house at Janelia's [jET](https://www.janelia.org/support-team/janelia-experimental-technology) group. The [OrCAD](https://www.orcad.com/) EDA source file is provided for reference, although the latest production files might not always correspond with the design file version.

# Historic designs

![Photo of a 40mm driver version 0.4 without LEDs](assets/driver_v0p4_front_photo.jpg){:.ifr .pop}

![Photo of a 40mm driver version 0.1…0.4 with an LED matrix](assets/driver_v0p2_back_photo.jpg){:standalone .ifr .clear data-img-class="pop"}

These designs are kept for historic reasons and to debug existing systems. If you have one of them, you probably know what to do and just need the files. If you are building a new system, don't use them. You can find the designs of the older drivers in the same repository as the [comm board]({{site.baseurl}}/Generation%204/Hardware/docs/comm.html).

Earlier versions of the driver were designed for off-the-shelf LED matrices. Historically this is what has been used in Generation 3 LED arenas and before as well. The latest version of the off-the-shelf LED matrices version, which is designed for four 20×20mm² components, is driver v0.4 at `driver_40mm_atmega_v0p4/production_v0`.

The difference between the historic versions (except [v0.1](#driver-v0p1)!) is minimal and can be documented if necessary. In general, they should be compatible between design iterations. Please [get in contact]({{site.baseurl}}/Contact) if you need further information.

## Panel Driver v0.5 (40mm, WIP) {#driver-v0p5}

![Rendering of the 40mm driver version v0.5 (front)](assets/driver_40mm_atmega_v0p5_front.png){:.ifr .pop}

![Rendering of the 40mm driver version v0.5](assets/driver_40mm_atmega_v0p5_back.png){:standalone .ifr .clear data-img-class="pop"}

Version 0.5 was the first attempt to build a driver with a custom LED matrix instead of the pre-fabricated 20×20mm² LED matrices. This project never finished as it was handed over from IO Rodeo to jET at the time, but the work-in-progress files are archived at `driver_40mm_atmega_v0p5`. The [schematics](assets/driver_40mm_atmega_v0p5_schematic.pdf) are very similar to previous versions, replacing the pre-fabricated LED matrices with a custom grid of rows and columns.

## Panel Driver v0.4 (40mm) {#driver-v0p4}

![Rendering of the 40mm driver version v0.4 (front)](assets/driver_40mm_atmega_v0p4_front.png){:.ifr .pop}

![Rendering of the 40mm driver version v0.4](assets/driver_40mm_atmega_v0p4_back.png){:standalone .ifr .clear data-img-class="pop"}

This is the latest version of the driver with prefabricated LED matrices.

Find the KiCad design files at `driver_40mm_atmega_v0p4` and have a look at the [schematics](assets/driver_40mm_atmega_v0p4_schematic.pdf).

## Panel Driver v0.3 (40mm) {#driver-v0p3}

![Rendering of the 40mm driver version v0.3 (front)](assets/driver_40mm_atmega_v0p3_front.png){:.ifr .pop}

![Rendering of the 40mm driver version v0.3](assets/driver_40mm_atmega_v0p3_back.png){:standalone .ifr .clear data-img-class="pop"}

Find the KiCad design files at `driver_40mm_atmega_v0p3` and have a look at the [schematics](assets/driver_40mm_atmega_v0p3_schematic.pdf).

## Panel Driver v0.2 (40mm) {#driver-v0p2}

![Rendering of the 40mm driver version v0.2 (front)](assets/driver_40mm_atmega_v0p2_front.png){:.ifr .pop}

![Rendering of the 40mm driver version v0.2](assets/driver_40mm_atmega_v0p2_back.png){:standalone .ifr .clear data-img-class="pop"}

Find the KiCad design files at `driver_40mm_atmega_v0p1` and have a look at the [schematics](assets/driver_40mm_atmega_v0p2_schematic.pdf).

## Panel Driver v0.1 (40mm) {#driver-v0p1}

![Rendering of the 40mm driver version 0.1 (front)](assets/driver_40mm_atmega_v0p1_front.png){:.ifr .pop}

![Rendering of the 40mm driver version 0.1](assets/driver_40mm_atmega_v0p1_back.png){:standalone .ifr .clear data-img-class="pop"}

The first driver with ATmega MCU used I²C for the communication between controller and arena. They are not compatible with later versions.

Find the KiCad design files at `driver_40mm_atmega_v0p1` and have a look at the [schematics](assets/driver_40mm_atmega_v0p1_schematic.pdf).

## Panel Driver v0.2 (32mm, WIP) {#driver-32-v0p2}

![Rendering of the 32mm driver version 0.2 (front)](assets/driver_32mm_atmega_v0p2_front.png){:.ifr .pop}

![Rendering of the 32mm driver version 0.2](assets/driver_32mm_atmega_v0p2_back.png){:standalone .ifr .clear data-img-class="pop"}

The 32mm driver v0.2 was designed in 2012. Compared to [version 0.1](#driver-32-v0p1) it uses MOSFETs. The [schematics](assets/driver_32mm_atmega_v0p2_schematic.pdf) have already been updated, the board design itself hasn't been done yet. The Find the KiCad design files at `driver_32mm_atmega_v0p2`.

## Panel Driver v0.1 (32mm) {#driver-32-v0p1}

![Rendering of the 32mm driver version 0.1 (front)](assets/driver_32mm_atmega_v0p1_front.png){:.ifr .pop}
![Rendering of the 32mm driver version 0.1](assets/driver_32mm_atmega_v0p1_back.png){:standalone .ifr .clear data-img-class="pop"}

The 32mm driver v0.1 was designed in 2012 and is basically the same as the Generation 2 panel. The Find the KiCad design files at `driver_32mm_atmega_v0p1` and have a look at the [schematics](assets/driver_32mm_atmega_v0p1_schematic.pdf).

## Panel Driver MAX6960 v0.1 (32mm)

![Rendering of the 32mm driver version 0.1 using a MAX6960 (front)](assets/driver_32mm_max6960_v0p1_front.png){:.ifr .pop}

![Rendering of the 32mm driver version 0.1 using a MAX6960](assets/driver_32mm_max6960_v0p1_back.png){:standalone .ifr .clear data-img-class="pop"}

![Rendering of the adapter between 32mm matrix and 32mm driver v0.1 (front)](assets/adapter_32mm-32mm_v0p1_front.png){:.ifr .pop .clear}

![Rendering of the adapter between 32mm matrix and 32mm driver v0.1](assets/adapter_32mm-32mm_v0p1_back.png){:standalone .ifr .clear data-img-class="pop"}

In 2013 there was an attempt to build 32mm drivers with a MAX6960, a "4-wire serially interfaced 8×8 matrix graphics LED driver" chip by Maxim Integrated. Have a look at the [schematics](assets/driver_32mm_max6960_v0p1_schematic.pdf) and find the design files at `driver_32mm_max6960_v0`.

In addition to the driver, this setup required another PCB as an adapter on the back of the LED matrix. The version 0.1 ([schematics](assets/adapter_32mm-32mm_v0p1_schematic.pdf)) and the project is inside `driver_32mm_max6960_v0/adapter_32mm-32mm_v0`.

## Panel Driver MAX6960 v0.1 (40mm)

![Rendering of the 40mm driver version 0.1 using a MAX6960 front](assets/driver_40mm_max6960_v0p1_front.png){:.ifr .pop}

![Rendering of the 40mm driver version 0.1 using a MAX6960](assets/driver_40mm_max6960_v0p1_back.png){:standalone .ifr .clear data-img-class="pop"}

![Rendering of the adapter between 20mm matrix and 40mm driver v0.1 (front)](assets/adapter_20mm-40mm_v0p1_front.png){:.ifr .pop .clear}

![Rendering of the adapter between 20mm matrix and 40mm driver v0.1](assets/adapter_20mm-40mm_v0p1_back.png){:standalone .ifr .clear data-img-class="pop"}

![Rendering of the adapter between 20mm matrix and 40mm driver v0.2 (front)](assets/adapter_20mm-40mm_v0p2_front.png){:.ifr .pop .clear}

![Rendering of the adapter between 20mm matrix and 40mm driver v0.2](assets/adapter_20mm-40mm_v0p2_back.png){:standalone .ifr .clear data-img-class="pop"}

In 2013 there was an attempt to build 40mm drivers with a MAX6960, a "4-wire serially interfaced 8×8 matrix graphics LED driver" chip by Maxim Integrated. Have a look at the [schematics](assets/driver_40mm_max6960_v0p1_schematic.pdf) and find the design files at `driver_40mm_max6960_v0`.

In addition to the driver, this setup required another PCB as an adapter on the back of the LED matrix. The version 0.1 ([schematics](assets/adapter_20mm-40mm_v0p1_schematic.pdf)) used a 2-layer PCB, version 0.2 ([schematic](assets/adapter_20mm-40mm_v0p2_schematic.pdf)) uses a 4-layer process. The projects for the adapters are inside the `driver_40mm_max6960_v0/adapter_20mm-40mm_v0p1` and `driver_40mm_max6960_v0/adapter_20mm-40mm_v0p2` directories, the production files are inside `driver_40mm_max6960_v0/production_v0`.

## Panel Driver MAX6960 v0.1 (32×64mm²)

![Rendering of the 32×64mm² driver version 0.1 using a MAX6960 (front)](assets/driver_32-64mm_max6960_v0p1_front.png){:.ifr .pop}

![Rendering of the 32×64mm² driver version 0.1 using a MAX6960](assets/driver_32-64mm_max6960_v0p1_back.png){:standalone .ifr .clear data-img-class="pop"}

![Rendering of the adapter between two 32mm matrix and 32×64mm² driver (front)](assets/adapter_32-64mm-32-64mm_v0p1_front.png){:.ifr .pop .clear}

![Rendering of the adapter between two 32mm matrix and 32×64mm² driver](assets/adapter_32-64mm-32-64mm_v0p1_back.png){:standalone .ifr .clear data-img-class="pop"}

![Rendering of the adapter between one 32mm matrix and 32×64mm² driver (front)](assets/adapter_32-32mm-32-64mm_v0p1_front.png){:.ifr .pop .clear}

![Rendering of the adapter between one 32mm matrix and 32×64mm² driver](assets/adapter_32-32mm-32-64mm_v0p1_back.png){:standalone .ifr .clear data-img-class="pop"}

![Rendering of the adapter between one 32mm matrix and 32×64mm² driver with diodes (front)](assets/adapter_32-32mm-32-64mm-D_v0p1_front.png){:.ifr .pop .clear}

![Rendering of the adapter between one 32mm matrix and 32×64mm² driver with diodes](assets/adapter_32-32mm-32-64mm-D_v0p1_back.png){:standalone .ifr .clear data-img-class="pop"}

There is also a 32×64mm² version of an a MAX6960 driven driver using 2 pre-fabricated LED matrices with a 32mm footprint each for the display. Inside the project at `driver_32-64mm_max6960_v0`, there are [schematics](assets/adapter_32mm-64mm_v0p1_schematic.pdf).

The schematic for the [two matrix adapter](assets/adapter_32-64mm-32-64mm_v0p1_schematic.pdf) are used in the design files at `driver_32-64mm_max6960_v0/adapter_32-64mm-32-64mm` and the [one matrix adapter](assets/adapter_32-32mm-32-64mm_v0p1_schematic.pdf) inside `driver_32-64mm_max6960_v0/adapter_32-32mm-32-64mm`, but he design files are in `driver_32-64mm_max6960_v0/production_v0/adapter_32-64mm-32-64mm_v0p1.zip` and `driver_32-64mm_max6960_v0/production_v0/adapter_32-32mm-32-64mm_v0p1.zip` respectively. Finally, there is also an adapter with some additional diodes on each signal line ([schematic](assets/adapter_32-32mm-32-64mm-D_v0p1_schematic.pdf)), available at `driver_32-64mm_max6960_v0/adapter_32-32mm-32-64mm-D` and `driver_32-64mm_max6960_v0/production_v0/adapter_32-32mm-32-64mm-D_v0p1.zip`.

## Panel Driver MAX6960 v0.1 (64mm)

![Rendering of the 64mm driver version 0.1 using a MAX6960 (front)](assets/driver_64mm_max6960_v0p1_front.png){:.ifr .pop}

![Rendering of the 64mm driver version 0.1 using a MAX6960](assets/driver_64mm_max6960_v0p1_back.png){:standalone .ifr .clear data-img-class="pop"}

![Rendering of the adapter between 32mm matrix and 64mm driver (front)](assets/adapter_32mm-64mm_v0p1_front.png){:.ifr .pop .clear}

![Rendering of the adapter between 32mm matrix and 64mm driver](assets/adapter_32mm-64mm_v0p1_back.png){:standalone .ifr .clear data-img-class="pop"}

There is also a 64mm version of an a MAX6960 driven driver using 4 pre-fabricated LED matrices with a 32mm footprint each for the display. Inside the project at `driver_64mm_max6960_v0/adapter_32mm-64mm_v0p1`, there are [schematics](assets/adapter_32mm-64mm_v0p1_schematic.pdf) and design files for an adapter pcb between the 32mm footprint of the pLED matrices and the 64mm of the driver. Judging by the available files, this designer was presumably never produced. Have a look at the [schematics](assets/driver_64mm_max6960_v0p1_schematic.pdf) and find the design files at `driver_64mm_max6960_v0p1`.
