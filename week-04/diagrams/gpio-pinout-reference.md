# GPIO Pin Reference for Raspberry Pi 4

## Quick Pin Reference

This guide shows the GPIO pins on your Raspberry Pi 4 Model B.

---

## Raspberry Pi 4 GPIO Pinout (40 pins)

```
        3.3V  [ 1] [2 ]  5V
 (SDA)  GPIO2  [ 3] [4 ]  5V
 (SCL)  GPIO3  [ 5] [6 ]  GND
        GPIO4  [ 7] [8 ]  GPIO14 (TXD)
          GND  [ 9] [10]  GPIO15 (RXD)
       GPIO17  [11] [12]  GPIO18
       GPIO27  [13] [14]  GND
       GPIO22  [15] [16]  GPIO23
        3.3V  [17] [18]  GPIO24
(MOSI) GPIO10  [19] [20]  GND
 (MISO) GPIO9  [21] [22]  GPIO25
(SCLK) GPIO11  [23] [24]  GPIO8  (CE0)
          GND  [25] [26]  GPIO7  (CE1)
  ID_SD  GPIO0  [27] [28]  GPIO1  ID_SC
       GPIO5  [29] [30]  GND
       GPIO6  [31] [32]  GPIO12
      GPIO13  [33] [34]  GND
      GPIO19  [35] [36]  GPIO16
      GPIO26  [37] [38]  GPIO20
          GND  [39] [40]  GPIO21
```

**Note**: Pin 1 is closest to the micro SD card slot!

---

## Pin Type Reference

### Power Pins
- **3.3V Power**: Pins 1, 17
- **5V Power**: Pins 2, 4
- **Ground (GND)**: Pins 6, 9, 14, 20, 25, 30, 34, 39

### GPIO Pins (BCM Numbers)
Programmable pins we use in this course:

**Commonly Used**:
- GPIO 17 (Pin 11) - Our standard first LED pin
- GPIO 27 (Pin 13) - Second LED
- GPIO 22 (Pin 15) - Third LED
- GPIO 23 (Pin 16)
- GPIO 24 (Pin 18)
- GPIO 25 (Pin 22)

**Also Available**:
- GPIO 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
- GPIO 16, 18, 19, 20, 21, 26

### Special Function Pins
- **GPIO 2 & 3** (I2C): Reserved for I2C communication
- **GPIO 14 & 15** (UART): Serial communication
- **GPIO 18**: Hardware PWM capable
- **Don't use ID_SD/ID_SC** (Pins 27-28) - Reserved!

---

## Pin Selection Guidelines

### For This Course (Weeks 4-7)

**Week 4 (LEDs)**:
- Use GPIO 17, 27, 22 (Easy to remember!)
- Pins 11, 13, 15 physically

**Week 5 (Buttons)**:
- Use GPIO 23, 24, 25
- Keep separate from LED pins

**Best Practices**:
- Use BCM numbering consistently
- Keep pin assignments organized
- Document which pin does what
- Leave I2C pins (2, 3) free for sensors

---

## Ground Pin Strategy

**Multiple Ground Options**:
Since there are 8 ground pins, you can:

**Option A**: One ground per component
- LED 1 → Ground Pin 6
- LED 2 → Ground Pin 9
- LED 3 → Ground Pin 14

**Option B**: Shared ground rail (recommended)
- All component grounds → Breadboard ground rail
- One wire from ground rail → Pi ground pin
- Cleaner wiring!

---

## Visual Pin Diagram

```
       +-----+-----+
       | USB | USB |
       +-----+-----+
       | USB | USB |
       +-----+-----+
    +---+         +---+
    |               |
    | Ethernet      |
    |               |
    +---+         +---+

Pin 1 →  +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
         |3V|5V|G2|5V|G3|Gn|G4|G1|Gn|G1|G1|G1|G2|Gn|G2|G2|3V|G2|G1|Gn|
         |3 |  | 2|  | 3| d| |4| d|5 |7 |8 |7 | d|2 |3 | 3|4 | 0| d|
Pin 2 →  +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
         
                      ↑ SD Card slot this side
```

**Legend**:
- 3V3 = 3.3V Power
- 5V = 5V Power  
- Gnd = Ground
- G## = GPIO number

---

## Common Pin Configurations

### Single LED
```python
GPIO 17 (Pin 11) → LED → Ground (Pin 6)
```

### Traffic Light (3 LEDs)
```python
GPIO 17 (Pin 11) → Red LED → Ground
GPIO 27 (Pin 13) → Yellow LED → Ground
GPIO 22 (Pin 15) → Green LED → Ground
```

### LED + Button
```python
GPIO 17 (Pin 11) → LED → Ground (Pin 6)
GPIO 23 (Pin 16) → Button → Ground (Pin 9)
```

---

## Pin Protection

### Current Limits
- **Per pin**: 16mA maximum
- **All pins combined**: 50mA maximum
- **Typical LED with resistor**: ~10mA

### Voltage Limits
- **GPIO output**: 3.3V (DO NOT connect to 5V!)
- **GPIO input**: 0-3.3V (5V will damage pin!)
- **Never** connect GPIO directly to 5V power pins

---

## Troubleshooting Pin Issues

### Pin Not Working?
1. Check BCM number vs physical pin number
2. Verify not using power or ground pin
3. Try different GPIO pin
4. Check for bent pins on Pi
5. Verify pin not reserved (I2C, etc.)

### Multiple Pins Not Working?
1. Check total current draw
2. Verify proper ground connections
3. Ensure not exceeding 50mA total
4. Check for short circuits
5. May need to reboot Pi

---

## Quick Command Reference

### Check GPIO Status (Terminal)
```bash
gpio readall   # Shows all pin states (if installed)
```

### Python Pin Check
```python
import RPi.GPIO as GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setup(17, GPIO.OUT)
GPIO.output(17, GPIO.HIGH)
# Check if pin 17 outputs 3.3V
```

---

## Pin Memory Tips

**Remember our standard pins**:
- **17** = First/Red LED
- **27** = Second/Yellow LED
- **22** = Third/Green LED

**Mnemonic**: "17, 27, 22" - sounds like "seventeen, twenty-seven, twenty-two"

**Physical location**: Pins 11, 13, 15 - all odd numbers in a row!

---

## Safety Reminders

1. ⚠️ **Never connect 5V to GPIO input** - Use 3.3V!
2. ⚠️ **Never connect GPIO directly to ground** - Use resistor!
3. ⚠️ **Never exceed 16mA per pin** - Use appropriate resistors!
4. ⚠️ **Power off before wiring changes** - Prevent shorts!

---

## Additional Resources

- Official Raspberry Pi Pinout: https://pinout.xyz
- Print this guide for quick reference
- Keep handy while building circuits
- Mark commonly used pins on printout

---

**Keep this reference nearby when working with GPIO!** 📍
