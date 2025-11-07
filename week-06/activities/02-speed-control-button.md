# Activity 2: Motor Speed Control with PWM

## Duration: 20 minutes
## Difficulty: Beginner-Intermediate  
## Skills: PWM motor control, button input, combining sensors and motors

---

## Overview
Now that you can make motors go forward and reverse, let's add SPEED control! Using PWM (Pulse Width Modulation), you'll control how fast your motor spins. Then you'll add a button to cycle through different speeds, combining input and output skills.

## Learning Objectives
- Apply PWM to motor speed control
- Remove and configure enable jumper for PWM
- Create smooth acceleration and deceleration
- Combine button input with motor output
- Implement state-based motor control

---

## Materials Needed
- Working motor circuit from Activity 1
- 1 push button (from Week 5)
- 1 resistor for button pull-down (10kΩ) - optional, can use internal
- 2-3 additional jumper wires for button
- Small screwdriver (to remove enable jumper)

---

## Part 1: PWM Review (3 minutes)

### What is PWM?

**Remember from Week 4:**
- PWM = Pulse Width Modulation
- Rapidly turns signal ON and OFF
- Duty cycle = % of time signal is HIGH
- Controls average power to device

**PWM for LEDs** (Week 4):
```
0% duty cycle → LED off
50% duty cycle → LED half bright
100% duty cycle → LED full bright
```

**PWM for Motors** (this week!):
```
0% duty cycle → Motor stopped
25% duty cycle → Motor slow (1/4 speed)
50% duty cycle → Motor medium (1/2 speed)  
75% duty cycle → Motor fast (3/4 speed)
100% duty cycle → Motor full speed
```

### Why PWM Works for Motors

Motors respond to AVERAGE voltage:
```
100% duty cycle → Always ON → Full voltage → Full speed
50% duty cycle → ON half the time → Half voltage → Half speed
0% duty cycle → Always OFF → No voltage → Stopped
```

PWM switches fast enough (1000 times per second) that motor sees average!

---

## Part 2: Enable Jumper Configuration (2 minutes)

### Understanding the Enable Jumper

**With jumper IN (Activity 1)**:
- Enable pin permanently connected to 5V
- Motor runs at full speed when IN1/IN2 set for direction
- Cannot control speed

**With jumper REMOVED (Activity 2)**:
- Enable pin controlled by GPIO
- Can use PWM on enable pin for speed control
- Full control over motor speed 0-100%

### Remove the Jumper

1. **Power everything OFF** first!
2. Locate enable jumper near ENA pin on motor driver
3. Gently pull jumper straight up (it's a removable cap)
4. **Keep jumper safe** - you might need it later
5. ENA pin now ready for PWM control

**Visual Check**: Enable pins should have no jumper caps

---

## Part 3: Basic Speed Control (5 minutes)

### Program 1: PWM Speed Test

Create new file: `motor_speed.py`

```python
import RPi.GPIO as GPIO
import time

# Pin definitions
IN1 = 17  # Direction control 1
IN2 = 27  # Direction control 2
ENA = 22  # Speed control (PWM)

# GPIO setup
GPIO.setmode(GPIO.BCM)
GPIO.setup(IN1, GPIO.OUT)
GPIO.setup(IN2, GPIO.OUT)
GPIO.setup(ENA, GPIO.OUT)

# Set direction to forward
GPIO.output(IN1, True)   # Forward direction
GPIO.output(IN2, False)

# Create PWM object
# ENA pin, 1000 Hz frequency
pwm = GPIO.PWM(ENA, 1000)
pwm.start(0)  # Start at 0% duty cycle (stopped)

print("Motor Speed Test")
print("Testing different speeds...")
print("Press Ctrl+C to exit")
print()

try:
    # Test different speeds
    speeds = [0, 25, 50, 75, 100]
    
    for speed in speeds:
        print(f"Speed: {speed}%")
        pwm.ChangeDutyCycle(speed)
        time.sleep(3)  # Run at each speed for 3 seconds
    
    print("\nTest complete!")

except KeyboardInterrupt:
    print("\nExiting...")

finally:
    pwm.stop()
    GPIO.cleanup()
    print("Motor stopped and cleaned up")
```

### Run It
```bash
sudo python3 motor_speed.py
```

### Expected Behavior
Motor should:
1. Start stopped (0%)
2. Spin slowly (25%)
3. Spin medium speed (50%)
4. Spin fast (75%)
5. Spin full speed (100%)
6. Stop

### Observations
- Can you hear pitch change with speed?
- Does motor start spinning below certain duty cycle?
- Is there noticeable difference between speeds?

### Troubleshooting

**Motor only runs at full speed:**
- Did you remove the enable jumper?
- Check that PWM is starting on ENA pin
- Verify duty cycle is changing in code

**Motor doesn't start until high duty cycle:**
- Normal! Motors need ~30% to overcome starting friction
- Starting torque requires more power
- Solution: Briefly pulse at high speed to start, then reduce

**Motor stutters at low speeds:**
- Normal behavior for cheap motors
- Try increasing PWM frequency: `GPIO.PWM(ENA, 2000)`
- Better motors handle low speeds smoothly

---

## Part 4: Gradual Speed Changes (3 minutes)

### Program 2: Smooth Acceleration

Create new file: `motor_acceleration.py`

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

# Set direction to forward
GPIO.output(IN1, True)
GPIO.output(IN2, False)

# Create PWM
pwm = GPIO.PWM(ENA, 1000)
pwm.start(0)

print("Motor Acceleration Test")
print("Watch motor gradually speed up and slow down")
print("Press Ctrl+C to exit")
print()

try:
    while True:
        # Accelerate: 0% to 100%
        print("Accelerating...")
        for speed in range(0, 101, 5):  # Increment by 5
            pwm.ChangeDutyCycle(speed)
            print(f"Speed: {speed}%", end='\r')  # Update same line
            time.sleep(0.1)  # Small delay for smooth change
        
        print()  # New line
        time.sleep(1)  # Hold at full speed
        
        # Decelerate: 100% to 0%
        print("Decelerating...")
        for speed in range(100, -1, -5):  # Decrement by 5
            pwm.ChangeDutyCycle(speed)
            print(f"Speed: {speed}%", end='\r')
            time.sleep(0.1)
        
        print()
        time.sleep(1)  # Pause before repeat

except KeyboardInterrupt:
    print("\nExiting...")

finally:
    pwm.stop()
    GPIO.cleanup()
    print("Motor stopped")
```

### Run It
```bash
sudo python3 motor_acceleration.py
```

### Expected Behavior
- Motor smoothly accelerates from stopped to full speed
- Holds at full speed briefly  
- Smoothly decelerates back to stopped
- Repeats until Ctrl+C

**This looks much more professional than instant speed changes!**

---

## Part 5: Button-Controlled Speed (7 minutes)

Now let's combine sensors (button from Week 5) with motors!

### Add Button to Circuit

**From Activity 1, you already have motor connected. Now add button:**

1. Power off Pi: `sudo shutdown -h now`
2. Insert button into breadboard (straddling center gap)
3. Connect one button leg to 3.3V (Pin 1)
4. Connect other button leg to GPIO 18 (Pin 12)

We'll use internal pull-down resistor in code (no external resistor needed).

### Circuit Summary
```
Existing motor circuit (from Activity 1) plus:

Button leg 1 → Pi 3.3V (Pin 1)
Button leg 2 → Pi GPIO 18 (Pin 12)
               (internal pull-down in code)
```

### Program 3: Button Speed Selector

Create new file: `button_motor_speed.py`

```python
import RPi.GPIO as GPIO
import time

# Pin definitions
IN1 = 17      # Motor direction 1
IN2 = 27      # Motor direction 2
ENA = 22      # Motor speed (PWM)
BUTTON = 18   # Button input

# GPIO setup
GPIO.setmode(GPIO.BCM)
GPIO.setup(IN1, GPIO.OUT)
GPIO.setup(IN2, GPIO.OUT)
GPIO.setup(ENA, GPIO.OUT)
GPIO.setup(BUTTON, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

# Set motor direction (forward)
GPIO.output(IN1, True)
GPIO.output(IN2, False)

# Create PWM
pwm = GPIO.PWM(ENA, 1000)
pwm.start(0)

# Speed settings
speeds = [0, 30, 50, 75, 100]
speed_names = ["OFF", "SLOW", "MEDIUM", "FAST", "FULL"]
current_speed_index = 0

# Set initial speed
pwm.ChangeDutyCycle(speeds[current_speed_index])

print("Button Motor Speed Control")
print("Press button to cycle through speeds")
print("Press Ctrl+C to exit")
print()
print(f"Current speed: {speed_names[current_speed_index]} ({speeds[current_speed_index]}%)")

try:
    last_button_state = False
    
    while True:
        button_state = GPIO.input(BUTTON)
        
        # Detect button press (rising edge)
        if button_state and not last_button_state:
            # Move to next speed
            current_speed_index = (current_speed_index + 1) % len(speeds)
            
            # Apply new speed
            pwm.ChangeDutyCycle(speeds[current_speed_index])
            
            # Display current speed
            print(f"Speed: {speed_names[current_speed_index]} ({speeds[current_speed_index]}%)")
            
            # Debounce delay
            time.sleep(0.3)
        
        last_button_state = button_state
        time.sleep(0.01)  # Small delay to prevent CPU overload

except KeyboardInterrupt:
    print("\nExiting...")

finally:
    pwm.stop()
    GPIO.cleanup()
    print("Motor stopped and GPIO cleaned up")
```

### Run It
```bash
sudo python3 button_motor_speed.py
```

### Expected Behavior
- Each button press cycles to next speed
- Speed order: OFF → SLOW → MEDIUM → FAST → FULL → OFF (repeats)
- Terminal shows current speed name and percentage
- Motor responds instantly to speed changes

### Try This
1. Press button multiple times - motor changes speed
2. Let it run at different speeds - listen to pitch changes
3. Notice motor might not spin at SLOW (30%) when starting from stop
4. Terminal displays clear feedback

---

## Part 6: Advanced Speed Control Function

### Program 4: Complete Motor Control

Create new file: `motor_complete.py`

```python
import RPi.GPIO as GPIO
import time

# Pin definitions
IN1, IN2, ENA = 17, 27, 22
BUTTON = 18

# GPIO setup
GPIO.setmode(GPIO.BCM)
GPIO.setup(IN1, GPIO.OUT)
GPIO.setup(IN2, GPIO.OUT)
GPIO.setup(ENA, GPIO.OUT)
GPIO.setup(BUTTON, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

# Create PWM
pwm = GPIO.PWM(ENA, 1000)
pwm.start(0)

def set_motor(direction, speed):
    """
    Control motor direction and speed
    
    Args:
        direction: 'forward', 'reverse', 'coast', 'brake'
        speed: 0-100 (percentage)
    """
    if direction == 'forward':
        GPIO.output(IN1, True)
        GPIO.output(IN2, False)
        pwm.ChangeDutyCycle(speed)
        print(f"Motor: FORWARD at {speed}%")
    elif direction == 'reverse':
        GPIO.output(IN1, False)
        GPIO.output(IN2, True)
        pwm.ChangeDutyCycle(speed)
        print(f"Motor: REVERSE at {speed}%")
    elif direction == 'coast':
        GPIO.output(IN1, False)
        GPIO.output(IN2, False)
        pwm.ChangeDutyCycle(0)
        print("Motor: COAST (stopped)")
    elif direction == 'brake':
        GPIO.output(IN1, True)
        GPIO.output(IN2, True)
        pwm.ChangeDutyCycle(0)
        print("Motor: BRAKE (stopped)")

# Motor states
states = [
    ('coast', 0),           # Off
    ('forward', 30),        # Slow forward
    ('forward', 70),        # Fast forward
    ('brake', 0),           # Brake
    ('reverse', 30),        # Slow reverse
    ('reverse', 70),        # Fast reverse
]
state_names = ["OFF", "FORWARD SLOW", "FORWARD FAST", "BRAKE", "REVERSE SLOW", "REVERSE FAST"]
current_state = 0

print("Complete Motor Control")
print("Button cycles through all motor states")
print("Press Ctrl+C to exit")
print()

# Set initial state
direction, speed = states[current_state]
set_motor(direction, speed)

try:
    last_button_state = False
    
    while True:
        button_state = GPIO.input(BUTTON)
        
        if button_state and not last_button_state:
            # Next state
            current_state = (current_state + 1) % len(states)
            direction, speed = states[current_state]
            
            print(f"\nState: {state_names[current_state]}")
            set_motor(direction, speed)
            
            time.sleep(0.3)  # Debounce
        
        last_button_state = button_state
        time.sleep(0.01)

except KeyboardInterrupt:
    print("\nExiting...")

finally:
    set_motor('coast', 0)
    pwm.stop()
    GPIO.cleanup()
    print("Motor stopped")
```

### Run It
```bash
sudo python3 motor_complete.py
```

This program demonstrates complete motor control:
- Different speeds
- Different directions  
- Both stop methods (coast and brake)
- Clean code organization with functions

---

## Understanding Speed Limitations

### Why Motor Might Not Start at Low Speeds

**Starting friction** is higher than running friction:
```
Motor at rest: Needs ~40% duty cycle to START
Motor running: Can maintain ~20% duty cycle
```

**Solution for smooth low-speed operation:**
```python
def start_motor_slow(direction, target_speed):
    """Start motor at high speed, then reduce"""
    # Pulse at high speed to start
    set_motor(direction, 70)
    time.sleep(0.2)
    
    # Reduce to target speed
    set_motor(direction, target_speed)

# Usage:
start_motor_slow('forward', 30)  # Starts reliably at 30%
```

---

## Extension Challenges

### Challenge 1: Smooth Transitions
Modify button_motor_speed.py to gradually change speed instead of instant changes.

**Hint**: Loop from current speed to target speed incrementally

### Challenge 2: Dual Button Control
- Button 1: Cycle through speeds (as before)
- Button 2: Toggle direction (forward/reverse)

### Challenge 3: PIR-Activated Motor
Replace button with PIR sensor:
- No motion: Motor off
- Motion detected: Motor runs at medium speed
- Implement timeout (motor runs 5 seconds after last motion)

### Challenge 4: Distance-Based Speed
Use ultrasonic sensor (Week 5):
- Close object: Motor slow
- Medium distance: Motor medium speed
- Far object: Motor fast
- Too close: Motor stops

---

## Common Issues & Solutions

### Motor speed doesn't change
- **Check**: Enable jumper removed?
- **Check**: PWM actually starting and changing?
- **Test**: Put LED on ENA pin to verify PWM working

### Motor won't start at low speeds
- **Normal!** Starting friction requires more power
- **Solution**: Start at 70%, then reduce to desired speed
- **Or**: Accept that minimum speed is ~30-40%

### Button not responding
- **Review Week 5**: Button input troubleshooting
- **Check**: Pull-down resistor enabled in code
- **Check**: Correct GPIO pin (18) used
- **Test**: Print button state in loop to debug

### Motor judders at certain speeds
- **Common** with cheap motors
- **Try**: Different PWM frequencies (500 Hz or 2000 Hz)
- **Try**: Avoid that specific speed range
- **Better motors** handle all speeds smoothly

---

## Key Concepts Review

**By completing this activity, you learned:**
- ✓ PWM controls motor speed through duty cycle
- ✓ Enable jumper must be removed for PWM control
- ✓ Speed (0-100%) independent from direction
- ✓ Combining input (button) with output (motor)
- ✓ Starting friction limits minimum speed
- ✓ Smooth acceleration more professional than instant changes
- ✓ State machines for cycling through options

---

## Real-World Applications

**Speed control is used in:**
- **Electric vehicles**: Accelerator pedal controls motor speed
- **Drones**: Variable speed for altitude and stabilization  
- **3D printers**: Precise speed control for print quality
- **Fans**: Thermostat-controlled cooling speed
- **Conveyor belts**: Speed matches production requirements
- **Robots**: Variable speed for different terrains or tasks

---

## Safety Reminders

**Before ending:**
- [ ] Motor stopped (set to coast or brake)
- [ ] PWM stopped: `pwm.stop()`
- [ ] GPIO cleaned up: `GPIO.cleanup()`
- [ ] Battery disconnected
- [ ] Pi powered down properly

---

## Next Steps

**You now have complete motor control!** In homework, you'll:
- Build sensor-controlled motor projects
- Create automated sequences
- Combine multiple sensors with motors
- Prepare for building a mobile robot (Week 7)

**Excellent work mastering motor control!** ⚙️🎮✨

---

## Instructor Checkpoint

Student should demonstrate:
- [ ] Motor speed controlled by PWM (0-100%)
- [ ] Button cycles through multiple speeds
- [ ] Understanding of duty cycle concept
- [ ] Clean code with proper cleanup
- [ ] Ready for homework challenges
