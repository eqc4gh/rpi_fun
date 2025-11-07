# Week 6 Lecture Notes: Motors & Movement

## Lecture Duration: 40 minutes (split into two sections)
## Topics: DC Motors, Motor Drivers, PWM Speed Control, Direction Control

---

## Section 1: Motor Theory & Safety (25 minutes)

### Introduction (2 minutes)

**Opening Question**: "What's the difference between a computer that sits on a desk and a robot?"

**Answer**: MOVEMENT! Robots can act on the physical world.

**This Week's Goal**: Make things MOVE with motors!

---

### What is a DC Motor? (5 minutes)

#### Definition
**DC Motor**: Device that converts Direct Current (DC) electrical energy into rotational mechanical energy

**Key Characteristics**:
- Runs on DC power (not AC from wall outlets)
- Continuous rotation (unlike servos with limited range)
- Speed proportional to voltage
- Direction reversible by reversing polarity

#### How DC Motors Work (Simplified)

**Basic Principle**: Electromagnetism

```
Inside a DC Motor:

1. Permanent magnets (North and South poles)
2. Coil of wire (electromagnet)
3. Commutator (switches current direction)
4. Brushes (conduct current to spinning coil)

When current flows:
- Coil becomes electromagnet
- Attracted to/repelled by permanent magnets
- Commutator switches polarity as it spins
- Continuous rotation!
```

**Visual Demo**: Show physical motor, point out shaft, case, terminals

**Key Point**: "You don't need to understand the physics deeply - just know: Electricity goes in, rotation comes out!"

---

### Motor Specifications (3 minutes)

#### Important Motor Parameters

**1. Voltage Rating (V)**
- Example: 3-6V motor
- Lower voltage = slower speed
- Higher voltage = faster speed
- Exceeding max voltage damages motor

**2. Current Draw (A or mA)**
- Example: 200-500mA typical for small motors
- More current = more torque (turning force)
- Stall current higher than running current

**3. RPM (Revolutions Per Minute)**
- How fast motor spins
- Example: 100-200 RPM for hobby motors
- Varies with voltage and load

**4. Torque**
- Rotational force motor can apply
- Measured in N·m (Newton-meters) or oz-in
- Higher torque = can turn heavier loads
- Trade-off: High RPM = low torque, High torque = low RPM

**5. Stall Current**
- Current when motor blocked from turning
- Much higher than running current
- Can damage motor or power supply
- Why we need current protection

#### Reading Motor Labels

Show example motor:
- Voltage: 3-6V DC
- No-load current: 70mA
- Stall current: 800mA
- No-load speed: 200 RPM

**Explain**: "No-load" means nothing connected to shaft (free spinning)

---

### The GPIO Current Problem (5 minutes)

#### Why We Can't Connect Motors Directly to GPIO

**Demonstration** (draw on board):

```
Raspberry Pi GPIO Pin:
- Voltage: 3.3V
- Maximum current: ~16mA per pin
- Total for all GPIO: ~50mA

Small DC Motor:
- Voltage: 3-6V (OK voltage-wise!)
- Running current: 200-500mA
- Stall current: 800-1200mA

Problem: Motor needs 15-75 TIMES more current than GPIO can provide!
```

**What Happens If You Connect Motor to GPIO?**
1. GPIO pin draws too much current
2. Pin overheats instantly
3. Internal transistor burns out
4. GPIO pin (or entire Pi) DIES ☠️
5. No fixing it - hardware damage is permanent

**Visual Analogy**:
```
GPIO pin = Garden hose
Motor = Fire hose
You can't get fire hose power from a garden hose!

Need: FIRE HYDRANT (Motor Driver)
```

---

### Motor Drivers: The Solution (5 minutes)

#### What is a Motor Driver?

**Definition**: Electronic circuit that amplifies low-power control signals into high-power motor control

**Three Jobs of Motor Driver**:
1. **Signal translation**: Takes GPIO HIGH/LOW signals
2. **Power amplification**: Controls high current from battery
3. **Protection**: Keeps Pi safe from motor current

**Diagram** (draw on board):
```
                    ┌─────────────────┐
Raspberry Pi ─────→ │                 │
(tiny signals)      │  Motor Driver   │ ─────→ Motor
                    │                 │        (powerful motion)
                    │  (Translator &  │
Battery Pack  ─────→ │   Amplifier)    │
(lots of power)     └─────────────────┘
```

#### The L298N Motor Driver

**Why L298N?**
- Common and affordable ($3-5)
- Controls 2 motors independently
- Easy to understand and wire
- Built-in protection features
- Handles 6-12V and up to 2A per channel
- Has heat sink (stays cool-ish)

**Physical Components** (show real module):

**Input Side** (from Raspberry Pi):
- IN1, IN2: Direction control for Motor A
- IN3, IN4: Direction control for Motor B
- ENA, ENB: Enable/speed control (PWM)

**Output Side** (to Motors):
- OUT1, OUT2: Motor A connections
- OUT3, OUT4: Motor B connections

**Power**:
- 12V terminal: Battery positive (+)
- GND terminal: Battery negative (-) AND Pi GND
- 5V output: Optional 5V supply (from voltage regulator)

**Enable Jumpers**:
- Jumper ON: Motor always enabled (full speed)
- Jumper OFF: Enable controlled by GPIO (PWM for speed control)

---

### H-Bridge Concept (5 minutes)

#### How Motor Drivers Control Direction

**Problem**: Motor direction controlled by polarity
- Current one way → Spins clockwise
- Current reversed → Spins counter-clockwise
- But batteries are fixed polarity!

**Solution**: H-Bridge circuit

**Simple Explanation**:
"Imagine 4 switches arranged in an 'H' pattern. By opening and closing different switches, you can make current flow through the motor in either direction."

**Visual** (draw on board):
```
    Battery +
        |
    [SW1] [SW2]
        | |
    Motor
        | |
    [SW3] [SW4]
        |
    Battery -

Forward:
SW1 ON, SW4 ON (SW2 OFF, SW3 OFF)
Current flows: Battery + → SW1 → Motor → SW4 → Battery -

Reverse:
SW2 ON, SW3 ON (SW1 OFF, SW4 OFF)
Current flows: Battery + → SW2 → Motor → SW3 → Battery -

Stop (Coast):
All switches OFF
Motor disconnected, freewheels

Stop (Brake):
SW1 ON, SW2 ON (or SW3 ON, SW4 ON)
Motor terminals shorted, resists turning
```

**L298N Does This Automatically!**
- IN1 and IN2 control which "switches" close
- We don't wire switches manually
- Just set GPIO HIGH/LOW

**Truth Table** (write on board, have students copy):
```
IN1  IN2  Result
---  ---  -----------
HIGH LOW  Forward
LOW  HIGH Reverse
LOW  LOW  Stop (coast)
HIGH HIGH Stop (brake)
```

---

### Critical Safety Rules (5 minutes)

#### Electrical Safety

**Rule 1: Separate Power Supplies**
```
CORRECT:
Pi has own 5V adapter
Motor has own 6V battery pack
Common ground connects them

WRONG:
Trying to power motor from Pi's 5V supply
(Not enough current! Will crash Pi or damage power supply)
```

**Rule 2: Common Ground is MANDATORY**
```
Without common ground:
- No reference voltage
- Signals meaningless
- Motor won't work

With common ground:
- Pi and motor driver share voltage reference
- GPIO signals interpreted correctly
- System works!
```

**Rule 3: Check Polarity**
```
Battery connections:
Red wire → + terminal (12V on L298N)
Black wire → - terminal (GND on L298N)

Wrong polarity = Smoke and sadness
```

#### Physical Safety

**Rule 4: Secure Your Motor**
- Motors vibrate and can "walk" off table
- Spinning motors can catch loose wires
- Use tape, clamps, or fixtures
- Keep fingers clear of spinning parts

**Rule 5: Disconnect Power When Not Testing**
- Batteries drain quickly with motors
- Prevents accidental motor start
- Reduces risk during circuit changes
- Prolongs battery life

#### Programming Safety

**Rule 6: Always Cleanup GPIO**
```python
try:
    # Motor control code
    pass
except KeyboardInterrupt:
    print("Stopping...")
finally:
    GPIO.cleanup()  # ALWAYS cleanup!
```

**Rule 7: Stop Before Direction Change**
```python
# WRONG (can damage motor):
set_motor('forward', 100)
set_motor('reverse', 100)  # Instant reverse!

# RIGHT:
set_motor('forward', 100)
time.sleep(0.5)
set_motor('coast', 0)      # Stop first
time.sleep(0.5)
set_motor('reverse', 100)  # Then reverse
```

---

## Section 2: PWM Speed Control (15 minutes)

### PWM Review from Week 4 (3 minutes)

**Quick Recap**:
- PWM = Pulse Width Modulation
- Signal rapidly switches ON and OFF
- Duty cycle = Percentage of time signal is HIGH
- Frequency = How many times per second it switches

**LED Brightness (Week 4)**:
```
0% duty cycle → LED off (always LOW)
50% duty cycle → LED half bright (half time ON)
100% duty cycle → LED full bright (always HIGH)
```

**Why It Works**: Human eye averages the flashing, sees intermediate brightness

---

### Applying PWM to Motors (4 minutes)

**Same Principle, New Application!**

**Motor Speed with PWM**:
```
0% duty cycle → Motor stopped (no average voltage)
25% duty cycle → Motor slow (1/4 average voltage)
50% duty cycle → Motor medium (1/2 average voltage)
75% duty cycle → Motor fast (3/4 average voltage)
100% duty cycle → Motor full speed (max average voltage)
```

**Why It Works**: Motor's inductance (coils) smooths out pulses, responds to average voltage

**Visual Demonstration** (if possible):
- Show motor at different duty cycles
- Students can hear pitch change with speed
- Motor hum gets higher pitched at higher speeds

**PWM Frequency for Motors**:
- LED: 100-1000 Hz (human eye perception)
- Motor: 1000-2000 Hz (mechanical inertia)
- Too low: Motor stutters/vibrates audibly
- Too high: Switching losses in driver
- Sweet spot: 1000 Hz (1 kHz)

---

### Implementing Speed Control (4 minutes)

#### Enable Pin Function

**Enable Pin (ENA/ENB)**:
- Acts as master ON/OFF switch for motor
- Controls whether H-bridge is active
- Perfect for PWM speed control!

**Two Operating Modes**:

**Mode 1: Jumper Installed (Full Speed)**
```
Enable pin connected to 5V internally
Motor runs at full speed when direction set
No speed control possible
Use for: Simple on/off applications
```

**Mode 2: Jumper Removed (PWM Control)**
```
Enable pin controlled by GPIO
Apply PWM to enable pin
Motor speed varies with duty cycle
Use for: Variable speed applications
```

#### Code Example

```python
# Setup PWM on enable pin
ENA = 22  # Enable pin for Motor A
pwm = GPIO.PWM(ENA, 1000)  # 1000 Hz frequency
pwm.start(0)  # Start at 0% (stopped)

# Set direction (example: forward)
GPIO.output(IN1, True)
GPIO.output(IN2, False)

# Control speed
pwm.ChangeDutyCycle(0)    # Stopped
pwm.ChangeDutyCycle(25)   # 25% speed
pwm.ChangeDutyCycle(50)   # 50% speed
pwm.ChangeDutyCycle(75)   # 75% speed
pwm.ChangeDutyCycle(100)  # Full speed
```

**Key Point**: Direction (IN1/IN2) and Speed (ENA) are INDEPENDENT!

---

### Speed Control Considerations (4 minutes)

#### Starting Friction

**Problem**: Motors don't start spinning at low duty cycles

**Why?**
- Static friction > kinetic friction
- Motor needs minimum torque to overcome bearing friction
- Typical minimum: 30-40% duty cycle to start
- Once spinning: Can maintain lower speeds (20-30%)

**Solution Strategies**:

**Strategy 1: Pulse Start**
```python
def start_motor_smoothly(target_speed):
    # Start at high speed
    pwm.ChangeDutyCycle(60)
    time.sleep(0.2)
    # Reduce to target
    pwm.ChangeDutyCycle(target_speed)
```

**Strategy 2: Accept Limitations**
```python
# Enforce minimum speed
if speed > 0 and speed < 30:
    speed = 30  # Minimum working speed
pwm.ChangeDutyCycle(speed)
```

#### Gradual Speed Changes

**Professional Technique**: Ramp speed instead of instant changes

**Instant Change** (jerky):
```python
pwm.ChangeDutyCycle(20)
pwm.ChangeDutyCycle(80)  # Sudden jump!
```

**Gradual Ramp** (smooth):
```python
for speed in range(20, 81, 5):  # 20 to 80 by 5
    pwm.ChangeDutyCycle(speed)
    time.sleep(0.1)  # 0.1s at each speed
```

**Benefits**:
- Looks more professional
- Reduces mechanical stress on motor
- Smoother current draw from battery
- Better user experience

#### Motor Load Effects

**Unloaded vs Loaded Motor**:
```
50% duty cycle, no load → Spins at ~50% max RPM
50% duty cycle, with load → Spins at ~30% max RPM

Why? Motor draws more current under load, voltage drops
```

**Advanced Topic** (preview): PID control maintains constant speed regardless of load

---

### Combining Direction and Speed (4 minutes)

#### Complete Motor Control Function

**Design Pattern**:
```python
def set_motor(direction, speed):
    """
    Complete motor control
    
    Args:
        direction: 'forward', 'reverse', 'coast', 'brake'
        speed: 0-100 (percentage)
    """
    if direction == 'forward':
        GPIO.output(IN1, True)
        GPIO.output(IN2, False)
        pwm.ChangeDutyCycle(speed)
    elif direction == 'reverse':
        GPIO.output(IN1, False)
        GPIO.output(IN2, True)
        pwm.ChangeDutyCycle(speed)
    elif direction == 'coast':
        GPIO.output(IN1, False)
        GPIO.output(IN2, False)
        pwm.ChangeDutyCycle(0)
    elif direction == 'brake':
        GPIO.output(IN1, True)
        GPIO.output(IN2, True)
        pwm.ChangeDutyCycle(0)

# Usage:
set_motor('forward', 75)   # 75% forward
set_motor('reverse', 50)   # 50% reverse
set_motor('coast', 0)      # Stop (coast)
set_motor('brake', 0)      # Stop (brake)
```

#### State Machine for Motor Control

**Concept**: Motor has distinct states, button/sensor triggers transitions

**Example States**:
```
State 0: Stopped
State 1: Slow Forward (30%)
State 2: Medium Forward (60%)
State 3: Fast Forward (90%)
State 4: Slow Reverse (30%)
State 5: Fast Reverse (90%)

Button press → Advance to next state
```

**Implementation**:
```python
states = [
    ('coast', 0),      # State 0
    ('forward', 30),   # State 1
    ('forward', 60),   # State 2
    ('forward', 90),   # State 3
    ('reverse', 30),   # State 4
    ('reverse', 90),   # State 5
]
current_state = 0

# On button press:
current_state = (current_state + 1) % len(states)
direction, speed = states[current_state]
set_motor(direction, speed)
```

**Benefits**:
- Organized code structure
- Easy to add/remove states
- Clear behavior definition
- Simple to debug

---

## Real-World Applications (5 minutes at end)

### Where Motor Control is Used

**Robotics**:
- Mobile robots (differential drive)
- Robotic arms (joint control)
- Drones (precise speed control)
- Underwater ROVs

**Automation**:
- Conveyor belts (material handling)
- 3D printers (axis movement)
- CNC machines (precise positioning)
- Assembly line robots

**Consumer Products**:
- Electric vehicles (acceleration control)
- Power tools (variable speed drills)
- Appliances (washing machines, dishwashers)
- HVAC systems (fan speed control)

**Hobby/Maker**:
- RC cars and boats
- Camera sliders (smooth video)
- Automated curtains/blinds
- Smart fans (temperature-controlled)

### Looking Ahead

**Week 7 Preview**: Two-motor robot with steering
**Week 8+**: Add sensors for autonomous navigation
**Final Projects**: Student-designed robots with multiple motors and sensors

---

## Key Takeaways

**Students should leave understanding**:
1. Why motor drivers are necessary (current amplification)
2. How to safely wire motor driver with separate power
3. How to control direction with IN1/IN2
4. How to control speed with PWM on enable pin
5. Difference between coast and brake stopping
6. How to combine sensors with motors

**Critical Safety Points**:
- Never connect motor directly to GPIO
- Always use separate power for motors
- Common ground is mandatory
- Secure motors before testing
- Stop before changing direction

**Programming Patterns**:
- Clean GPIO in finally block
- Use functions to organize motor control
- Implement gradual speed changes
- Handle Ctrl+C gracefully

---

## Questions for Class Discussion

1. "Why does a motor need more current than an LED?"
2. "What happens if we forget common ground?"
3. "How is PWM different for motors vs LEDs?"
4. "When would you use brake vs coast?"
5. "How could we make a robot turn? (Hint: Two motors...)"

---

## Demonstrations to Prepare

- [ ] Motor spinning at different speeds
- [ ] Direction change (forward/reverse)
- [ ] Coast vs brake comparison
- [ ] PWM frequency effect (if time allows)
- [ ] What happens without common ground (safely demonstrate failure)
- [ ] Motor under load vs no load

---

**End of Lecture Notes**

These notes should be expanded upon during lecture with:
- Physical demonstrations
- Drawing diagrams on board
- Student questions and discussion
- Hands-on examples with actual hardware
- Debugging common issues as they arise

**Total Lecture Time**: ~40 minutes (flexible based on class engagement)
