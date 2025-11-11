# Activity 1: Robot Assembly and Motor Testing

## Objective
Build the mechanical structure of your line following robot and verify both motors work correctly before adding sensors.

**Time**: 30-35 minutes  
**Difficulty**: Beginner to Intermediate  
**Group**: Individual or pairs

---

## What You'll Learn
- How to properly assemble a robot chassis
- Secure mounting techniques for mobile robots
- Testing motors independently before integration
- Troubleshooting mechanical issues
- Proper wire management for moving robots

---

## Materials Needed

### From Your Kit
- [ ] Robot chassis (2-wheel design)
- [ ] 2x DC motors with wires
- [ ] 2x Wheels (attach to motor shafts)
- [ ] 1x Caster wheel or ball bearing (for balance)
- [ ] L298N Motor Driver module
- [ ] Battery pack (4x AA, 6V) with barrel connector or wires
- [ ] Jumper wires (male-to-female, ~20 wires)
- [ ] Breadboard (optional, can wire directly)
- [ ] Velcro strips or mounting tape
- [ ] Zip ties (10+)

### Tools
- [ ] Small Phillips screwdriver
- [ ] Wire strippers (if needed)
- [ ] Scissors (for zip ties)
- [ ] Ruler or measuring tape

---

## Part 1: Mechanical Assembly (20 minutes)

### Step 1: Prepare the Chassis

**Inspect Your Chassis**
1. Identify mounting holes for motors
2. Find battery pack mounting area (usually bottom)
3. Locate caster wheel mounting point (front or rear)
4. Check for any pre-drilled holes for components

**Typical Chassis Layouts**:
```
Front-wheel drive (motors in front):
    [Caster]
       |
    [Motor-L]  [Motor-R]
       |           |
     [Wheel]    [Wheel]
       |
   [Battery]

Rear-wheel drive (motors in rear):
    [Battery]
       |
    [Motor-L]  [Motor-R]
       |           |
     [Wheel]    [Wheel]
       |
    [Caster]
```

### Step 2: Mount the Motors

**DC Motor Installation**

1. **Position Motors**
   - Insert motors into chassis mounting brackets
   - Motor shaft should point outward (for wheel attachment)
   - Motor body should be inside chassis
   - Ensure motors are parallel and aligned

2. **Secure Motors**
   ```
   Option A: Screw mounting
   - Use small screws through motor bracket holes
   - Don't over-tighten (can crack plastic)
   
   Option B: Clip mounting
   - Snap motor into plastic clips
   - Ensure firmly seated
   
   Option C: Zip tie mounting
   - Wrap zip ties around motor body
   - Thread through chassis holes
   - Pull tight but not crushing
   ```

3. **Test Motor Security**
   - Try to wiggle motors - should not move
   - Motor shaft should spin freely (not rubbing chassis)

**Common Issues**:
- Motor tilted → Re-mount with better alignment
- Motor loose → Add extra zip tie or use glue/tape
- Shaft hitting chassis → Adjust motor position

### Step 3: Attach Wheels

**Wheel Installation**

1. **Check Motor Shaft**
   - Most hobby motors have D-shaped shafts
   - Wheel should have matching D-shaped hole
   - Some use setscrew to secure wheel

2. **Attach Wheels**
   ```
   Method A: Press-fit
   - Align wheel hole with motor shaft
   - Push firmly until seated
   - Should not wobble
   
   Method B: Setscrew
   - Slide wheel onto shaft
   - Align setscrew with flat part of D-shaft
   - Tighten with Allen key
   - Don't strip the screw!
   ```

3. **Test Wheels**
   - Spin each wheel by hand
   - Should turn smoothly without wobbling
   - Should not slide off shaft easily
   - Both wheels should be same distance from chassis

**Wheel Alignment Check**:
```
Side view - wheels should be parallel:
   |  |
   |  |
 [W][W]  ✓ Good

   \  /
    \/
  [W][W]  ✗ Bad (toed-in)
```

### Step 4: Install Caster Wheel

**Caster/Ball Wheel Purpose**: 
- Provides third point of contact for stability
- Allows robot to turn freely
- Typically mounted front or rear (opposite motors)

**Installation**:

1. **Choose Location**
   - Front caster: Good for forward-biased robots
   - Rear caster: Good for motor-heavy rear mounting
   - Should create stable triangle with two drive wheels

2. **Adjust Height**
   ```
   Important: Robot should be LEVEL!
   
   Too low caster:
     [Caster]
        \
      [Motors] ✗ Tilted forward
   
   Correct:
     [Caster]
        |
      [Motors] ✓ Level
   ```

3. **Secure Caster**
   - Use screws if chassis has mounting holes
   - Or use strong double-sided tape/velcro
   - Test: Robot should roll smoothly when pushed

**Test the Rolling Action**:
- Place robot on smooth floor
- Give it a gentle push
- Should roll straight for at least 2 feet
- Should not tip over or drag

### Step 5: Mount Battery Pack

**Battery Pack Placement**

Strategic considerations:
- **Center of gravity** - Keep weight balanced
- **Wire reach** - Must reach motor driver
- **Accessibility** - Need to change batteries easily
- **Safety** - Shouldn't fall off when moving

**Mounting Options**:

```
Option 1: Bottom mount (most common)
- Attach to bottom of chassis with velcro
- Low center of gravity (more stable)
- Keeps top clear for other components

Option 2: Top mount
- Use zip ties or tape on top of chassis
- Easy battery access
- Higher center of gravity (less stable)

Option 3: Rear mount
- Between motors or behind motors
- Good weight distribution
- May interfere with wiring
```

**Installation Steps**:
1. Position battery pack on chosen location
2. Cut velcro to size (rough side on chassis, soft on battery)
3. Press firmly to adhere
4. Test: Shake robot - battery should not move

**Wire Management**:
- Route battery wires to one side
- Use zip tie to secure wire to chassis
- Leave enough slack for access but not dangling

---

## Part 2: Motor Driver Mounting (5 minutes)

### Position the L298N Module

**Placement Considerations**:
- Should be near motors for short wire runs
- Should be accessible for connections
- Won't interfere with wheels or moving parts
- Flat surface for secure mounting

**Recommended Location**:
```
Top view of robot:
    [Battery]
       |
  [L298N Driver]  ← Center, accessible
       |
   [Motor-L] [Motor-R]
```

**Temporary Mounting**:
For now, just position the module - don't secure it yet!
- Place it where you plan to mount
- Test that wires can reach motors
- Verify battery wires reach driver
- Make sure it's not in the way of future sensor mounting

We'll do the wiring next, then permanently mount it.

---

## Part 3: Test Motor Driver Wiring (15 minutes)

### Safety Check FIRST

**CRITICAL**: Before connecting ANYTHING:
1. Remove batteries from battery pack
2. Verify Raspberry Pi is powered OFF
3. Check all connections visually before powering on

### Step 1: Power Connections

**Connect Battery to Motor Driver**

The L298N has a power input section (usually in the middle of the board):

```
L298N Power Section:
+12V ← Battery positive (red wire)
GND  ← Battery negative (black wire)
```

**Connection Steps**:
1. Take RED wire from battery pack → Connect to **+12V** terminal on L298N
2. Take BLACK wire from battery pack → Connect to **GND** terminal on L298N

**For screw terminals**:
- Loosen screw with screwdriver
- Insert wire (strip ~5mm of insulation if needed)
- Tighten screw (not super tight, just snug)

**Verification**:
- Wiggle wires gently - should not come out
- Check polarity: RED to +12V, BLACK to GND
- Power LED on L298N should light up when batteries inserted

### Step 2: Motor Connections

**Identify Motor Terminals**

The L298N has two motor output sections:

```
Motor A (Left motor):        Motor B (Right motor):
OUT1                         OUT3
OUT2                         OUT4
```

**Connect Motors**:

1. **Left Motor → Motor A**
   - Motor wire 1 → OUT1
   - Motor wire 2 → OUT2
   - Polarity doesn't matter yet (we'll fix direction in code)

2. **Right Motor → Motor B**
   - Motor wire 1 → OUT3
   - Motor wire 2 → OUT4

**Wire Colors**:
- Most hobby motors: RED and BLACK wires
- Some motors: RED and BLUE, or other colors
- Color doesn't matter (we'll adjust direction in code)

**Secure Connections**:
- For screw terminals: Tighten screws snugly
- Test by tugging gently on wires
- Use zip ties to strain-relieve wires

### Step 3: Quick Motor Test (Without Pi)

**Test with Direct Battery Power**:

Some L298N boards have jumpers that allow direct testing:

1. **Check for EN jumpers** (ENA and ENB)
   - These enable the motor drivers
   - Should have jumpers installed (small plastic caps connecting two pins)
   - If missing, motors won't run

2. **Temporarily Bridge Control Pins** (CAREFULLY!)
   ```
   To test LEFT motor:
   - Touch a wire from +5V or +12V to IN1
   - Touch a wire from GND to IN2
   - Motor should spin!
   
   To test RIGHT motor:
   - Touch a wire from +5V or +12V to IN3
   - Touch a wire from GND to IN4
   - Motor should spin!
   ```

   **⚠️ CAUTION**: Only touch briefly! Don't short +12V to GND!

3. **Observe**:
   - Motors should spin
   - If not, check connections
   - If spinning backwards, don't worry (we'll fix in code)

**Safety Note**: If you're not comfortable with this direct test, skip it and test with Raspberry Pi code instead.

---

## Part 4: Raspberry Pi Control Connections (10 minutes)

### Important Power Rule

**CRITICAL SAFETY**:
```
❌ DO NOT connect Raspberry Pi to motor driver +5V output
❌ Connecting Pi power to motor driver can damage your Pi

✓ Motors get power from battery
✓ Raspberry Pi gets power from wall adapter (or second battery)
✓ Only GPIO control signals connect between Pi and motor driver
```

### Control Signal Connections

**Connections from L298N → Raspberry Pi GPIO**

```
Motor A (Left Motor):
IN1  → GPIO 17
IN2  → GPIO 27
ENA  → GPIO 12 (PWM capable)

Motor B (Right Motor):
IN3  → GPIO 22
IN4  → GPIO 23
ENB  → GPIO 13 (PWM capable)

Common Ground (CRITICAL!):
GND  → Raspberry Pi GND (physical pin 6, 9, 14, 20, 25, 30, 34, or 39)
```

**Why Common Ground Matters**:
- Digital signals are measured as voltage differences
- Without common ground, "HIGH" and "LOW" are meaningless
- This is THE most common beginner mistake
- Symptoms of missing common ground: erratic behavior, nothing works

**Connection Steps**:

1. **Prepare Jumper Wires**
   - Need 7 wires total (6 control + 1 ground)
   - Female-to-Female if using GPIO pins directly
   - Male-to-Female if using breadboard

2. **Connect Control Signals**
   ```
   L298N Pin → Jumper Wire → Raspberry Pi Pin
   IN1 → Wire 1 → GPIO 17 (physical pin 11)
   IN2 → Wire 2 → GPIO 27 (physical pin 13)
   ENA → Wire 3 → GPIO 12 (physical pin 32)
   IN3 → Wire 4 → GPIO 22 (physical pin 15)
   IN4 → Wire 5 → GPIO 23 (physical pin 16)
   ENB → Wire 6 → GPIO 13 (physical pin 33)
   ```

3. **Connect Common Ground**
   ```
   L298N GND → Wire 7 → Raspberry Pi GND (physical pin 6)
   ```

**Pin Reference** (print this and keep with robot):
```
==================================
MOTOR CONTROL PIN ASSIGNMENT
==================================
LEFT MOTOR (Motor A):
  Direction: GPIO 17, GPIO 27
  Speed:     GPIO 12 (PWM)

RIGHT MOTOR (Motor B):
  Direction: GPIO 22, GPIO 23
  Speed:     GPIO 13 (PWM)

GROUND: Pi GND to L298N GND
==================================
```

### Wire Management

**Secure All Wires**:
1. Route wires along chassis edges
2. Use zip ties every 3-4 inches
3. Keep wires away from wheels
4. Leave some slack (robot needs to move!)
5. Label wires with tape if helpful

**Check Your Work**:
- [ ] Battery connected to motor driver power
- [ ] Motors connected to motor outputs
- [ ] GPIO pins connected to control inputs
- [ ] COMMON GROUND connected
- [ ] No loose wires near wheels
- [ ] All connections are snug

---

## Part 5: Motor Test Code (On Blocks!)

### Safety: Test on Blocks First

**⚠️ IMPORTANT**: Before testing motors:
1. Place robot on blocks, books, or box
2. Wheels should NOT touch ground
3. This prevents robot from driving away during testing!

### Test Code

Create a file: `motor_test.py`

```python
#!/usr/bin/env python3
"""
Simple motor test for line following robot
Tests both motors individually and together
"""

import RPi.GPIO as GPIO
import time

# Pin definitions
LEFT_IN1 = 17
LEFT_IN2 = 27
LEFT_ENA = 12

RIGHT_IN1 = 22
RIGHT_IN2 = 23
RIGHT_ENB = 13

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Configure pins
GPIO.setup(LEFT_IN1, GPIO.OUT)
GPIO.setup(LEFT_IN2, GPIO.OUT)
GPIO.setup(LEFT_ENA, GPIO.OUT)

GPIO.setup(RIGHT_IN1, GPIO.OUT)
GPIO.setup(RIGHT_IN2, GPIO.OUT)
GPIO.setup(RIGHT_ENB, GPIO.OUT)

# Create PWM objects (1000 Hz)
left_pwm = GPIO.PWM(LEFT_ENA, 1000)
right_pwm = GPIO.PWM(RIGHT_ENB, 1000)

# Start PWM (0% duty cycle = stopped)
left_pwm.start(0)
right_pwm.start(0)

def test_left_forward():
    """Test left motor forward"""
    print("Testing LEFT motor FORWARD...")
    GPIO.output(LEFT_IN1, GPIO.HIGH)
    GPIO.output(LEFT_IN2, GPIO.LOW)
    left_pwm.ChangeDutyCycle(70)
    time.sleep(2)
    left_pwm.ChangeDutyCycle(0)
    print("  LEFT motor should have spun forward!")
    time.sleep(1)

def test_left_backward():
    """Test left motor backward"""
    print("Testing LEFT motor BACKWARD...")
    GPIO.output(LEFT_IN1, GPIO.LOW)
    GPIO.output(LEFT_IN2, GPIO.HIGH)
    left_pwm.ChangeDutyCycle(70)
    time.sleep(2)
    left_pwm.ChangeDutyCycle(0)
    print("  LEFT motor should have spun backward!")
    time.sleep(1)

def test_right_forward():
    """Test right motor forward"""
    print("Testing RIGHT motor FORWARD...")
    GPIO.output(RIGHT_IN1, GPIO.HIGH)
    GPIO.output(RIGHT_IN2, GPIO.LOW)
    right_pwm.ChangeDutyCycle(70)
    time.sleep(2)
    right_pwm.ChangeDutyCycle(0)
    print("  RIGHT motor should have spun forward!")
    time.sleep(1)

def test_right_backward():
    """Test right motor backward"""
    print("Testing RIGHT motor BACKWARD...")
    GPIO.output(RIGHT_IN1, GPIO.LOW)
    GPIO.output(RIGHT_IN2, GPIO.HIGH)
    right_pwm.ChangeDutyCycle(70)
    time.sleep(2)
    right_pwm.ChangeDutyCycle(0)
    print("  RIGHT motor should have spun backward!")
    time.sleep(1)

def test_both_forward():
    """Test both motors forward"""
    print("Testing BOTH motors FORWARD...")
    GPIO.output(LEFT_IN1, GPIO.HIGH)
    GPIO.output(LEFT_IN2, GPIO.LOW)
    GPIO.output(RIGHT_IN1, GPIO.HIGH)
    GPIO.output(RIGHT_IN2, GPIO.LOW)
    left_pwm.ChangeDutyCycle(70)
    right_pwm.ChangeDutyCycle(70)
    time.sleep(2)
    left_pwm.ChangeDutyCycle(0)
    right_pwm.ChangeDutyCycle(0)
    print("  Both motors should have spun forward!")
    time.sleep(1)

# Main test sequence
try:
    print("=" * 40)
    print("MOTOR TEST PROGRAM")
    print("=" * 40)
    print("\n⚠️  MAKE SURE ROBOT IS ON BLOCKS!")
    print("Press Ctrl+C to stop\n")
    time.sleep(3)
    
    # Run tests
    test_left_forward()
    test_left_backward()
    test_right_forward()
    test_right_backward()
    test_both_forward()
    
    print("\n" + "=" * 40)
    print("Testing complete!")
    print("=" * 40)
    
    # Observations
    print("\nCheck the following:")
    print("1. Did both motors spin?")
    print("2. Did forward/backward work correctly?")
    print("3. Are the wheel directions correct?")
    print("\nIf a motor spun backward when it should go")
    print("forward, we'll fix it in the code later.")
    
except KeyboardInterrupt:
    print("\n\nTest stopped by user")

finally:
    # Cleanup
    left_pwm.stop()
    right_pwm.stop()
    GPIO.cleanup()
    print("GPIO cleanup complete")
```

### Run the Test

```bash
python3 motor_test.py
```

**Watch the motors!**
- Left wheel should spin during left motor tests
- Right wheel should spin during right motor tests
- Both should spin during both motor test
- Note any issues in your lab notebook

---

## Troubleshooting

### Motor Doesn't Spin

**Check**:
1. Battery installed? Powered on?
2. Motor driver LED on?
3. Motor connections secure?
4. Control pins connected to correct GPIO?
5. Common ground connected?
6. EN jumper installed on motor driver?

**Test**:
- Try swapping to different motor output terminals
- Check motor directly with battery (touch wires)
- Verify GPIO pins work with LED test

### Motor Spins Wrong Direction

**Not a problem!** Two solutions:

**Option 1: Swap motor wires**
- Disconnect motor from OUT1/OUT2
- Swap wires (OUT1 → OUT2, OUT2 → OUT1)

**Option 2: Fix in code**
```python
# Instead of:
GPIO.output(IN1, HIGH)
GPIO.output(IN2, LOW)

# Use:
GPIO.output(IN1, LOW)
GPIO.output(IN2, HIGH)
```

### Both Motors Spin at Different Speeds

**Normal!** Hobby motors vary slightly.

**Solutions**:
1. Adjust in code:
```python
# If left motor slower:
left_pwm.ChangeDutyCycle(75)
right_pwm.ChangeDutyCycle(70)
```

2. Or buy matched motors (more expensive)

### Motor Stutters or Stops

**Possible Causes**:
1. Weak batteries → Replace with fresh
2. Motor stalling → Check wheel not rubbing
3. Poor connection → Re-check wiring
4. Overheating → Let cool down, reduce speed

### Raspberry Pi Reboots When Motors Start

**CRITICAL ISSUE**: 
- Motors drawing too much current from Pi
- **Verify**: Motor power from battery, NOT from Pi
- **Verify**: Only signal wires connect to Pi GPIO
- **Never**: Connect motor driver +5V to Pi 5V

---

## Success Criteria

At the end of this activity, you should have:

- [ ] Fully assembled robot chassis
- [ ] Motors securely mounted
- [ ] Wheels attached and aligned
- [ ] Caster wheel installed (robot rolls smoothly)
- [ ] Battery pack mounted securely
- [ ] Motor driver positioned (not permanently mounted yet)
- [ ] All wiring completed and secured
- [ ] Common ground connected between Pi and driver
- [ ] Both motors tested and working
- [ ] Direction of motors verified (or noted for code fix)
- [ ] Robot ready for sensor installation

---

## Next Steps

With your robot's mechanical and motor systems working:
1. **Next Activity**: Install and test line sensors
2. **Then**: Combine motors and sensors for line following
3. **Finally**: Test on actual track and tune performance

**Document Your Build**:
- Take photos of your wired robot
- Note any pin changes you made
- Record motor directions (for future reference)
- Write down any issues and solutions

**Keep Your Robot Safe**:
- Remove batteries when not testing
- Store in safe place where it won't get bumped
- Keep wheels off ground when stored

---

## Bonus Challenges

If you finish early:

1. **Add Status LED**
   - Connect LED to GPIO 25
   - Blink LED when motors are active
   - Helps with debugging

2. **Create Motor Control Functions**
   - Write `move_forward(speed)` function
   - Write `turn_left(sharpness)` function
   - Write `turn_right(sharpness)` function
   - Write `stop()` function

3. **Test Differential Steering**
   - Make robot turn by running motors at different speeds
   - Try gradual turns vs. sharp pivots
   - Measure turning radius at different speed ratios

---

**Great work!** Your robot's foundation is complete. Next, we'll add the "eyes" (sensors) so it can see the line! 👀🤖
