# Week 7 Homework - Line Following Robot Improvements

## Overview
This week's homework focuses on improving and extending your line following robot. Choose challenges based on your current robot's performance and your interest level. All students should complete the Basic section, and then choose at least one challenge from Intermediate or Advanced.

**Due**: Beginning of next class
**Submission**: Bring your robot to demonstrate improvements (or video if robot can't come to class)

---

## Basic Challenges (Choose at least 2)

### 1. Speed Optimization
**Goal**: Find the optimal speed for your robot to follow the line quickly without losing it.

**Tasks**:
- Test your robot at different speeds (30%, 50%, 70%, 100%)
- Time how long it takes to complete one lap at each speed
- Record the fastest speed where robot completes lap without losing line
- Document your findings

**Deliverable**: Comment in your code showing optimal speeds
```python
# Speed Testing Results:
# 30% - Completes lap in 45s, very stable
# 50% - Completes lap in 28s, stable
# 70% - Completes lap in 18s, loses line on sharp curves
# OPTIMAL: 60% - Completes lap in 22s, reliable
BASE_SPEED = 60
```

### 2. Add Speed Control Button
**Goal**: Add a button to cycle through different speed presets.

**Requirements**:
- Connect a push button to GPIO
- Each button press cycles through 3 speeds (slow, medium, fast)
- LED indicates current speed (optional: different blink patterns)
- Robot remembers speed setting

**Hints**:
```python
speeds = [40, 60, 80]
current_speed_index = 0

# In button press handler:
current_speed_index = (current_speed_index + 1) % 3
BASE_SPEED = speeds[current_speed_index]
```

### 3. Enhanced Sensor Debugging
**Goal**: Create a visual display of sensor status using LEDs.

**Requirements**:
- Connect 2-3 LEDs (one per sensor)
- LED turns ON when sensor detects black line
- LED turns OFF when sensor over white surface
- Helps debug sensor behavior in real-time

**Wiring**:
```python
LEFT_LED = 20
RIGHT_LED = 21

# In main loop:
GPIO.output(LEFT_LED, not GPIO.input(LEFT_SENSOR))  # Invert because LOW=black
GPIO.output(RIGHT_LED, not GPIO.input(RIGHT_SENSOR))
```

### 4. Start/Stop Button
**Goal**: Add manual control to start and stop line following.

**Requirements**:
- Button to start line following
- Same or different button to stop
- Robot remains stopped until button pressed again
- Optional: LED indicates running vs. stopped state

**Hint**: Use a boolean flag
```python
is_running = False

# Check button, toggle flag
if button_pressed and is_running:
    stop_motors()
    is_running = False
elif button_pressed and not is_running:
    is_running = True

# Only follow line if running
if is_running:
    follow_line()
```

### 5. Code Documentation
**Goal**: Add comprehensive comments to your code.

**Requirements**:
- Header comment explaining what program does
- Comment for each function explaining purpose
- Inline comments for complex logic
- Pin assignment section at top
- Instructions for use

**Example**:
```python
#!/usr/bin/env python3
"""
Line Following Robot - Advanced Version
Author: [Your Name]
Date: [Date]

This program controls a 2-wheeled robot with IR line sensors.
The robot autonomously follows a black line on white surface.

Hardware:
- 2x DC motors via L298N driver
- 2x IR line sensors
- Optional: Start/stop button, status LEDs

Usage:
1. Place robot on line
2. Run: python3 line_follower.py
3. Press Ctrl+C to stop
"""
```

---

## Intermediate Challenges (Choose at least 1)

### 6. Add Center Sensor
**Goal**: Improve line following with a third sensor.

**Requirements**:
- Add center sensor to your array
- Modify code to use all 3 sensors
- Improve centering on line
- Handle edge cases (all sensors on/off line)

**Logic Pattern**:
```python
if center == 0 and left == 1 and right == 1:
    # Centered - go straight
elif left == 0:
    # Drifting left - turn left
elif right == 0:
    # Drifting right - turn right
# ... handle other combinations
```

### 7. Proportional Steering
**Goal**: Implement smoother steering using proportional control.

**Requirements**:
- Calculate "error" from center of line
- Adjust motor speeds proportionally to error
- Smoother following, less oscillation
- Tune proportional constant (K_p)

**Algorithm**:
```python
# Calculate error (-2 to +2 for 3 sensors)
error = (left * 2) + center - (right * 2)

# Proportional control
K_p = 15  # Tune this value!
adjustment = error * K_p

# Adjust motors
left_motor_speed = BASE_SPEED - adjustment
right_motor_speed = BASE_SPEED + adjustment

# Clamp speeds to 0-100
left_motor_speed = max(0, min(100, left_motor_speed))
right_motor_speed = max(0, min(100, right_motor_speed))
```

### 8. Intersection Counter
**Goal**: Detect and count intersections (all sensors see black).

**Requirements**:
- Detect when all sensors see black line
- Count number of intersections passed
- Display count on console or LCD
- Optional: Stop after N intersections

**Detection Logic**:
```python
# Detect intersection
if left == 0 and center == 0 and right == 0:
    if not intersection_detected:
        intersection_count += 1
        intersection_detected = True
        print(f"Intersection {intersection_count}")
else:
    intersection_detected = False  # Reset flag
```

### 9. Lost Line Recovery
**Goal**: Implement smart behavior when robot loses the line.

**Requirements**:
- Detect when no sensors see line
- Execute search pattern (spin, backup, etc.)
- Resume following when line found
- Avoid getting stuck off-track

**Search Strategy**:
```python
def search_for_line():
    """Search for lost line"""
    # Strategy 1: Slow spin right
    set_left_motor(40, "forward")
    set_right_motor(40, "backward")
    
    # Or Strategy 2: Back up and turn
    # set_left_motor(50, "backward")
    # set_right_motor(50, "backward")
    # time.sleep(0.5)
    # Then turn...
```

### 10. Lap Timer
**Goal**: Time how long it takes to complete laps.

**Requirements**:
- Detect start/finish line (using intersection detection)
- Record lap times
- Display current lap and best lap time
- Save times to file

**Implementation**:
```python
import time

lap_start_time = time.time()
lap_times = []

# When start line detected:
lap_time = time.time() - lap_start_time
lap_times.append(lap_time)
print(f"Lap {len(lap_times)}: {lap_time:.2f}s")
print(f"Best: {min(lap_times):.2f}s")
lap_start_time = time.time()
```

---

## Advanced Challenges (Choose 1 if attempting)

### 11. Five Sensor Array
**Goal**: Use 5 sensors for precise line following.

**Requirements**:
- Connect and configure 5 sensors
- Implement weighted error calculation
- Very smooth line following
- Handle all sensor state combinations

**Error Calculation**:
```python
# Sensor weights: -2, -1, 0, 1, 2
sensors = [s1, s2, s3, s4, s5]
weights = [-2, -1, 0, 1, 2]

# Calculate weighted position
position = 0
active_sensors = 0
for sensor, weight in zip(sensors, weights):
    if sensor == 0:  # On line
        position += weight
        active_sensors += 1

if active_sensors > 0:
    error = position / active_sensors
else:
    error = 0  # No line detected
```

### 12. PID Control
**Goal**: Implement full PID (Proportional-Integral-Derivative) control.

**Requirements**:
- Implement P, I, and D terms
- Tune K_p, K_i, K_d constants
- Very smooth and stable line following
- Document tuning process

**PID Algorithm**:
```python
class PIDController:
    def __init__(self, K_p, K_i, K_d):
        self.K_p = K_p
        self.K_i = K_i
        self.K_d = K_d
        self.previous_error = 0
        self.integral = 0
    
    def calculate(self, error):
        # Proportional
        P = error
        
        # Integral (accumulated error)
        self.integral += error
        I = self.integral
        
        # Derivative (rate of change)
        D = error - self.previous_error
        self.previous_error = error
        
        # Combined output
        output = (self.K_p * P) + (self.K_i * I) + (self.K_d * D)
        return output

# Usage
pid = PIDController(K_p=20, K_i=0.1, K_d=5)
correction = pid.calculate(error)
```

### 13. Obstacle Avoidance
**Goal**: Add ultrasonic sensor for obstacle detection.

**Requirements**:
- Mount ultrasonic sensor on robot
- Detect obstacles while line following
- Stop or go around obstacle
- Return to line following after avoidance

**Logic**:
```python
# Check for obstacles
distance = get_ultrasonic_distance()

if distance < 20:  # Obstacle within 20cm
    stop_motors()
    time.sleep(0.5)
    # Try going around
    avoid_obstacle()
    search_for_line()
else:
    # Normal line following
    follow_line()
```

### 14. Remote Control Override
**Goal**: Add wireless control to manually drive robot.

**Requirements**:
- Implement simple web interface or keyboard control
- Switch between autonomous and manual modes
- Manual: WASD or arrow keys for control
- Return to autonomous line following on command

**Approach Options**:
- Flask web server with buttons
- Python keyboard library for key control
- Bluetooth gamepad integration

### 15. Track Learning & Replay
**Goal**: Record the path and replay it without using sensors.

**Requirements**:
- Record motor commands and timing during line following
- Save to file
- Replay recorded commands (open-loop control)
- Compare performance: sensor-based vs. recorded

**Recording**:
```python
import json
import time

actions = []
start_time = time.time()

# During line following
action = {
    'time': time.time() - start_time,
    'left_speed': left_speed,
    'right_speed': right_speed
}
actions.append(action)

# Save to file
with open('track_recording.json', 'w') as f:
    json.dump(actions, f)
```

---

## Bonus Challenges (Optional, Extra Credit)

### 16. Multi-Path Navigation
- Create track with intersection and branches
- Robot decides which path to take
- Uses button presses or predetermined sequence
- Tracks current position on course

### 17. Line Following Race Optimization
- Optimize for speed competition
- Acceleration/deceleration strategies
- Predict curves vs. straights
- Log all performance metrics

### 18. Camera-Based Line Detection
- Use Pi Camera instead of IR sensors
- Computer vision to detect line
- More flexible (can follow different colors)
- Much more complex but very educational!

### 19. Maze Solver
- Follow lines through maze
- Left-hand or right-hand wall following
- Remember path and optimize
- Return to start via shortest path

### 20. Coordinated Multi-Robot
- Two robots on same track
- One leads, one follows (maintain distance)
- Or: Parallel tracks, synchronized movement
- Wireless communication between robots

---

## Documentation Requirements

For all homework submissions:

### 1. Code Documentation
- Header with name, date, description
- Comments explaining logic
- Pin assignments clearly labeled
- Usage instructions

### 2. Testing Notes
Create a file `TESTING_NOTES.md` with:
- What you attempted
- What worked / what didn't
- Problems encountered and solutions
- Performance measurements (speed, accuracy, etc.)
- Ideas for future improvements

### 3. Video Demonstration (Optional but Recommended)
- 30-60 second video showing robot in action
- Narrate what your improvements do
- Show before/after comparison if possible

---

## Grading Rubric

**Basic Challenges (50%)**
- Completion of 2+ basic challenges
- Code works as intended
- Proper documentation

**Intermediate/Advanced Challenges (30%)**
- Completion of 1+ intermediate OR 1 advanced
- Demonstrates understanding of concepts
- Good implementation

**Code Quality (10%)**
- Clean, readable code
- Good commenting
- Proper structure

**Documentation (10%)**
- Testing notes submitted
- Clear explanations of work
- Reflection on learning

---

## Tips for Success

1. **Start early** - Don't wait until night before class
2. **Test incrementally** - Make one change at a time
3. **Version control** - Save working versions before major changes
4. **Ask for help** - Use class forum or instructor office hours
5. **Be creative** - Add your own unique improvements
6. **Have fun!** - Robotics is about exploration and learning

---

## Submission Checklist

Before submitting, verify:
- [ ] Code is documented with comments
- [ ] Testing notes completed
- [ ] All chosen challenges working
- [ ] Robot is functional and ready to demo
- [ ] Batteries charged for demonstration
- [ ] You can explain how your improvements work

---

## Reflection Questions

Answer these in your testing notes:

1. **What challenge did you find most difficult? Why?**

2. **How did you debug issues that arose?**

3. **What would you do differently if starting over?**

4. **How could your robot's performance be improved further?**

5. **What real-world application could use this technology?**

6. **What did you learn about robotics and autonomous systems?**

---

## Resources

### Reference Code
- Check class repository for examples
- Review Week 6 motor control code
- Reference sensor reading examples from Week 5

### Additional Learning
- YouTube: PID control tutorials
- Online: Line following algorithm comparisons
- Forums: Raspberry Pi robotics communities

### Troubleshooting Help
- Review INSTRUCTOR-GUIDE.md troubleshooting section
- Post questions in class forum
- Schedule office hours with instructor

---

## Looking Ahead

Next week we'll explore:
- Network-connected robots
- Web interfaces for robot control
- Sensor data visualization
- More advanced autonomous behaviors

Keep your robot working and ready for more improvements!

---

**Remember**: The goal is learning, not perfection. Document your process, try new things, and don't be afraid to experiment. Some of the best learning comes from things that don't work the first time!

**Happy robot improving!** 🤖✨
