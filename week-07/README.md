# Week 7: Robotics Project - Line Following Robot

## Overview
This week brings together everything learned in Weeks 5 and 6 to build an exciting line-following robot! Students will assemble a complete mobile robot that uses infrared sensors to detect and follow a black line on the ground. This project demonstrates how sensors and motors work together to create autonomous behavior. By the end of class, students will have a functioning robot that can navigate a track on its own!

## Learning Objectives
By the end of this week, students will be able to:
- Assemble a complete mobile robot with chassis, motors, and sensors
- Understand how infrared line sensors work
- Implement basic line-following algorithms
- Control two motors independently for steering
- Debug sensor readings and motor behavior
- Tune sensor thresholds for different surfaces
- Create decision logic for autonomous navigation
- Troubleshoot mechanical and electrical robot issues

## Topics Covered
1. **Robot Assembly**
   - Mounting motors to chassis
   - Installing wheels and casters
   - Battery pack placement
   - Wire management for mobile robots
   - Component mounting strategies

2. **Line Following Sensors**
   - How infrared (IR) sensors work
   - Reflective vs. non-reflective surfaces
   - Multi-sensor arrays (2-5 sensors)
   - Reading digital sensor outputs
   - Calibrating sensor sensitivity

3. **Differential Drive**
   - Two-motor steering concept
   - Turning by controlling motor speeds independently
   - Forward, reverse, left, right, spin
   - Smooth curves vs. sharp turns
   - Stopping and braking

4. **Line Following Algorithms**
   - Basic decision logic (if sensor sees line, adjust motors)
   - Proportional control (more elegant approach)
   - Handling intersections and dead ends
   - Recovery from losing the line
   - Speed vs. accuracy tradeoffs

5. **Robot Integration**
   - Combining sensor inputs with motor outputs
   - Main control loop structure
   - Testing and iteration process
   - Performance tuning
   - Competition-ready improvements

## Materials Needed
From your kit:
- Raspberry Pi (set up from previous weeks)
- Robot chassis with 2 DC motors and wheels
- L298N Motor Driver Module
- Line following sensor module (2-5 IR sensors)
- External power supply (4x AA battery pack, 6V)
- Breadboard (small/portable) or direct connections
- Jumper wires (lots of them!)
- Velcro or zip ties for mounting components
- Optional: Second battery pack for Pi (for untethered operation)

**New This Week**: Line sensor module, robot chassis, mounting materials

**For Testing**: Black electrical tape or black marker on white paper to create tracks

## ⚠️ CRITICAL SAFETY & BEST PRACTICES

**ROBOT SAFETY RULES:**
1. **Test on flat, clear surfaces** - Keep away from table edges!
2. **Start with robot on blocks** - Test motors before letting it run
3. **Emergency stop ready** - Know how to quickly power off
4. **Secure all components** - Nothing should fall off when moving
5. **Battery check before each run** - Weak batteries cause erratic behavior
6. **No obstacles in test area** - Clear floor space for testing
7. **One person per robot during testing** - Avoid collisions
8. **Supervised running only** - Don't leave robots running unattended

**WIRING FOR MOBILE ROBOTS:**
- Secure all wires with zip ties or tape
- Keep wires away from moving wheels
- Test all connections before powering on
- Label wires to help with troubleshooting
- Use proper length wires (not too long, not too short)
- Check for shorts before connecting power

**POWER MANAGEMENT:**
- Two power options:
  - Option 1: Motor power only, Pi connected to wall (tethered testing)
  - Option 2: Separate batteries for motors AND Pi (fully mobile)
- Common ground between all power sources
- Power motors through driver only (never directly)
- Turn off when adjusting circuits

**FLOOR SAFETY:**
- Test in area free of stairs or drop-offs
- Watch for cables and cords on floor
- Keep water/liquids away from test area
- Have spotter when testing high-speed robots

## Class Structure
- **Week 6 Review & Robot Introduction**: 10 minutes
- **Robot Assembly Demo**: 15 minutes
- **Hands-on Activity 1 (Build Robot)**: 30 minutes
- **Break**: 5 minutes
- **Line Sensor Theory & Testing**: 10 minutes
- **Hands-on Activity 2 (Program Line Following)**: 25 minutes
- **Testing & Troubleshooting**: 15 minutes
- **Robot Race & Discussion**: 10 minutes

## Files in This Week's Folder
- `README.md` - This file, overview of the week
- `QUICK-START.md` - Quick reference for line following code
- `INSTRUCTOR-GUIDE.md` - Teaching notes, track setup, and tips
- `lecture/` - Detailed lecture notes on robots and sensors
- `activities/` - In-class robot building and programming
- `diagrams/` - Robot wiring and assembly diagrams
- `resources/` - Troubleshooting guide, tracks, and improvements
- `week07-homework.md` - Take-home challenges and improvements

## Getting Started

### Before You Begin
1. **Review Week 6 motor control** - You'll control TWO motors now
2. **Clear large workspace** - Robot assembly needs space
3. **Gather all components** - Chassis, motors, wheels, sensors, driver
4. **Fresh batteries** - Critical for consistent robot behavior
5. **Create test track** - Black tape on white floor/poster board

### First Steps (Do These IN ORDER!)
1. Assemble chassis with motors and wheels (mechanical)
2. Mount L298N motor driver on chassis
3. Test motors individually (before attaching sensors)
4. Mount and test line sensors independently
5. Combine sensors and motors in code
6. Test and tune on actual track

### Test Track Setup
Create a simple track using black electrical tape (1-2 inches wide) on:
- White poster board (easiest, portable)
- Light-colored tile or linoleum floor
- White paper taped together

Start with simple shapes:
- Straight line (10 feet)
- Gentle curve
- Figure-8 or oval
- Later: Sharp corners, intersections

## Key Concepts to Remember

### How Line Sensors Work
```
Infrared (IR) Line Sensor:
1. Emits infrared light downward
2. Light reflects off floor
3. White surfaces reflect MORE light
4. Black surfaces reflect LESS light
5. Sensor outputs HIGH or LOW based on threshold

Typical Sensor Array:
[Left] [Center-Left] [Center] [Center-Right] [Right]

Each sensor returns:
- LOW (0) when over black line
- HIGH (1) when over white surface
```

### Differential Drive Steering
```
Two Motors for Turning:

Go Forward:
- Left motor: Forward 100%
- Right motor: Forward 100%

Turn Left:
- Left motor: Forward 50%
- Right motor: Forward 100%

Sharp Left:
- Left motor: Reverse 50%
- Right motor: Forward 100%

Turn Right:
- Left motor: Forward 100%
- Right motor: Forward 50%

Spin Right:
- Left motor: Forward 100%
- Right motor: Reverse 100%
```

### Basic Line Following Algorithm
```python
# Simplified 2-sensor line following logic

if left_sensor == LOW and right_sensor == LOW:
    # Both sensors on line (or both off line)
    move_forward()

elif left_sensor == LOW and right_sensor == HIGH:
    # Line is to the left
    turn_left()

elif left_sensor == HIGH and right_sensor == LOW:
    # Line is to the right
    turn_right()

elif left_sensor == HIGH and right_sensor == HIGH:
    # Both sensors see white (lost line?)
    search_for_line()
```

### Control Loop Structure
```python
try:
    setup_motors()
    setup_sensors()
    
    while True:
        # 1. Read sensor values
        left = read_left_sensor()
        right = read_right_sensor()
        
        # 2. Make decision based on sensors
        if line_detected():
            adjust_motors_to_follow_line()
        else:
            search_for_line()
        
        # 3. Small delay for loop timing
        time.sleep(0.01)  # 10ms, 100 times per second
        
except KeyboardInterrupt:
    # Clean stop when Ctrl+C pressed
    stop_motors()
    cleanup()
```

## Tips for Success
- **Mechanical first** - Make sure robot rolls smoothly before coding
- **Test motors separately** - Verify each motor works before combining
- **Calibrate sensors** - Test over black and white surfaces first
- **Print sensor values** - Use `print()` to debug sensor readings
- **Start slow** - Low motor speeds make debugging easier
- **Good lighting** - IR sensors work better in consistent lighting
- **High contrast** - Darker black, brighter white = easier detection
- **Secure components** - Robot vibrations can loosen connections
- **Iterate quickly** - Test, adjust, test again
- **Watch for patterns** - Does robot always turn too much one way?

## Common Beginner Mistakes (And How to Avoid Them)

1. **Motors spin opposite directions** → Swap motor wires or swap in code
2. **Robot ignores line** → Check sensor threshold/sensitivity
3. **Sensors always LOW or HIGH** → Test sensor over known surfaces
4. **Robot too fast to follow line** → Reduce motor speed (start ~50%)
5. **Loose wires during movement** → Secure ALL wires with zip ties
6. **Robot veers to one side** → Motors may have different speeds, adjust in code
7. **Sensors too high above ground** → Should be ~5mm from surface
8. **Battery dies quickly** → Turn off when not testing, use fresh batteries
9. **Raspberry Pi resets when motors run** → Separate power sources!
10. **Robot oscillates wildly** → Reduce turn strength, tune algorithm

## Troubleshooting Guide

### Robot Won't Move
- [ ] Motor driver powered? (Check LED on L298N)
- [ ] Motor connections secure?
- [ ] Code actually calling motor functions?
- [ ] Fresh batteries?
- [ ] Motors work when tested individually?
- [ ] Enable pins being controlled correctly?

### Robot Moves But Doesn't Follow Line
- [ ] Are sensors detecting line? (Print sensor values)
- [ ] Sensors mounted at correct height? (~5mm)
- [ ] Line has good contrast (dark black on white)?
- [ ] Correct sensor pins defined in code?
- [ ] Logic correct (if sensor LOW, then turn right direction)?
- [ ] Motors responding to steering commands?

### Sensors Give Wrong Readings
- [ ] Adequate lighting in room?
- [ ] Sensors clean? (Dust interferes with IR)
- [ ] Good contrast between line and floor?
- [ ] Sensor threshold/sensitivity properly set?
- [ ] Testing with sensor actually over line?
- [ ] Wiring correct (VCC, GND, signal pins)?

### Robot Follows Line But Poorly
- [ ] Speed too fast? Try slower
- [ ] Turns too gentle? Increase motor speed difference
- [ ] Turns too sharp? Reduce motor speed difference
- [ ] Algorithm too simple? Try proportional control
- [ ] Sensor positioning? Should be in front of wheels
- [ ] Track too curved for current algorithm?

### Mechanical Issues
- [ ] Wheels slipping? Check motor mounting
- [ ] Robot dragging? Adjust caster/ball wheel height
- [ ] Components falling off? Add more zip ties/velcro
- [ ] Wires tangling in wheels? Reroute and secure
- [ ] Battery pack sliding? Secure with velcro

## Looking Ahead

**This Week**: Basic line following robot
**Week 8**: Adding more sensors (distance, maybe camera)
**Week 9**: Web control - Drive robot from browser!
**Future**: More complex autonomous behaviors

## Why This Matters

Line following is the foundation of many real-world applications:
- **Warehouse robots** - Follow paths to deliver packages
- **Automated guided vehicles (AGVs)** - Transport materials in factories
- **Agricultural robots** - Follow crop rows for planting/harvesting
- **Industrial assembly** - Move parts between stations
- **Competition robots** - Line following is a classic robotics competition
- **Learning platform** - Teaches closed-loop control systems

This project combines:
- **Sensors** (input from environment)
- **Processing** (decision-making logic)
- **Actuators** (motors creating movement)
- **Feedback loop** (continuous adjustment based on sensors)

This is the essence of robotics and automation!

## Real-World Applications

Students will see how this week's skills relate to:
- **Self-driving cars** - Lane detection and following
- **Delivery robots** - Navigate sidewalks and hallways
- **Robot vacuums** - Navigate rooms systematically
- **Amazon warehouse robots** - Follow floor markers
- **Airport baggage systems** - Automated luggage transport
- **Hospital robots** - Deliver supplies following floor lines
- **Manufacturing** - Parts transport between workstations

## Robot Competition Ideas

If time permits, try these challenges:
1. **Speed race** - Fastest to complete track
2. **Complex track** - Sharp corners and intersections
3. **Accuracy** - Stay centered on line without wobbling
4. **Recovery** - Who recovers fastest after losing line
5. **Obstacle course** - Line following plus obstacle avoidance
6. **Sumo ring** - Line following in circular arena

---

**Important Reminder**: This is a complex project combining many skills. Don't get discouraged if it doesn't work perfectly on the first try! Robotics requires patience, testing, and iteration. Every problem you solve teaches you something valuable!

**Let's build amazing robots!** 🤖🏁📍
