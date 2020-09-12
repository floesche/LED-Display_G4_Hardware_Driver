---
title: Panel PCB
parent: Setup
grand_parent: Generation 4
nav_order: 2
---

# Production files

The `.art` files are GERBER RS274X files.

The `Assembly.art` file contains the constraints for production. For example, the copper layers are as follows: `TOP`, `GND`, `LAYER_1`, `LAYER_2` `PWR`, `BOTTOM`.

* `Assembly.art` - Assembly instructions
* `BOTTOM.art` - Bottom Cu layer (Layer 6)
* `Body_Center.txt` - placement file, using the body center of components, modified format (If manufacturer doesn't specify which placement file, they most likely want this one.)
* `GND.art` - Ground Cu layer (Layer 2)
* `LAYER_1.art` - Logic Cu layer 1 (Layer 3)
* `LAYER_2.art` - Logic Cu layer 2 (Layer 4)
* `driver_L1-6.drl` - Excellon Drill file between Layer 1 and Layer 6. Metric 3:3, auto-tool select, LZ, no repeat codes.
* `Paste_Bottom.art` – bottom solder paste layer
* `Paste_Top.art` – top solder paste layer
* `Pin1.txt` - centroid placement for the pin 1 location of each component
* `place_txt.txt` - centroid placement file
* `PWR.art` - power Cu layer (Layer 5)
* `SilkScreen_Top.art` - Top silkscreen
* `SolderMask_Bottom.art` - bottom solder mask
* `Soldermask_Top.art` - top solder mask
* `TOP.art` - top Cu Layer (Layer 1)
* `BOM.xlsx` - Bill of Materials
* `README.md` - this file

# Changelog

* 2020-09-10 v1.5: updated paste layer without vias
* 2020-08-31 v1.4: added solder paste, update BOM
* 2020-08-25 v1.3: fix resolution error in gerber files, updated drl file, new Body_Center placement file
* 2020-08-17 v1.2: defined this version as v1.2. It is based on the cadence file `2017-03-26_LED-Panel_G4_V1.brd`, combined with additional exports received from jET.
* 2020-08-13: updated gerber files (inch to mm)
* 2020-08-12: received initial file export from jET
