# Week 4 Quick Start Guide

## ⚠️ Safety First - READ THIS!

**CRITICAL RULES:**
- ✅ ALWAYS use resistors with LEDs
- ✅ Power off Pi before changing circuits: `sudo shutdown -h now`
- ✅ Double-check wiring before power on
- ❌ NEVER connect 3.3V or 5V directly to Ground
- ❌ NEVER connect anything to 5V power pins unless you know what you're doing
- ❌ DON'T force components - they should fit easily

**When in doubt, ASK!**

---

## GPIO Pin Quick Reference

### Pin Numbering - We Use BCM Mode
```
BCM = Broadcom chip numbering (GPIO numbers)
BOARD = Physical pin numbers (1-40)

We use BCM throughout this course!
```

### Common GPIO Pins (BCM Numbering)
- **GPIO 17** - Pin we'll use first
- **GPIO 27** - Second pin
- **GPIO 22** - Third pin
- **Ground pins** - Pins 6, 9, 14, 20, 25, 30, 34, 39
- **3.3V pins** - Pins 1, 17 (use carefully!)
- **5V pins** - Pins 2, 4 (DON'T USE for LEDs!)

**See diagrams folder for complete pinout!**

---

## LED Basics

### LED Polarity - IMPORTANT!
```
Long leg (+) = Anode = Positive
Short leg (-) = Cathode = Negative (flat side)

ALWAYS: GPIO → Resistor → LED (long leg) → LED (short leg) → Ground
```

### Testing an LED
```
GPIO Pin → 560Ω Resistor → LED long leg → LED short leg → Ground Pin
```

---

## Resistor Color Codes

### Reading Resistors (4-band)
```
Band 1 | Band 2 | Band 3 (Multiplier) | Band 4 (Tolerance)

560Ω (Green-Blue-Brown):
Green (5) + Blue (6) + Brown (×10) = 560Ω

1kΩ (Brown-Black-Red):
Brown (1) + Black (0) + Red (×100) = 1000Ω = 1kΩ
```

**Any resistor between 220Ω and 1kΩ is fine for LEDs!**

---

## Breadboard Basics

### How Breadboards Work
```
Power Rails (sides):
+ + + + + +  (connected horizontally)
- - - - - -  (connected horizontally)

Main Area:
| | | | |    (connected vertically in columns)
| | | | |    
  a b c d e
---------    (GAP - not connected)
  f g h i j
| | | | |    (connected vertically in columns)
| | | | |
```

### Basic Connection
1. Insert components into rows
2. Components in same column (a-e or f-j) are connected
3. Bridge across middle gap to connect both sides
4. Use power rails for Ground and voltage

---

## Python GPIO Code Template

### Basic Setup
```python
import RPi.GPIO as GPIO
import time

# Set up GPIO mode
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Define pin
LED_PIN = 17

# Set up pin as output
GPIO.setup(LED_PIN, GPIO.OUT)

# Your code here

# Clean up when done
GPIO.cleanup()
```

### Turn LED On
```python
GPIO.output(LED_PIN, GPIO.HIGH)  # or True
```

### Turn LED Off
```python
GPIO.output(LED_PIN, GPIO.LOW)   # or False
```

### Blink LED
```python
while True:
    GPIO.output(LED_PIN, GPIO.HIGH)
    time.sleep(1)  # Wait 1 second
    GPIO.output(LED_PIN, GPIO.LOW)
    time.sleep(1)  # Wait 1 second
```

### Multiple LEDs
```python
RED_LED = 17
YELLOW_LED = 27
GREEN_LED = 22

# Set up all pins
GPIO.setup(RED_LED, GPIO.OUT)
GPIO.setup(YELLOW_LED, GPIO.OUT)
GPIO.setup(GREEN_LED, GPIO.OUT)

# Turn them on
GPIO.output(RED_LED, GPIO.HIGH)
GPIO.output(YELLOW_LED, GPIO.HIGH)
GPIO.output(GREEN_LED, GPIO.HIGH)
```

---

## Common Patterns

### Blink Once
```python
def blink_once(pin, duration=0.5):
    GPIO.output(pin, GPIO.HIGH)
    time.sleep(duration)
    GPIO.output(pin, GPIO.LOW)
    time.sleep(duration)
```

### Blink N Times
```python
def blink_times(pin, times, duration=0.5):
    for i in range(times):
        GPIO.output(pin, GPIO.HIGH)
        time.sleep(duration)
        GPIO.output(pin, GPIO.LOW)
        time.sleep(duration)
```

### Traffic Light Sequence
```python
# Red for 3 seconds
GPIO.output(RED_LED, GPIO.HIGH)
time.sleep(3)
GPIO.output(RED_LED, GPIO.LOW)

# Yellow for 1 second
GPIO.output(YELLOW_LED, GPIO.HIGH)
time.sleep(1)
GPIO.output(YELLOW_LED, GPIO.LOW)

# Green for 3 seconds
GPIO.output(GREEN_LED, GPIO.HIGH)
time.sleep(3)
GPIO.output(GREEN_LED, GPIO.LOW)
```

---

## Running Your Programs

### Run Python with GPIO
```bash
# Must use sudo for GPIO access!
sudo python3 myprogram.py
```

### Stop a Running Program
```
Press Ctrl+C
```

### Proper Shutdown
```bash
sudo shutdown -h now
```

---

## Troubleshooting

### LED Not Lighting?
1. Check LED orientation (long leg to +)
2. Verify resistor is in circuit
3. Check all wire connections
4. Make sure pin is set to OUTPUT
5. Make sure pin is set to HIGH
6. Try different LED (might be dead)
7. Check you're using correct pin number

### Python Errors?

**"RuntimeError: No access to /dev/mem"**
→ Forgot to use `sudo`

**"RuntimeError: This channel is already in use"**
→ Add `GPIO.setwarnings(False)` or run `GPIO.cleanup()` first

**"NameError: name 'GPIO' is not defined"**
→ Forgot `import RPi.GPIO as GPIO`

**"AttributeError: module 'RPi' has no attribute 'GPIO'"**
→ Library not installed (should be pre-installed on Raspberry Pi OS)

---

## Quick Circuit Checklist

Before powering on:
- [ ] LED has resistor (not directly to GPIO)
- [ ] LED long leg connected to positive side
- [ ] LED short leg connected to Ground
- [ ] All wires firmly in breadboard
- [ ] No wires touching that shouldn't
- [ ] Using Ground pin, not 5V
- [ ] Double-checked pin numbers

---

## Example: First LED Program

### Circuit
```
GPIO 17 → 560Ω Resistor → LED Long Leg → LED Short Leg → Ground
```

### Code (save as led_test.py)
```python
import RPi.GPIO as GPIO
import time

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

LED = 17
GPIO.setup(LED, GPIO.OUT)

# Turn on
print("LED ON")
GPIO.output(LED, GPIO.HIGH)
time.sleep(3)

# Turn off
print("LED OFF")
GPIO.output(LED, GPIO.LOW)

# Cleanup
GPIO.cleanup()
print("Done!")
```

### Run
```bash
sudo python3 led_test.py
```

---

## Time Functions (from Week 3)

```python
import time

time.sleep(1)      # Wait 1 second
time.sleep(0.5)    # Wait 0.5 seconds (half second)
time.sleep(0.1)    # Wait 0.1 seconds (100 milliseconds)
```

---

## Best Practices

1. **Always comment your code**
   ```python
   # Set up red LED on GPIO 17
   RED_LED = 17
   GPIO.setup(RED_LED, GPIO.OUT)
   ```

2. **Use descriptive variable names**
   ```python
   # Good
   RED_LED = 17
   BLINK_TIME = 0.5
   
   # Bad
   r = 17
   t = 0.5
   ```

3. **Clean up GPIO at the end**
   ```python
   try:
       # Your code here
   finally:
       GPIO.cleanup()
   ```

4. **Test small changes**
   - Get one LED working before adding more
   - Test each new feature separately

5. **Keep circuits organized**
   - Use different color wires for different purposes
   - Keep wires as short as practical
   - Route wires neatly

---

## Pin Safety Limits

- **Maximum current per pin**: 16mA
- **Safe LED current**: 10-15mA
- **Typical LED forward voltage**: 2-2.2V
- **This is why we need resistors!**

### Resistor Math (optional)
```
Voltage = 3.3V (GPIO HIGH)
LED voltage drop = 2V
Remaining = 1.3V

For 10mA current:
R = V / I = 1.3V / 0.01A = 130Ω (minimum)

Use 220Ω-1kΩ to be safe!
```

---

## Quick Command Reference

```bash
# Run Python with GPIO
sudo python3 program.py

# Stop program
Ctrl+C

# Shutdown Pi safely
sudo shutdown -h now

# Reboot Pi
sudo reboot

# Check GPIO status (advanced)
gpio readall
```

---

## Getting Help

- Check the circuit diagram
- Review the lecture notes
- Ask your instructor
- Check connections one by one
- Try the Python shell: `sudo python3`
- Remember: GPIO needs `sudo`!

---

**Remember**: Take your time, double-check connections, and ask questions. Physical computing is fun once you get the hang of it! 🚦
