# Activity 2: Line Sensor Installation and Line Following

## Objective
Install infrared line sensors on your robot, test them independently, and then combine them with motor control to create a working line following robot!

**Time**: 30-40 minutes  
**Difficulty**: Intermediate  
**Prerequisites**: Completed Activity 1 (robot assembled with working motors)

---

## What You'll Learn
- How to mount sensors on a mobile robot
- Reading digital sensor inputs in real-time
- Combining sensor inputs with motor outputs
- Basic decision-making algorithms for autonomous robots
- Debugging sensor-based control systems
- Tuning robot performance

---

## Materials Needed

### From Your Kit
- [ ] Your assembled robot from Activity 1
- [ ] Line sensor module (2, 3, or 5 IR sensors)
- [ ] Jumper wires (female-to-female)
- [ ] Velcro or mounting tape
- [ ] Zip ties
- [ ] Test track (black tape on white surface)

### For Testing
- [ ] Black electrical tape (1-2 inches wide)
- [ ] White poster board, paper, or light-colored floor
- [ ] Ruler or measuring tape

---

## Part 1: Understanding Your Line Sensor (5 minutes)

### Identify Your Sensor Module

**Common Sensor Configurations**:

**2-Sensor Module** (Simplest):
```
[Left Sensor]  [Right Sensor]
     S1              S2
```
- Good for basic line following
- Easiest to program
- More oscillation on line

**3-Sensor Module** (Recommended):
```
[Left]  [Center]  [Right]
  S1       S2        S3
```
- Better centering capability
- More stable following
- Good balance of simplicity and performance

**5-Sensor Module** (Advanced):
```
[Far Left] [Left] [Center] [Right] [Far Right]
    S1       S2      S3       S4        S5
```
- Most precise control
- Smoothest line following
- More complex to program

### Sensor Module Pins

Most line sensor modules have these connections:

```
Pin Labels:
VCC  → Power (5V)
GND  → Ground
S1   → Sensor 1 output (digital)
S2   → Sensor 2 output
S3   → Sensor 3 output (if present)
...  → Additional sensors

Some modules have:
EN   → Enable pin (usually not needed, can ignore)
```

### How Sensors Work

**Detection Principle**:
```
                Sensor
                   ↓
IR LED → ))) Light ))) → Reflected → Phototransistor
                   ↓
            Black line
             (absorbs)

Output: LOW (0) when over BLACK
Output: HIGH (1) when over WHITE
```

**Built-in Features**:
- Most modules have adjustable sensitivity (small potentiometer)
- LED indicators show when sensor detects black line
- Digital output (no analog reading needed)

---

## Part 2: Sensor Installation (10 minutes)

### Step 1: Determine Sensor Position

**Optimal Sensor Placement**:

```
Side view (sensor height):
         Sensor Module
              |||
              |||  ← 3-8mm optimal
    ==================== Floor

Too high (>10mm):
- Weak signal
- Unreliable detection

Too low (<2mm):
- Risk hitting bumps
- May scrape ground

Perfect (3-8mm):
- Strong, consistent signal
- Safe clearance
```

```
Top view (sensor position):
      [Battery]
          |
    [Sensor Module]  ← Front of robot
          |
      [Motors]
          |
       [Caster]

Why in front:
- Gives robot time to react
- Sees line before wheels cross it
- Better curve handling
```

### Step 2: Mount the Sensor Module

**Mounting Options**:

**Option 1: Velcro Mount** (Recommended)
```
Steps:
1. Clean sensor module mounting surface
2. Cut velcro to size
3. Attach rough side to robot front
4. Attach soft side to sensor module
5. Press together firmly
6. Test height with ruler (3-8mm)
```

**Option 2: Zip Tie Mount**
```
Steps:
1. Find mounting holes on chassis front
2. Thread zip tie through chassis
3. Wrap around sensor module
4. Pull tight but don't crush
5. Trim excess zip tie
6. Add second zip tie for security
```

**Option 3: Tape Mount** (Temporary)
```
Steps:
1. Use strong double-sided tape
2. Position sensor at front edge
3. Press firmly for 30 seconds
4. Support from below while pressing
Note: May come loose with vibration!
```

### Step 3: Adjust Sensor Height

**Measuring and Adjusting**:

1. **Measure current height**
   ```bash
   # Place robot on flat surface
   # Use ruler to measure sensor to ground
   # Target: 4-6mm for most sensors
   ```

2. **If too high**: Add washers or spacers under sensor
3. **If too low**: Add spacers under sensor mounting points
4. **Use mounting tape thickness** to fine-tune height

**Verification**:
- Place robot on floor
- Sensor should be parallel to floor
- No scraping when robot moves
- Consistent height across sensor array

---

## Part 3: Sensor Wiring (5 minutes)

### Wiring Connections

**From Line Sensor → Raspberry Pi**:

```
Sensor Module          Raspberry Pi GPIO
--------------         ------------------
VCC (Power)      →     5V (physical pin 2 or 4)
GND (Ground)     →     GND (physical pin 6, 9, etc.)
S1 (Left)        →     GPIO 5 (physical pin 29)
S2 (Center/Right)→     GPIO 6 (physical pin 31)
S3 (Right)       →     GPIO 19 (physical pin 35)
[Additional sensors use GPIO 16, 20, 21, 26]
```

**For 2-Sensor Module**:
```python
LEFT_SENSOR = 5
RIGHT_SENSOR = 6
```

**For 3-Sensor Module**:
```python
LEFT_SENSOR = 5
CENTER_SENSOR = 19
RIGHT_SENSOR = 6
```

**For 5-Sensor Module**:
```python
SENSOR_1 = 5   # Far left
SENSOR_2 = 19  # Left
SENSOR_3 = 6   # Center
SENSOR_4 = 16  # Right
SENSOR_5 = 20  # Far right
```

### Wire Management

**Important**: Wires must not interfere with robot movement!

1. **Route wires along chassis**
   - Follow edges, not across open spaces
   - Keep away from wheels
   - Leave some slack for movement

2. **Secure with zip ties**
   - Every 3-4 inches
   - Not too tight (wires need some flex)
   - Trim excess zip tie length

3. **Test clearance**
   - Spin wheels by hand
   - Wires shouldn't touch wheels
   - Wires shouldn't pull on connections

---

## Part 4: Sensor Testing (5 minutes)

### Create Sensor Test Program

Create file: `sensor_test.py`

```python
#!/usr/bin/env python3
"""
Line Sensor Test Program
Tests sensor readings over black and white surfaces
"""

import RPi.GPIO as GPIO
import time

# Pin definitions (adjust based on your wiring)
LEFT_SENSOR = 5
CENTER_SENSOR = 19  # Comment out if using 2-sensor module
RIGHT_SENSOR = 6

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Configure sensor pins as inputs
GPIO.setup(LEFT_SENSOR, GPIO.IN)
GPIO.setup(CENTER_SENSOR, GPIO.IN)  # Comment out if not using
GPIO.setup(RIGHT_SENSOR, GPIO.IN)

print("=" * 50)
print("LINE SENSOR TEST")
print("=" * 50)
print("\nMove robot over black line and white surface")
print("Press Ctrl+C to stop\n")
print("Sensor readings:")
print("  0 = Black (line detected)")
print("  1 = White (no line)")
print("-" * 50)

try:
    while True:
        # Read sensors
        left = GPIO.input(LEFT_SENSOR)
        center = GPIO.input(CENTER_SENSOR)  # Comment out if not using
        right = GPIO.input(RIGHT_SENSOR)
        
        # Display readings (3-sensor version)
        print(f"Left: {left}  Center: {center}  Right: {right}", end="\r")
        
        # For 2-sensor version, use this instead:
        # print(f"Left: {left}  Right: {right}       ", end="\r")
        
        time.sleep(0.1)

except KeyboardInterrupt:
    print("\n\nTest stopped")
    GPIO.cleanup()
```

### Test Procedure

1. **Run the test program**:
   ```bash
   python3 sensor_test.py
   ```

2. **Test over WHITE surface**:
   - Hold robot over white paper/floor
   - All sensors should show: `1`

3. **Test over BLACK line**:
   - Move robot over black tape
   - Sensors over black should show: `0`
   - Sensors over white should show: `1`

4. **Expected Readings**:
   ```
   All over white:    Left: 1  Center: 1  Right: 1
   Left edge:         Left: 0  Center: 1  Right: 1
   Centered:          Left: 1  Center: 0  Right: 1
   Right edge:        Left: 1  Center: 1  Right: 0
   All over black:    Left: 0  Center: 0  Right: 0
   ```

### Sensor Calibration

**If sensors don't work correctly**:

1. **Check wiring** (most common issue)
   - Verify VCC → 5V
   - Verify GND → GND
   - Verify signal pins → correct GPIO

2. **Adjust sensitivity**
   - Locate small potentiometer on sensor module
   - Use small screwdriver to turn
   - Turn clockwise = less sensitive
   - Turn counter-clockwise = more sensitive

3. **Test lighting**
   - IR sensors work best in consistent lighting
   - Avoid bright sunlight or flickering fluorescent
   - Try different lighting if issues persist

4. **Check height**
   - Sensor should be 3-8mm from surface
   - Too high = weak signal
   - Too low = inconsistent readings

---

## Part 5: Basic Line Following Code (15 minutes)

### Two-Sensor Line Following

Create file: `line_follow_2sensor.py`

```python
#!/usr/bin/env python3
"""
2-Sensor Line Following Robot
Simple algorithm for basic line following
"""

import RPi.GPIO as GPIO
import time

# ===== PIN DEFINITIONS =====
# Motors
LEFT_IN1 = 17
LEFT_IN2 = 27
LEFT_ENA = 12
RIGHT_IN1 = 22
RIGHT_IN2 = 23
RIGHT_ENB = 13

# Sensors
LEFT_SENSOR = 5
RIGHT_SENSOR = 6

# ===== MOTOR SPEEDS =====
BASE_SPEED = 60    # Forward speed (0-100)
TURN_SPEED = 40    # Speed when turning (0-100)

# ===== SETUP =====
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Setup motor pins
GPIO.setup(LEFT_IN1, GPIO.OUT)
GPIO.setup(LEFT_IN2, GPIO.OUT)
GPIO.setup(LEFT_ENA, GPIO.OUT)
GPIO.setup(RIGHT_IN1, GPIO.OUT)
GPIO.setup(RIGHT_IN2, GPIO.OUT)
GPIO.setup(RIGHT_ENB, GPIO.OUT)

# Setup sensor pins
GPIO.setup(LEFT_SENSOR, GPIO.IN)
GPIO.setup(RIGHT_SENSOR, GPIO.IN)

# Create PWM objects
left_pwm = GPIO.PWM(LEFT_ENA, 1000)
right_pwm = GPIO.PWM(RIGHT_ENB, 1000)
left_pwm.start(0)
right_pwm.start(0)

# ===== MOTOR CONTROL FUNCTIONS =====

def set_motor(motor_side, speed, direction):
    """
    Control a motor
    motor_side: 'left' or 'right'
    speed: 0-100
    direction: 'forward', 'backward', or 'stop'
    """
    if motor_side == 'left':
        if direction == 'forward':
            GPIO.output(LEFT_IN1, GPIO.HIGH)
            GPIO.output(LEFT_IN2, GPIO.LOW)
        elif direction == 'backward':
            GPIO.output(LEFT_IN1, GPIO.LOW)
            GPIO.output(LEFT_IN2, GPIO.HIGH)
        else:  # stop
            GPIO.output(LEFT_IN1, GPIO.LOW)
            GPIO.output(LEFT_IN2, GPIO.LOW)
        left_pwm.ChangeDutyCycle(speed)
    
    elif motor_side == 'right':
        if direction == 'forward':
            GPIO.output(RIGHT_IN1, GPIO.HIGH)
            GPIO.output(RIGHT_IN2, GPIO.LOW)
        elif direction == 'backward':
            GPIO.output(RIGHT_IN1, GPIO.LOW)
            GPIO.output(RIGHT_IN2, GPIO.HIGH)
        else:  # stop
            GPIO.output(RIGHT_IN1, GPIO.LOW)
            GPIO.output(RIGHT_IN2, GPIO.LOW)
        right_pwm.ChangeDutyCycle(speed)

def move_forward():
    """Move both motors forward at base speed"""
    set_motor('left', BASE_SPEED, 'forward')
    set_motor('right', BASE_SPEED, 'forward')
    print("→ Forward", end="\r")

def turn_left():
    """Turn left by slowing left motor"""
    set_motor('left', TURN_SPEED, 'forward')
    set_motor('right', BASE_SPEED, 'forward')
    print("↰ Turn Left ", end="\r")

def turn_right():
    """Turn right by slowing right motor"""
    set_motor('left', BASE_SPEED, 'forward')
    set_motor('right', TURN_SPEED, 'forward')
    print("↱ Turn Right", end="\r")

def stop_motors():
    """Stop both motors"""
    set_motor('left', 0, 'stop')
    set_motor('right', 0, 'stop')
    print("■ Stopped   ", end="\r")

# ===== LINE FOLLOWING LOGIC =====

def follow_line():
    """Main line following algorithm"""
    
    # Read sensors
    left = GPIO.input(LEFT_SENSOR)
    right = GPIO.input(RIGHT_SENSOR)
    
    # Decision logic
    # Remember: 0 = black (on line), 1 = white (off line)
    
    if left == 0 and right == 0:
        # Both sensors on line (or both off line)
        # Go straight
        move_forward()
    
    elif left == 0 and right == 1:
        # Left sensor sees line, right doesn't
        # Line is to the LEFT
        turn_left()
    
    elif left == 1 and right == 0:
        # Right sensor sees line, left doesn't
        # Line is to the RIGHT
        turn_right()
    
    else:  # left == 1 and right == 1
        # Both sensors off line (lost line!)
        # Keep moving slowly to search
        set_motor('left', BASE_SPEED // 2, 'forward')
        set_motor('right', BASE_SPEED // 2, 'forward')
        print("? Searching...", end="\r")

# ===== MAIN PROGRAM =====

try:
    print("=" * 50)
    print("LINE FOLLOWING ROBOT - 2 SENSOR VERSION")
    print("=" * 50)
    print("\n🤖 Starting robot...")
    print("   Place robot on line")
    print("   Press Ctrl+C to stop\n")
    
    time.sleep(2)  # Give time to position robot
    
    print("▶ Running...\n")
    
    # Main control loop
    while True:
        follow_line()
        time.sleep(0.05)  # 50ms loop delay (20 times per second)

except KeyboardInterrupt:
    print("\n\n⏹ Stopping robot...")
    
finally:
    # Clean shutdown
    stop_motors()
    time.sleep(0.5)
    left_pwm.stop()
    right_pwm.stop()
    GPIO.cleanup()
    print("✓ Cleanup complete\n")
```

### Run Your Line Following Robot!

1. **Prepare test track**:
   - Black tape on white surface
   - Start with straight line (6 feet)
   - Then add gentle curve

2. **Place robot on line**:
   - Sensors should straddle the line
   - Robot facing forward along line

3. **Run the program**:
   ```bash
   python3 line_follow_2sensor.py
   ```

4. **Observe**:
   - Robot should start moving forward
   - Should adjust left/right to follow line
   - May oscillate (zigzag) somewhat - this is normal!

---

## Part 6: Tuning and Improvement (10 minutes)

### Common Issues and Fixes

**Issue**: Robot goes straight off line
- **Cause**: Not turning enough
- **Fix**: Reduce TURN_SPEED or increase BASE_SPEED difference
  ```python
  BASE_SPEED = 70
  TURN_SPEED = 30  # Bigger difference = sharper turns
  ```

**Issue**: Robot oscillates wildly (zigzags a lot)
- **Cause**: Turning too much
- **Fix**: Increase TURN_SPEED or reduce difference
  ```python
  BASE_SPEED = 60
  TURN_SPEED = 50  # Less difference = gentler turns
  ```

**Issue**: Robot too fast, overshoots line
- **Cause**: Moving too fast to react
- **Fix**: Reduce both speeds
  ```python
  BASE_SPEED = 50
  TURN_SPEED = 35
  ```

**Issue**: Robot too slow
- **Cause**: Speeds too conservative
- **Fix**: Increase both speeds
  ```python
  BASE_SPEED = 80
  TURN_SPEED = 60
  ```

**Issue**: Robot veers to one side
- **Cause**: Motors have different speeds
- **Fix**: Compensate in code
  ```python
  # If robot veers right, slow right motor:
  set_motor('left', BASE_SPEED, 'forward')
  set_motor('right', BASE_SPEED * 0.95, 'forward')  # 5% slower
  ```

### Testing Track Progression

**Start Simple, Add Complexity**:

1. **Straight line** (10 feet)
   - Verify basic following works
   - Tune speeds on straight

2. **Gentle curve**
   - Single wide curve
   - Adjust if robot loses line

3. **Oval or circle**
   - Continuous gentle curves
   - Robot should complete full loop

4. **Figure-8**
   - Curves in both directions
   - Tests left and right turning

5. **Sharp corners** (Advanced)
   - 90-degree turns
   - May need algorithm improvements

### Performance Metrics

Track your robot's performance:
```
Test Track: ___________________
BASE_SPEED: ____  TURN_SPEED: ____

[ ] Completes straight line
[ ] Follows gentle curves
[ ] Completes full lap
[ ] Handles sharp corners

Time for one lap: _____ seconds
Lost line: _____ times
```

---

## Three-Sensor Improvement (Bonus)

If you have a 3-sensor module, try this improved algorithm:

```python
# Add to pin definitions:
CENTER_SENSOR = 19

# Add to setup:
GPIO.setup(CENTER_SENSOR, GPIO.IN)

# Replace follow_line() function:
def follow_line():
    """Improved 3-sensor line following"""
    
    left = GPIO.input(LEFT_SENSOR)
    center = GPIO.input(CENTER_SENSOR)
    right = GPIO.input(RIGHT_SENSOR)
    
    # Perfectly centered
    if center == 0 and left == 1 and right == 1:
        move_forward()
    
    # Drifting left or left edge
    elif left == 0:
        turn_left()
    
    # Drifting right or right edge
    elif right == 0:
        turn_right()
    
    # All sensors on white (lost line)
    elif left == 1 and center == 1 and right == 1:
        set_motor('left', BASE_SPEED // 2, 'forward')
        set_motor('right', BASE_SPEED // 2, 'forward')
        print("? Searching...", end="\r")
    
    # All sensors on black (intersection or wide line)
    elif left == 0 and center == 0 and right == 0:
        move_forward()  # Go straight through
        print("╬ Intersection", end="\r")
    
    # Default: go forward
    else:
        move_forward()
```

---

## Success Criteria

At the end of this activity, you should have:

- [ ] Line sensors mounted at proper height (3-8mm)
- [ ] Sensors positioned at front of robot
- [ ] All sensor wires connected and secured
- [ ] Sensors tested individually (working correctly)
- [ ] Line following code running
- [ ] Robot follows straight line successfully
- [ ] Robot navigates gentle curves
- [ ] Speeds tuned for your robot and track
- [ ] Understanding of how sensors and motors work together

---

## Challenges to Try

### Challenge 1: Speed Optimization
- Find fastest speed where robot reliably follows line
- Time 3 laps and calculate average
- Compare with classmates

### Challenge 2: Smooth Following
- Minimize oscillation (zigzagging)
- Tune for straightest path
- Measure deviation from center of line

### Challenge 3: Complex Track
- Create track with sharp corners
- Add intersections
- See if robot can handle it

### Challenge 4: Line Detection LED
- Add LED that lights when ANY sensor sees line
- Helps visualize what robot "sees"
- Good for debugging

---

## Troubleshooting Guide

### Sensors Don't Respond
1. Check wiring (VCC, GND, signal pins)
2. Verify power to sensors (should have 5V)
3. Test sensors with sensor_test.py
4. Adjust sensitivity potentiometer

### Robot Doesn't Follow Line
1. Print sensor values to verify they're changing
2. Check if 0/1 logic is correct for your sensors
3. Verify motors respond to commands
4. Check sensor height (not too high)
5. Ensure good contrast (black on white)

### Robot Follows for a Bit, Then Loses Line
1. Too fast - reduce speed
2. Batteries getting weak - replace
3. Loose connections - check wiring
4. Algorithm needs tuning - adjust TURN_SPEED

### Robot Only Turns One Direction
1. Check motor wiring
2. Verify both turn functions work
3. Test motors individually
4. Check for code errors in turn logic

---

## Documentation

Record in your lab notebook:

1. **Sensor Configuration**:
   - Number of sensors used
   - GPIO pin assignments
   - Mounting method and height

2. **Final Code Values**:
   - BASE_SPEED
   - TURN_SPEED
   - Any special adjustments made

3. **Performance**:
   - Tracks successfully completed
   - Lap times
   - Issues encountered and solutions

4. **Improvements for Next Time**:
   - What would you change?
   - Ideas for better performance
   - Different algorithm approaches?

---

## Next Steps

**Congratulations! You've built a working line following robot!** 🎉🤖

This is a major achievement in robotics. Your robot can now:
- Sense its environment
- Make decisions based on sensor data
- Act autonomously without human control

**Looking ahead**:
- Week 8: Add more sensors (distance, maybe camera)
- Week 9: Network control and monitoring
- Future: More complex autonomous behaviors

**Keep improving your robot**:
- Try different algorithms
- Add more sensors
- Optimize speed and stability
- Get creative with tracks and challenges!

---

**Excellent work!** You're now a roboticist! 👨‍🔬🤖✨
