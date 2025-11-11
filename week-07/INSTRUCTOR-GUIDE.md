# Week 7 Instructor Guide - Line Following Robot

## Overview for Instructors

This week is the culmination of Weeks 5 and 6, bringing together sensors and motors into a complete autonomous robot. This is typically the most exciting week for students as they see their robots come to life! However, it's also the most complex, with many potential points of failure. Preparation and organization are key to success.

**Time Management**: This is a full 2-hour class. Consider extending if possible or breaking into two sessions.

---

## Pre-Class Preparation (Critical!)

### 1. Test ALL Components (1-2 hours before class)
- [ ] Build one complete robot yourself
- [ ] Test each motor driver with fresh batteries
- [ ] Verify all line sensors work properly
- [ ] Test complete system on your test track
- [ ] Identify any DOA (dead on arrival) components
- [ ] Have spare motors, sensors, and drivers ready

### 2. Prepare Test Tracks (Can be done days ahead)
Create multiple tracks so students aren't waiting:
- **Minimum**: 3-4 tracks for class of 12 students
- **Material**: White poster board (22"×28") or larger
- **Line**: Black electrical tape, 1-1.5 inches wide
- **Patterns**: Start with simple straight lines and gentle curves
- **Storage**: Roll up tracks for reuse in future classes

**Sample Track Layouts:**
```
Track 1: Simple Oval
Track 2: Figure-8
Track 3: Straight with gentle S-curves
Track 4: Square with rounded corners
```

### 3. Organize Components
Pre-sort into bins/bags per student:
- Robot chassis with motors and wheels
- L298N motor driver
- Line sensor module
- Jumper wires (20+ assorted)
- Zip ties (10+) for cable management
- Velcro strips for component mounting

### 4. Battery Management
- Charge/acquire LOTS of AA batteries (8 per robot minimum)
- Have battery tester to identify weak batteries
- Label battery packs per student
- Consider having power strips for tethered testing

### 5. Classroom Setup
- **Large clear floor area** for robot testing
- **Tables**: Workspace for assembly
- **Floor space**: Away from table edges for robot testing
- **Power access**: For Pi connections during tethered testing
- **Good lighting**: IR sensors work better in consistent light

---

## Class Timeline (120 minutes)

### Segment 1: Introduction & Mechanical Assembly (35 min)

**00:00-10:00 - Introduction and Demonstration**
- Show completed robot following line (your demo model)
- Explain how IR sensors detect black vs. white
- Show differential steering concept with physical robot
- Safety briefing (table edges, battery handling)
- Overview of build process

**10:00-35:00 - Mechanical Assembly (Hands-on)**

Instructor demonstrates each step, then students follow:

1. **Motor Installation** (10 min)
   - Mount motors to chassis using screws or clips
   - Attach wheels to motor shafts
   - Test that motors are secure and wheels spin freely
   - **Common issue**: Wheels rubbing on chassis

2. **Caster/Ball Wheel** (5 min)
   - Attach to front or rear of chassis for balance
   - Adjust height so robot is level
   - Test that robot rolls smoothly by hand

3. **Battery Pack Mounting** (5 min)
   - Position on chassis (usually center or rear)
   - Secure with velcro or zip ties
   - Check that weight distribution is good

4. **Component Layout Planning** (5 min)
   - Place motor driver on chassis (don't secure yet)
   - Plan sensor position (front, ~5mm above ground)
   - Plan Pi position (if going mobile)
   - **Key point**: Weight balance and wire routing

**Instructor Notes:**
- Walk around helping with mechanical issues
- Check that all motors spin freely
- Verify battery packs are secure
- Have extra screws/mounting hardware ready

---

### Segment 2: Electrical Connections (35 min)

**35:00-45:00 - Motor Driver Wiring (Demonstration)**

Show on document camera or large demo robot:

1. **Power Connections**
   ```
   Battery Pack (+) → Motor Driver 12V terminal
   Battery Pack (-) → Motor Driver GND terminal
   Raspberry Pi GND → Motor Driver GND (CRITICAL!)
   ```

2. **Motor Connections**
   ```
   Left Motor  → Motor A terminals (OUT1, OUT2)
   Right Motor → Motor B terminals (OUT3, OUT4)
   ```

3. **Control Signal Connections**
   ```
   Motor A: IN1, IN2, ENA → GPIOs (show diagram)
   Motor B: IN3, IN4, ENB → GPIOs (show diagram)
   ```

**Safety Reminder**: Do NOT connect Pi power to motor driver 5V output!

**45:00-60:00 - Students Wire Motor Driver**
- Students follow your demonstration
- Check each student's wiring before they power on
- **Critical checkpoint**: Verify common ground before testing

**60:00-70:00 - Test Motors on Blocks**
- Place robots on blocks/books so wheels don't touch
- Run simple motor test code (from Week 6)
- Verify both motors spin
- Check correct direction (forward = robot moves forward)
- **Troubleshoot**: Swap wires if motor spins wrong direction

---

### BREAK (5 minutes) - 70:00-75:00
Students stretch, check progress, ask questions

---

### Segment 3: Line Sensors (20 min)

**75:00-80:00 - Line Sensor Theory**
- Explain IR LED + photodetector principle
- Show sensor output: LOW on black, HIGH on white
- Demonstrate with sensor and tape
- Discuss sensor mounting height (~5mm)

**80:00-90:00 - Sensor Installation**
1. Mount sensor array at front of robot
2. Connect sensor power: VCC → 5V, GND → GND
3. Connect sensor outputs to GPIO pins
4. Secure wires with zip ties

**90:00-95:00 - Test Sensors Independently**
Run sensor test code:
```python
while True:
    print(f"Left: {left}  Right: {right}")
    time.sleep(0.2)
```
- Hold robot over track to verify sensor readings
- Over BLACK tape: Should read 0
- Over WHITE surface: Should read 1
- **Troubleshoot**: Adjust sensor height if readings inconsistent

---

### Segment 4: Line Following Programming (35 min)

**95:00-105:00 - Line Following Algorithm**
Explain the logic on whiteboard:
```
IF both sensors on white → Go forward
IF left sensor on black → Turn left
IF right sensor on black → Turn right
IF both on black → Go forward (or search)
```

Show complete code example from QUICK-START.md

**105:00-120:00 - Testing and Tuning**
- Students run line following code
- Test on actual tracks
- Tune speeds for smooth following
- Troubleshoot issues (see troubleshooting section below)

**Instructor**: Circulate to help debug issues

---

### Segment 5: Wrap-up (10 min)

**120:00-130:00 - Showcase and Discussion**
- Each robot does one lap (or attempt)
- Celebrate successes!
- Discuss what worked and what didn't
- Preview next week
- Explain homework challenges

---

## Common Student Issues & How to Help

### Mechanical Problems

**Issue**: Wheels wobbling or loose
- **Fix**: Tighten wheel attachment, check motor shaft

**Issue**: Robot dragging or tilting
- **Fix**: Adjust caster height, redistribute weight

**Issue**: Robot doesn't roll straight
- **Fix**: Check wheel alignment, may need code compensation

### Electrical Problems

**Issue**: One motor doesn't work
- **Fix**: Check motor driver connections, test motor directly with battery
- **Fix**: Verify GPIO pins in code match actual wiring

**Issue**: Both motors don't work
- **Fix**: Check battery level (most common!)
- **Fix**: Verify motor driver power LED is on
- **Fix**: Check common ground connection

**Issue**: Motors work but erratically
- **Fix**: Replace batteries (weak batteries cause problems)
- **Fix**: Check for loose connections

**Issue**: Pi resets when motors start
- **Fix**: CRITICAL - Separate power sources! Motors draw too much current

### Sensor Problems

**Issue**: Sensors always read 0 or always 1
- **Fix**: Check wiring (VCC, GND, signal)
- **Fix**: Test sensor with multimeter if available
- **Fix**: Try different GPIO pin

**Issue**: Sensor readings flickering
- **Fix**: Ensure good lighting (no shadows/flicker)
- **Fix**: Check sensor height (5mm from surface)
- **Fix**: Clean sensor lenses

**Issue**: Sensors work but robot ignores line
- **Fix**: Print sensor values to debug
- **Fix**: Check if sensor logic is inverted (some modules output opposite)
- **Fix**: Verify track has good contrast

### Programming Problems

**Issue**: Robot goes straight off line
- **Fix**: Check sensor readings are working
- **Fix**: Verify turn logic (left sensor → turn left, not right!)
- **Fix**: Increase motor speed difference during turns

**Issue**: Robot oscillates wildly on line
- **Fix**: Reduce turn aggressiveness
- **Fix**: Slow down overall speed
- **Fix**: Add center sensor for better control

**Issue**: Robot loses line in curves
- **Fix**: Reduce speed
- **Fix**: Position sensors further forward
- **Fix**: Improve algorithm (proportional control)

---

## Troubleshooting Workflow

When a student has an issue, follow this systematic approach:

### 1. Isolate the Problem
- **Mechanical**: Does robot roll smoothly by hand?
- **Power**: Is motor driver LED on? Fresh batteries?
- **Motors**: Do they spin on blocks (no sensors involved)?
- **Sensors**: Do they give correct readings when printed?
- **Logic**: Is code calling the right functions?

### 2. Test Components Individually
- Test each motor alone
- Test sensors alone (print values)
- Test motor driver with simple forward command
- Only then combine everything

### 3. Simplify
- Start with robot going forward only
- Add left turn logic
- Add right turn logic
- Then add sensor integration

### 4. Use Print Statements
```python
print(f"Left: {left}, Right: {right}")
print(f"Action: Forward")
```
This helps students see what's happening

---

## Advanced Student Extensions

For students who finish early or want challenges:

### 1. Add More Sensors
- Use 3 or 5 sensor array for better line tracking
- Center sensor for precise centering

### 2. Proportional Control
```python
# Calculate error from center
error = (left * 2) + center - (right * 2)
# Adjust motor speeds proportionally
left_speed = BASE_SPEED - (error * K_p)
right_speed = BASE_SPEED + (error * K_p)
```

### 3. Track Intersection Detection
- Detect when all sensors see black (intersection)
- Count intersections to navigate specific path

### 4. Speed Optimization
- Start slow, increase speed on straights
- Slow down for curves (detected by frequent turning)

### 5. Add Obstacle Avoidance
- Mount ultrasonic sensor
- Stop or avoid obstacles while line following

### 6. Remote Stop/Start
- Add button to start/stop line following
- Add LED to indicate robot state

---

## Track Design Tips

### Beginner Tracks
- Wide lines (1.5-2 inches)
- Gentle curves
- No sharp corners
- Continuous loop

### Intermediate Tracks
- Standard width (1-1.5 inches)
- Mix of curves and straights
- Some corners (not too sharp)
- Figure-8 or oval

### Advanced Tracks
- Narrow lines (0.75-1 inch)
- Sharp corners
- Intersections
- Gaps in line (test recovery)

### Track Testing
- Test each track yourself before class
- Mark difficulty level on each track
- Have variety so students can progress

---

## Materials Management

### Before Class
- Inventory all components
- Test components (especially sensors and motors)
- Charge/acquire fresh batteries
- Organize into per-student kits

### During Class
- Track which student has which kit
- Have spare parts accessible
- Keep multimeter handy for testing
- Have extra batteries ready

### After Class
- Collect all components (checklist)
- Test returned components
- Recharge batteries
- Note damaged/missing items
- Store tracks carefully for reuse

---

## Alternative Teaching Approaches

### Option 1: Two-Day Project
**Day 1**: Mechanical assembly + motor testing
**Day 2**: Sensors + line following programming
**Benefit**: Less rushed, more time for troubleshooting

### Option 2: Pre-Built Partial Robots
Provide robots with:
- Motors already mounted
- Motor driver already wired
Students focus on:
- Sensor installation
- Programming and tuning
**Benefit**: More time on programming, less on mechanical

### Option 3: Team Approach
- Pairs of students share one robot
- One focuses on hardware, one on software
- Then they swap and help each other
**Benefit**: Peer teaching, less hardware needed

---

## Assessment Ideas

### Informal Assessment (During Class)
- Observe problem-solving approach
- Check understanding during troubleshooting
- Note ability to work independently vs. need help

### Robot Performance Rubric
- **Mechanical**: Well-assembled, secure components (25%)
- **Electrical**: Proper wiring, safe practices (25%)
- **Programming**: Working line following code (30%)
- **Performance**: Follows line smoothly (20%)

### Competition-Based Assessment
- Timed lap around track
- Accuracy (staying on line)
- Recovery from losing line
- Handling curves and corners

### Reflection Questions
1. What was the hardest part of building your robot?
2. How did you debug when something didn't work?
3. What would you change to improve your robot?
4. How does your robot relate to real-world applications?

---

## Safety Reminders

### During Class
- [ ] Emphasize table edge awareness (robots falling)
- [ ] Monitor battery handling (no shorts)
- [ ] Watch for loose components flying off robots
- [ ] Keep testing area clear of obstacles
- [ ] Remind students to turn off robots when not testing

### Cleanup
- [ ] All batteries removed from robots
- [ ] Components returned to proper bins
- [ ] Verify no missing parts
- [ ] Tracks stored properly
- [ ] Workspace cleaned

---

## Backup Plans

### If Components Don't Work
- Have spare motors, sensors, drivers
- Can demo with your working robot
- Students can work in teams with working components

### If No Floor Space
- Test on tables with cardboard tracks
- Use elevated test platforms
- Students take turns with available space

### If Time Runs Short
- Focus on getting motors working (Day 1)
- Complete sensors and line following next week
- Students can test code in simulation (print statements)

---

## Next Week Preview

Tease Week 8 content:
- Add more sensors (distance for obstacles)
- More advanced navigation
- Maybe camera for line detection
- Network control possibilities

---

## Instructor Resources

### Useful Links for Deep Dives
- L298N datasheet and tutorials
- IR sensor working principles
- PID control for line following
- Competition robot designs

### Video Resources
- Show YouTube videos of line following robots
- Formula 1 car line tracking (similar principle!)
- Warehouse robots following floor markers

### Guest Speaker Idea
- Invite robotics professional or competition team
- Show industrial line following robots (if accessible)

---

## Week 7 Success Checklist

At the end of class, successful students should have:
- [ ] Fully assembled robot that rolls smoothly
- [ ] Both motors spinning correct direction
- [ ] Sensors detecting line (black/white)
- [ ] Code that attempts to follow line
- [ ] Understanding of how sensors + motors = autonomous behavior
- [ ] Documented code with comments
- [ ] Ideas for improvements

**Remember**: Not every robot needs to work perfectly! The learning is in the troubleshooting and iteration. Celebrate effort and problem-solving as much as working robots!

---

## Final Tips

1. **Prepare thoroughly** - Test everything beforehand
2. **Start simple** - Get motors working before adding complexity
3. **Patience** - Robotics is hard; students will struggle
4. **Encourage iteration** - "Try, fail, adjust, repeat"
5. **Celebrate small wins** - Motor spins? Great! Sensor works? Awesome!
6. **Document issues** - Note common problems for next time
7. **Have fun!** - This is the most exciting week for students

**You've got this!** 🤖👨‍🏫
