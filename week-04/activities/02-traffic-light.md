# Activity 2: Traffic Light Simulator

**Time**: 25 minutes  
**Group Size**: 2-3 students  
**Difficulty**: Beginner-Intermediate

## Objective
Build a working traffic light using 3 LEDs and create a realistic traffic light sequence.

## ⚠️ Safety Reminder!
- [ ] Power OFF before adding new components
- [ ] All 3 LEDs need resistors
- [ ] Check LED polarity for each LED
- [ ] Get instructor approval before powering on

## Materials Needed
- Raspberry Pi
- Breadboard (with Activity 1 circuit or fresh)
- 3 LEDs (red, yellow, green recommended - or any 3 colors)
- 3 resistors (560Ω to 1kΩ)
- 4 jumper wires (male-to-female)

---

## Part 1: Build the Traffic Light Circuit (10 minutes)

### Circuit Overview
```
GPIO 17 → Resistor → Red LED → Ground
GPIO 27 → Resistor → Yellow LED → Ground
GPIO 22 → Resistor → Green LED → Ground
(All grounds connect to same Ground pin)
```

### Step-by-Step Instructions

**Step 1**: Power off your Pi
```bash
sudo shutdown -h now
```
Wait until LED on Pi stops blinking!

**Step 2**: Plan your breadboard layout
- Red LED: rows 5-7
- Yellow LED: rows 10-12
- Green LED: rows 15-17
- Ground rail: use the (-) rail on breadboard side

**Step 3**: Insert Red LED
- Long leg in row 5, column 'e'
- Short leg in row 7, column 'e'

**Step 4**: Insert resistor for Red LED
- One end in row 5, column 'a'
- Other end in row 3, column 'a'

**Step 5**: Connect GPIO 17 to Red LED
- Wire from GPIO 17 (physical pin 11)
- Into breadboard row 3, column 'b'

**Step 6**: Insert Yellow LED
- Long leg in row 10, column 'e'
- Short leg in row 12, column 'e'

**Step 7**: Insert resistor for Yellow LED
- One end in row 10, column 'a'
- Other end in row 8, column 'a'

**Step 8**: Connect GPIO 27 to Yellow LED
- Wire from GPIO 27 (physical pin 13)
- Into breadboard row 8, column 'b'

**Step 9**: Insert Green LED
- Long leg in row 15, column 'e'
- Short leg in row 17, column 'e'

**Step 10**: Insert resistor for Green LED
- One end in row 15, column 'a'
- Other end in row 13, column 'a'

**Step 11**: Connect GPIO 22 to Green LED
- Wire from GPIO 22 (physical pin 15)
- Into breadboard row 13, column 'b'

**Step 12**: Connect all grounds
- Option A: Connect each LED short leg to Ground pin with separate wires
- Option B: Connect LED short legs to breadboard ground rail, then rail to Ground pin

**Step 13**: STOP - Get instructor approval!

### Circuit Checklist
- [ ] 3 LEDs installed (red, yellow, green)
- [ ] Each LED has long leg to positive side
- [ ] Each LED has resistor on positive side
- [ ] GPIO 17 → Red LED
- [ ] GPIO 27 → Yellow LED
- [ ] GPIO 22 → Green LED
- [ ] All grounds connected properly
- [ ] No loose wires
- [ ] Instructor approved

---

## Part 2: Test Individual LEDs (5 minutes)

Before writing the full program, test each LED!

### Create test program

```bash
nano test_leds.py
```

```python
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

RED = 17
YELLOW = 27
GREEN = 22

GPIO.setup(RED, GPIO.OUT)
GPIO.setup(YELLOW, GPIO.OUT)
GPIO.setup(GREEN, GPIO.OUT)

# Test each LED
print("Testing RED...")
GPIO.output(RED, GPIO.HIGH)
time.sleep(2)
GPIO.output(RED, GPIO.LOW)

print("Testing YELLOW...")
GPIO.output(YELLOW, GPIO.HIGH)
time.sleep(2)
GPIO.output(YELLOW, GPIO.LOW)

print("Testing GREEN...")
GPIO.output(GREEN, GPIO.HIGH)
time.sleep(2)
GPIO.output(GREEN, GPIO.LOW)

print("All LEDs work!")
GPIO.cleanup()
```

Run: `sudo python3 test_leds.py`

**Each LED should light up for 2 seconds in order!**

---

## Part 3: Write Traffic Light Program (10 minutes)

### Create the program

```bash
nano traffic_light.py
```

```python
import RPi.GPIO as GPIO
import time

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Define pins
RED = 17
YELLOW = 27
GREEN = 22

# Setup pins
GPIO.setup(RED, GPIO.OUT)
GPIO.setup(YELLOW, GPIO.OUT)
GPIO.setup(GREEN, GPIO.OUT)

# Function to turn all LEDs off
def all_off():
    GPIO.output(RED, GPIO.LOW)
    GPIO.output(YELLOW, GPIO.LOW)
    GPIO.output(GREEN, GPIO.LOW)

# Main program
print("Traffic Light Starting...")
print("Press Ctrl+C to stop")

try:
    while True:
        # GREEN light - GO!
        all_off()
        GPIO.output(GREEN, GPIO.HIGH)
        print("GREEN - Go!")
        time.sleep(5)
        
        # YELLOW light - Slow down!
        all_off()
        GPIO.output(YELLOW, GPIO.HIGH)
        print("YELLOW - Slow down!")
        time.sleep(2)
        
        # RED light - STOP!
        all_off()
        GPIO.output(RED, GPIO.HIGH)
        print("RED - Stop!")
        time.sleep(5)

except KeyboardInterrupt:
    print("\nStopping traffic light...")

finally:
    all_off()
    GPIO.cleanup()
    print("Traffic light stopped. All LEDs off.")
```

### Run the program

```bash
sudo python3 traffic_light.py
```

### What Should Happen
1. Green LED lights for 5 seconds
2. Yellow LED lights for 2 seconds
3. Red LED lights for 5 seconds
4. Pattern repeats forever
5. Press Ctrl+C to stop

---

## Challenges (If you finish early)

### Challenge 1: Add Countdown Timer
Print how many seconds remain for each light:

```python
# Green light with countdown
all_off()
GPIO.output(GREEN, GPIO.HIGH)
for i in range(5, 0, -1):
    print(f"GREEN - {i} seconds remaining")
    time.sleep(1)
```

### Challenge 2: Yellow Blink Warning
Make yellow LED blink 3 times before turning red:

```python
# Yellow blinking
all_off()
print("YELLOW - Caution!")
for i in range(3):
    GPIO.output(YELLOW, GPIO.HIGH)
    time.sleep(0.5)
    GPIO.output(YELLOW, GPIO.LOW)
    time.sleep(0.5)
```

### Challenge 3: Emergency Mode
Add code that when you press Ctrl+C once, enters "emergency mode":
- All lights flash red rapidly
- After 10 flashes, program exits

```python
except KeyboardInterrupt:
    print("\nEMERGENCY MODE!")
    all_off()
    for i in range(10):
        GPIO.output(RED, GPIO.HIGH)
        time.sleep(0.3)
        GPIO.output(RED, GPIO.LOW)
        time.sleep(0.3)
```

### Challenge 4: Custom Timing
Ask user for timing at start:

```python
print("Traffic Light Setup")
green_time = int(input("Green light duration (seconds): "))
yellow_time = int(input("Yellow light duration (seconds): "))
red_time = int(input("Red light duration (seconds): "))

# Then use these variables in time.sleep()
```

### Challenge 5: Pedestrian Signal
Add a 4th LED (white or blue) as "walk" signal:
- Walk signal ON with green light
- Walk signal blinks with yellow light
- Walk signal OFF with red light

### Challenge 6: All Red Phase
Add a phase where all lights are red briefly:
- Useful at intersections for clearing traffic
- After yellow, ALL red for 1 second
- Then just normal red

---

## Understanding Your Code

### The `all_off()` Function
```python
def all_off():
    GPIO.output(RED, GPIO.LOW)
    GPIO.output(YELLOW, GPIO.LOW)
    GPIO.output(GREEN, GPIO.LOW)
```
- Creates reusable function
- Turns off all LEDs
- Prevents multiple lights on at once

### The Main Loop
```python
while True:
    # Traffic light sequence
```
- Loops forever
- Each cycle is one complete light sequence
- Ctrl+C exits the loop

### Exception Handling
```python
try:
    # Main code
except KeyboardInterrupt:
    # Handle Ctrl+C
finally:
    # Always runs (cleanup)
```
- `try`: Normal operation
- `except`: Catch Ctrl+C
- `finally`: Always cleanup, even if error

---

## Real Traffic Light Facts

**Standard Traffic Light Timing**:
- Green: 30-60 seconds (we use 5 for demo)
- Yellow: 3-7 seconds (we use 2)
- Red: 30-60 seconds (we use 5)
- All-red phase: 1-2 seconds (optional)

**Traffic Light Colors**:
- Red = Stop (universal)
- Yellow/Amber = Caution, prepare to stop
- Green = Go

**Why Yellow Light?**
- Gives drivers time to react
- Prevents sudden stops
- Reduces accidents

---

## Troubleshooting

**Only one LED lights?**
- Check other LEDs are connected to correct pins
- Verify each LED's resistor
- Run test_leds.py to isolate problem

**Wrong LED lights for wrong color?**
- Pins might be swapped in code or circuit
- Check pin definitions match circuit

**LEDs very dim?**
- Resistor might be too high (over 1kΩ)
- Try lower resistor value (but not below 220Ω!)

**Multiple LEDs on at once?**
- Check `all_off()` is called before each light
- Verify ground connections

---

## Reflection Questions

1. Why is it important to turn off all LEDs before lighting the next one?
2. How does using a function like `all_off()` make code easier?
3. What would happen if you removed the `try/except` block?
4. How could you make the traffic light more realistic?
5. Can you think of other uses for sequenced LEDs?

---

## Show Your Work!

Demonstrate to instructor:
- [ ] All 3 LEDs working in proper sequence
- [ ] Correct traffic light timing
- [ ] Proper cleanup when Ctrl+C pressed
- [ ] At least one challenge completed
- [ ] Explain how the code controls timing

---

## Going Further

**Other LED Sequencing Projects**:
- Knight Rider scanner (LEDs chase back and forth)
- Binary counter (LEDs represent binary numbers)
- Random pattern generator
- Music visualizer (LEDs react to beat)
- Christmas light patterns

---

## Cleanup

**Before leaving**:
1. Demonstrate working traffic light to instructor
2. Take photo of circuit
3. Save your code
4. Properly shutdown: `sudo shutdown -h now`
5. Carefully remove components and organize them

---

**Excellent work!** You've created a realistic traffic light simulator! This project combines circuits, multiple outputs, timing, and programming logic. These skills apply to many real-world projects! 🚦🎉
