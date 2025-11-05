# Week 5: Sensors & Input

## Overview
This week builds on Week 4's GPIO output skills by exploring the other side of physical computing: INPUT! Students will learn to read data from buttons, sensors, and the physical world, making their Raspberry Pi projects interactive and responsive. You'll turn your Pi into a motion detector, temperature monitor, distance sensor, and more!

## Learning Objectives
By the end of this week, students will be able to:
- Understand the difference between digital and analog inputs
- Read button presses using GPIO input pins
- Implement pull-up and pull-down resistors
- Detect motion using a PIR sensor
- Read temperature and humidity with a DHT sensor
- Measure distance with an ultrasonic sensor
- Debounce button inputs in software
- Combine inputs with outputs for interactive projects
- Build real-world sensor applications

## Topics Covered
1. **Digital vs Analog Input**
   - What is digital input (HIGH/LOW)?
   - Understanding analog signals
   - How sensors convert physical phenomena to electrical signals
   - Raspberry Pi's input limitations (no built-in ADC)

2. **Button Input Basics**
   - Reading button states
   - Pull-up and pull-down resistors
   - Why we need them
   - Button debouncing
   - Event detection

3. **Motion Detection (PIR Sensor)**
   - How PIR sensors work
   - Detecting movement
   - Trigger delays and sensitivity
   - Building a motion-activated system

4. **Temperature & Humidity (DHT11/DHT22)**
   - Digital vs analog temperature sensors
   - Reading DHT sensors
   - Data validation and error handling
   - Creating a weather station

5. **Distance Measurement (HC-SR04)**
   - How ultrasonic sensors work
   - Measuring distance with sound waves
   - Timing and calculations
   - Building proximity detectors

## Materials Needed
From your kit:
- Raspberry Pi (set up from previous weeks)
- Breadboard
- Push buttons (2-3)
- Resistors (10kΩ for pull-down)
- PIR Motion Sensor (HC-SR501)
- Temperature/Humidity Sensor (DHT11 or DHT22)
- Ultrasonic Distance Sensor (HC-SR04)
- LEDs and resistors (from Week 4)
- Jumper wires (Male-to-Female, Male-to-Male)
- Monitor, keyboard, and mouse
- Power supply

## ⚠️ Safety & Best Practices

**INPUT GPIO SAFETY RULES:**
1. **NEVER apply more than 3.3V to a GPIO input pin** - Will damage the Pi!
2. **Check sensor voltage requirements** - Some sensors need 5V power, but send 3.3V signals
3. **Use current-limiting resistors when needed** - Protect inputs from overcurrent
4. **Power off before changing circuits** - Use `sudo shutdown -h now`
5. **Verify sensor connections twice** - Check VCC, GND, and data pins
6. **Be gentle with sensors** - They contain delicate components
7. **Keep sensors dry** - Unless specifically rated waterproof

**SENSOR HANDLING:**
- PIR sensors are sensitive to movement - keep stable while testing
- DHT sensors need 2-second intervals between readings
- Ultrasonic sensors need clear line-of-sight - no obstacles
- Don't touch sensor components while circuit is powered

## Class Structure
- **Week 4 Review & Input Concepts**: 15 minutes
- **Digital Input Theory (Buttons)**: 15 minutes
- **Hands-on Activity 1 (Button Input)**: 20 minutes
- **Break**: 5 minutes
- **Sensor Theory Lecture**: 15 minutes
- **Hands-on Activity 2 (Choose sensor)**: 25 minutes
- **Demo & Discussion**: 10 minutes

## Files in This Week's Folder
- `README.md` - This file, overview of the week
- `QUICK-START.md` - Quick reference for sensors and inputs
- `INSTRUCTOR-GUIDE.md` - Teaching notes and setup tips
- `lecture/` - Detailed lecture notes with diagrams
- `activities/` - In-class hands-on projects
- `diagrams/` - Sensor wiring diagrams and pin references
- `resources/` - Sensor datasheets and troubleshooting guides
- `week05-homework.md` - Take-home practice assignments

## Getting Started

### Before You Begin
1. **Review Week 4 GPIO concepts** - We'll use output (LEDs) with input (sensors)
2. **Organize your components** - Have sensors, buttons, wires ready
3. **Read sensor labels** - Identify VCC, GND, and signal pins
4. **Test your LEDs** - We'll use them for sensor feedback
5. **Be patient** - Sensors can be finicky at first!

### First Steps
1. Power off your Raspberry Pi: `sudo shutdown -h now`
2. Identify your input pins (any GPIO can be input!)
3. Read the pinout on your sensors carefully
4. Plan your circuit before building
5. Double-check voltage requirements (3.3V vs 5V)

## Key Concepts to Remember

### Input vs Output
- **OUTPUT (Week 4)**: Pi controls devices (LEDs, motors)
- **INPUT (Week 5)**: Pi reads from the world (buttons, sensors)
- **Pins can be either**, but not both at the same time
- This week: COMBINING input and output for interactivity!

### Digital Input States
- **HIGH (1)**: Pin reads 3.3V - button pressed, motion detected, etc.
- **LOW (0)**: Pin reads 0V - button not pressed, no motion, etc.
- **Floating**: No defined state - BAD! Use pull-up/pull-down resistors

### Pull-up and Pull-down Resistors
- **Pull-down**: Holds pin at LOW (0V) when button not pressed
- **Pull-up**: Holds pin at HIGH (3.3V) when button not pressed
- **Why needed**: Prevents "floating" state that gives random readings
- **Raspberry Pi has internal pull-ups** - Can enable in code!

### Sensor Types
- **Digital sensors**: Send HIGH/LOW signals (PIR, button)
- **Analog sensors**: Send variable voltage (temperature, light)
- **Serial sensors**: Send data through communication protocol (DHT)

### Programming GPIO Input
```python
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
button_state = GPIO.input(pin)  # Returns True (HIGH) or False (LOW)
```

## Tips for Success
- **Start with buttons** - Simplest input to understand
- **Test sensors individually** - One at a time before combining
- **Print debug info** - Use `print()` to see what sensors read
- **Check wiring carefully** - Most problems are wiring mistakes
- **Read error messages** - They often tell you exactly what's wrong
- **Be patient with sensors** - They need warmup time
- **Keep circuits neat** - Easier to troubleshoot
- **Use the diagrams** - Follow wiring exactly as shown

## Common Beginner Mistakes (And How to Avoid Them)

1. **Forgetting pull-down resistor** → Use internal pull-down: `GPIO.PUD_DOWN`
2. **Wrong sensor voltage** → Check if sensor needs 5V power (most do!)
3. **Reversed button wiring** → Doesn't matter! Buttons work both ways
4. **Reading too fast** → Add `time.sleep()` between sensor readings
5. **Forgetting GPIO mode** → Always set `GPIO.setmode(GPIO.BCM)` first
6. **Wrong pin setup** → INPUT pins use `GPIO.IN`, not `GPIO.OUT`
7. **DHT sensor errors** → Normal! Add retry logic, allow warmup time

## Troubleshooting Quick Checks

**Button not working?**
- [ ] Is button firmly in breadboard?
- [ ] Are both button legs connected?
- [ ] Is pull-down resistor or internal pull-down enabled?
- [ ] Did you set pin as INPUT?
- [ ] Try printing `GPIO.input(pin)` in a loop to see values

**PIR sensor always triggering?**
- [ ] Did sensor warm up for 60 seconds?
- [ ] Is sensor stable (not moving)?
- [ ] Check sensitivity adjustment pot
- [ ] Verify 5V power connection

**DHT sensor not reading?**
- [ ] Installed Adafruit_DHT library?
- [ ] Using correct sensor type (DHT11 vs DHT22)?
- [ ] Wait 2+ seconds between readings?
- [ ] Check data pin connection?
- [ ] Try different GPIO pin?

**Ultrasonic sensor giving weird values?**
- [ ] Clear line of sight?
- [ ] Trigger and Echo pins swapped?
- [ ] Sensor powered with 5V?
- [ ] Measuring within range (2cm-400cm)?
- [ ] Are you calculating distance correctly?

## Looking Ahead

**This Week**: Read sensors and respond to the world
**Next Week**: Build interactive projects combining sensors and outputs
**Future Weeks**: Create autonomous robots with sensor feedback!

## Why This Matters

Input is what makes computers smart! With sensors, your Raspberry Pi can:
- **Detect** motion for security systems
- **Monitor** temperature for smart homes
- **Measure** distance for robots to avoid obstacles
- **Respond** to user button presses
- **Track** environmental conditions
- **React** to the physical world

Combining input (sensors) with output (LEDs, motors) creates truly interactive projects!

## Real-World Applications

Students will see how this week's skills relate to:
- **Smart home thermostats** - Reading temperature
- **Security systems** - Motion detection
- **Self-parking cars** - Distance sensors
- **Automatic doors** - Proximity detection
- **Weather stations** - Environmental monitoring
- **Interactive games** - Button inputs
- **Robots** - Sensor feedback for navigation

---

**Important Reminder**: Always verify sensor voltage requirements before connecting. When in doubt, ask! A few seconds of double-checking can save your Raspberry Pi from damage.

**Have fun exploring the world through sensors!** 🌡️📍🔘
