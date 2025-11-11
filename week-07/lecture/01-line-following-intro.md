# Lecture 1: Introduction to Line Following Robots

## What is a Line Following Robot?

A line following robot is an autonomous mobile robot that uses sensors to detect and follow a marked path on the ground. It's one of the fundamental projects in robotics education and demonstrates the key principles of:
- **Sensing** - Detecting the environment
- **Processing** - Making decisions based on sensor data
- **Actuation** - Taking action with motors
- **Feedback** - Continuously adjusting based on results

### Real-World Applications

**Automated Guided Vehicles (AGVs)**
- Warehouse robots that follow magnetic strips or tape
- Amazon uses thousands of AGVs to move shelves in fulfillment centers
- Factories use AGVs to transport materials between workstations
- Hospitals use them to deliver supplies and meals

**Self-Driving Cars**
- Lane detection is similar to line following
- Computer vision detects lane markings
- Steering adjusts to stay centered in lane
- Adaptive cruise control maintains distance from car ahead

**Agriculture**
- Robots follow crop rows for planting, weeding, or harvesting
- Precision agriculture reduces waste and increases efficiency
- GPS-guided tractors follow predetermined paths

**Industrial Manufacturing**
- Conveyor belt systems track items with sensors
- Parts move between assembly stations automatically
- Quality control systems inspect items on production lines

---

## How Do Infrared Line Sensors Work?

### The Physics of IR Sensors

**Basic Principle**: Different surfaces reflect infrared light differently.

**Components**:
1. **IR LED** (Emitter)
   - Emits infrared light (wavelength ~940nm)
   - Not visible to human eye
   - Points downward at ground

2. **Phototransistor** (Detector)
   - Detects reflected infrared light
   - More reflection = more current
   - Less reflection = less current

3. **Comparator Circuit**
   - Converts analog signal to digital (HIGH/LOW)
   - Potentiometer adjusts sensitivity threshold
   - Outputs clean digital signal for microcontroller

### Reflection Properties

```
White Surface:
- Reflects ~70-90% of IR light
- Phototransistor receives strong signal
- Output: HIGH (1)

Black Surface:
- Reflects ~5-15% of IR light
- Phototransistor receives weak signal
- Output: LOW (0)
```

**Why This Works**:
- Black absorbs most light (including infrared)
- White reflects most light
- This creates clear distinction for sensor

### Sensor Module Configuration

Most line sensor modules include:
- **2-5 IR sensor pairs** arranged in a row
- **Onboard LED indicators** show sensor states
- **Sensitivity adjustment** via potentiometers
- **3-pin or multi-pin connector** (VCC, GND, Signal pins)

**Common Configurations**:
```
2-Sensor: [L]  [R]           - Simple, beginner-friendly
3-Sensor: [L] [C] [R]        - Better centering
5-Sensor: [L] [LC] [C] [RC] [R] - Precise control
```

---

## Sensor Sensitivity and Calibration

### Factors Affecting Sensor Performance

**1. Distance from Surface**
- **Optimal**: 3-8mm from ground
- Too high: Weak signal, unreliable detection
- Too low: Risk of hitting bumps, consistent contact

**2. Ambient Lighting**
- Bright sunlight can interfere
- Fluorescent lights may flicker at 60Hz
- Consistent lighting gives best results
- Some sensors have ambient light rejection

**3. Surface Contrast**
- High contrast (black on white) = Best
- Low contrast (gray on gray) = Poor
- Glossy surfaces may reflect unpredictably
- Matte surfaces give consistent results

**4. Line Width**
- Wider line = Easier to follow
- Narrower line = More precise but challenging
- Typical: 1-2 inches (25-50mm) for beginners
- Competition: Often 0.75 inch (19mm)

### Calibration Process

**Step 1: Adjust Sensitivity**
Most modules have small potentiometers (trim pots):
1. Place sensor over WHITE surface
2. Turn pot until LED turns OFF
3. Place sensor over BLACK line
4. Verify LED turns ON
5. Find the threshold where it reliably switches

**Step 2: Test in Real Conditions**
```python
# Print sensor values while moving over line
while True:
    left = GPIO.input(LEFT_SENSOR)
    right = GPIO.input(RIGHT_SENSOR)
    print(f"L:{left} R:{right}")
    time.sleep(0.1)
```

**Expected Output**:
```
Over white: L:1 R:1
Edge left:  L:0 R:1
Over line:  L:0 R:0
Edge right: L:1 R:0
Over white: L:1 R:1
```

---

## Understanding Differential Drive

### What is Differential Drive?

A robot with two independently controlled wheels (or tracks) can steer by varying the speed or direction of each wheel.

**Key Concept**: Different wheel speeds = Turning!

### Basic Movements

**Forward (Straight)**
```
Left Motor:  ──────>  100%
Right Motor: ──────>  100%

Result: Robot moves straight forward
```

**Backward**
```
Left Motor:  <──────  100%
Right Motor: <──────  100%

Result: Robot moves straight backward
```

**Gentle Turn Right**
```
Left Motor:  ──────>  100%
Right Motor: ────>    50%

Result: Robot curves right
       (left wheel goes faster)
```

**Gentle Turn Left**
```
Left Motor:  ────>    50%
Right Motor: ──────>  100%

Result: Robot curves left
       (right wheel goes faster)
```

**Sharp Turn Right (Pivot)**
```
Left Motor:  ──────>  100%
Right Motor: <──────  100%

Result: Robot spins right in place
       (wheels go opposite directions)
```

**Sharp Turn Left (Pivot)**
```
Left Motor:  <──────  100%
Right Motor: ──────>  100%

Result: Robot spins left in place
```

### Turning Radius

The turning radius depends on the speed difference between wheels:

```
Speed Difference    Turn Type         Radius
-----------------   ---------------   --------
0%                  Straight          Infinite
25%                 Gentle curve      Large
50%                 Medium curve      Medium
75%                 Sharp curve       Small
100% (opposite)     Spin in place     Zero
```

**Code Example**:
```python
def turn_right(sharpness):
    """
    Turn right with variable sharpness
    sharpness: 0-100 (0=straight, 100=sharp)
    """
    left_speed = 100
    right_speed = 100 - sharpness
    set_left_motor(left_speed, "forward")
    set_right_motor(right_speed, "forward")
```

---

## Line Following Algorithms

### Algorithm 1: Simple Two-Sensor Logic

**The Simplest Approach** (Good for beginners)

```python
def simple_line_follow():
    left = GPIO.input(LEFT_SENSOR)
    right = GPIO.input(RIGHT_SENSOR)
    
    # Create truth table
    if left == 0 and right == 0:
        # Both on black (or both off line)
        move_forward()
    
    elif left == 0 and right == 1:
        # Black on left, white on right
        # Line is to the left!
        turn_left()
    
    elif left == 1 and right == 0:
        # White on left, black on right
        # Line is to the right!
        turn_right()
    
    else:  # left == 1 and right == 1
        # Both on white (lost line)
        search_for_line()
```

**Pros**:
- Easy to understand
- Simple to implement
- Works for basic tracks

**Cons**:
- Binary control (on/off, no gradual adjustment)
- Oscillates (zigzags) on line
- Limited precision

---

### Algorithm 2: Three-Sensor with Center Detection

**Better Approach** (Recommended)

```python
def three_sensor_follow():
    left = GPIO.input(LEFT_SENSOR)
    center = GPIO.input(CENTER_SENSOR)
    right = GPIO.input(RIGHT_SENSOR)
    
    # Centered
    if center == 0 and left == 1 and right == 1:
        move_forward()
    
    # Drifting left
    elif left == 0 or (left == 0 and center == 0):
        turn_left()
    
    # Drifting right
    elif right == 0 or (right == 0 and center == 0):
        turn_right()
    
    # All sensors on white (lost line)
    elif left == 1 and center == 1 and right == 1:
        search_for_line()
    
    # All sensors on black (intersection or wide line)
    elif left == 0 and center == 0 and right == 0:
        move_forward()  # Or handle intersection
```

**Pros**:
- Better centering on line
- Detects when centered vs. off-center
- Can handle intersections

**Cons**:
- Still somewhat binary
- Still oscillates somewhat

---

### Algorithm 3: Weighted Position (Proportional Control)

**Advanced Approach** (Best performance)

**Concept**: Calculate position relative to line, adjust proportionally.

```python
def weighted_position_follow():
    # Read sensors (1 = white, 0 = black)
    s1 = GPIO.input(SENSOR_1)  # Far left
    s2 = GPIO.input(SENSOR_2)  # Left
    s3 = GPIO.input(SENSOR_3)  # Center
    s4 = GPIO.input(SENSOR_4)  # Right
    s5 = GPIO.input(SENSOR_5)  # Far right
    
    # Assign weights (-2 to +2)
    # Negative = left of center
    # Positive = right of center
    weights = [-2, -1, 0, 1, 2]
    sensors = [s1, s2, s3, s4, s5]
    
    # Calculate weighted position
    position = 0
    sensors_on_line = 0
    
    for sensor, weight in zip(sensors, weights):
        if sensor == 0:  # Sensor on black line
            position += weight
            sensors_on_line += 1
    
    # Calculate error (average position)
    if sensors_on_line > 0:
        error = position / sensors_on_line
    else:
        error = 0  # No sensors on line
    
    # Proportional control
    K_p = 15  # Proportional constant (tune this!)
    correction = error * K_p
    
    # Adjust motor speeds
    left_speed = BASE_SPEED - correction
    right_speed = BASE_SPEED + correction
    
    # Clamp to valid range
    left_speed = max(0, min(100, left_speed))
    right_speed = max(0, min(100, right_speed))
    
    # Apply to motors
    set_left_motor(left_speed, "forward")
    set_right_motor(right_speed, "forward")
```

**Example Calculations**:
```
Centered: [1,1,0,1,1]
  position = 0
  error = 0/1 = 0
  correction = 0
  → Go straight

Slightly right: [1,1,0,0,1]
  position = 0 + 1 = 1
  error = 1/2 = 0.5
  correction = 0.5 * 15 = 7.5
  → Left motor: 60 - 7.5 = 52.5
  → Right motor: 60 + 7.5 = 67.5
  → Gentle left turn

Far right: [1,1,1,0,0]
  position = 1 + 2 = 3
  error = 3/2 = 1.5
  correction = 1.5 * 15 = 22.5
  → Left motor: 60 - 22.5 = 37.5
  → Right motor: 60 + 22.5 = 82.5
  → Sharp left turn
```

**Pros**:
- Smooth, proportional corrections
- Less oscillation
- Faster on track
- Handles curves better

**Cons**:
- More complex code
- Requires tuning K_p constant
- Needs multiple sensors

---

## Tuning Your Robot

### Motor Speed Tuning

**Start Slow, Increase Gradually**
```python
# Start conservative
BASE_SPEED = 50
TURN_SPEED = 30

# Test and increase
BASE_SPEED = 60
TURN_SPEED = 40

# Optimize for speed
BASE_SPEED = 75
TURN_SPEED = 55
```

**Symptom**: Robot goes straight off line
- **Cause**: Not turning aggressively enough
- **Fix**: Increase difference between BASE_SPEED and TURN_SPEED

**Symptom**: Robot oscillates wildly
- **Cause**: Turning too aggressively
- **Fix**: Reduce difference, or reduce overall speed

### Algorithm Tuning

**For Simple Algorithm**:
- Adjust turn speeds
- Add short delays in turns for sharper response

**For Proportional Control**:
- **K_p too low**: Robot doesn't correct quickly, runs off line
- **K_p too high**: Robot oscillates, overshoots corrections
- **K_p just right**: Smooth following, minimal oscillation

**Tuning Process**:
1. Start with K_p = 10
2. Test robot on straight line
3. If lazy (doesn't correct): Increase K_p
4. If oscillates: Decrease K_p
5. Repeat until smooth

### Mechanical Tuning

**Sensor Height**: 
- Measure distance from sensor to ground
- Should be 3-8mm
- Use washers or spacers to adjust

**Sensor Position**:
- Should be in FRONT of axle (wheels)
- Gives robot time to respond
- Too far back = delayed response

**Weight Distribution**:
- Heavier in back = Better traction
- Balanced = Easier to steer
- Front-heavy = May tip forward

**Wheel Alignment**:
- Both wheels should point straight
- If robot veers, adjust in code:
```python
# If robot veers right, give right motor more power
set_left_motor(speed, "forward")
set_right_motor(speed * 1.1, "forward")  # 10% more
```

---

## Handling Edge Cases

### Lost Line Situations

**Problem**: Robot drives off line completely

**Solutions**:

**Option 1: Stop and Spin**
```python
def search_for_line():
    # Spin slowly to find line
    set_left_motor(40, "forward")
    set_right_motor(40, "backward")
    
    # Check sensors
    if any_sensor_on_line():
        return  # Resume normal following
```

**Option 2: Backup and Turn**
```python
def search_for_line():
    # Back up
    set_left_motor(50, "backward")
    set_right_motor(50, "backward")
    time.sleep(0.5)
    
    # Turn
    set_left_motor(50, "forward")
    set_right_motor(50, "backward")
    time.sleep(0.5)
```

**Option 3: Remember Last Direction**
```python
last_turn_direction = "straight"

def follow_line():
    # ... normal logic ...
    
    if line_lost():
        if last_turn_direction == "left":
            turn_left()  # Continue turning left
        elif last_turn_direction == "right":
            turn_right()  # Continue turning right
```

### Intersection Detection

**Problem**: All sensors see black at intersection

```python
def detect_intersection():
    if all_sensors_black():
        intersection_count += 1
        
        # Decide what to do
        if intersection_count == 1:
            turn_left()  # Go left at first intersection
        elif intersection_count == 2:
            turn_right()  # Go right at second
        else:
            move_forward()  # Otherwise go straight
        
        # Wait to clear intersection
        time.sleep(0.5)
```

### Dead Ends

**Problem**: Line ends abruptly

```python
def handle_dead_end():
    if all_sensors_white_for_too_long():
        # 180-degree turn
        set_left_motor(70, "backward")
        set_right_motor(70, "forward")
        time.sleep(1.0)  # Spin for ~180 degrees
        
        # Resume forward
        move_forward()
```

---

## Summary

### Key Concepts Reviewed

1. **Line following combines sensing, processing, and actuation**
2. **IR sensors detect contrast between black and white**
3. **Differential drive enables steering through motor speed differences**
4. **Simple algorithms are easy but oscillate; proportional control is smoother**
5. **Tuning is essential for good performance**

### Success Factors

- **Good mechanical assembly** (stable, properly aligned)
- **Properly calibrated sensors** (correct height and sensitivity)
- **Appropriate algorithm** (start simple, improve iteratively)
- **Well-tuned parameters** (speeds, gains, thresholds)
- **Testing and iteration** (test, observe, adjust, repeat)

---

## Next: Let's Build!

In the next activities, you'll:
1. Assemble your robot mechanically
2. Wire up motors and sensors
3. Test components individually
4. Implement line following algorithm
5. Tune and optimize performance

**Remember**: Robotics is iterative. It won't work perfectly on the first try, and that's okay! The learning is in the debugging and improvement process.

Let's get building! 🤖
