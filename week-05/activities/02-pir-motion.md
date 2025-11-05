# Activity 2A: PIR Motion Sensor

## Duration: 25 minutes
## Difficulty: Beginner-Intermediate
## Skills: Digital sensor reading, motion detection, sensor calibration

---

## Overview
Build a motion detection system using a PIR (Passive InfraRed) sensor! PIR sensors detect changes in infrared radiation (heat), making them perfect for detecting movement of people and animals. You'll create a motion-activated LED system - the foundation for security systems, automatic lights, and more!

## Learning Objectives
- Understand how PIR sensors detect motion
- Connect and configure PIR sensor
- Read digital sensor output
- Create motion-activated responses
- Adjust sensor sensitivity and timing

---

## Materials Needed
- Raspberry Pi (running from Activity 1)
- Breadboard
- 1 PIR Motion Sensor (HC-SR501 or similar)
- 1 LED and resistor (from Activity 1)
- Jumper wires:
  - 3 male-to-female (for PIR connections)
  - 2-3 male-to-male (if using breadboard for LED)

---

## Part 1: Understanding Your PIR Sensor (5 minutes)

### What is PIR?

**PIR** = **P**assive **I**nfra**R**ed

**How it works**:
1. Everything with heat emits infrared radiation
2. PIR sensor has two infrared detectors
3. When something moves, the two detectors see DIFFERENT heat patterns
4. This difference triggers the output
5. Output goes HIGH when motion detected

**Why "Passive"?**
- Doesn't send out any signals
- Just "listens" for infrared changes
- Like your ears (passive) vs your mouth (active)

### Your PIR Sensor Components

**Look at your sensor**:

**Front (Dome side)**:
- White dome (Fresnel lens)
- Focuses infrared radiation onto sensors
- Don't remove dome!

**Back (Circuit side)**:
- Three pins: VCC, OUT, GND
- Two adjustment potentiometers (small screws you can turn)
- May have a jumper (small plastic bridge)

### Adjustment Potentiometers

**Sensitivity (Sx)**:
- Adjusts detection distance
- Turn clockwise = more sensitive (longer range)
- Turn counterclockwise = less sensitive (shorter range)
- Range: typically 3-7 meters (10-23 feet)

**Time Delay (Tx)**:
- How long output stays HIGH after trigger
- Turn clockwise = longer delay (up to 300 seconds!)
- Turn counterclockwise = shorter delay (as low as 3 seconds)
- Recommended: Start with short delay

### Jumper Setting (if present)

Some PIR sensors have a jumper with two positions:
- **H** = Repeatable trigger (keeps retriggering while motion present)
- **L** = Single trigger (waits for delay to expire before retriggering)

**Recommended**: Use H position for our projects

---

## Part 2: Circuit Diagram

### Wiring Plan

```
PIR Sensor           Raspberry Pi
──────────           ────────────
VCC (red wire)   →   5V (Pin 2)
GND (black wire) →   GND (Pin 6)
OUT (yellow wire) →  GPIO 17 (Pin 11)


LED Circuit (same as Activity 1):
GPIO 27 (Pin 13) → 560Ω resistor → LED → GND
```

### Important Notes
- PIR needs **5V power** (not 3.3V!)
- PIR output is 3.3V (safe for GPIO)
- Can use same LED circuit from Activity 1

---

## Part 3: Build the Circuit (5 minutes)

### Step 1: Identify PIR Pins

**Look at back of PIR sensor**:
- Pins should be labeled: VCC, OUT, GND
- May also be labeled: +, S, -

**Pin mapping**:
```
VCC = + = Power (5V)
OUT = S = Signal (to GPIO)
GND = - = Ground
```

### Step 2: Power Off Pi
```bash
sudo shutdown -h now
```

### Step 3: Connect PIR Sensor

**Using jumper wires (female-to-female or female-to-male)**:

1. **VCC pin** → Connect to Pi 5V (Pin 2 - red wire recommended)
2. **GND pin** → Connect to Pi GND (Pin 6 - black wire recommended)
3. **OUT pin** → Connect to Pi GPIO 17 (Pin 11 - yellow wire recommended)

**Visual check**:
```
PIR:  [VCC] [OUT] [GND]
       │     │     │
       5V   GPIO17 GND
      (Pin2)(Pin11)(Pin6)
```

### Step 4: Keep LED from Activity 1

Your LED should still be connected to GPIO 27. If not:
- GPIO 27 (Pin 13) → 560Ω resistor → LED long leg
- LED short leg → GND

### Step 5: Double-Check Everything
- [ ] PIR VCC to Pi 5V (not 3.3V!)
- [ ] PIR GND to Pi GND
- [ ] PIR OUT to Pi GPIO 17
- [ ] LED still connected to GPIO 27
- [ ] All connections firm

**Power on Pi!**

---

## Part 4: Initial Sensor Test (7 minutes)

### Important: Warmup Period!

PIR sensors need **60 seconds** to stabilize after power-on. During this time:
- Output may randomly trigger
- Sensor is "getting used" to room temperature
- This is NORMAL!

### Program 1: Basic Motion Detector

Create new file: `pir_test.py`

```python
import RPi.GPIO as GPIO
import time

# Pin definitions
PIR_PIN = 17

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setup(PIR_PIN, GPIO.IN)

print("PIR Motion Sensor Test")
print("=" * 40)
print("Waiting for sensor to warm up...")
print("Please keep very still for 60 seconds...")

# Wait for sensor warmup
for i in range(60, 0, -1):
    print(f"  {i} seconds remaining...", end='\r')
    time.sleep(1)

print("\n" + "=" * 40)
print("Sensor ready! Detecting motion...")
print("Move in front of sensor to test")
print("Press Ctrl+C to exit\n")

try:
    motion_detected = False
    
    while True:
        current_state = GPIO.input(PIR_PIN)
        
        if current_state:  # Motion detected
            if not motion_detected:  # First detection
                print("🚨 MOTION DETECTED! 🚨")
                motion_detected = True
        else:  # No motion
            if motion_detected:  # Motion just stopped
                print("   No motion - sensor reset")
                motion_detected = False
        
        time.sleep(0.1)

except KeyboardInterrupt:
    print("\n\nExiting...")

finally:
    GPIO.cleanup()
    print("GPIO cleaned up")
```

### Run It
```bash
sudo python3 pir_test.py
```

### What to Expect

**During warmup (60 seconds)**:
- Counter counts down
- **Stay very still!** Movement during warmup confuses sensor

**After warmup**:
- Move in front of sensor → "MOTION DETECTED!"
- Stop moving → "No motion - sensor reset" (after delay)
- Depending on settings, may take a few seconds to reset

### Troubleshooting Warmup Phase

**Sensor constantly triggering?**
- Keep sensor very still (don't touch it)
- Make sure no one walking nearby
- Avoid pointing at heater/AC vents
- Wait full 60 seconds

**Never triggers?**
- Check VCC connection (should be 5V)
- Check OUT pin to GPIO 17
- Try adjusting sensitivity pot (turn clockwise)
- Verify sensor is facing outward (dome toward you)

---

## Part 5: Motion-Activated LED (4 minutes)

Now let's make LED light up when motion is detected!

### Program 2: Motion Alarm with LED

Create new file: `motion_alarm.py`

```python
import RPi.GPIO as GPIO
import time

# Pin definitions
PIR_PIN = 17
LED_PIN = 27

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setup(PIR_PIN, GPIO.IN)
GPIO.setup(LED_PIN, GPIO.OUT)

print("Motion-Activated LED System")
print("=" * 40)
print("Warming up sensor (60 seconds)...")

# Warmup
for i in range(60, 0, -1):
    print(f"  {i} seconds...", end='\r')
    time.sleep(1)

print("\n" + "=" * 40)
print("System armed! Motion will trigger LED.")
print("Press Ctrl+C to exit\n")

try:
    while True:
        if GPIO.input(PIR_PIN):  # Motion detected
            print("⚠️  MOTION! LED ON")
            GPIO.output(LED_PIN, True)
        else:  # No motion
            print("   All clear - LED OFF")
            GPIO.output(LED_PIN, False)
        
        time.sleep(0.5)

except KeyboardInterrupt:
    print("\n\nDisarming system...")

finally:
    GPIO.output(LED_PIN, False)  # Turn off LED
    GPIO.cleanup()
    print("System disarmed - GPIO cleaned up")
```

### Run It
```bash
sudo python3 motion_alarm.py
```

### Expected Behavior
- Move in front of sensor → LED turns ON
- Stop moving → LED turns OFF (after delay)
- LED follows sensor output

---

## Part 6: Understanding Sensor Adjustments (4 minutes)

### Adjusting Sensitivity (Sx Pot)

**Find the sensitivity potentiometer** (usually labeled "Sx" or farther from LED)

**To adjust**:
1. Use small screwdriver or fingernail
2. Turn gently - don't force!

**Clockwise (increase)**:
- Longer detection range
- More sensitive
- May trigger more easily

**Counterclockwise (decrease)**:
- Shorter detection range
- Less sensitive
- Fewer false alarms

**Experiment**:
1. Turn sensitivity to middle position
2. Walk toward sensor from far away
3. Note when it triggers
4. Adjust and repeat

### Adjusting Time Delay (Tx Pot)

**Find the time delay potentiometer** (usually labeled "Tx" or near LED)

**To adjust**:
1. Use small screwdriver or fingernail
2. Turn gently

**Clockwise (increase)**:
- Output stays HIGH longer
- Up to 300 seconds (5 minutes!)
- Better for security applications

**Counterclockwise (decrease)**:
- Output resets quickly
- As low as 3-5 seconds
- Better for our projects!

**Recommended**: Turn Tx counterclockwise (short delay) for testing

---

## Extension Challenges

### Challenge 1: Motion Counter
Count how many times motion is detected.

**Hints**:
```python
count = 0
last_state = False

# In loop:
current_state = GPIO.input(PIR_PIN)
if current_state and not last_state:  # New motion event
    count += 1
    print(f"Motion detected {count} times")
last_state = current_state
```

### Challenge 2: Motion Timer
Measure how long motion is detected for.

**Hints**:
- Record time when motion starts: `start_time = time.time()`
- When motion stops, calculate: `duration = time.time() - start_time`
- Print duration

### Challenge 3: Multi-LED Alarm
Use multiple LEDs to show alarm levels:
- Green LED: System armed, no motion
- Red LED: Motion detected!

### Challenge 4: "Security System" with Button
Add button to arm/disarm system:
- Button press toggles armed/disarmed
- Only detect motion when armed
- Different LED colors for each state

---

## Real-World Applications

**What you just built is used in**:
- Automatic lights (hallways, bathrooms)
- Security systems (home alarm)
- Automatic doors
- Wildlife cameras
- Energy-saving smart homes
- Halloween decorations!

---

## Troubleshooting Guide

### Sensor constantly triggers
- Wait full 60 seconds warmup
- Keep sensor still (tape it down)
- Point away from heat sources
- Decrease sensitivity (turn Sx counterclockwise)
- Check if delay is set too long (turn Tx counterclockwise)

### Sensor never triggers
- Check 5V power connection
- Verify GPIO 17 connection
- Try increasing sensitivity (turn Sx clockwise)
- Make sure dome is facing you
- Try different GPIO pin
- Sensor might be defective

### Delayed response
- This is normal! PIR sensors aren't instant
- Time delay pot might be set too high
- Turn Tx counterclockwise for faster reset

### False alarms
- Avoid pointing at:
  - Windows (sunlight changes)
  - Heaters or AC vents
  - Fans or moving curtains
- Decrease sensitivity
- Secure sensor so it doesn't move

---

## Science Behind PIR Sensors

### How Infrared Detection Works

Everything above absolute zero emits infrared radiation. Humans and animals emit quite a bit!

**PIR sensor has TWO infrared detectors**:
```
  [Detector 1]    [Detector 2]
       │               │
   [Comparator Circuit]
       │
    OUTPUT
```

**When stationary**:
- Both detectors see same infrared level
- Output stays LOW

**When motion occurs**:
- Detectors see DIFFERENT infrared levels
- Comparator detects difference
- Output goes HIGH!

**The dome (Fresnel lens)**:
- Focuses infrared into multiple zones
- Creates a "checkerboard" of detection areas
- Walking across zones creates the difference signal

---

## Key Concepts Review

**By completing this activity, you learned:**
- ✓ PIR sensors detect motion using infrared radiation
- ✓ Digital sensors output simple HIGH/LOW signals
- ✓ Sensors often need warmup/stabilization time
- ✓ Potentiometers can adjust sensor behavior
- ✓ Combining sensors with outputs creates useful systems
- ✓ Real-world applications start with simple circuits!

---

## Going Further

**Try experimenting with**:
- Different sensitivity settings
- Different time delays
- Multiple PIR sensors
- Adding sound (buzzer) to alarm
- Logging motion events to file
- Sending notifications (advanced)

**Great job building a motion detector!** 🚨👁️
