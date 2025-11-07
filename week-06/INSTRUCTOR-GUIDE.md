# Week 6 Instructor Guide

## Pre-Class Preparation

### ⚠️ CRITICAL SETUP & SAFETY REVIEW
Before class, you MUST:
- [ ] Test each motor driver with motor on YOUR Raspberry Pi first
- [ ] Verify all battery packs work and have fresh batteries
- [ ] Test motor polarity (which way is "forward")
- [ ] Prepare backup motors (at least 2 spares)
- [ ] Have multimeter ready for voltage/current testing
- [ ] Review motor driver datasheets
- [ ] Test PWM motor speed control at various frequencies
- [ ] Prepare fire extinguisher location (motor safety)
- [ ] Have extra jumper wires (motors pull connections loose)
- [ ] Know motor driver current limits

### Technical Setup (2-3 days before)

#### Software Testing
Run on ALL Raspberry Pis:
```bash
# Verify RPi.GPIO is installed
python3 -c "import RPi.GPIO; print('GPIO OK')"

# Test PWM capability
python3 << 'EOF'
import RPi.GPIO as GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setup(18, GPIO.OUT)
pwm = GPIO.PWM(18, 1000)
pwm.start(50)
print("PWM Test OK")
pwm.stop()
GPIO.cleanup()
EOF
```

#### Hardware Testing Checklist Per Station
- [ ] L298N motor driver (or equivalent)
- [ ] Small DC motor (3-6V, tested working)
- [ ] 4x AA battery holder with fresh batteries
- [ ] Test motor driver with motor and battery
- [ ] Verify motor spins both directions
- [ ] Check motor driver doesn't overheat
- [ ] Label IN1, IN2, ENA pins clearly on driver
- [ ] Use colored tape/stickers for quick identification
- [ ] Test enable jumper on L298N (remove for PWM control)

### Component Preparation Per Station

#### Required Components
- [ ] L298N Motor Driver Module (tested)
- [ ] 1 Small DC motor (3-6V)
- [ ] 4x AA battery holder (with connector)
- [ ] 4x Fresh AA batteries (alkaline or rechargeable)
- [ ] Breadboard (from previous weeks)
- [ ] 8+ male-to-female jumper wires (motor driver to Pi)
- [ ] 4+ male-to-male jumper wires (breadboard)
- [ ] 1 push button (from Week 5)
- [ ] 2 LEDs and resistors (for signal testing)
- [ ] Optional: PIR sensor for bonus activity

#### Nice to Have
- [ ] Small tape pieces (to secure motor to table)
- [ ] Cable ties (to organize wires)
- [ ] Colored stickers (to mark motor "front")
- [ ] Small screwdriver (for motor driver terminal screws)
- [ ] Alligator clips (for quick motor testing)
- [ ] Extra motor driver modules (2+ spares)
- [ ] Assorted motors (different voltages)

### Materials to Prepare
- [ ] Print QUICK-START guide (1 per student)
- [ ] Print L298N wiring diagram LARGE for demonstration
- [ ] Print motor control truth table poster
- [ ] Prepare motor safety checklist handout
- [ ] Create motor driver pinout reference cards
- [ ] Have motor datasheets available
- [ ] Prepare PWM demonstration materials
- [ ] Create troubleshooting flowchart poster

### Room Setup
- [ ] Clear extra space - motors need room to move
- [ ] Tape down loose wires from motor area
- [ ] Have fire extinguisher visible (motor safety)
- [ ] Extra power strips for battery chargers
- [ ] First aid kit accessible
- [ ] Proper ventilation (motors can smell when new)
- [ ] Camera/projector for motor driver closeup
- [ ] Multimeter at instructor station
- [ ] Working demo motor system ready

---

## Lesson Timing (90 minutes total)

### Week 5 Review & Motor Introduction (15 minutes)

**Review Questions** (ask students):
- "What did we learn last week?" → Sensors and input
- "What's the difference between input and output?" → Read vs control
- "What if we combined sensors with something that moves?" → ROBOTS!

**Hook - Exciting Motor Demo**:
1. Show simple motorized robot or project
2. Demonstrate sensor-controlled motor (button controls speed)
3. Show motor going forward, reverse, different speeds
4. "Today YOU will control motors like this!"

**Transition**: 
"Sensors let us read the world. Motors let us CHANGE the world. Together = ROBOTS!"

---

### Motor Theory & Safety Lecture (15 minutes)

#### Part 1: What is a Motor? (5 minutes)

**Physical Demo**:
- Show DC motor
- Let students see size, weight
- Point out shaft, terminals, case
- "This converts electricity into motion - spinning!"

**How Motors Work** (simplified):
1. Electricity flows through coils (electromagnets)
2. Coils create magnetic field
3. Magnets inside motor are attracted/repelled
4. Result: Shaft spins!

**Motor Specifications**:
```
Voltage: 3-6V (amount of electrical "pressure")
Current: 200-500mA (amount of electricity flowing)
RPM: 100-200 (how fast it spins - Revolutions Per Minute)
Torque: How much force it can apply
```

**The BIG Problem**:
Draw on board:
```
GPIO Pin: Can provide ~16mA
Motor needs: 200-500mA
That's 15-30 TIMES more than GPIO can provide!

Connecting motor directly to GPIO = DEAD RASPBERRY PI ☠️
```

#### Part 2: Motor Drivers to the Rescue! (5 minutes)

**What is a Motor Driver?**
Draw simple diagram:
```
Raspberry Pi → [Motor Driver] → Motor
    (tiny         (translator &     (powerful
     signals)      amplifier)        motion)
    
Plus:
Battery Pack → Motor Driver → Motor
    (power for motor, not from Pi!)
```

**Motor Driver Job**:
1. Takes small GPIO signals from Pi
2. Controls large power from battery to motor
3. Protects Pi from motor's high current
4. Allows speed and direction control

**L298N Motor Driver Module**:
Show physical module, point out:
- Input pins (IN1, IN2, IN3, IN4) - GPIO signals
- Enable pins (ENA, ENB) - Speed control with PWM
- Output terminals (OUT1-4) - Connect motors here
- Power input (12V, GND, 5V)
- Heat sink (gets warm, that's okay)
- Voltage regulator (provides 5V output - optional)
- Enable jumpers (remove for PWM speed control)

**Key Features**:
- Controls 2 motors independently
- Voltage: 6-12V input
- Current: Up to 2A per channel
- Has built-in protection circuits
- Common and affordable

#### Part 3: Critical Safety Rules (5 minutes)

**NEVER, EVER:**
1. Connect motor directly to GPIO (instant Pi death!)
2. Use Pi's power supply for motors (not enough current)
3. Forget common ground between Pi and motor driver
4. Touch spinning motor parts
5. Run motors without securing them

**ALWAYS:**
1. Use separate battery power for motors
2. Connect motor driver GND to Pi GND (common ground)
3. Double-check polarity before powering on
4. Secure motors so they don't fly off
5. Power off before changing motor connections

**Power Supply Rules** (draw diagram):
```
Raspberry Pi Power (5V adapter)
    ↓
Raspberry Pi
    ↓ (GPIO signals only)
    L298N Motor Driver
    ↑ (power from batteries)
Battery Pack (6V)
    ↓
Motor Driver → Motors

Common Ground: Pi GND ←→ Motor Driver GND
```

**Live Demo - What NOT To Do**:
- Show attempting to connect motor to GPIO (DON'T actually do it!)
- Explain instant damage: "GPIO pin dies, maybe whole Pi dies"
- Show correct way: Through motor driver with separate power

---

### Motor Driver Setup Demo (10 minutes)

**Build Circuit on Camera/Projector**:
Walk through each connection slowly:

**Step 1: Motor Driver to Battery Pack**
```
Battery Pack + (red) → Motor Driver 12V terminal
Battery Pack - (black) → Motor Driver GND terminal
```
Point out: "This powers the motor driver"

**Step 2: Motor to Driver Outputs**
```
Motor wire 1 → OUT1 terminal
Motor wire 2 → OUT2 terminal
```
Point out: "Motor doesn't care which wire goes where - just controls direction"

**Step 3: Motor Driver to Raspberry Pi (GPIO signals)**
```
Motor Driver IN1 → Pi GPIO 17
Motor Driver IN2 → Pi GPIO 27
Motor Driver ENA → Pi GPIO 22 (for speed control)
Motor Driver GND → Pi GND (CRITICAL - common ground!)
```

**Step 4: Enable Jumper**
```
Show enable jumper on driver near ENA pin
Explain: "Remove this jumper to control speed with PWM"
"Leave it in for full-speed only operation"
```

**Step 5: Test Simple ON**
```python
# Quick demo code
import RPi.GPIO as GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setup(17, GPIO.OUT)
GPIO.setup(27, GPIO.OUT)
GPIO.setup(22, GPIO.OUT)

# Motor forward full speed
GPIO.output(17, True)   # IN1 HIGH
GPIO.output(27, False)  # IN2 LOW
GPIO.output(22, True)   # ENA HIGH
```

Watch motor spin, point out direction!

**Direction Truth Table** (write on board):
```
IN1  IN2  Result
---  ---  -----------
HIGH LOW  Forward (clockwise)
LOW  HIGH Reverse (counter-clockwise)
LOW  LOW  Stop (coast)
HIGH HIGH Stop (brake - holds position)
```

Have students copy this table!

---

### Hands-on Activity 1: Basic Motor Control (20 minutes)

**Activity**: Connect motor driver and make motor spin forward, reverse, and stop

**See**: `activities/01-dc-motor-control.md`

**Instructor Role**:
- **CRITICAL**: Check EVERY circuit before students power on
- Verify battery polarity (+ and -)
- Confirm common ground connection
- Help with motor driver terminal screws
- Assist with identifying IN1/IN2/ENA pins
- Watch for loose connections (motors vibrate)

**Circuit Checking Protocol**:
Before student powers on, verify:
1. Battery pack connected to motor driver 12V and GND
2. Motor connected to OUT1 and OUT2
3. IN1, IN2, ENA connected to correct GPIO pins
4. Motor driver GND connected to Pi GND (MOST IMPORTANT!)
5. No short circuits or crossed wires
6. Battery pack has correct polarity

**Common Issues to Watch For**:
1. **No common ground** - Most common mistake! Motor won't work
2. **Wrong GPIO pin numbers** - Check BCM vs BOARD mode
3. **Loose terminal screws** - Motors vibrate them loose
4. **Weak batteries** - Motor won't spin or spins weakly
5. **Motor driver orientation** - Students connect pins backward
6. **Enable jumper still in place** - For Activity 2, needs removal

**Quick Fixes**:
- Test battery voltage with multimeter (should be ~6V)
- Test GPIO pins with LED before connecting motor
- Verify IN1/IN2 logic with print statements
- Check motor driver power LED is lit
- Try reversing motor wires if direction is backward

**Extension for Fast Finishers**:
- Add LED indicators for motor state (forward/reverse/stop)
- Implement gradual direction changes (stop between directions)
- Create timed motor sequences (forward 2s, stop 1s, reverse 2s)

---

### Break (5 minutes)
- Students can troubleshoot motor issues
- Good time to help struggling students individually
- Prepare PWM demo for next section
- Check that all motors are working

---

### Speed & Direction Theory (10 minutes)

#### PWM Review (from Week 4)

**Quick Recap**:
- PWM = Pulse Width Modulation
- Rapidly turns signal ON and OFF
- Duty cycle = % of time signal is ON
- Controls average power to device

**PWM for LED** (review):
```
0% duty cycle = LED off
50% duty cycle = LED half bright
100% duty cycle = LED full bright
```

**PWM for Motors** (new!):
```
0% duty cycle = Motor stopped
25% duty cycle = Motor slow (1/4 speed)
50% duty cycle = Motor medium (1/2 speed)
75% duty cycle = Motor fast (3/4 speed)
100% duty cycle = Motor full speed
```

**Live Demo**:
Show motor at different PWM values:
```python
pwm = GPIO.PWM(22, 1000)  # ENA pin, 1000 Hz
pwm.start(0)
# Gradually increase from 0 to 100
for speed in range(0, 101, 10):
    pwm.ChangeDutyCycle(speed)
    print(f"Speed: {speed}%")
    time.sleep(1)
```

Students can hear and see motor speed changing!

#### Speed + Direction Control

**Two Independent Controls**:
1. **Direction**: IN1 and IN2 pins (HIGH/LOW)
2. **Speed**: ENA pin (PWM duty cycle)

**Example Scenarios**:
```
Forward at 50% speed:
IN1=HIGH, IN2=LOW, ENA=50% PWM

Reverse at 75% speed:
IN1=LOW, IN2=HIGH, ENA=75% PWM

Stopped (coast):
IN1=LOW, IN2=LOW, ENA=any

Stopped (brake):
IN1=HIGH, IN2=HIGH, ENA=any
```

**Why Both Stop Methods?**
- **Coast**: Motor freewheels, can be turned by hand, gradual stop
- **Brake**: Motor resists turning, holds position, quick stop

**Practical Applications**:
- Coast: Toy car rolling to stop naturally
- Brake: Robot arm holding a position precisely

---

### Hands-on Activity 2: Speed Control with Button (20 minutes)

**Activity**: Use button presses to cycle through motor speeds (off, slow, medium, fast)

**See**: `activities/02-speed-control-button.md`

**Instructor Role**:
- Help students remove enable jumper for PWM control
- Assist with button integration (review Week 5)
- Debug PWM frequency issues
- Help with speed cycling logic
- Encourage testing at each speed level

**New Skills**:
- Combining Week 5 (buttons) with Week 6 (motors)
- Using PWM with motors (vs LEDs)
- State machines (cycling through speeds)
- Multiple GPIO outputs working together

**Common Issues**:
1. **Enable jumper still in place** - Remove it for PWM!
2. **PWM frequency too low** - Use 1000 Hz minimum
3. **Duty cycle out of range** - Keep 0-100
4. **Button debouncing issues** - Add 0.2s delay
5. **Motor not changing speed** - Check PWM actually working

**Testing Strategy**:
1. First: Get motor spinning at fixed speed
2. Second: Test PWM speed changes without button
3. Third: Add button to cycle through speeds
4. Fourth: Add print statements for debugging

**Extension Challenges**:
- Add second button for direction control
- Use potentiometer for analog speed control (advanced)
- Implement smooth acceleration/deceleration
- Add sensor to trigger motor (PIR or ultrasonic)

---

### Demo & Discussion (5 minutes)

**Student Demos** (volunteer basis):
- 1-2 students show motor speed control project
- Demonstrate different speeds
- Show button controlling motor
- Explain how PWM changes speed

**Class Discussion Questions**:
- "What was most challenging?" (Usually wiring complexity)
- "How does motor control compare to LED control?" (More power, more complex)
- "What could you build with speed control?" (Robot with acceleration, variable speed fan, camera slider)

**Preview Next Week**:
- "Next week: Control TWO motors for steering!"
- "Build a simple mobile robot"
- "Add sensors for obstacle avoidance"
- Show exciting robot demo if available

**Homework Assignment**:
- Review `week06-homework.md`
- Build sensor-controlled motor project
- Experiment with different speed patterns
- Practice safe motor handling

---

## Teaching Tips

### Conceptual Understanding
- Use real-world analogies: "Motor driver is like a translator"
- Physical demos before every concept
- Let students hear motor speed changes
- Show motor driver getting warm (expected)

### Safety First
- Repeat safety rules multiple times
- Check every circuit before power-on
- Teach students to double-check their own work
- "When in doubt, power off and ask!"

### Pacing
- Budget extra time for motor driver connections
- Terminal screws are slow for beginners
- Battery issues cause delays
- Have backup motors ready
- Some students finish quickly - have extensions

### Practical Skills
- Teach systematic circuit building
- Label connections with tape as you build
- Test with multimeter frequently
- Celebrate when motor first spins!

### Student Engagement
- Motors are exciting - use that energy!
- Ask predictions: "What speed is 30% duty cycle?"
- Use volunteers for demos
- Connect to real robots constantly

---

## Common Instructor Challenges

### "Motor driver is smoking/very hot!"
→ POWER OFF IMMEDIATELY!
→ Check for short circuit
→ Verify motor current rating vs driver rating
→ Check battery voltage (too high?)
→ Replace motor driver

### "Motor not spinning at all"
→ Check battery voltage with multimeter
→ Verify motor driver power LED is on
→ Test motor directly with battery
→ Check common ground connection
→ Verify IN1/IN2 are correct states
→ Check ENA is HIGH or getting PWM

### "Motor only goes one speed"
→ Is enable jumper removed?
→ Is PWM actually running on ENA pin?
→ Test ENA pin with LED to verify PWM
→ Check duty cycle values in code

### "Motor direction is opposite"
→ Normal! Every motor is different
→ Solution: Swap motor wires OR swap IN1/IN2 in code
→ Not a problem, just adjust

### "Battery dies quickly"
→ Motors use lots of power (normal)
→ Have extra battery sets charged
→ Consider rechargeable batteries
→ Don't run motors continuously at full speed

### "Inconsistent behavior"
→ Almost always loose connections
→ Check terminal screws tight
→ Check jumper wires fully inserted
→ Weak batteries causing voltage drops
→ Add capacitor across battery terminals (advanced)

---

## Materials Management

### Before Class
- Charge all rechargeable battery packs
- Test each motor with multimeter
- Verify motor driver modules working
- Pre-strip some wire ends if needed
- Label motor drivers with station numbers

### During Class
- Have battery replacement protocol
- Keep spare motors accessible
- Collect broken components immediately
- Help students organize wires
- Mark which motors spin "backward"

### After Class
- Test all motors and drivers
- Remove batteries from packs (storage)
- Inventory components
- Note failures for reordering
- Clean terminal screws
- Store motors safely

---

## Assessment Opportunities

### Formative (During Class)
- Can student explain why motor driver is needed?
- Can student identify L298N pins correctly?
- Can student predict motor behavior from code?
- Can student troubleshoot common issues?

### Practical (End of Class)
- Motor spins forward and reverse
- Motor speed controlled by PWM
- Button controls motor state
- Safe circuit construction demonstrated
- Proper GPIO cleanup in code

### Homework Review (Next Week)
- Sensor-controlled motor project working
- Understanding of PWM speed control
- Creative application attempted
- Code quality and safety practices

---

## Vocabulary for Week

- **DC Motor**: Motor that runs on direct current
- **Motor Driver**: Circuit that controls motor with low-power signals
- **H-Bridge**: Circuit configuration that allows bidirectional motor control
- **L298N**: Common and affordable motor driver module
- **Enable Pin**: Pin that controls whether motor can run (often PWM for speed)
- **IN1/IN2**: Input pins that control motor direction
- **Common Ground**: Shared GND connection between Pi and motor driver
- **Duty Cycle**: Percentage of time PWM signal is HIGH
- **RPM**: Revolutions Per Minute - motor speed measurement
- **Torque**: Rotational force a motor can apply
- **Terminal**: Screw connection point for wires on motor driver
- **Coast**: Motor stop method where shaft can freely rotate
- **Brake**: Motor stop method where shaft resists rotation

---

## Extension Activities (For Advanced Students)

1. **Dual Motor Control**: Control two motors independently with different speeds
2. **Motor Tachometer**: Count motor revolutions using optical sensor
3. **PID Speed Control**: Maintain constant motor speed under load (very advanced)
4. **Sound-Activated Motor**: Use microphone to control motor with claps
5. **Servo Motor Introduction**: Compare DC motor to servo motor
6. **Motor Efficiency Test**: Measure current draw at different speeds

---

## Resources to Have Ready

### Physical
- Extra motors (2-3 spares)
- Extra motor drivers (2 spares)
- Extra battery packs
- Multimeter for testing
- Screwdrivers (for terminals)
- Tape (to secure motors)
- Wire strippers
- Extra jumper wires
- Alligator clips

### Digital
- L298N datasheet (PDF)
- Motor specifications
- Wiring diagrams (printed large)
- Truth tables (printed)
- PWM explanation diagrams

### Online Links (Write on Board)
- GPIO Pinout: https://pinout.xyz
- L298N Tutorial: (specific URL)
- Motor basics: (specific URL)

---

## Next Week Prep

Before Week 7, ensure:
- [ ] All students have working motor control
- [ ] Motor drivers still functional
- [ ] Plan two-motor robot chassis
- [ ] Source wheels/chassis if needed
- [ ] Test steering algorithms

---

## Emergency Procedures

**If motor driver smokes:**
1. Immediately disconnect battery power
2. Check for short circuits
3. Replace driver if damaged
4. Review student circuit carefully

**If student gets minor shock:**
1. Battery pack is only 6V (very safe)
2. Clean hands if battery acid present
3. Replace batteries if corroded

**If motor won't stop spinning:**
1. Disconnect battery pack first
2. Check code for infinite loops
3. Verify GPIO cleanup

---

**Remember**: This week introduces more power and complexity than previous weeks. Safety checks are CRITICAL! Double-check every circuit before power-on. Motor issues are 90% wiring problems, 10% code problems. Debug systematically!

**Key Success Factors**:
1. Thorough safety briefing
2. Check every student circuit before power-on
3. Working demo for each concept
4. Fresh batteries ready
5. Patience with complex wiring
6. Celebrate first motor spin!

**You've got this! Happy teaching!** 🤖⚙️
