# Mainboard

## License

Framework Laptop 12 © 2025 by Framework Computer Inc is licensed under CC BY 4.0.
To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/

## Pinouts

### Front Panel 9 Pin

Standard Pin layout

```
┌─┬─┐
│1│2│
├─┼─┤
│3│4│
├─┼─┤
│5│6│
├─┼─┤
│7│8│
├─┼─┤
│9│ │
└─┴─┘
```

| Pin | Signal               |
|-----|----------------------|
| 1   | +5VALW               |
| 2   | +5VALW               |
| 3   | Debug LED (LED4) GND |
| 4   | Power Button LED GND |
| 5   | `EC_RST#`            |
| 6   | Power Button         |
| 7   | GND                  |
| 8   | GND                  |
| 9   | +5VS_Header          |

The power button LED is controlled by the same signal as LED3 on the mainboard. See table below.

`EC_RST#` resets the embedded controller when pulling this signal low.
After the EC has reset, it does not turn the CPU back on. To do so, use the Power Button (pin).

### ARGB

| Pin | Signal   |
|-----|----------|
| 1   | +5VS     |
| 2   | Data Out |
| 3   | NC       |
| 4   | GND      |

Data has 2.2k pullup to +5VS on the mainboard.

## LEDs

All LEDs are controlled by the Embedded Controller firmware.

| LED | Signal | Color | Description                                |
|-----|--------|-------|--------------------------------------------|
| 1   | GPIO   | Amber | AC Power (VSB)                             |
| 2   | GPIO   | Amber | 12V AC Power (G3=Off, S0=On)               |
| 3   | PWM    | Amber | Power Button (S5=Off, S3=Breathing, S0=On) |
| 4   | GPIO   | Red   | Debug blinking                             |

Debug blink codes

| Behavior    | Description                        |
|-------------|------------------------------------|
| Long blink  | Start of diagnostic                |
| 1 - On/Off  | PSU OK                             |
| 2 - On/Off  | 12V OK                             |
| 3 - On/Off  | CPU deassert sleep S5              |
| 4 - On/Off  | CPU deassert sleep S4              |
| 5 - On/Off  | Power boot core VR                 |
| 6 - On/Off  | CPU Fan Detected                   |
| 7 - On/Off  | Thermal Sensor Detected            |
| 8 - On/Off  | CPU reached S0 state               |
| 9 - On/Off  | DDR initialized OK                 |
| 10 - On/Off | Power glitch detected during boot  |

## Buttons

| Label | Function       |
|-------|----------------|
| SW1   | Clear RTC/CMOS |
| SW3   | Power Button   |
