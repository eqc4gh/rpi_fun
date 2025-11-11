# Week 7 Quick Start - Line Following Robot

## Quick Assembly Checklist

### 1. Mechanical Assembly (15 minutes)
- [ ] Attach motors to chassis
- [ ] Install wheels on motor shafts
- [ ] Attach caster wheel or ball bearing to front/back
- [ ] Mount battery holder on chassis
- [ ] Test that robot rolls smoothly

### 2. Electrical Setup (10 minutes)
- [ ] Mount L298N motor driver on chassis
- [ ] Connect LEFT motor to Motor A terminals
- [ ] Connect RIGHT motor to Motor B terminals
- [ ] Connect motor power: Battery (+) → 12V input, Battery (-) → GND
- [ ] Connect Pi GND to motor driver GND (common ground!)

### 3. Motor Control Connections
```
L298N → Raspberry Pi GPIO
IN1 → GPIO 17 (Left motor direction)
IN2 → GPIO 27 (Left motor direction)
IN3 → GPIO 22 (Right motor direction)
IN4 → GPIO 23 (Right motor direction)
ENA → GPIO 12 (Left motor speed, PWM)
ENB → GPIO 13 (Right motor speed, PWM)
GND → GND (already connected above)
```

### 4. Line Sensor Connections
```
Line Sensor Module → Raspberry Pi
VCC → 5V
GND → GND
Left Sensor (S1) → GPIO 5
Right Sensor (S2) → GPIO 6
(If using 3+ sensors, use additional GPIO pins)
```

### 5. Create Simple Test Track
- Use black electrical tape (1-2 inches wide)
- Place on white poster board or light floor
- Start with straight line, then add gentle curves

---

## Basic Line Following Code

### Complete Working Example (2-Sensor)

```python
#!/usr/bin/env python3
"""
Simple Line Following Robot
Uses 2 IR sensors to follow a black line
"""

import RPi.GPIO as GPIO
import time

# Motor control pins
LEFT_MOTOR_IN1 = 17
LEFT_MOTOR_IN2 = 27
LEFT_MOTOR_PWM = 12

RIGHT_MOTOR_IN1 = 22
RIGHT_MOTOR_IN2 = 23
RIGHT_MOTOR_PWM = 13

# Line sensor pins
LEFT_SENSOR = 5
RIGHT_SENSOR = 6

# Motor speed (0-100)
BASE_SPEED = 60
TURN_SPEED = 40

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Setup motor pins
GPIO.setup(LEFT_MOTOR_IN1, GPIO.OUT)
GPIO.setup(LEFT_MOTOR_IN2, GPIO.OUT)
GPIO.setup(LEFT_MOTOR_PWM, GPIO.OUT)

GPIO.setup(RIGHT_MOTOR_IN1, GPIO.OUT)
GPIO.setup(RIGHT_MOTOR_IN2, GPIO.OUT)
GPIO.setup(RIGHT_MOTOR_PWM, GPIO.OUT)

# Setup sensor pins
GPIO.setup(LEFT_SENSOR, GPIO.IN)
GPIO.setup(RIGHT_SENSOR, GPIO.IN)

# Create PWM objects
left_pwm = GPIO.PWM(LEFT_MOTOR_PWM, 1000)
right_pwm = GPIO.PWM(RIGHT_MOTOR_PWM, 1000)

# Start PWM
left_pwm.start(0)
right_pwm.start(0)

def set_left_motor(speed, direction):
    """Control left motor"""
    if direction == "forward":
        GPIO.output(LEFT_MOTOR_IN1, GPIO.HIGH)
        GPIO.output(LEFT_MOTOR_IN2, GPIO.LOW)
    elif direction == "backward":
        GPIO.output(LEFT_MOTOR_IN1, GPIO.LOW)
        GPIO.output(LEFT_MOTOR_IN2, GPIO.HIGH)
    else:  # stop
        GPIO.output(LEFT_MOTOR_IN1, GPIO.LOW)
        GPIO.output(LEFT_MOTOR_IN2, GPIO.LOW)
    
    left_pwm.ChangeDutyCycle(abs(speed))

def set_right_motor(speed, direction):
    """Control right motor"""
    if direction == "forward":
        GPIO.output(RIGHT_MOTOR_IN1, GPIO.HIGH)
        GPIO.output(RIGHT_MOTOR_IN2, GPIO.LOW)
    elif direction == "backward":
        GPIO.output(RIGHT_MOTOR_IN1, GPIO.LOW)
        GPIO.output(RIGHT_MOTOR_IN2, GPIO.HIGH)
    else:  # stop
        GPIO.output(RIGHT_MOTOR_IN1, GPIO.LOW)
        GPIO.output(RIGHT_MOTOR_IN2, GPIO.LOW)
    
    right_pwm.ChangeDutyCycle(abs(speed))

def move_forward(speed=BASE_SPEED):
    """Move forward"""
    set_left_motor(speed, "forward")
    set_right_motor(speed, "forward")

def turn_left():
    """Turn left"""
    set_left_motor(TURN_SPEED, "forward")
    set_right_motor(BASE_SPEED, "forward")

def turn_right():
    """Turn right"""
    set_left_motor(BASE_SPEED, "forward")
    set_right_motor(TURN_SPEED, "forward")

def stop_motors():
    """Stop both motors"""
    set_left_motor(0, "stop")
    set_right_motor(0, "stop")

def read_sensors():
    """Read both line sensors"""
    left = GPIO.input(LEFT_SENSOR)
    right = GPIO.input(RIGHT_SENSOR)
    return left, right

def follow_line():
    """Main line following logic"""
    left, right = read_sensors()
    
    # Sensor returns LOW (0) when over black line
    # Sensor returns HIGH (1) when over white surface
    
    if left == 0 and right == 0:
        # Both on line (or both off) - go straight
        move_forward()
        print("Forward")
    
    elif left == 0 and right == 1:
        # Line is to the left - turn left
        turn_left()
        print("Turn Left")
    
    elif left == 1 and right == 0:
        # Line is to the right - turn right
        turn_right()
        print("Turn Right")
    
    else:  # left == 1 and right == 1
        # Both sensors off line - lost line, try turning
        move_forward(BASE_SPEED // 2)  # Slow forward to find line
        print("Searching...")

# Main program
try:
    print("Line Following Robot Starting...")
    print("Press Ctrl+C to stop")
    time.sleep(2)
    
    while True:
        follow_line()
        time.sleep(0.05)  # 50ms loop delay
        
except KeyboardInterrupt:
    print("\nStopping robot...")
    
finally:
    stop_motors()
    left_pwm.stop()
    right_pwm.stop()
    GPIO.cleanup()
    print("Cleanup complete")
```

---

## Testing Procedure

### Step 1: Test Sensors Alone
```python
#!/usr/bin/env python3
import RPi.GPIO as GPIO
import time

LEFT_SENSOR = 5
RIGHT_SENSOR = 6

GPIO.setmode(GPIO.BCM)
GPIO.setup(LEFT_SENSOR, GPIO.IN)
GPIO.setup(RIGHT_SENSOR, GPIO.IN)

try:
    while True:
        left = GPIO.input(LEFT_SENSOR)
        right = GPIO.input(RIGHT_SENSOR)
        print(f"Left: {left}  Right: {right}")
        time.sleep(0.2)
except KeyboardInterrupt:
    GPIO.cleanup()
```

**Test**: Move sensors over black line and white surface
- Over BLACK: Should show 0
- Over WHITE: Should show 1

### Step 2: Test Motors On Blocks
- Put robot on blocks so wheels don't touch ground
- Run motor test program from Week 6
- Verify both motors spin correct direction
- If backwards, swap motor wires or change code

### Step 3: Test Line Following (Tethered)
- Keep Pi plugged into wall power
- Only motors on battery
- Run line following program
- Manually move robot along line to test logic

### Step 4: Test Line Following (Mobile)
- If untethered: Add second battery pack for Pi
- Place robot at start of track
- Start program
- Let it follow the line!

---

## Quick Tuning Tips

### Robot Goes Straight Off Line
```python
# Increase turning response
TURN_SPEED = 30  # More difference between wheels
BASE_SPEED = 70  # Keep forward speed higher
```

### Robot Oscillates/Wobbles Too Much
```python
# Reduce turning response
TURN_SPEED = 50  # Less difference between wheels
BASE_SPEED = 60  # Slower forward speed
```

### Robot Too Slow
```python
BASE_SPEED = 80
TURN_SPEED = 60
```

### Robot Too Fast (Overshoots Line)
```python
BASE_SPEED = 50
TURN_SPEED = 30
```

### Robot Loses Line in Curves
- Reduce overall speed
- Position sensors further forward
- Add more sensors for better detection
- Check sensor height (should be ~5mm from ground)

---

## 3-Sensor Version (Better Performance)

```python
# Additional sensor
CENTER_SENSOR = 19

# In setup:
GPIO.setup(CENTER_SENSOR, GPIO.IN)

# In follow_line() function:
def follow_line():
    left = GPIO.input(LEFT_SENSOR)
    center = GPIO.input(CENTER_SENSOR)
    right = GPIO.input(RIGHT_SENSOR)
    
    # All on white except center on line
    if left == 1 and center == 0 and right == 1:
        move_forward()
        print("Forward (centered)")
    
    # Line drifting left
    elif left == 0 or (center == 0 and left == 0):
        turn_left()
        print("Turn Left")
    
    # Line drifting right
    elif right == 0 or (center == 0 and right == 0):
        turn_right()
        print("Turn Right")
    
    # All on line or all off line
    else:
        move_forward(BASE_SPEED // 2)
        print("Searching...")
```

---

## Emergency Stop

### Hardware Button Stop (Recommended)
```python
STOP_BUTTON = 26

GPIO.setup(STOP_BUTTON, GPIO.IN, pull_up_down=GPIO.PUD_UP)

# In main loop:
while True:
    if GPIO.input(STOP_BUTTON) == GPIO.LOW:
        print("Emergency stop!")
        break
    
    follow_line()
    time.sleep(0.05)
```

### Software Stop
- Press `Ctrl+C` in terminal
- Or close SSH session (not ideal)

---

## Common Issues & Quick Fixes

| Problem | Quick Fix |
|---------|-----------|
| One motor doesn't spin | Check motor connections, test motor alone |
| Robot veers left/right | Adjust motor speeds in code to compensate |
| Sensors always 0 or always 1 | Check wiring, test on known black/white |
| Robot too fast | Reduce BASE_SPEED |
| Robot won't turn | Increase difference between TURN_SPEED and BASE_SPEED |
| Loses line on curves | Slow down, position sensors forward |
| Stops working after a few seconds | Check battery level |
| Pi resets when motors start | Separate motor and Pi power! |

---

## Pin Reference Card

**Print This Out and Keep With Your Robot!**

```
=================================
LINE FOLLOWING ROBOT PIN MAP
=================================

LEFT MOTOR (Motor A):
  IN1: GPIO 17
  IN2: GPIO 27
  PWM: GPIO 12

RIGHT MOTOR (Motor B):
  IN1: GPIO 22
  IN2: GPIO 23
  PWM: GPIO 13

LINE SENSORS:
  Left:   GPIO 5
  Center: GPIO 19 (optional)
  Right:  GPIO 6

POWER:
  Motor Driver: 6V from battery pack
  Pi Ground: Connect to motor driver GND

SENSOR LOGIC:
  0 (LOW)  = On black line
  1 (HIGH) = On white surface
=================================
```

---

## Next Steps

Once basic line following works:
1. Add more sensors for better tracking
2. Implement proportional control (smoother)
3. Add obstacle avoidance with ultrasonic sensor
4. Track intersection counting
5. Speed optimization
6. Record and replay paths

**Remember**: Robotics is iterative. Test, adjust, test again!
