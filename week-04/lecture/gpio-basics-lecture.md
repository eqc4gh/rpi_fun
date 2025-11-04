# Week 4 Lecture Notes: GPIO Basics & LED Control

## Part 1: Introduction to GPIO (10-15 minutes)

### What is GPIO?

**GPIO** stands for **General Purpose Input/Output**

Think of GPIO pins as programmable electrical connection points on your Raspberry Pi. They're like switches and sensors you can control with code!

**Analogy**: Imagine your house has light switches (outputs) and doorbells (inputs). GPIO pins work the same way:
- **OUTPUT** pins are like light switches - you control them with code
- **INPUT** pins are like doorbells - they tell your program when something happens
- This week focuses on OUTPUT to control LEDs

### The GPIO Header

Your Raspberry Pi 4 has **40 GPIO pins** in two rows along one edge of the board.

**Important**: Not all 40 pins are programmable GPIO!
- **26 GPIO pins** - Programmable (can use for input/output)
- **8 Ground pins** - Electrical ground (negative/return path)
- **2 5V power pins** - Provide 5V (DON'T use for LEDs!)
- **2 3.3V power pins** - Provide 3.3V (for specific uses)
- **2 Special pins** - ID_EEPROM (don't touch!)

### Pin Numbering Systems

**Two Ways to Number Pins - This is CRITICAL!**

#### Physical (BOARD) Numbering
- Counts pins 1-40 in order
- Pin 1 is closest to micro SD card
- Easy to count but not standard

#### BCM (Broadcom) Numbering
- Uses GPIO chip numbers (GPIO2, GPIO3, GPIO4, etc.)
- Standard across Raspberry Pi models
- What we use in this course!

**Example**:
```
Physical Pin 11 = GPIO 17 (BCM)
Physical Pin 13 = GPIO 27 (BCM)
Physical Pin 15 = GPIO 22 (BCM)
```

**In Code**:
```python
GPIO.setmode(GPIO.BCM)  # Use BCM numbering
# Now use GPIO numbers: 17, 27, 22, etc.
```

### GPIO Capabilities and Limitations

**What GPIO Pins Can Do**:
- Output 3.3V (HIGH) or 0V (LOW)
- Read if voltage is HIGH or LOW
- Toggle very fast (thousands of times per second)
- Use software PWM for dimming

**Important Limitations**:
- ⚠️ **Only 3.3V output** (not 5V!)
- ⚠️ **Maximum 16mA per pin** (very small current)
- ⚠️ **Maximum 50mA total** for all pins combined
- ⚠️ **Easily damaged** by overvoltage or overcurrent
- ⚠️ **No built-in protection** - you must be careful!

### Why These Limitations Matter

**Example**: A typical LED needs about 10-20mA
- One LED per pin is fine
- Without resistor, LED might try to draw 50mA+ → damages pin!
- This is why we ALWAYS use resistors

---

## Part 2: Electrical Safety (10-15 minutes)

### ⚠️ CRITICAL SAFETY RULES

**READ THIS SECTION CAREFULLY!**

#### Rule 1: ALWAYS Use Resistors with LEDs
- LEDs without resistors draw too much current
- Can damage GPIO pins permanently
- Can damage LEDs
- **NEVER connect LED directly to GPIO!**

#### Rule 2: NEVER Connect Power to Ground
- Connecting 3.3V or 5V directly to Ground creates a short circuit
- Will damage your Raspberry Pi
- Might create heat or sparks
- Always double-check before powering on!

#### Rule 3: Power Off Before Changing Circuits
- Shutdown Pi: `sudo shutdown -h now`
- Wait for Pi to fully power down
- Make changes
- Double-check connections
- Power on

#### Rule 4: Be Gentle with Pins
- GPIO pins can bend or break
- Don't force components
- Insert wires gently
- Pull straight out, don't twist

#### Rule 5: Check Before Powering On
- Get in habit of always double-checking
- One minute of checking saves hours of repair
- Ask someone to review if unsure

---

## Part 3: How LEDs Work (10 minutes)

### What is an LED?

**LED** = Light Emitting Diode

**Diode** = Electronic component that allows current to flow in only ONE direction

Think of it like a one-way door - current can only go in one direction!

### LED Polarity - CRITICAL!

LEDs have two legs of different lengths:

**Long Leg** = **Positive** = **Anode**
- Connects to power (through resistor)
- This side gets current first

**Short Leg** = **Negative** = **Cathode**  
- Connects to ground
- Current exits here

**Visual Clue**: LED body has flat side on negative (cathode) side

**If you connect LED backwards**: It won't light up (but won't damage anything)

---

## Part 4: Breadboards and Basic Circuits (10 minutes)

### What is a Breadboard?

A **breadboard** lets you build circuits WITHOUT SOLDERING!

**Benefits**:
- Reusable
- Easy to change
- No special tools needed
- Perfect for prototyping

### How Breadboards Work

**Power Rails** (sides):
- All + holes connected horizontally
- All - holes connected horizontally

**Terminal Strips** (middle):
- Holes in same row (a-e or f-j) connected
- Center gap separates left and right
- Columns NOT connected vertically

---

## Part 5: Using RPi.GPIO Library (15 minutes)

### Basic GPIO Program Structure

```python
# 1. Import libraries
import RPi.GPIO as GPIO
import time

# 2. Set up GPIO mode
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# 3. Define pins
LED_PIN = 17

# 4. Set up each pin
GPIO.setup(LED_PIN, GPIO.OUT)

# 5. Your main program
GPIO.output(LED_PIN, GPIO.HIGH)  # Turn on
time.sleep(1)
GPIO.output(LED_PIN, GPIO.LOW)   # Turn off

# 6. Clean up
GPIO.cleanup()
```

### Key Functions

**Setting Mode**:
```python
GPIO.setmode(GPIO.BCM)  # Use BCM numbering
```

**Setting Pin Direction**:
```python
GPIO.setup(17, GPIO.OUT)  # Pin 17 is output
```

**Controlling Output**:
```python
GPIO.output(17, GPIO.HIGH)  # Turn on (3.3V)
GPIO.output(17, GPIO.LOW)   # Turn off (0V)
```

**Cleanup**:
```python
GPIO.cleanup()  # Reset all pins
```

---

## Part 6: LED Control Examples (20 minutes)

### Simple Blink

```python
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
LED = 17
GPIO.setup(LED, GPIO.OUT)

print("Blinking - Ctrl+C to stop")

try:
    while True:
        GPIO.output(LED, GPIO.HIGH)
        time.sleep(0.5)
        GPIO.output(LED, GPIO.LOW)
        time.sleep(0.5)
        
except KeyboardInterrupt:
    print("\nStopping...")
    
finally:
    GPIO.cleanup()
```

### Traffic Light

```python
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)

RED = 17
YELLOW = 27
GREEN = 22

GPIO.setup(RED, GPIO.OUT)
GPIO.setup(YELLOW, GPIO.OUT)
GPIO.setup(GREEN, GPIO.OUT)

def all_off():
    GPIO.output(RED, GPIO.LOW)
    GPIO.output(YELLOW, GPIO.LOW)
    GPIO.output(GREEN, GPIO.LOW)

try:
    while True:
        # Green
        all_off()
        GPIO.output(GREEN, GPIO.HIGH)
        print("GREEN")
        time.sleep(5)
        
        # Yellow
        all_off()
        GPIO.output(YELLOW, GPIO.HIGH)
        print("YELLOW")
        time.sleep(2)
        
        # Red
        all_off()
        GPIO.output(RED, GPIO.HIGH)
        print("RED")
        time.sleep(5)
        
except KeyboardInterrupt:
    print("\nStopping...")
finally:
    all_off()
    GPIO.cleanup()
```

---

## Key Takeaways

1. **GPIO pins** control physical hardware with Python
2. **Safety is critical** - use resistors, check circuits
3. **LEDs have polarity** - long leg to positive
4. **BCM numbering** is standard
5. **RPi.GPIO library** provides control functions
6. **Always use sudo** for GPIO programs
7. **Always cleanup** at program end
8. **Week 3 Python** combines with GPIO!

---

**Physical computing is incredibly rewarding! Take your time and follow safety rules!** 🔴🟡🟢
