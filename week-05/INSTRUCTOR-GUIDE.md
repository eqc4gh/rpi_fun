# Week 5 Instructor Guide

## Pre-Class Preparation

### ⚠️ CRITICAL SETUP & SAFETY REVIEW
Before class, you MUST:
- [ ] Test all sensors on YOUR Raspberry Pi first
- [ ] Verify voltage requirements for each sensor
- [ ] Install Adafruit_DHT library on all Pis
- [ ] Prepare voltage divider circuits for HC-SR04 if using
- [ ] Have multimeter ready for voltage testing
- [ ] Review sensor datasheets
- [ ] Test button debouncing timing
- [ ] Know sensor warmup requirements
- [ ] Have spare sensors (at least 1 of each type)

### Technical Setup (2-3 days before)

#### Software Installation
Run on ALL Raspberry Pis:
```bash
# Update system
sudo apt-get update

# Install DHT sensor library
sudo pip3 install Adafruit_DHT --break-system-packages

# Verify RPi.GPIO is installed (should be by default)
python3 -c "import RPi.GPIO; print('GPIO OK')"

# Test DHT library
python3 -c "import Adafruit_DHT; print('DHT OK')"
```

#### Hardware Testing Checklist
- [ ] Test each button with multimeter (continuity check)
- [ ] Verify PIR sensors trigger correctly (60s warmup!)
- [ ] Test DHT sensors return valid readings
- [ ] Calibrate ultrasonic sensors for room environment
- [ ] Label sensors if they look identical
- [ ] Check all jumper wires for continuity
- [ ] Verify 5V and 3.3V output on each Pi

### Component Preparation Per Station

#### Required Components
- [ ] 2-3 push buttons (tactile switches)
- [ ] 2-3 10kΩ resistors (for pull-down if not using internal)
- [ ] 1 PIR motion sensor (HC-SR501)
- [ ] 1 DHT11 or DHT22 sensor
- [ ] 1 HC-SR04 ultrasonic sensor (optional for advanced students)
- [ ] Breadboard (from Week 4)
- [ ] 10+ male-to-female jumper wires
- [ ] 5+ male-to-male jumper wires
- [ ] 3+ LEDs and resistors (for output feedback)
- [ ] Voltage divider resistors (1kΩ + 2kΩ) if using HC-SR04

#### Nice to Have
- [ ] Printed sensor pinout diagrams
- [ ] Colored jumper wire labels/tape
- [ ] Small screwdriver for PIR adjustment pots
- [ ] Tape to secure sensors while testing
- [ ] Small cardboard boxes to trigger PIR from distance

### Materials to Prepare
- [ ] Print QUICK-START guide (1 per student)
- [ ] Print sensor wiring diagrams LARGE for demonstration
- [ ] Prepare sensor specification cards (voltage, pins, timing)
- [ ] Create "sensor tester" demo board for display
- [ ] Prepare troubleshooting flowchart posters
- [ ] Have sensor datasheets available (PDF or printed)

### Room Setup
- [ ] Extra lighting for reading tiny sensor labels
- [ ] Magnifying glasses available
- [ ] Multimeter at instructor station
- [ ] Working demo circuit for each sensor type
- [ ] Clear space for PIR sensor testing (needs movement)
- [ ] Temperature reference (thermometer) to verify DHT readings
- [ ] Ruler/tape measure to verify ultrasonic distance readings

---

## Lesson Timing (90 minutes total)

### Week 4 Review & Input Preview (15 minutes)

**Review Questions** (ask students):
- "What did we do last week?" → Control LEDs (OUTPUT)
- "What's the opposite of output?" → INPUT (reading sensors)
- "Can you think of input devices?" → Keyboard, mouse, buttons, sensors

**Exciting Demo**:
- Show working motion-activated LED
- Show temperature display updating
- Show button-controlled LED
- "Today YOU will build these!"

**Key Transition**: 
"Last week: Pi talks to the world (LEDs). This week: World talks to Pi (sensors)!"

---

### Digital Input Theory - Buttons (15 minutes)

**Start with Physical Demo**:
1. Show a button - "What does it do?" (Makes connection)
2. Press and release while students watch
3. Draw simple circuit on board: `Button → GPIO → GND`

#### Key Concepts to Teach

**1. What is Digital Input?**
- Digital = Only TWO states: HIGH (3.3V) or LOW (0V)
- Like a light switch: ON or OFF
- No in-between values

**2. The Floating Problem** (CRITICAL!)
Draw on board:
```
Unconnected GPIO pin = ??? (floating)
Reads random values: HIGH, LOW, HIGH, LOW...
```

**Live Demo**: 
- Connect GPIO pin with NO button, no resistor
- Run program: `print(GPIO.input(pin))` in loop
- Show erratic readings
- "This is BAD! How do we fix it?"

**3. Pull-down Resistors Solution**
Draw on board:
```
GPIO → Button → 3.3V
  |
10kΩ resistor
  |
 GND

When button NOT pressed: Resistor pulls pin to GND (LOW)
When button pressed: Pin connects to 3.3V (HIGH)
```

**Raspberry Pi's Secret Weapon**:
- "Good news! Pi has INTERNAL pull-down resistors!"
- Show code: `GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)`
- "No external resistor needed! Pi does it internally."

**4. Button Debouncing**
- Real buttons "bounce" - make/break contact rapidly
- Can trigger multiple times from one press
- Solutions:
  - Hardware: Capacitor (advanced)
  - Software: `time.sleep(0.2)` after detection
  - Library: `bouncetime=200` in event detection

#### Hands-on Demo
Build button circuit on camera/projector:
1. Talk through each connection
2. Show GPIO.input() returning values
3. Add LED to visualize button state
4. Demonstrate bounce without debouncing
5. Fix with software debounce

**Common Student Questions**:
- Q: "Which way does button go?" → A: "Doesn't matter! Buttons are non-directional"
- Q: "Can I use pull-up instead?" → A: "Yes! Then button pressed = LOW"
- Q: "What if I forget pull-down?" → A: "Random readings! Always use one"

---

### Hands-on Activity 1: Button Input (20 minutes)

**Activity**: Build button circuit, toggle LED with button press

**See**: `activities/01-button-input.md`

**Instructor Role**:
- Circulate constantly
- Check circuits BEFORE students power on
- Help with pull-down resistor concept
- Assist with debouncing issues
- Encourage students to help neighbors

**Common Issues to Watch For**:
1. Students forgetting `GPIO.IN` (using OUT by mistake)
2. No pull-down resistor configured
3. Button pressed logic inverted (expecting HIGH when set to pull-up)
4. Infinite loops without sleep (CPU maxes out)
5. Forgetting GPIO.cleanup()

**Quick Fixes**:
- Print button state in loop to debug
- Check if internal pull-down is enabled
- Add time.sleep(0.01) in loop
- Verify GPIO numbering (BCM vs BOARD)

**Extension for Fast Finishers**:
- Add second button for different LED
- Implement event detection instead of polling
- Count button presses and display count

---

### Break (5 minutes)
- Students can troubleshoot button issues
- Good time to help struggling students individually
- Set up sensor demos for next section

---

### Sensor Theory Lecture (15 minutes)

**Start with Question**: 
"Buttons are simple: ON or OFF. But what about temperature? Motion? Distance? These need SENSORS!"

#### 1. What Are Sensors?

**Definition**: Devices that convert physical phenomena into electrical signals

**Examples**:
- Temperature → Voltage
- Light → Current
- Motion → Digital pulse
- Distance → Timing

**Key Point**: Sensors are the "eyes and ears" of computers!

#### 2. Types of Sensors

**Digital Sensors**:
- Output: HIGH or LOW only
- Examples: PIR motion, button, door sensor
- Easy to read: `GPIO.input(pin)`

**Analog Sensors**:
- Output: Variable voltage (0V to 3.3V)
- Examples: Temperature, light, pressure
- Problem: Pi can't read analog directly!
- Need ADC (Analog-to-Digital Converter)

**Serial/Protocol Sensors**:
- Output: Data through communication protocol
- Examples: DHT11/22, GPS, some distance sensors
- Need special library to decode

#### 3. PIR Motion Sensor Deep Dive

**How It Works** (simplified):
- PIR = Passive InfraRed
- Detects changes in infrared (heat) radiation
- Two sensors compare readings
- Motion = difference detected

**Physical Demo**:
- Show PIR sensor
- Point out dome lens (Fresnel lens)
- Show adjustment potentiometers:
  - Sensitivity (Sx): How far it sees
  - Time delay (Tx): How long output stays HIGH
- Show jumper setting (single vs repeatable trigger)

**Important Notes**:
- Needs 60 second warmup (thermal stabilization)
- Very sensitive to temperature changes
- Keep stable during testing (don't wave it around!)
- Detection range: 3-7 meters typically

**Wiring**:
```
PIR:  VCC (5V) → Pi 5V
      GND → Pi GND
      OUT → GPIO pin (3.3V safe output)
```

#### 4. DHT11/DHT22 Temperature/Humidity Sensors

**DHT11 vs DHT22**:
| Feature | DHT11 | DHT22 |
|---------|-------|-------|
| Accuracy | ±2°C, ±5% humidity | ±0.5°C, ±2% humidity |
| Range | 0-50°C, 20-80% | -40-80°C, 0-100% |
| Price | Cheaper | More expensive |
| Sample rate | 1 Hz (1/sec) | 0.5 Hz (1/2 sec) |

**How It Works**:
- Combines temperature and humidity sensors
- Has internal microcontroller
- Sends data through custom serial protocol
- Need library (Adafruit_DHT) to decode

**Critical Requirements**:
- Minimum 2 seconds between readings
- Need 1 second startup time
- Can fail occasionally (normal!)
- Always check for None returns

**Wiring**:
```
DHT:  VCC → Pi 3.3V or 5V (check datasheet)
      GND → Pi GND
      DATA → GPIO pin (usually GPIO 4)
```

#### 5. HC-SR04 Ultrasonic Distance Sensor

**How It Works**:
- Sends 40 kHz ultrasonic pulse (inaudible)
- Measures time until echo returns
- Distance = (time × speed of sound) / 2

**Physics**:
- Speed of sound: 343 m/s = 34,300 cm/s
- Going there and back: divide by 2
- Result: multiply time by 17,150 cm/s

**⚠️ CRITICAL SAFETY**:
- Echo pin outputs 5V
- Pi GPIO can only handle 3.3V
- MUST use voltage divider on Echo pin!
- Trigger pin can go directly to GPIO

**Voltage Divider** (draw on board):
```
Echo (5V) → 1kΩ resistor → GPIO pin → 2kΩ resistor → GND
Result: ~3.3V to GPIO (safe!)
```

**Range**: 2cm to 400cm (accuracy ±3mm)

**Wiring**:
```
HC-SR04:  VCC → Pi 5V
          GND → Pi GND
          TRIG → GPIO 23 (direct connection OK)
          ECHO → GPIO 24 (THROUGH VOLTAGE DIVIDER!)
```

#### Sensor Comparison Discussion

Ask students: "When would you use each sensor?"
- PIR: Security systems, automatic lights, presence detection
- DHT: Weather stations, HVAC control, greenhouses
- Ultrasonic: Robot obstacle avoidance, parking sensors, liquid level

---

### Hands-on Activity 2: Choose Your Sensor (25 minutes)

**Students pick ONE sensor to work with**:
1. **Easier**: PIR Motion Sensor → Light LED when motion detected
2. **Medium**: DHT Sensor → Display temperature to terminal
3. **Advanced**: Ultrasonic → Measure distance, LED indicates proximity

**See respective activity files**:
- `activities/02-pir-motion.md`
- `activities/03-dht-temperature.md`
- `activities/04-ultrasonic-distance.md` (optional)

**Instructor Strategy**:
- Suggest PIR for students who struggled with buttons
- Suggest DHT for students comfortable with debugging
- Reserve ultrasonic for advanced students or homework

**Instructor Role**:
- Help students choose appropriate sensor for skill level
- Assist with library installation issues (DHT)
- Explain sensor warmup/timing requirements
- Help debug wiring issues
- Encourage inter-student collaboration

**Common Issues by Sensor**:

**PIR Problems**:
- Not waiting 60s warmup
- Sensor moving/not stable
- Sensitivity set too low
- Wrong GPIO pin number

**DHT Problems**:
- Library not installed
- Wrong sensor type (DHT11 vs DHT22)
- Reading too frequently (< 2 seconds)
- Normal failures not handled (check for None)

**Ultrasonic Problems**:
- No voltage divider on Echo
- Trigger and Echo pins swapped
- Not powered by 5V
- Objects too close (< 2cm) or too far (> 400cm)
- Calculation error in distance formula

**Quick Debug Tips**:
- Use multimeter to verify sensor power (5V or 3.3V)
- Print raw sensor values before processing
- Check library imports with simple test
- Verify GPIO pin numbers match physical connections

---

### Demo & Discussion (10 minutes)

**Student Demos** (volunteer basis):
- 2-3 students demo their working projects
- Explain what sensor they used and how it works
- Show code briefly
- Demonstrate functionality

**Class Discussion Questions**:
- "What was the hardest part?" (Usually wiring or library issues)
- "How could you combine sensors?" (Motion + temp, button + distance)
- "What real-world uses can you think of?" (Encourage creativity!)

**Preview Next Week**:
- "Next week: Combine multiple sensors in one project!"
- "Example: Motion-activated temp display"
- "Example: Button-controlled distance measurement"
- Show exciting preview demo if time allows

**Homework Assignment**:
- Review `week05-homework.md`
- Emphasize: Try ALL three sensors at home
- Due before Week 6

---

## Teaching Tips

### Conceptual Understanding
- Use analogies: "Pull-down resistor is like a default answer"
- Physical demonstrations before code
- Let students predict behavior before testing
- Celebrate failures as learning opportunities

### Pacing
- Budget extra time for sensor setup
- PIR sensor needs 60 seconds - use this for explanations
- DHT library installation can take 5-10 minutes
- Some students will finish fast - have extensions ready

### Student Engagement
- Ask prediction questions: "What will happen if...?"
- Use volunteer demos early and often
- Pair struggling students with those who finish early
- Connect to real-world applications constantly

### Debugging Strategy
Teach systematic debugging:
1. Check power (VCC, GND with multimeter)
2. Verify wiring matches diagram
3. Print sensor raw values
4. Test with known-good code
5. Swap sensor if still broken

### Safety Emphasis
- Repeat voltage warnings multiple times
- Check circuits before power-on
- Teach students to check their own circuits
- "When in doubt, ASK!"

---

## Common Instructor Challenges

### "My button gives random readings!"
→ Check pull-down is enabled (internal or external)
→ Print state in loop to see pattern
→ Bad button? Swap it out

### "My PIR won't stop triggering!"
→ Wait full 60 seconds warmup
→ Is sensor stable? Tape it down
→ Adjust sensitivity pot (turn counterclockwise)
→ Is delay too long? Adjust delay pot

### "DHT sensor always fails!"
→ Most common: Library not installed correctly
→ Second most common: Wrong sensor type in code
→ Check with: `python3 -c "import Adafruit_DHT"`
→ Retry logic is normal - sensor is flaky!

### "Students finishing at very different rates"
Have ready:
- Extension activities in each activity file
- Peer tutoring opportunities
- Start next activity early
- Homework can be started in class

### "Not enough time!"
Priority order (if running short):
1. Button input (foundational)
2. PIR motion (easiest sensor)
3. DHT temperature (good complexity example)
4. Ultrasonic (can be homework)

---

## Materials Management

### Before Class
- Sort sensors into labeled bags per station
- Check all sensors work (test day before)
- Have spares of EVERYTHING
- Charge any demo equipment

### During Class
- Collect broken components in "broken" bin
- Distribute spares as needed
- Note which sensors fail frequently
- Help students keep workspace organized

### After Class
- Collect and inventory all sensors
- Test any suspicious sensors
- Recharge demo equipment
- Note what needs reordering

---

## Assessment Opportunities

### Formative (During Class)
- Can student explain pull-down resistor purpose?
- Can student predict button state (HIGH/LOW)?
- Can student debug wiring issues?
- Can student interpret sensor readings?

### Practical (End of Class)
- Working button circuit with LED
- Chosen sensor functioning correctly
- Code demonstrates understanding
- Proper GPIO cleanup

### Homework Review (Next Week)
- Did student try all three sensors?
- Quality of code comments
- Understanding shown in reflections
- Creative extensions attempted?

---

## Vocabulary for Week

- **Digital Input**: Signal with only two states (HIGH/LOW)
- **Analog Input**: Signal with continuous range of values
- **Pull-down Resistor**: Resistor that holds input pin at LOW when not driven
- **Pull-up Resistor**: Resistor that holds input pin at HIGH when not driven
- **Floating**: Input pin with no defined voltage (bad!)
- **Debouncing**: Eliminating false triggers from mechanical bounce
- **PIR**: Passive InfraRed motion sensor
- **DHT**: Digital Humidity/Temperature sensor
- **Ultrasonic**: Using sound waves above human hearing range
- **Sensor**: Device that converts physical phenomenon to electrical signal
- **Serial Protocol**: Method of transmitting data one bit at a time

---

## Extension Activities (For Advanced Students)

1. **Multiple Button Control**: 3 buttons control 3 different LEDs
2. **Button Counter**: Count and display number of presses
3. **Sensor Datalogger**: Save sensor readings to file with timestamp
4. **Distance Alarm**: Ultrasonic triggers buzzer/LED at threshold
5. **Temperature Alert**: LED changes color based on temp ranges
6. **Motion Logger**: Record times when motion detected

---

## Resources to Have Ready

### Physical
- Extra sensors (at least 1 of each type)
- Extra jumper wires
- Multimeter
- Voltage divider resistors (for ultrasonic)
- Tape to secure sensors
- Screwdrivers for PIR adjustment

### Digital
- Sensor datasheets (PDF)
- Wiring diagrams (printed large)
- Troubleshooting flowcharts
- Example code snippets
- Installation instructions for libraries

### Online Links (Write on Board)
- GPIO Pinout: https://pinout.xyz
- Adafruit DHT Guide: (write full URL)
- RPi.GPIO docs: (write full URL)

---

## Next Week Prep

Before Week 6, ensure:
- [ ] All students have working sensors
- [ ] DHT library installed on all Pis
- [ ] Students completed homework
- [ ] Components still inventoried
- [ ] Advanced students have challenge ready

---

**Remember**: This week can be frustrating for students - sensors are finicky! Be patient, encouraging, and emphasize that debugging is a critical skill. Every error is a learning opportunity!

**Key Success Factors**:
1. Thorough testing before class
2. Clear wiring diagrams
3. Working demo for each sensor
4. Systematic debugging approach
5. Patience and encouragement!

**You've got this! Happy teaching!** 🔘🌡️📍
