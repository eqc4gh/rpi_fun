# Week 7 Resources - Track Designs and Robot Improvements

## Test Track Designs

### Track Difficulty Levels

#### Level 1: Beginner Tracks

**Purpose**: Initial testing, algorithm verification, speed tuning

**Track 1: Straight Line**
```
═══════════════════════════════════════════════════
                    10 feet
```
- Length: 10-15 feet
- Width: 2 inches
- Use: Test basic sensor response and motor control
- Success criteria: Robot stays on line for entire length

**Track 2: Gentle Curve**
```
        ═════════╗
              ╔══╝
           ═══╝
        ═══
     ═══
```
- Radius: 2-3 feet
- Single curve (30-45 degrees)
- Wide line (2 inches)
- Use: Test turning response
- Success criteria: Follows curve without losing line

**Track 3: Simple Oval**
```
    ╔═══════════╗
    ║           ║
    ║           ║
    ╚═══════════╝
```
- Oval shape: 4 feet × 6 feet
- Gentle curves at ends
- Wide line (1.5-2 inches)
- Use: Continuous testing without repositioning
- Success criteria: Completes 3 consecutive laps

---

#### Level 2: Intermediate Tracks

**Track 4: Figure-8**
```
    ╔═══════╗
    ║       ╚═══╗
    ║      ╔════╝
    ║      ║
    ╚════╗ ║
         ╚═╝
```
- Tests both left and right turns
- Intersection in middle
- Line width: 1.5 inches
- Use: Test turning both directions equally
- Success criteria: Navigates intersection correctly

**Track 5: S-Curve**
```
═══╗
   ╚══╗
      ╚══╗
         ╚══╗
            ╚═══
```
- Multiple gentle alternating curves
- Line width: 1.5 inches
- Length: 8 feet
- Use: Test responsiveness to direction changes
- Success criteria: Smooth navigation without oscillation

**Track 6: Rounded Square**
```
    ╔═══════════╗
    ║           ║
    ║           ║
    ║           ║
    ╚═══════════╝
```
- 4 feet per side
- Rounded corners (not sharp 90°)
- Line width: 1.5 inches
- Use: Test tighter turns
- Success criteria: Completes square without cutting corners

---

#### Level 3: Advanced Tracks

**Track 7: Sharp Corners**
```
    ╔═══════════╗
    ║           ║
    ╚═══╗   ╔═══╝
        ║   ║
    ╔═══╝   ╚═══╗
    ║           ║
    ╚═══════════╝
```
- 90-degree turns
- Narrow line (1 inch)
- Use: Challenge algorithm limits
- Success criteria: Completes track, even if slowly

**Track 8: Intersection Navigation**
```
         ║
         ║
    ═════╬═════
         ║
         ║
```
- Multiple intersections
- Robot must choose path
- Requires intersection detection
- Use: Advanced programming challenges

**Track 9: Maze**
```
    ╔═══╗   ╔═══╗
    ║   ║   ║   ║
    ╚═╗ ╚═══╝ ╔═╝
      ║       ║
    ╔═╝ ╔═══╗ ╚═╗
    ║   ║   ║   ║
    ╚═══╝   ╚═══╝
```
- Multiple paths
- Dead ends
- Use: Testing recovery and pathfinding
- Success criteria: Finds exit using wall-following

**Track 10: Speedway**
```
    ╔═══════════════════════════════════╗
    ║                                   ║
    ║                                   ║
    ║                                   ║
    ╚═══════════════════════════════════╝
```
- Long straights (6+ feet)
- Gentle curves only
- Narrow line (0.75 inch)
- Use: Speed optimization
- Success criteria: Fast laps without losing line

---

### Track Construction Tips

#### Materials

**For Portable Tracks**:
```
Material: White poster board (22" × 28")
Line: Black electrical tape (3/4" to 2" wide)
Cost: ~$5-10 per track
Storage: Roll up when not in use

Advantages:
- Easy to make
- Portable
- Reusable
- Inexpensive
```

**For Permanent Tracks**:
```
Material: White shower board or melamine
Line: Black vinyl tape or paint
Mounting: On table or floor
Cost: ~$20-40 per track

Advantages:
- Very durable
- Professional appearance
- Easy to clean
- Can use markers for debugging
```

**For Temporary Testing**:
```
Material: White butcher paper or printer paper
Line: Black marker or tape
Surface: Tape to floor
Cost: ~$2 per track

Advantages:
- Very cheap
- Quick to make
- Easy to modify
- Good for prototyping
```

#### Line Width Guidelines

| Skill Level | Line Width | Difficulty |
|-------------|------------|------------|
| Beginner | 2 inches | Easy, forgiving |
| Intermediate | 1.5 inches | Standard |
| Advanced | 1 inch | Challenging |
| Expert | 0.75 inch | Competition-level |

#### Contrast Requirements

**Minimum Contrast**:
- Black line should reflect <20% of light
- White surface should reflect >70% of light
- Greater contrast = better detection

**Testing Contrast**:
```python
# Run sensor over track, print values
while True:
    on_black = GPIO.input(SENSOR)
    print(f"Value: {on_black}")
    time.sleep(0.1)

# Should clearly show 0 vs 1
# If not, improve contrast
```

#### Track Layout Tips

**Good Track Design**:
- Smooth transitions (no sharp kinks)
- Continuous line (no gaps unless intentional)
- Flat surface (no bumps or dips)
- Consistent lighting
- Adequate space around track

**Common Mistakes**:
- Tape bubbles or wrinkles
- Gaps in line at corners
- Uneven surface
- Reflective floor surface
- Inconsistent line width

---

## Robot Improvement Ideas

### Hardware Improvements

#### 1. Add More Sensors

**5-Sensor Array**
```
Before (2-sensor):    After (5-sensor):
    [●]  [●]             [●][●][●][●][●]
    
Benefits:
- More precise position detection
- Smoother line following
- Better curve handling
- Enables proportional control
```

**Implementation**:
```python
# Additional GPIO pins needed
SENSOR_1 = 5   # Far left
SENSOR_2 = 19  # Left
SENSOR_3 = 6   # Center
SENSOR_4 = 16  # Right  
SENSOR_5 = 20  # Far right

# Read all sensors
sensors = [
    GPIO.input(SENSOR_1),
    GPIO.input(SENSOR_2),
    GPIO.input(SENSOR_3),
    GPIO.input(SENSOR_4),
    GPIO.input(SENSOR_5)
]
```

**Cost**: $5-10 for 5-sensor module

---

#### 2. Add Ultrasonic Sensor

**For Obstacle Avoidance**
```
    [Ultrasonic]
         ↓
    [Line Sensors]
         ↓
     [Chassis]
```

**Capabilities**:
- Detect obstacles while line following
- Stop before collision
- Measure distance to walls
- Implement maze-solving

**Wiring**:
```
HC-SR04 → Raspberry Pi
VCC → 5V
GND → GND
Trig → GPIO 23
Echo → GPIO 24 (via voltage divider!)
```

**Example Use**:
```python
def check_obstacles():
    distance = get_ultrasonic_distance()
    if distance < 20:  # 20cm
        stop_motors()
        avoid_obstacle()
        return True
    return False

# In main loop:
if not check_obstacles():
    follow_line()
```

**Cost**: $2-5 for HC-SR04

---

#### 3. Status LEDs

**Visual Feedback**
```
Components:
- 3 LEDs (Red, Yellow, Green)
- 3x 220Ω resistors
- Jumper wires

Meanings:
- Green: On line, following normally
- Yellow: Turning/adjusting
- Red: Lost line, searching
```

**Wiring**:
```
LED → Resistor → GPIO → GND

Green LED  → 220Ω → GPIO 26
Yellow LED → 220Ω → GPIO 19  
Red LED    → 220Ω → GPIO 13
```

**Code**:
```python
def update_status_led(state):
    if state == "following":
        GPIO.output(GREEN_LED, GPIO.HIGH)
        GPIO.output(YELLOW_LED, GPIO.LOW)
        GPIO.output(RED_LED, GPIO.LOW)
    elif state == "turning":
        GPIO.output(GREEN_LED, GPIO.LOW)
        GPIO.output(YELLOW_LED, GPIO.HIGH)
        GPIO.output(RED_LED, GPIO.LOW)
    elif state == "lost":
        GPIO.output(GREEN_LED, GPIO.LOW)
        GPIO.output(YELLOW_LED, GPIO.LOW)
        GPIO.output(RED_LED, GPIO.HIGH)
```

**Cost**: <$5

---

#### 4. LCD Display

**Real-Time Information**
```
16×2 LCD Display shows:
- Current speed
- Sensor readings
- Lap counter
- Error values
- Battery status
```

**I2C LCD Module**:
```
Connections:
VCC → 5V
GND → GND
SDA → GPIO 2 (Pin 3)
SCL → GPIO 3 (Pin 5)
```

**Example Display**:
```
┌────────────────┐
│Speed: 65%      │
│Sensors: 0-1-0  │
└────────────────┘
```

**Cost**: $5-10 for I2C LCD

---

#### 5. Encoders for Precision

**Wheel Encoders**
```
Purpose:
- Measure actual wheel rotation
- Calculate distance traveled
- Detect wheel slip
- Maintain straight line better

Types:
- Optical encoders (LED + sensor)
- Magnetic encoders (Hall effect)
- Quadrature encoders (direction too)
```

**Use Cases**:
- Dead reckoning navigation
- Speed feedback control
- Distance measurement
- Slip detection

**Cost**: $5-15 per encoder

---

#### 6. Battery Voltage Monitor

**Low Battery Detection**
```python
import smbus

def read_battery_voltage():
    # Using ADS1115 ADC
    # Read voltage divider from battery
    voltage = read_adc()
    
    if voltage < 5.0:  # 4xAA below 5V
        print("WARNING: Low battery!")
        reduce_speed()
    
    return voltage
```

**Benefits**:
- Prevent unexpected shutdowns
- Consistent performance
- Automatic speed adjustment
- Battery life indication

**Cost**: $5-10 for ADC module

---

### Software Improvements

#### 1. PID Control

**Proportional-Integral-Derivative Control**

**Better than simple proportional control**:

```python
class PIDController:
    def __init__(self, Kp, Ki, Kd):
        self.Kp = Kp  # Proportional gain
        self.Ki = Ki  # Integral gain
        self.Kd = Kd  # Derivative gain
        
        self.previous_error = 0
        self.integral = 0
    
    def calculate(self, error):
        # Proportional term
        P = error
        
        # Integral term (accumulated error)
        self.integral += error
        I = self.integral
        
        # Derivative term (rate of change)
        derivative = error - self.previous_error
        D = derivative
        
        # Calculate output
        output = (self.Kp * P) + (self.Ki * I) + (self.Kd * D)
        
        # Remember error for next time
        self.previous_error = error
        
        return output

# Usage:
pid = PIDController(Kp=20, Ki=0.1, Kd=5)

while True:
    error = calculate_position_error()
    correction = pid.calculate(error)
    
    left_speed = BASE_SPEED - correction
    right_speed = BASE_SPEED + correction
    
    set_motors(left_speed, right_speed)
```

**Tuning PID**:
1. Start with P only (Ki=0, Kd=0)
2. Increase P until oscillation
3. Add D to reduce oscillation
4. Add small I for steady-state accuracy

**Benefits**:
- Smoother line following
- Faster response
- Better disturbance rejection
- More stable on curves

---

#### 2. State Machine

**Organized Robot Behavior**

```python
class RobotState:
    FOLLOWING = 1
    LOST_LINE = 2
    INTERSECTION = 3
    OBSTACLE = 4
    STOPPED = 5

current_state = RobotState.FOLLOWING

def update_state():
    global current_state
    
    if current_state == RobotState.FOLLOWING:
        if line_lost():
            current_state = RobotState.LOST_LINE
        elif intersection_detected():
            current_state = RobotState.INTERSECTION
        elif obstacle_detected():
            current_state = RobotState.OBSTACLE
    
    elif current_state == RobotState.LOST_LINE:
        if line_found():
            current_state = RobotState.FOLLOWING
        elif timeout():
            current_state = RobotState.STOPPED
    
    # ... more state transitions

def execute_state():
    if current_state == RobotState.FOLLOWING:
        follow_line()
    elif current_state == RobotState.LOST_LINE:
        search_for_line()
    elif current_state == RobotState.INTERSECTION:
        handle_intersection()
    # ... etc

# Main loop:
while True:
    update_state()
    execute_state()
```

**Benefits**:
- Organized code
- Easy to add features
- Clear behavior logic
- Easier debugging

---

#### 3. Adaptive Speed Control

**Slow Down for Curves**

```python
def calculate_adaptive_speed():
    # Read sensors
    sensors = read_all_sensors()
    
    # Count sensors on line
    on_line = sum([1 for s in sensors if s == 0])
    
    # Calculate curve indicator
    if on_line == 1:
        # On edge - probably curve
        curve_factor = 0.6  # 60% speed
    elif on_line == 2:
        # Slight angle
        curve_factor = 0.8  # 80% speed
    else:
        # Straight section
        curve_factor = 1.0  # 100% speed
    
    # Adjust speed
    speed = BASE_SPEED * curve_factor
    return speed

# Usage:
while True:
    speed = calculate_adaptive_speed()
    follow_line(speed)
```

**Benefits**:
- Faster on straights
- Safer on curves
- Better overall lap times
- Reduces line loss

---

#### 4. Intersection Navigation

**Handle Track Intersections**

```python
def detect_intersection():
    # All sensors see black
    if all(GPIO.input(s) == 0 for s in sensors):
        return True
    return False

def navigate_intersection(direction):
    # Continue through intersection
    move_forward()
    time.sleep(0.3)  # Cross intersection
    
    if direction == "left":
        # Turn left after clearing
        turn_left()
        time.sleep(0.5)
        while center_sensor() != 0:
            turn_left()
    
    elif direction == "right":
        # Turn right after clearing
        turn_right()
        time.sleep(0.5)
        while center_sensor() != 0:
            turn_right()
    
    # direction == "straight" just continues

# Usage:
intersection_count = 0
navigation_plan = ["straight", "left", "straight", "right"]

while True:
    if detect_intersection():
        direction = navigation_plan[intersection_count % len(navigation_plan)]
        navigate_intersection(direction)
        intersection_count += 1
    else:
        follow_line()
```

---

#### 5. Data Logging

**Record Robot Performance**

```python
import csv
import time

class DataLogger:
    def __init__(self, filename):
        self.filename = filename
        self.data = []
    
    def log(self, **kwargs):
        entry = {'timestamp': time.time()}
        entry.update(kwargs)
        self.data.append(entry)
    
    def save(self):
        with open(self.filename, 'w', newline='') as f:
            if self.data:
                writer = csv.DictWriter(f, fieldnames=self.data[0].keys())
                writer.writeheader()
                writer.writerows(self.data)

# Usage:
logger = DataLogger('robot_log.csv')

while True:
    sensors = read_sensors()
    error = calculate_error(sensors)
    
    logger.log(
        sensors=sensors,
        error=error,
        left_speed=left_speed,
        right_speed=right_speed
    )
    
    follow_line()

# At end:
logger.save()
```

**Analyze Later**:
```python
import pandas as pd
import matplotlib.pyplot as plt

# Load data
data = pd.read_csv('robot_log.csv')

# Plot error over time
plt.plot(data['timestamp'], data['error'])
plt.xlabel('Time (s)')
plt.ylabel('Position Error')
plt.title('Line Following Performance')
plt.show()
```

---

### Competition Ideas

#### Speed Competition
```
Rules:
- Standard oval track
- Fastest 3-lap time wins
- Must stay on line entire time
- Line loss = disqualification

Optimization strategies:
- Adaptive speed control
- PID tuning for minimum oscillation
- Lightweight design
- Fresh batteries
```

#### Accuracy Competition
```
Rules:
- Narrow line (0.75 inch)
- Sharp corners
- Points for staying centered
- Deductions for wobbling

Judging:
- Video analysis of path
- Measure deviation from center
- Time penalties for line loss
```

#### Maze Solving
```
Rules:
- Unknown maze layout
- Find exit in minimum time
- Dead ends present
- Bonus for finding shortest path

Strategies:
- Wall following algorithm
- Track intersection decisions
- Remember path (SLAM)
- Optimize on second attempt
```

#### Sumo Ring
```
Rules:
- Follow circular line
- Try to push opponent off
- Ultrasonic sensor allowed
- Last robot on line wins

Design considerations:
- Low center of gravity
- Push plate on front
- Object detection
- Aggressive driving
```

#### Obstacle Course
```
Challenges:
- Line following
- Obstacle avoidance  
- Ramp climbing
- Speed sections
- Complex intersections

Points:
- Each section completed
- Time bonus
- Penalties for line loss
```

---

## Real-World Applications

### Understanding Industrial Relevance

**Automated Guided Vehicles (AGVs)**
```
Same principles as our robot:
- Follow floor markers (line following)
- Avoid obstacles (sensors)
- Navigate facilities autonomously
- Carry loads efficiently

Industries using AGVs:
- Warehouses (Amazon, FedEx)
- Manufacturing (automotive, electronics)
- Hospitals (supply delivery)
- Agriculture (harvesting robots)
```

**Self-Driving Cars**
```
Lane detection is line following!
- Camera detects lane markers
- Computer processes image
- Steering adjusts to stay in lane
- Plus obstacle avoidance, GPS, etc.

Our robot teaches:
- Sensor fusion
- Control algorithms
- Real-time decision making
- Safety systems
```

**Delivery Robots**
```
Sidewalk robots (Starship, Marble):
- Follow paths using cameras
- Navigate around people
- Deliver food and packages
- Use similar algorithms

Indoor robots (TUG, Relay):
- Navigate hospital/hotel hallways
- Follow painted lines or use SLAM
- Deliver supplies autonomously
```

---

## Further Learning Resources

### Books
- "Programming Robots with ROS" by Quigley et al.
- "Robotics, Vision and Control" by Peter Corke
- "Mobile Robots" by Dudek and Jenkin

### Online Courses
- Coursera: "Control of Mobile Robots"
- EdX: "Autonomous Mobile Robots"
- YouTube: "f1tenth.org" autonomous racing

### Websites
- ros.org - Robot Operating System
- robotshop.com - Parts and tutorials
- hackaday.io - DIY robot projects
- instructables.com - Robot builds

### Competitions
- First Robotics Competition
- VEX Robotics Competition
- RoboCup (various leagues)
- IGVC (Intelligent Ground Vehicle Competition)

---

## Safety and Maintenance

### Regular Maintenance

**Weekly Checks**:
```
☐ Clean sensors (soft cloth)
☐ Tighten all connections
☐ Check wheel attachment
☐ Inspect wires for damage
☐ Test battery voltage
☐ Verify all screws tight
```

**Monthly Maintenance**:
```
☐ Deep clean chassis
☐ Replace worn wheels
☐ Update code with improvements
☐ Backup current code
☐ Document changes
☐ Test all sensors thoroughly
```

### Storage

**When Not in Use**:
```
☐ Remove batteries (prevent leakage)
☐ Store in dry location
☐ Keep wheels off ground
☐ Cover with cloth (dust protection)
☐ Label with configuration notes
☐ Store code on backup drive
```

---

## Troubleshooting Quick Reference

| Symptom | Most Likely Cause | Quick Fix |
|---------|------------------|-----------|
| Won't move | Battery/EN jumper | Check power, jumpers |
| Ignores line | Sensor wiring | Verify connections |
| Oscillates | Speed too high | Reduce BASE_SPEED |
| Loses line | Weak batteries | Replace batteries |
| One motor dead | Wiring/motor | Test motor, check wires |
| Veers off course | Motor speeds unequal | Calibrate in code |
| Sensors flicker | Height/lighting | Adjust sensor height |
| Erratic behavior | No common ground | Connect Pi GND to driver GND |

---

## Documentation Template

**Robot Configuration Sheet**:
```
=================================
ROBOT CONFIGURATION
=================================
Date: __________
Builder: __________

HARDWARE:
Chassis: __________
Motors: __________
Sensor Array: __ sensors
Battery: __ volts

PIN ASSIGNMENTS:
Left Motor: IN1=___ IN2=___ ENA=___
Right Motor: IN3=___ IN4=___ ENB=___
Sensors: S1=___ S2=___ S3=___

TUNING PARAMETERS:
BASE_SPEED = ___
TURN_SPEED = ___
Algorithm: ____________

PERFORMANCE:
Best lap time: ___ seconds
Track completed: __________
Issues: ____________________

NOTES:
_____________________________
_____________________________
=================================
```

---

**Keep building and improving your robot!** The sky's the limit! 🤖🚀
