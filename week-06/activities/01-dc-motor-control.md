# Activity 1: DC Motor Control Basics

## Duration: 20 minutes
## Difficulty: Beginner
## Skills: Motor driver wiring, direction control, basic motor programming

---

## Overview
Build your first motorized circuit! You'll connect a DC motor to your Raspberry Pi using an L298N motor driver and make it spin forward, reverse, and stop. This introduces the fundamental concepts of motor control while emphasizing safety.

## Learning Objectives
- Understand why motor drivers are necessary
- Connect L298N motor driver correctly
- Control motor direction with GPIO pins
- Implement safe motor control practices
- Combine hardware and software for motion control

---

## Materials Needed
- Raspberry Pi (running)
- Breadboard
- L298N Motor Driver Module
- 1 Small DC motor (3-6V)
- 4x AA battery holder with batteries (6V total)
- Jumper wires:
  - 6 male-to-female (Pi to driver)
  - 2 wires with battery pack connector
- Optional: Tape to secure motor

---

## Part 1: Understanding Your Motor Driver (5 minutes)

### L298N Motor Driver Overview

Your L298N module has several key components:

**Power Inputs** (top of module):
- **12V**: Connect battery pack positive (+, red)
- **GND**: Connect battery pack negative (-, black) AND Pi GND
- **5V**: Optional 5V output (not used today)

**Control Inputs** (side of module):
- **IN1**: Direction control (from Pi GPIO)
- **IN2**: Direction control (from Pi GPIO)
- **IN3**: Direction control for motor B (not used today)
- **IN4**: Direction control for motor B (not used today)

**Enable Pins** (with jumpers):
- **ENA**: Speed control for Motor A (we'll use for PWM later)
- **ENB**: Speed control for Motor B (not used today)
- **Jumpers**: Leave IN for now (full speed mode)

**Motor Outputs** (terminal blocks):
- **OUT1**: Motor wire 1 (Motor A)
- **OUT2**: Motor wire 2 (Motor A)
- **OUT3/OUT4**: Motor B terminals (not used today)

**Visual Features**:
- Large heat sink (aluminum block on top)
- Power LED (lights when driver has power)
- Terminal screws (for motor connections)

### Examine Your Components

1. **Motor Driver**: Find IN1, IN2, ENA, OUT1, OUT2
2. **Motor**: Two wires (polarity doesn't matter for DC motors)
3. **Battery Pack**: Red wire (+), Black wire (-)

---

## Part 2: Safety Briefing

### CRITICAL Safety Rules

**NEVER:**
- Connect motor directly to GPIO pin (will destroy Pi!)
- Use Pi's power supply for motors (insufficient current)
- Forget common ground connection (motor won't work)
- Change connections while powered on
- Touch spinning motor

**ALWAYS:**
- Use separate battery pack for motor power
- Connect motor driver GND to Pi GND
- Double-check polarity before powering on
- Secure motor so it doesn't fly off table
- Power off Pi before changing motor connections

### Power Supply Understanding

```
Two Separate Power Systems:

Raspberry Pi:           Motor System:
5V Wall Adapter         6V Battery Pack
    ↓                       ↓
Raspberry Pi            L298N Driver
    ↓                       ↓
GPIO Signals            DC Motor
    
Connected by: Common Ground (GND)
```

---

## Part 3: Build the Circuit (8 minutes)

### Step 1: Power Off Everything
```bash
sudo shutdown -h now
```
Wait 30 seconds, unplug Pi, disconnect battery pack.

### Step 2: Connect Battery Pack to Motor Driver

**Terminal screw connections:**
1. Loosen the screws on 12V and GND terminals (small screwdriver)
2. Insert battery pack RED wire into **12V** terminal
3. Tighten screw firmly
4. Insert battery pack BLACK wire into **GND** terminal  
5. Tighten screw firmly

**Check**: Wires should not pull out when tugged gently

### Step 3: Connect Motor to Driver

**Terminal screw connections:**
1. Loosen OUT1 and OUT2 terminal screws
2. Insert one motor wire into **OUT1**
3. Tighten screw firmly
4. Insert other motor wire into **OUT2**
5. Tighten screw firmly

**Note**: Motor wire order doesn't matter - just controls which direction is "forward"

### Step 4: Connect Motor Driver to Raspberry Pi

**CRITICAL: Common Ground First!**
1. Male-to-female wire from motor driver **GND** → Pi **GND (Pin 6)**

**Control signals:**
2. Male-to-female wire from motor driver **IN1** → Pi **GPIO 17 (Pin 11)**
3. Male-to-female wire from motor driver **IN2** → Pi **GPIO 27 (Pin 13)**
4. Male-to-female wire from motor driver **ENA** → Pi **GPIO 22 (Pin 15)**

### Step 5: Verify Enable Jumper

- Locate the jumper cap near the ENA pin
- **Leave jumper IN PLACE** for this activity (full speed mode)
- We'll remove it in Activity 2 for PWM speed control

### Step 6: Final Checklist

Before powering on, verify:
- [ ] Battery RED wire → Driver 12V terminal
- [ ] Battery BLACK wire → Driver GND terminal
- [ ] Motor wires → Driver OUT1 and OUT2
- [ ] Driver GND → Pi GND (Pin 6) **MOST IMPORTANT!**
- [ ] Driver IN1 → Pi GPIO 17 (Pin 11)
- [ ] Driver IN2 → Pi GPIO 27 (Pin 13)
- [ ] Driver ENA → Pi GPIO 22 (Pin 15)
- [ ] Enable jumper is in place on ENA
- [ ] All terminal screws tight
- [ ] No wires touching each other

### Step 7: Secure Motor (Recommended)

Use tape to secure motor to table:
- Prevents motor from spinning off table
- Keeps wires from tangling
- Safer during testing

**Ask instructor to verify your circuit before proceeding!**

---

## Part 4: Test the Motor (5 minutes)

### Program 1: Simple Motor Test

Create new file: `motor_test.py`

```python
import RPi.GPIO as GPIO
import time

# Pin definitions
IN1 = 17  # Direction pin 1
IN2 = 27  # Direction pin 2
ENA = 22  # Enable pin (speed)

# GPIO setup
GPIO.setmode(GPIO.BCM)
GPIO.setup(IN1, GPIO.OUT)
GPIO.setup(IN2, GPIO.OUT)
GPIO.setup(ENA, GPIO.OUT)

print("Motor Test - Press Ctrl+C to exit")
print("Testing motor forward, stop, reverse...")

try:
    # Motor forward
    print("Forward...")
    GPIO.output(IN1, True)   # IN1 = HIGH
    GPIO.output(IN2, False)  # IN2 = LOW
    GPIO.output(ENA, True)   # Enable ON
    time.sleep(2)
    
    # Motor stop
    print("Stop...")
    GPIO.output(IN1, False)  # IN1 = LOW
    GPIO.output(IN2, False)  # IN2 = LOW
    GPIO.output(ENA, False)  # Enable OFF
    time.sleep(1)
    
    # Motor reverse
    print("Reverse...")
    GPIO.output(IN1, False)  # IN1 = LOW
    GPIO.output(IN2, True)   # IN2 = HIGH
    GPIO.output(ENA, True)   # Enable ON
    time.sleep(2)
    
    # Final stop
    print("Stop...")
    GPIO.output(IN1, False)
    GPIO.output(IN2, False)
    GPIO.output(ENA, False)

except KeyboardInterrupt:
    print("\nExiting...")

finally:
    GPIO.cleanup()
    print("GPIO cleaned up. Motor should be stopped.")
```

### Run It

**Before running:**
1. Ensure motor is secured to table
2. Instructor has verified circuit

**Run the program:**
```bash
sudo python3 motor_test.py
```

### Expected Behavior
1. Motor spins one direction for 2 seconds (forward)
2. Motor stops for 1 second
3. Motor spins opposite direction for 2 seconds (reverse)
4. Motor stops
5. Program exits

### Troubleshooting

**Motor not spinning at all:**
- Check motor driver power LED is ON
- Verify battery voltage (~6V with multimeter)
- Check common ground connection (driver GND to Pi GND)
- Test motor directly with battery (bypass driver)
- Verify terminal screws are tight

**Motor spins only one direction:**
- Check IN1 and IN2 connections
- Verify GPIO pin numbers in code
- One direction might be natural for motor orientation

**Motor stutters or weak:**
- Check battery power (weak batteries common issue)
- Verify terminal connections are tight
- Motor may need higher voltage

---

## Part 5: Understanding Motor Control (2 minutes)

### Direction Control Truth Table

Study this table - it explains how IN1 and IN2 control motor:

| IN1 | IN2 | Motor Behavior |
|-----|-----|----------------|
| HIGH | LOW | Forward (clockwise) |
| LOW | HIGH | Reverse (counter-clockwise) |
| LOW | LOW | Stop (coast - motor freewheels) |
| HIGH | HIGH | Stop (brake - motor resists turning) |

### Why Two Pins for Direction?

- One pin could only do ON/OFF
- Two pins give us FOUR states:
  - Forward
  - Reverse  
  - Stop (coast)
  - Stop (brake)

This is called an **H-Bridge** configuration!

---

## Part 6: Interactive Motor Control

### Program 2: Direction Test

Create new file: `motor_directions.py`

```python
import RPi.GPIO as GPIO
import time

# Pin definitions
IN1, IN2, ENA = 17, 27, 22

# GPIO setup
GPIO.setmode(GPIO.BCM)
GPIO.setup(IN1, GPIO.OUT)
GPIO.setup(IN2, GPIO.OUT)
GPIO.setup(ENA, GPIO.OUT)

def motor_forward():
    """Spin motor forward"""
    GPIO.output(IN1, True)
    GPIO.output(IN2, False)
    GPIO.output(ENA, True)
    print("Motor: FORWARD")

def motor_reverse():
    """Spin motor in reverse"""
    GPIO.output(IN1, False)
    GPIO.output(IN2, True)
    GPIO.output(ENA, True)
    print("Motor: REVERSE")

def motor_coast():
    """Stop motor (coast)"""
    GPIO.output(IN1, False)
    GPIO.output(IN2, False)
    GPIO.output(ENA, False)
    print("Motor: STOP (coast)")

def motor_brake():
    """Stop motor (brake)"""
    GPIO.output(IN1, True)
    GPIO.output(IN2, True)
    GPIO.output(ENA, True)
    print("Motor: STOP (brake)")

print("Motor Direction Control")
print("Press Ctrl+C to exit")
print()

try:
    while True:
        print("\nChoose direction:")
        print("1 = Forward")
        print("2 = Reverse")
        print("3 = Coast")
        print("4 = Brake")
        
        choice = input("Enter 1-4: ")
        
        if choice == '1':
            motor_forward()
        elif choice == '2':
            motor_reverse()
        elif choice == '3':
            motor_coast()
        elif choice == '4':
            motor_brake()
        else:
            print("Invalid choice!")
        
        time.sleep(0.1)

except KeyboardInterrupt:
    print("\nExiting...")

finally:
    motor_coast()  # Stop motor
    GPIO.cleanup()
    print("Motor stopped and cleaned up")
```

### Run It
```bash
sudo python3 motor_directions.py
```

### Experiment
1. Try each direction
2. Notice difference between coast and brake
3. Try changing directions without stopping (not recommended!)
4. Feel motor shaft resistance in brake vs coast

---

## Understanding Coast vs Brake

### Coast (IN1=LOW, IN2=LOW)
- Motor disconnected from power
- Can turn freely by hand
- Gradual stop (coasts to a halt)
- Good for: Simple stopping, reduced power consumption

### Brake (IN1=HIGH, IN2=HIGH)
- Motor connected to itself (short circuit)
- Resists turning by hand
- Quick stop (electromagnetic braking)
- Good for: Precise positioning, quick stops

**Try it**: In brake mode, try turning motor by hand (harder!)

---

## Extension Challenges

### Challenge 1: Timed Sequence
Create a program that runs this pattern automatically:
1. Forward 3 seconds
2. Stop 1 second
3. Reverse 3 seconds
4. Stop 1 second
5. Repeat 3 times

### Challenge 2: LED Indicators
Add 3 LEDs to show motor state:
- Green LED: Motor forward
- Red LED: Motor reverse
- Yellow LED: Motor stopped

### Challenge 3: Button Control
Add a button that toggles motor between forward and stopped.

**Hint**: Review Week 5 button input

### Challenge 4: Morse Code Motor
Make motor spell SOS in morse code:
- Short forward = dot (0.5s)
- Long forward = dash (1.5s)
- Stop between signals = 0.5s
- Stop between letters = 1.5s

---

## Common Issues & Solutions

### Motor spins opposite of expected
- **Not a problem!** Every motor is different
- **Solution 1**: Swap motor wires on OUT1 and OUT2
- **Solution 2**: Swap IN1 and IN2 in your code
- Choose whichever is easier for your project

### Motor driver gets warm
- **Normal!** Driver converts power efficiently but generates heat
- Heat sink will be warm to touch (not burning hot)
- If too hot to touch for 2+ seconds, something is wrong - ask instructor

### Motor loses power during operation
- **Weak batteries** - Most common issue
- **Solution**: Replace with fresh batteries
- Test battery voltage: should be ~6V

### Loose connections cause intermittent operation
- **Vibration** - Motors vibrate terminal connections loose
- **Solution**: Tighten all terminal screws firmly
- Check connections if behavior becomes erratic

### Program won't start (GPIO in use error)
```bash
# Reset GPIO pins
sudo python3 -c "import RPi.GPIO as GPIO; GPIO.cleanup()"
```

---

## Key Concepts Review

**By completing this activity, you learned:**
- ✓ Motor drivers amplify GPIO signals to power motors
- ✓ Separate power supply needed for motors
- ✓ Common ground connects Pi and motor systems
- ✓ Two GPIO pins control motor direction
- ✓ Enable pin turns motor on/off
- ✓ Coast vs brake for different stop behaviors
- ✓ H-bridge allows bidirectional control

---

## Safety Review

**Before ending lab:**
- [ ] Motor is stopped
- [ ] Battery pack disconnected
- [ ] `GPIO.cleanup()` called in code
- [ ] Pi powered down properly
- [ ] Workspace organized

**Never forget:**
- Motors need separate power
- Common ground is critical
- Motor drivers get warm (normal)
- Stop motor before direction change (best practice)

---

## Next Steps

In Activity 2, you'll learn to:
- Control motor SPEED using PWM
- Make motor accelerate and decelerate smoothly
- Use button to change motor speed
- Combine sensors with motor control

**Great job controlling your first motor!** ⚙️🎉

---

## Instructor Checkpoint

Before moving to Activity 2, verify:
- [ ] Motor spins both directions correctly
- [ ] Student understands direction control
- [ ] Student can explain why motor driver is needed
- [ ] Circuit is safe and properly connected
- [ ] Ready to add speed control (PWM)
