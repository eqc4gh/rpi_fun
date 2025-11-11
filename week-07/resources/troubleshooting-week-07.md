# Week 7 Troubleshooting Guide - Line Following Robot

## Quick Diagnostic Flowchart

```
Robot not working?
        │
        ▼
Is motor driver LED on?
        │
    ┌───┴───┐
   NO      YES
    │       │
    ▼       ▼
Check    Do motors
battery  spin on
power    blocks?
    │       │
    │   ┌───┴───┐
    │  NO      YES
    │   │       │
    │   ▼       ▼
    │  Check  Do sensors
    │  motor  change when
    │  wiring moved over
    │   │    line?
    │   │       │
    │   │   ┌───┴───┐
    │   │  NO      YES
    │   │   │       │
    │   │   ▼       ▼
    │   │  Check  Tune speeds
    │   │  sensor and test
    │   │  wiring algorithm
    └───┴───┴────────┘
```

---

## Power Issues

### Motor Driver LED Not Lighting

**Symptoms**:
- No LED on L298N board
- Motors don't respond at all
- No sound from motor driver

**Possible Causes & Solutions**:

1. **Battery Pack Issues**
   ```
   Check:
   ☐ Are batteries installed?
   ☐ Is battery switch ON?
   ☐ Are batteries fresh? (Test with multimeter: should be ~6V)
   ☐ Are battery terminals clean and making contact?
   
   Solution:
   - Install fresh batteries
   - Clean battery terminals with pencil eraser
   - Check battery holder for damage
   ```

2. **Wiring Issues**
   ```
   Check:
   ☐ Red wire (+) connected to 12V terminal
   ☐ Black wire (-) connected to GND terminal
   ☐ Wires securely in screw terminals
   ☐ No broken wires
   
   Solution:
   - Re-check connections
   - Tighten screw terminals
   - Test battery voltage with multimeter
   ```

3. **Defective Motor Driver**
   ```
   Check:
   ☐ No visible damage to L298N board
   ☐ No burn marks or smell
   ☐ Voltage present at input terminals
   
   Solution:
   - Test with known-good motor driver
   - Contact instructor for replacement
   ```

### Raspberry Pi Keeps Rebooting

**Symptoms**:
- Pi works until motors start
- Pi suddenly restarts when robot moves
- Pi screen goes black during operation

**⚠️ CRITICAL ISSUE**: Motors drawing power from Pi

**Solution**:
```
1. IMMEDIATELY stop testing
2. Verify motor driver is powered from battery ONLY
3. Check that you did NOT connect:
   - Motor driver 5V → Raspberry Pi 5V
   - This can damage your Pi!
4. Only signal wires should connect Pi to motor driver
5. Verify common ground connection is present
```

**Correct Power Setup**:
```
✓ Motors powered by battery through motor driver
✓ Pi powered by wall adapter (or separate battery)
✓ Common ground connects Pi GND to motor driver GND
✗ Never connect motor driver 5V to Pi 5V
```

---

## Motor Problems

### Motors Don't Spin At All

**Symptoms**:
- Motor driver LED is on
- Code runs without errors
- But motors don't move

**Diagnostic Steps**:

1. **Check Enable (EN) Jumpers**
   ```
   L298N board should have jumpers:
   
   ENA [●─●]  ← Jumper MUST be here
   ENB [●─●]  ← Jumper MUST be here
   
   If missing:
   - Find the small plastic jumpers
   - Connect the two pins labeled ENA
   - Connect the two pins labeled ENB
   ```

2. **Verify Control Wiring**
   ```
   Check each connection:
   ☐ IN1 → GPIO 17
   ☐ IN2 → GPIO 27
   ☐ ENA → GPIO 12
   ☐ IN3 → GPIO 22
   ☐ IN4 → GPIO 23
   ☐ ENB → GPIO 13
   
   Common mistakes:
   - Wires on wrong pins
   - Wires not fully inserted in female connector
   - GPIO numbers don't match code
   ```

3. **Test Common Ground**
   ```
   CRITICAL: Pi GND must connect to motor driver GND
   
   Without this connection:
   - Digital signals have no reference
   - Motors won't respond correctly
   - Behavior will be erratic
   
   Test:
   - Use multimeter continuity test
   - Should beep between Pi GND and driver GND
   ```

4. **Test Motors Directly**
   ```
   Bypass electronics to test motors:
   1. Disconnect motor from driver
   2. Briefly touch motor wires to battery terminals
   3. Motor should spin
   
   If motor doesn't spin:
   - Check motor connections
   - Motor may be defective
   - Try different motor
   ```

### One Motor Works, Other Doesn't

**Symptoms**:
- Left motor spins but right doesn't (or vice versa)
- One wheel moves, other is stationary

**Diagnostic Steps**:

1. **Swap Motor Connections**
   ```
   Test to isolate the problem:
   
   1. Swap motor wire connections on driver
      - Move Motor A wires to OUT3/OUT4
      - Move Motor B wires to OUT1/OUT2
   
   2. Does the problem follow the motor?
      - YES → Motor is bad
      - NO → Motor driver channel is bad
   ```

2. **Check Specific Motor's Control Wires**
   ```
   For non-working motor, verify:
   
   Left motor (Motor A):
   ☐ IN1 connected and secure
   ☐ IN2 connected and secure
   ☐ ENA connected and secure
   ☐ ENA jumper installed
   
   Right motor (Motor B):
   ☐ IN3 connected and secure
   ☐ IN4 connected and secure
   ☐ ENB connected and secure
   ☐ ENB jumper installed
   ```

3. **Test PWM Functionality**
   ```python
   # Test PWM pin with LED
   import RPi.GPIO as GPIO
   import time
   
   GPIO.setmode(GPIO.BCM)
   TEST_PIN = 12  # Or 13 for other motor
   GPIO.setup(TEST_PIN, GPIO.OUT)
   
   pwm = GPIO.PWM(TEST_PIN, 1000)
   pwm.start(50)  # 50% duty cycle
   
   # LED should light at medium brightness
   # If LED doesn't light, GPIO or wiring issue
   
   time.sleep(5)
   pwm.stop()
   GPIO.cleanup()
   ```

### Motor Spins Wrong Direction

**Symptoms**:
- Motor spins when commanded
- But spins backward instead of forward
- May cause robot to go wrong direction

**Solution: Two Options**

**Option 1: Swap Motor Wires (Hardware Fix)**
```
Physical fix:
1. Loosen screw terminals on motor driver
2. Remove both motor wires
3. Swap them:
   - Wire that was in OUT1 → OUT2
   - Wire that was in OUT2 → OUT1
4. Tighten terminals
5. Test again
```

**Option 2: Reverse in Code (Software Fix)**
```python
# Find the motor control function
def set_left_motor(speed, direction):
    if direction == "forward":
        # If motor goes backward, swap these:
        GPIO.output(LEFT_IN1, GPIO.LOW)   # Was HIGH
        GPIO.output(LEFT_IN2, GPIO.HIGH)  # Was LOW
    elif direction == "backward":
        # And swap these:
        GPIO.output(LEFT_IN1, GPIO.HIGH)  # Was LOW
        GPIO.output(LEFT_IN2, GPIO.LOW)   # Was HIGH
```

**Which option to choose?**
- Hardware fix: Cleaner, more intuitive code
- Software fix: Easier, no screwdriver needed
- Either works fine!

### Motors Run at Different Speeds

**Symptoms**:
- Robot veers left or right on straight command
- One wheel spins noticeably faster
- Robot makes curved path instead of straight

**This is NORMAL** - Hobby motors vary in speed

**Solution: Calibrate in Code**

```python
# Add calibration factors
LEFT_MOTOR_FACTOR = 1.0   # Baseline
RIGHT_MOTOR_FACTOR = 0.95  # Adjust this

def set_motor(side, speed, direction):
    if side == 'left':
        adjusted_speed = speed * LEFT_MOTOR_FACTOR
    else:  # right
        adjusted_speed = speed * RIGHT_MOTOR_FACTOR
    
    # Rest of motor control code...
    pwm.ChangeDutyCycle(adjusted_speed)
```

**Finding the Right Factor**:
```
1. Run robot straight on floor
2. Does it veer right?
   → Reduce RIGHT_MOTOR_FACTOR (try 0.95, 0.9, etc.)
3. Does it veer left?
   → Increase RIGHT_MOTOR_FACTOR (try 1.05, 1.1, etc.)
4. Test and adjust until straight
```

### Motors Stutter or Stop

**Symptoms**:
- Motors start and stop repeatedly
- Motors run for a second then quit
- Uneven, jerky movement

**Possible Causes**:

1. **Weak Batteries**
   ```
   Test:
   - Measure battery voltage
   - Should be ~6V for 4xAA
   - If below 5V, replace batteries
   
   Fresh batteries are CRITICAL for robots!
   ```

2. **Loose Connections**
   ```
   Check:
   ☐ Motor wires securely in terminals
   ☐ Battery connections tight
   ☐ No intermittent contact
   ☐ Wiggle test - try to loosen connections
   
   Solution:
   - Tighten all screw terminals
   - Use zip ties for strain relief
   - Check for broken wires
   ```

3. **Motor Stalling**
   ```
   Check:
   ☐ Wheels spin freely by hand
   ☐ Nothing rubbing on wheels
   ☐ Chassis not binding motor
   
   Solution:
   - Clear obstructions
   - Adjust motor mounting
   - Reduce speed if too fast
   ```

4. **Overheating**
   ```
   If running for long time:
   - Motor driver may get hot
   - Thermal protection may activate
   
   Solution:
   - Let cool for 5 minutes
   - Reduce motor speed
   - Don't stall motors (block wheels)
   ```

---

## Sensor Problems

### Sensors Always Show Same Value

**Symptoms**:
- Sensor test program shows all 0s or all 1s
- Sensors don't respond to black/white surfaces
- LED indicators don't change

**Diagnostic Steps**:

1. **Check Power Connections**
   ```
   Verify:
   ☐ VCC connected to Pi 5V (pin 2 or 4)
   ☐ GND connected to Pi GND
   
   Test:
   - Sensor module LEDs should be lit
   - If no LEDs, no power
   
   Solution:
   - Re-check VCC and GND wiring
   - Try different 5V pin on Pi
   - Verify Pi is powered on
   ```

2. **Check Signal Connections**
   ```
   Verify each sensor output:
   ☐ S1 → GPIO 5
   ☐ S2 → GPIO 19 (if 3+ sensors)
   ☐ S3 → GPIO 6
   
   Common mistakes:
   - Wires on wrong GPIO pins
   - GPIO numbers in code don't match wiring
   ```

3. **Test with Different GPIO**
   ```python
   # Try different pin to isolate issue
   # Change in code:
   LEFT_SENSOR = 26  # Instead of 5
   
   # If this works, original pin may be damaged
   ```

### Sensor Readings Flicker/Unstable

**Symptoms**:
- Sensor values rapidly switch 0/1
- Inconsistent readings over same surface
- Hard to get stable detection

**Possible Causes**:

1. **Lighting Issues**
   ```
   IR sensors affected by ambient light
   
   Problems:
   - Bright sunlight
   - Flickering fluorescent lights
   - Shadows moving over sensor
   
   Solutions:
   - Test in consistent lighting
   - Avoid windows with direct sun
   - Use steady LED lighting
   - Add small hood over sensors
   ```

2. **Wrong Sensor Height**
   ```
   Optimal: 3-8mm from surface
   
   Too high (>10mm):
   - Weak reflected signal
   - Ambient light interference
   - Unreliable detection
   
   Too low (<2mm):
   - May hit bumps
   - Reflections too strong
   - Inconsistent as robot moves
   
   Solution:
   - Measure with ruler
   - Adjust sensor mount height
   - Test at different heights
   ```

3. **Sensor Sensitivity**
   ```
   Most modules have adjustment potentiometers
   
   Adjustment:
   1. Find small screw (potentiometer) on module
   2. Use small Phillips screwdriver
   3. Turn slowly clockwise = less sensitive
   4. Turn slowly CCW = more sensitive
   5. Test between adjustments
   
   Goal:
   - Clearly distinguishes black from white
   - Doesn't trigger on shadows
   - Consistent readings
   ```

4. **Surface Issues**
   ```
   Check your track:
   ☐ Good contrast (dark black on bright white)
   ☐ Matte finish (not glossy)
   ☐ Clean surface (no dust/dirt)
   
   Problems:
   - Low contrast: gray on off-white
   - Glossy surfaces: unpredictable reflections
   - Dirty sensors: wipe with soft cloth
   ```

### Sensor Detects But Output is Inverted

**Symptoms**:
- Sensor shows 1 over black line
- Sensor shows 0 over white surface
- Opposite of expected

**This Happens**: Some modules have inverted logic

**Solution: Invert in Code**

```python
# Option 1: Invert when reading
left = not GPIO.input(LEFT_SENSOR)
right = not GPIO.input(RIGHT_SENSOR)

# Option 2: Flip comparison logic
if left == 1 and right == 1:  # Now 1 = black
    # Line detected
```

**How to Tell Which Way Your Sensors Work**:
```python
# Run sensor test
# Hold over BLACK line
# Do LEDs light up?
#   - YES: Output is LOW (0) on black (normal)
#   - NO: Output is HIGH (1) on black (inverted)
```

---

## Line Following Problems

### Robot Ignores Line Completely

**Symptoms**:
- Sensors work in test program
- Robot drives straight off line
- No turning response

**Diagnostic Steps**:

1. **Verify Sensor Readings in Main Code**
   ```python
   # Add debug prints
   def follow_line():
       left = GPIO.input(LEFT_SENSOR)
       right = GPIO.input(RIGHT_SENSOR)
       
       # Print to see what sensors detect
       print(f"L:{left} R:{right}")
       
       # Rest of code...
   ```

2. **Check Decision Logic**
   ```python
   # Common mistake: backwards logic
   
   # WRONG:
   if left == 0:  # Left sensor sees line
       turn_right()  # But turning wrong way!
   
   # CORRECT:
   if left == 0:  # Left sensor sees line
       turn_left()   # Turn toward the line
   ```

3. **Verify Motors Respond**
   ```
   Test:
   - Call turn_left() directly
   - Call turn_right() directly
   - Do motors actually turn?
   
   If motors don't respond:
   - Problem is with motor control, not sensors
   - Go back to motor troubleshooting section
   ```

4. **Check Sensor Placement**
   ```
   Sensors must be:
   ☐ At front of robot (in front of wheels)
   ☐ At proper height (3-8mm)
   ☐ Parallel to ground (not tilted)
   
   Too far back:
   - Robot reacts too late
   - Drives off line before correction
   ```

### Robot Follows Line But Loses It

**Symptoms**:
- Starts following successfully
- After a few seconds, drives off line
- Can't recover once lost

**Possible Causes**:

1. **Speed Too High**
   ```
   Robot moving too fast to react
   
   Solution:
   BASE_SPEED = 50   # Start slower
   TURN_SPEED = 35   # Reduce this too
   
   Gradually increase as you tune
   ```

2. **Weak Batteries**
   ```
   As batteries drain:
   - Motors slow down
   - Response gets sluggish
   - Eventually stops working
   
   Solution:
   - Always test with fresh batteries
   - Replace when robot gets sluggish
   ```

3. **Line Search Algorithm Missing**
   ```python
   # When both sensors off line, need strategy
   
   def follow_line():
       left = GPIO.input(LEFT_SENSOR)
       right = GPIO.input(RIGHT_SENSOR)
       
       # If both sensors see white (lost line)
       if left == 1 and right == 1:
           # Need recovery behavior!
           # Option A: Slow down and go straight
           set_motor('left', BASE_SPEED // 2, 'forward')
           set_motor('right', BASE_SPEED // 2, 'forward')
           
           # Option B: Spin to search
           # set_motor('left', 40, 'forward')
           # set_motor('right', 40, 'backward')
   ```

4. **Line Too Narrow for Sensor Spacing**
   ```
   If line is narrower than sensor spacing:
   - Both sensors may miss line
   - Can't detect properly
   
   Solution:
   - Use wider line (1.5-2 inches)
   - Or use sensors with closer spacing
   - Or add center sensor
   ```

### Robot Oscillates Wildly (Zigzags)

**Symptoms**:
- Robot follows line
- But zigzags back and forth excessively
- Erratic, nervous movement

**Causes & Solutions**:

1. **Turning Too Aggressively**
   ```python
   # Problem: Too much speed difference
   BASE_SPEED = 70
   TURN_SPEED = 20  # Too low! 50 speed difference
   
   # Solution: Reduce difference
   BASE_SPEED = 60
   TURN_SPEED = 45  # Only 15 speed difference
   ```

2. **Loop Delay Too Short**
   ```python
   # Running too fast
   while True:
       follow_line()
       time.sleep(0.01)  # 10ms - maybe too fast
   
   # Try longer delay
   while True:
       follow_line()
       time.sleep(0.05)  # 50ms - smoother
   ```

3. **Need Proportional Control**
   ```
   Binary control (full left/full right) causes oscillation
   
   Better: Proportional control
   - Small errors → small corrections
   - Large errors → large corrections
   
   See QUICK-START.md for proportional code example
   ```

### Robot Loses Line on Curves

**Symptoms**:
- Follows straight sections fine
- Drives off line on curves
- Sharper curves = more problems

**Solutions**:

1. **Reduce Speed**
   ```
   Slower speed gives more time to react
   
   BASE_SPEED = 50  # Start conservative
   
   Can optimize once following is stable
   ```

2. **Position Sensors Further Forward**
   ```
   Sensors too close to wheels:
   - Robot commits before seeing curve
   
   Solution:
   - Move sensor mount forward
   - More warning time for curves
   ```

3. **Add More Sensors**
   ```
   2-sensor: Only knows "left" or "right"
   3-sensor: Knows "left", "center", "right"
   5-sensor: Much more precise position
   
   More sensors = better curve handling
   ```

4. **Improve Algorithm**
   ```python
   # Simple algorithm: binary response
   # Better: Proportional control
   # Best: PID control
   
   See homework challenges for improved algorithms
   ```

---

## Mechanical Issues

### Robot Doesn't Roll Straight

**Symptoms**:
- Both motors at same speed
- But robot veers to one side
- Curved path instead of straight

**Causes & Solutions**:

1. **Wheel Alignment**
   ```
   Check:
   ☐ Both wheels point straight forward
   ☐ Wheels same distance from chassis
   ☐ No wheel wobble
   
   Solution:
   - Adjust motor mounting
   - Tighten wheel on shaft
   - May need to shim one side
   ```

2. **Uneven Wheel Diameter**
   ```
   If using different wheels:
   - Smaller wheel spins faster for same motor speed
   - Robot curves toward smaller wheel
   
   Solution:
   - Use matching wheels
   - Or compensate in code (see motor speed calibration above)
   ```

3. **Caster Drag**
   ```
   Caster wheel causing resistance on one side
   
   Check:
   ☐ Caster spins freely
   ☐ Caster height allows smooth rolling
   ☐ Caster not twisted or stuck
   
   Solution:
   - Clean caster bearing
   - Adjust caster height
   - Replace if damaged
   ```

4. **Weight Distribution**
   ```
   Uneven weight can cause veering
   
   Solution:
   - Center battery pack
   - Balance components left/right
   - May need to add weight to lighter side
   ```

### Components Falling Off

**Symptoms**:
- Sensors detach during operation
- Battery pack slides around
- Wires pull loose

**Prevention & Fixes**:

1. **Secure Mounting**
   ```
   Use multiple attachment methods:
   - Velcro: Good for frequently removed items
   - Zip ties: Permanent, very secure
   - Double-sided tape: Quick but may fail
   - Screws: Best for permanent mounts
   
   Always test: Shake robot vigorously!
   ```

2. **Vibration Resistance**
   ```
   Robots vibrate a lot:
   - Motors create vibration
   - Bumps and movement
   - Can loosen connections over time
   
   Solutions:
   - Use multiple zip ties
   - Add hot glue to secure wires
   - Check connections before each run
   ```

3. **Wire Strain Relief**
   ```
   Wires pulling on connections:
   
   ╭─────╮
   │Senso│←─────── Direct pull (BAD)
   ╰─────╯
   
   ╭─────╮
   │Senso│←─┐      Zip tie provides
   ╰─────╯  │      strain relief (GOOD)
            🔗
   
   Attach wires to chassis near connections
   ```

### Wheels Rubbing or Dragging

**Symptoms**:
- Wheels don't spin freely
- Motors work but robot slow
- Scraping or rubbing sound

**Checks**:

```
☐ Wheels clear of chassis
☐ Nothing touching wheel edge
☐ Motor shaft not bent
☐ Wires not caught in wheels
☐ Caster height correct (robot level)

Solutions:
- Adjust motor position
- Route wires away from wheels
- Trim excess zip ties near wheels
- Check wheel attachment (not rubbing hub)
```

---

## Code/Algorithm Issues

### Syntax Errors

**Symptoms**:
- Program won't run
- Python shows error message
- Line number indicated

**Common Python Errors**:

```python
# SyntaxError: invalid syntax
if left = 0:  # WRONG: Single = is assignment
if left == 0:  # CORRECT: Double == is comparison

# IndentationError
def follow_line():
left = read_sensor()  # WRONG: Not indented
    left = read_sensor()  # CORRECT: Indented

# NameError: name 'LEFT_SENSOR' is not defined
left = GPIO.input(LEFT_SENSOR)  # Variable not defined above
LEFT_SENSOR = 5  # Need to define before use

# TypeError: unsupported operand
speed = "50" + 10  # WRONG: Can't add string and number
speed = 50 + 10    # CORRECT: Both numbers
```

### Logic Errors (Code Runs But Wrong)

**Finding Logic Errors**:

```python
# Add debugging prints
def follow_line():
    left = GPIO.input(LEFT_SENSOR)
    right = GPIO.input(RIGHT_SENSOR)
    
    print(f"Sensors: L={left} R={right}")  # See sensor values
    
    if left == 0 and right == 0:
        print("Action: Forward")  # See what robot decides
        move_forward()
    elif left == 0:
        print("Action: Turn Left")
        turn_left()
    # ... etc
```

**Common Logic Mistakes**:

```python
# Mistake 1: Wrong operator
if left = 0:  # Should be ==, not =

# Mistake 2: Reversed logic
if left == 0:  # Left sensor sees black
    turn_right()  # But turning away from line! Should turn_left()

# Mistake 3: Missing cases
if left == 0:
    turn_left()
# What about if right == 0? Need elif!

# Mistake 4: Wrong condition
if left == 0 or right == 0:  # Using OR
    move_forward()
# Should probably be AND for both on line
```

### GPIO Warnings/Errors

**Warning**: "Channel already in use"
```python
# Previous program didn't cleanup

Solution:
GPIO.cleanup()  # Clean up before GPIO.setup()
```

**Warning**: "RuntimeWarning: channel already in use"
```python
# Can ignore but better to fix

Solution:
GPIO.setwarnings(False)  # Add after GPIO.setmode()
```

**Error**: "ModuleNotFoundError: No module named 'RPi'"
```python
# Not running on Raspberry Pi, or wrong Python

Solution:
- Make sure running on actual Pi
- Use: python3 filename.py (not just python)
```

---

## Testing Strategies

### Systematic Testing Approach

**Level 1: Component Test**
```
Test each component alone:
1. Sensor test program
2. Motor test program
3. Battery voltage test
```

**Level 2: Integration Test**
```
Test components together:
1. Sensors + print statements
2. Motors + sensors (tethered)
3. Full robot (on blocks first!)
```

**Level 3: Performance Test**
```
Test on actual track:
1. Straight line only
2. Gentle curve
3. Complete circuit
4. Optimize speeds
```

### Debugging Workflow

```
1. Identify the symptom
   ↓
2. Form hypothesis about cause
   ↓
3. Test hypothesis
   ↓
4. If confirmed → Apply solution
   ↓
5. If not confirmed → Form new hypothesis
   ↓
6. Repeat until solved
```

### Using Print Statements

```python
# Print everything during debugging
def follow_line():
    left = GPIO.input(LEFT_SENSOR)
    right = GPIO.input(RIGHT_SENSOR)
    
    print(f"Sensors: L={left} R={right}", end=" | ")
    
    if left == 0 and right == 0:
        print("Action: FWD")
        move_forward()
    elif left == 0:
        print("Action: TURN_L")
        turn_left()
    elif right == 0:
        print("Action: TURN_R")
        turn_right()
    else:
        print("Action: SEARCH")
        search_for_line()
```

**What to Print**:
- Sensor raw values
- Calculated values (errors, corrections)
- Current action/state
- Motor speeds

**Remove prints** once debugging complete (slows down loop)

---

## When to Ask for Help

**Try These First**:
1. Re-check all connections
2. Test components individually
3. Read error messages carefully
4. Search this guide for symptoms
5. Try simpler test code

**Ask for Help If**:
- Component seems defective
- Can't figure out wiring issue
- Tried multiple solutions, none work
- Getting frustrated!

**When Asking for Help, Provide**:
1. What you expected to happen
2. What actually happens
3. What you've already tried
4. Error messages (exact text)
5. Photos of setup (if wiring issue)

---

## Emergency Procedures

### Robot Running Away

```
1. PRESS CTRL+C in terminal
2. If that fails, unplug power
3. If wireless, switch off battery
4. Pick up robot to stop wheels
```

### Smoke or Burning Smell

```
1. IMMEDIATELY disconnect power
2. Unplug Raspberry Pi
3. Remove batteries
4. DO NOT RECONNECT
5. Inspect for damage
6. Get instructor to check before using again
```

### Component Gets Very Hot

```
If motor driver hot:
- Normal to be warm
- If too hot to touch, something wrong

Solutions:
- Reduce motor speed
- Let cool before continuing
- Check for short circuits
- Don't stall motors (block wheels)
```

---

## Quick Reference: Error Messages

| Error | Likely Cause | Solution |
|-------|-------------|----------|
| GPIO warnings | Cleanup issue | Add `GPIO.cleanup()` |
| ModuleNotFoundError | Wrong Python version | Use `python3` not `python` |
| Permission denied | GPIO access | Need `sudo` or add to gpio group |
| Indentation error | Mixed tabs/spaces | Use 4 spaces consistently |
| Syntax error | Typo in code | Check line number in error |
| Name not defined | Variable typo | Check spelling |
| List index out of range | Array access error | Check array size |

---

**Remember**: Every expert was once a beginner who didn't give up! Troubleshooting is learning! 🔧🤖
