# Week 6 Resources: Motor Control Reference

## Motor Specifications Guide

### Understanding Motor Ratings

#### Voltage Rating
**What it means**: The electrical pressure the motor is designed for

**Common ratings**: 3V, 5V, 6V, 12V

**Effects of voltage**:
- **Below rated voltage**: Motor runs slower, less torque
- **At rated voltage**: Optimal performance
- **Above rated voltage**: Faster speed, but overheating risk and shorter lifespan

**Example**: A 3-6V motor
- At 3V: Slow, gentle operation
- At 4.5V: Good medium speed
- At 6V: Maximum speed and power
- At 9V+: Motor overheats and damages

#### Current Rating
**What it means**: Amount of electrical flow the motor uses

**Two important values**:
1. **No-load current**: Current when spinning freely (50-150mA typical)
2. **Stall current**: Current when motor blocked/stuck (500-1500mA typical)

**Why it matters**:
- GPIO provides only ~16mA (not enough!)
- Motor driver must handle stall current
- Battery pack must provide required current
- Stall current can be 10-20x no-load current

#### RPM (Revolutions Per Minute)
**What it means**: How fast the motor shaft spins

**Typical ranges**:
- Low speed: 50-100 RPM (high torque)
- Medium speed: 100-200 RPM (balanced)
- High speed: 200-500 RPM (low torque)
- Very high speed: 1000+ RPM (very low torque)

**Relationship**: RPM × Torque = roughly constant
- High RPM → Low torque (spins fast, weak force)
- Low RPM → High torque (spins slow, strong force)

#### Torque
**What it means**: Rotational force the motor can apply

**Units**:
- Newton-meters (N·m) - metric
- Ounce-inches (oz-in) - imperial
- Kilogram-centimeters (kg-cm) - common for hobby motors

**Typical hobby motor**: 0.5-5 kg-cm

**What it affects**:
- Can motor lift a weight?
- Can motor climb a hill?
- Can motor overcome friction?

**Example**: 2 kg-cm torque can lift 2kg at 1cm radius (or 1kg at 2cm radius)

---

## L298N Motor Driver Specifications

### Module Overview
- **Part Number**: L298N Dual H-Bridge Motor Driver
- **Voltage Range**: 5V - 35V (typical use: 6-12V)
- **Current per Channel**: Up to 2A continuous, 3A peak
- **Number of Motors**: 2 independent motors (or 1 stepper motor)
- **Logic Voltage**: 3.3V or 5V compatible (works with Raspberry Pi)
- **Protection**: Over-current, over-temperature
- **Size**: ~55mm × 45mm × 30mm

### Pin Descriptions

**Power Pins**:
- **+12V**: Motor power input (6-35V, typically 6-12V)
- **GND**: Ground (connect to battery - AND Pi GND)
- **+5V**: 5V output from onboard regulator (500mA max, optional)

**Motor A Controls**:
- **ENA**: Enable/speed control (PWM) for Motor A
- **IN1**: Direction control bit 1 for Motor A
- **IN2**: Direction control bit 2 for Motor A
- **OUT1**: Motor A output terminal 1
- **OUT2**: Motor A output terminal 2

**Motor B Controls**:
- **ENB**: Enable/speed control (PWM) for Motor B
- **IN3**: Direction control bit 1 for Motor B
- **IN4**: Direction control bit 2 for Motor B
- **OUT3**: Motor B output terminal 1
- **OUT4**: Motor B output terminal 2

### Enable Jumper Function
**Jumper Installed** (default):
- Enable pins connected to 5V internally
- Motors run at full speed when direction set
- Cannot control speed via PWM
- Use for: Simple on/off applications

**Jumper Removed**:
- Enable pins controlled by external GPIO
- Can apply PWM for speed control
- Essential for variable speed applications
- Use for: Precise speed control

### Heat Sink Notes
- Large aluminum heat sink on top
- Gets warm during operation (normal)
- Should be touchable (not burning hot)
- If too hot: Check for shorts, reduce duty cycle, check motor current

---

## Battery Power Guide

### Battery Types for Motors

#### Alkaline AA Batteries
- **Voltage per cell**: 1.5V
- **4x AA in series**: 6V
- **Capacity**: 2000-3000mAh typical
- **Pros**: Readily available, inexpensive
- **Cons**: Voltage drops as they discharge, not rechargeable
- **Best for**: Testing, short-term projects

#### Rechargeable NiMH AA Batteries
- **Voltage per cell**: 1.2V (lower than alkaline!)
- **4x AA in series**: 4.8V
- **Capacity**: 2000-2500mAh typical
- **Pros**: Rechargeable, maintain voltage better
- **Cons**: Lower voltage, need charger
- **Best for**: Frequent use, longer projects

#### LiPo (Lithium Polymer) Batteries
- **Voltage per cell**: 3.7V nominal (4.2V fully charged)
- **2S LiPo**: 7.4V nominal (8.4V fully charged)
- **Capacity**: 1000-5000mAh common
- **Pros**: High capacity, lightweight, maintains voltage
- **Cons**: Requires special charger, safety concerns if damaged
- **Best for**: Advanced projects, mobile robots

### Battery Life Calculations

**Example Motor**: 200mA average current

**With 2500mAh battery pack**:
```
Runtime = Battery Capacity / Motor Current
Runtime = 2500mAh / 200mA
Runtime = 12.5 hours (theoretical maximum)
```

**Reality**:
- Voltage drops as battery discharges
- Motor draws more current as voltage drops
- Actual runtime: 60-70% of theoretical
- Practical runtime: 7-9 hours for this example

**Multiple Motors**:
- 2 motors × 200mA each = 400mA total
- 2500mAh / 400mA = 6.25 hours theoretical
- Practical: 3.5-4.5 hours

### Power Supply Selection Guide

**For testing/learning (this week)**:
- 4x AA battery holder (alkaline or NiMH)
- 6V or 4.8V output
- Simple, safe, readily available

**For mobile robot**:
- 2S LiPo battery (7.4V)
- 1000-2000mAh capacity
- Lighter weight, longer runtime

**For stationary project**:
- DC power adapter (6V or 12V)
- 2A or higher current rating
- No batteries to replace

---

## PWM Frequency Guide

### Why Frequency Matters

**PWM switches motor on/off rapidly**:
- Too slow: Motor stutters, audible buzzing
- Too fast: Switching losses in driver, less efficiency
- Just right: Smooth operation, quiet running

### Recommended Frequencies

**For DC motors**: 1000 Hz (1 kHz)
- Most versatile
- Works well with variety of motors
- Good balance of smoothness and efficiency

**Alternative frequencies**:
- **500 Hz**: Older/larger motors, lower switching losses
- **2000 Hz**: Small/fast motors, smoother operation
- **5000 Hz**: Very small motors, minimal audible noise

**Experimenting**:
```python
# Try different frequencies
pwm = GPIO.PWM(ENA, 500)   # 500 Hz
pwm = GPIO.PWM(ENA, 1000)  # 1000 Hz (recommended)
pwm = GPIO.PWM(ENA, 2000)  # 2000 Hz
pwm = GPIO.PWM(ENA, 5000)  # 5000 Hz
```

Listen for:
- Smoothness of operation
- Audible buzzing or whining
- Motor response at low speeds

---

## Troubleshooting Guide

### Motor Won't Spin At All

**Check power supply**:
- [ ] Battery pack has fresh batteries
- [ ] Battery voltage ~6V (measure with multimeter)
- [ ] Motor driver power LED is ON
- [ ] Battery connected to driver 12V and GND terminals

**Check common ground**:
- [ ] Motor driver GND connected to battery -
- [ ] Motor driver GND connected to Pi GND
- [ ] This is the #1 forgotten connection!

**Check motor connections**:
- [ ] Motor wires in OUT1 and OUT2 terminals
- [ ] Terminal screws tight
- [ ] Test motor directly with battery (bypass driver)

**Check GPIO connections**:
- [ ] IN1 connected to correct GPIO pin
- [ ] IN2 connected to correct GPIO pin
- [ ] ENA connected to correct GPIO pin
- [ ] Pin numbers match code (BCM mode?)

**Check code**:
- [ ] GPIO.setmode(GPIO.BCM) called
- [ ] Pins set as OUTPUT
- [ ] Direction set correctly (IN1/IN2)
- [ ] Enable set HIGH or PWM running

### Motor Spins One Direction Only

**Possible causes**:
1. IN1 or IN2 not connected properly
2. Wrong GPIO pin in code
3. Motor driver channel damaged

**Troubleshooting steps**:
```python
# Test IN1 and IN2 independently
GPIO.output(IN1, True)
GPIO.output(IN2, False)
time.sleep(2)
# Swap
GPIO.output(IN1, False)
GPIO.output(IN2, True)
time.sleep(2)
```

If one direction works but not other:
- Check the non-working direction's GPIO connection
- Verify that GPIO pin not damaged (test with LED)
- May have damaged motor driver channel

### Motor Only Runs at Full Speed

**Most common cause**: Enable jumper still installed

**Solution**:
1. Power off everything
2. Locate enable jumper near ENA pin
3. Remove jumper cap
4. Restart and test PWM

**Verify PWM is working**:
```python
# Test PWM with LED first
pwm = GPIO.PWM(22, 1000)  # ENA pin
pwm.start(50)  # 50% duty cycle
# If LED half bright, PWM working
# If LED full bright, check setup
```

**Check code**:
- [ ] PWM object created: `pwm = GPIO.PWM(pin, freq)`
- [ ] PWM started: `pwm.start(0)`
- [ ] Duty cycle changed: `pwm.ChangeDutyCycle(value)`

### Motor Won't Start at Low Speeds

**This is NORMAL behavior!**

**Why**:
- Starting friction > running friction
- Motor needs minimum torque to overcome static friction
- Typical minimum: 30-40% duty cycle

**Solutions**:

**Option 1: Accept limitations**
```python
MIN_SPEED = 30  # Minimum working speed
if speed > 0 and speed < MIN_SPEED:
    speed = MIN_SPEED
pwm.ChangeDutyCycle(speed)
```

**Option 2: Pulse start**
```python
def start_motor_smoothly(target_speed):
    # Start at high speed
    pwm.ChangeDutyCycle(70)
    time.sleep(0.2)
    # Reduce to target
    pwm.ChangeDutyCycle(target_speed)
```

**Option 3: Higher quality motor**
- Better bearings
- Lower friction
- Can start at lower speeds
- More expensive

### Motor Behavior Erratic/Intermittent

**Loose connections** (most common):
- [ ] Check all terminal screws - motors vibrate them loose!
- [ ] Verify jumper wires fully inserted
- [ ] Wiggle connections and watch for changes
- [ ] Secure motor to prevent movement

**Weak batteries**:
- [ ] Measure battery voltage (should be ~6V)
- [ ] Replace with fresh batteries
- [ ] Check battery holder connections
- [ ] Voltage drops under load indicate weak batteries

**Interference/noise**:
- [ ] Add 100µF capacitor across battery terminals (advanced)
- [ ] Keep motor wires away from sensor wires
- [ ] Use shielded cable for long motor wires (advanced)

### Motor Driver Getting Very Hot

**Warm is normal, burning hot is problem!**

**If too hot to touch (>2 seconds)**:

**Check motor current**:
- Motor may draw more current than driver rated for
- Use multimeter to measure motor current
- L298N rated for 2A continuous per channel

**Check for short circuit**:
- Motor wires touching?
- Wires in circuit crossed?
- Damaged insulation?

**Reduce duty cycle**:
- Running at 100% constantly generates most heat
- Try limiting to 80% maximum

**Improve cooling**:
- Add fan (yes, motor-powered fan to cool motor driver!)
- Mount driver vertically for better airflow
- Add heat sink fins (advanced)

### Motor Runs Opposite Direction

**This is NOT a problem!**

**Every motor is wired differently internally**

**Two easy solutions**:

**Solution 1: Swap motor wires**
```
Physical swap:
OUT1 ↔ OUT2 on motor driver
```

**Solution 2: Swap IN1/IN2 in code**
```python
# Change this:
IN1 = 17
IN2 = 27

# To this:
IN1 = 27  # Swapped
IN2 = 17  # Swapped
```

Choose whichever solution is easier for your project!

---

## Advanced Topics (Future Learning)

### Motor Encoders
**What**: Sensor that measures motor rotation
**Why**: Know exact speed and position
**How**: Optical or magnetic sensor counts rotations
**Use**: PID control, odometry for navigation

### H-Bridge ICs
**Alternatives to L298N**:
- **TB6612FNG**: More efficient, smaller, 1A per channel
- **DRV8833**: Very small, 1.5A per channel
- **L293D**: Lower current (600mA), older technology
- **Monster Moto Shield**: Higher current (30A), expensive

### Stepper Motors
**Difference from DC motors**:
- Precise positioning
- Moves in discrete steps
- Doesn't spin continuously without control
- Requires different driver circuit

### Servo Motors
**Difference from DC motors**:
- Built-in position control
- Limited rotation range (typically 0-180°)
- Controlled by PWM pulse width (not duty cycle)
- Used for precise angular positioning

### PID Control
**What**: Proportional-Integral-Derivative controller
**Why**: Maintain constant speed despite load changes
**How**: Feedback loop adjusts PWM based on encoder readings
**Advanced topic**: Requires encoders and significant code

---

## Safety References

### Electrical Safety

**Safe Voltages** (for this course):
- Raspberry Pi: 5V (safe to touch)
- Motor driver: 6-12V (safe to touch)
- Batteries: 6V (safe to touch)
- GPIO: 3.3V (safe to touch)

**Current Safety**:
- Battery packs: Can provide several amps
- Short circuits can generate heat
- Never intentionally short battery terminals
- Use properly rated wire (22-24 AWG fine for hobby motors)

**Fire Safety**:
- Know fire extinguisher location
- LiPo batteries can catch fire if damaged/shorted
- Alkaline batteries safer but can overheat if shorted
- Never leave projects running unattended

### Mechanical Safety

**Rotating Parts**:
- Keep fingers away from spinning motors
- Motor shaft can cause pinch injuries
- Secure motors to prevent them flying off
- Don't try to stop motor by hand

**Sharp Edges**:
- Motor shafts may be sharp
- Terminal screws can scratch
- Heat sink edges can be sharp
- Handle with care

---

## Useful Formulas

### Power Calculations
```
Power (Watts) = Voltage (Volts) × Current (Amps)

Example:
6V motor drawing 200mA
Power = 6V × 0.2A = 1.2W
```

### Battery Runtime
```
Runtime (hours) = Battery Capacity (mAh) / Current Draw (mA)

Example:
2500mAh battery, 250mA motor
Runtime = 2500 / 250 = 10 hours (theoretical)
Actual runtime ≈ 70% of theoretical = 7 hours
```

### Motor Speed Estimation
```
Speed at X% = (X / 100) × Maximum RPM

Example:
200 RPM max speed motor
At 60% duty cycle: 0.6 × 200 = 120 RPM (approximately)
```

### Torque and Force
```
Force = Torque / Radius

Example:
2 kg-cm torque, 3cm wheel radius
Force = 2 / 3 = 0.67 kg force at wheel edge
```

---

## Resources for Further Learning

### Online Resources
- **GPIO Pinout**: https://pinout.xyz
- **L298N Datasheet**: Search "L298N datasheet PDF"
- **RPi.GPIO Documentation**: https://sourceforge.net/projects/raspberry-gpio-python/
- **Motor tutorial videos**: Search "Raspberry Pi motor control"

### Books
- "Raspberry Pi Robotics Projects" by Dr. Richard Grimmett
- "Learn Robotics with Raspberry Pi" by Matt Timmons-Brown
- "Make: Electronics" by Charles Platt

### Communities
- Raspberry Pi Forums: raspberrypi.org/forums
- Reddit: r/raspberry_pi, r/robotics
- Stack Exchange: raspberrypi.stackexchange.com

### Tools to Consider
- **Multimeter**: Essential for debugging ($20-50)
- **Logic analyzer**: See PWM signals ($10-100)
- **Oscilloscope**: Advanced signal viewing ($50-500)
- **Motor encoder**: Measure actual speed ($5-20)

---

## Maintenance Tips

### Motor Care
- Don't run motors continuously at stall (blocked)
- Keep motor vents clear of dust
- Check for bearing wear (grinding noise)
- Replace motors showing poor performance

### Battery Care
- Remove batteries when storing project
- Don't mix old and new batteries
- Dispose of dead batteries properly
- Check for corrosion on contacts

### Motor Driver Care
- Keep heat sink dust-free
- Don't exceed current ratings
- Protect from physical damage
- Store in anti-static bag

### Wire Management
- Use cable ties to organize
- Label wires for easy debugging
- Replace frayed or damaged wires
- Keep wire lengths reasonable (shorter = better)

---

## Component Shopping Guide

### Where to Buy
- **Adafruit**: High quality, tutorials, support
- **SparkFun**: Good selection, learning resources
- **Amazon**: Fast shipping, variety of brands
- **eBay/AliExpress**: Cheapest, longer shipping
- **Local electronics store**: Immediate availability, support

### What to Buy for Home Lab
**Essential**:
- [ ] Extra motors (2-3 spares)
- [ ] Extra motor driver (1 spare)
- [ ] Extra battery packs
- [ ] Rechargeable batteries and charger
- [ ] Jumper wire assortment

**Nice to have**:
- [ ] Multimeter
- [ ] Motor mounting brackets
- [ ] Wheels for motors
- [ ] Robot chassis kit
- [ ] Assorted sensors

**Price range**: $30-60 for complete motor control kit

---

**Keep this reference handy throughout Week 6 and beyond!**

**When troubleshooting: Start with the basics (power, ground, connections) before assuming complex problems. 90% of motor issues are wiring!**
