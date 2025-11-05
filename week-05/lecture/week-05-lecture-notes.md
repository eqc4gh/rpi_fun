# Week 5 Lecture: Sensors & Input

## Duration: 30 minutes total (15 min buttons + 15 min sensors)

---

## Part 1: Digital Input & Buttons (15 minutes)

### Opening Activity (2 minutes)
**Ask students**: "Last week we controlled LEDs - the Pi was TALKING to the world. This week, what's the opposite?"

**Expected answers**: Reading, listening, input

**Demo**: Show motion-activated LED or button-controlled LED
"By the end of today, YOU will build something like this!"

---

### Review: Output vs Input (2 minutes)

**Last Week - OUTPUT**:
- Pi controls things
- Turns LEDs on/off
- Code: `GPIO.output(pin, True)`
- Pin mode: `GPIO.OUT`

**This Week - INPUT**:
- Pi reads from world
- Detects button presses
- Code: `GPIO.input(pin)`
- Pin mode: `GPIO.IN`

**Key point**: Same GPIO pins, different setup!

---

### What is Digital Input? (3 minutes)

**Definition**: Digital means only TWO possible values

**For GPIO pins**:
- **HIGH** = 3.3 volts = ON = True = 1
- **LOW** = 0 volts = OFF = False = 0
- **NO MIDDLE GROUND!**

**Examples of Digital Input**:
- Button pressed or not pressed
- Door open or closed
- Motion detected or not detected
- Like a light switch: ON or OFF

**Draw on board**:
```
HIGH ─────  3.3V (True)
             
LOW  ─────  0V (False)
```

**Question for class**: "Can you think of digital inputs in your daily life?"
- Expected: doorbell, keyboard keys, game controller buttons, light switches

---

### The Floating Problem (4 minutes)

**Demonstration** (if possible):
"What happens if we connect a GPIO pin as input but don't connect it to anything?"

**Show code running**:
```python
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
GPIO.setup(17, GPIO.IN)  # NO pull-down, NO button

while True:
    print(GPIO.input(17))
    time.sleep(0.2)
```

**Result**: Random readings! True, False, True, True, False...

**Why?** Draw on board:
```
        GPIO Pin
           |
          ???  ← No defined voltage!
        
"Floating" - Acts like antenna
Picks up electrical noise
Random readings
```

**Key Point**: Pins MUST have a defined voltage at all times!

---

### Solution: Pull-down Resistors (4 minutes)

**Draw circuit on board**:
```
    3.3V ──┐
           │
       [Button]
           │
           ├─→ GPIO Pin
           │
        [10kΩ]
           │
          GND
```

**Explain each state**:

**Button NOT pressed**:
```
10kΩ resistor connects GPIO to GND
GPIO reads: LOW (0V)
```

**Button pressed**:
```
Direct path from GPIO to 3.3V
GPIO reads: HIGH (3.3V)
(Resistor limits current - protects circuit!)
```

**Analogy**: "The resistor is like a default answer. When nothing else is happening, it gives a clear LOW signal."

**The Raspberry Pi Secret**:
"Good news! Raspberry Pi has INTERNAL pull-down resistors!"

**Show code**:
```python
GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
```

**Explain**: `GPIO.PUD_DOWN` activates internal resistor - no external resistor needed!

**Alternative**: `GPIO.PUD_UP` - pulls to HIGH instead
- Button not pressed = HIGH
- Button pressed = LOW
- (Less common, but useful sometimes)

---

## Part 2: Understanding Sensors (15 minutes)

### What Are Sensors? (3 minutes)

**Definition**: Devices that measure the physical world and convert it to electrical signals

**The Sensor's Job**:
```
Physical phenomenon → Sensor → Electrical signal → Computer
```

**Examples** - Ask students to guess what each sensor detects:
- Thermometer → Temperature
- Microphone → Sound
- Camera → Light
- GPS → Location
- Accelerometer → Movement/tilt

**In Raspberry Pi**:
- Temperature sensor → Tells us how hot/cold
- Motion sensor → Detects movement
- Distance sensor → Measures how far away objects are
- Button → Detects press (simplest sensor!)

**Key Point**: "Sensors are the computer's eyes, ears, and sense of touch!"

---

### Types of Sensors (4 minutes)

#### 1. Digital Sensors

**Output**: Only HIGH or LOW (like button)

**Examples**:
- PIR motion sensor: Motion detected = HIGH, No motion = LOW
- Door sensor: Door open = HIGH, Door closed = LOW
- Button: Pressed = HIGH, Not pressed = LOW

**Easy to read**: Use `GPIO.input(pin)` just like buttons!

**Draw**:
```
Sensor → GPIO pin → Read True/False
```

#### 2. Analog Sensors

**Output**: Variable voltage (0V to 3.3V or 5V)

**Examples**:
- Temperature: Hotter = Higher voltage
- Light sensor: Brighter = Higher voltage
- Potentiometer (dial): Turn more = Higher voltage

**Problem for Raspberry Pi**:
- Pi can only read digital (HIGH/LOW)
- Can't read "how much" voltage
- Need special converter (ADC - Analog to Digital Converter)

**Not covering analog today** (requires extra hardware)

#### 3. Serial/Smart Sensors

**Output**: Send digital DATA through special communication

**Examples**:
- DHT11/DHT22: Send temperature AND humidity as data
- GPS module: Sends location data
- Some distance sensors

**Need special library** to decode the data

**Good news**: Libraries do the hard work for us!

---

### Sensor #1: PIR Motion Sensor (3 minutes)

**Show physical sensor to class**

**PIR = Passive InfraRed**

**How it works** (simplified):
1. Everything gives off infrared radiation (heat)
2. PIR has two sensors looking at different areas
3. When something moves, the two sensors see DIFFERENT heat
4. Difference = MOTION DETECTED!
5. Output goes HIGH

**Why "Passive"?**
- Doesn't send out signals
- Just listens for infrared (heat)
- Like ears (passive) vs. mouth (active)

**Show physical features**:
- Dome lens (Fresnel lens) - focuses infrared
- Three pins: VCC (5V), GND, OUT (signal)
- Two adjustment pots: Sensitivity and Time delay
- Jumper for single/repeatable trigger

**Important facts**:
- Needs 60 second warmup time (getting used to room temp)
- Detection range: 3-7 meters (10-23 feet)
- Detects motion, not presence
- Very sensitive! Keep it still during testing

**Real-world uses**:
- Automatic lights
- Security alarms
- Automatic doors
- Halloween decorations!

---

### Sensor #2: DHT Temperature/Humidity (3 minutes)

**Show DHT sensor to class**

**Two versions**:
- DHT11: Cheaper, less accurate (±2°C)
- DHT22: More expensive, more accurate (±0.5°C)

**What it measures**:
1. **Temperature** in Celsius (we can convert to Fahrenheit)
2. **Humidity** in percentage (how much water in air)

**How it works** (simplified):
- Has tiny temperature sensor inside
- Has humidity sensor (special material changes with moisture)
- Built-in microcontroller does math
- Sends data through special protocol

**Need library**: Adafruit_DHT (we'll install together)

**Important facts**:
- Must wait 2 seconds between readings
- Sometimes fails to read (normal! Add retry logic)
- Can use 3.3V or 5V power (check your model)
- Three pins: VCC, GND, DATA

**Real-world uses**:
- Weather stations
- Smart thermostats
- Greenhouse monitoring
- Museum artifact preservation
- Terrarium/aquarium control

**Fun fact**: Professional DHT22 sensors are used in weather balloons!

---

### Sensor #3: HC-SR04 Ultrasonic Distance (2 minutes)

**Show ultrasonic sensor to class**

**Ultrasonic = Sound waves we can't hear**

**How it works**:
1. Sensor sends out ultrasonic pulse (40,000 Hz - we can't hear it)
2. Sound bounces off objects
3. Sensor hears the echo
4. Measures TIME for echo to return
5. Calculate distance: Distance = (Time × Speed of Sound) / 2

**Why divide by 2?**
Sound travels TO object and BACK - that's twice the distance!

**Show physical features**:
- Two "eyes": One is speaker (sends), one is microphone (receives)
- Four pins: VCC (5V), GND, TRIG (trigger), ECHO (receive)

**⚠️ WARNING - VERY IMPORTANT**:
- Echo pin outputs 5 VOLTS
- Pi can only handle 3.3 VOLTS
- MUST use voltage divider on Echo pin!
- Will damage Pi without it!

**Important facts**:
- Range: 2cm to 400cm (about 1 inch to 13 feet)
- Accuracy: ±3mm
- Needs clear line-of-sight
- Affected by temperature (sound speed changes)

**Real-world uses**:
- Car parking sensors
- Robot obstacle avoidance
- Liquid level measurement
- Automatic doors
- Drones for landing

---

## Conclusion & Transition to Activity (1 minute)

**Recap**:
1. Input pins READ from world (opposite of output)
2. Digital input = HIGH or LOW only
3. Need pull-down resistors (internal ones are easy!)
4. Three types of sensors: Digital, Analog, Serial
5. Today: PIR, DHT, and Ultrasonic

**Today's activities**:
- Activity 1: Button input with LED (everyone)
- Activity 2: Choose one sensor to explore

**Safety reminder**:
- Check voltage requirements!
- PIR and Ultrasonic need 5V power
- DHT can use 3.3V or 5V
- Echo pin on ultrasonic needs voltage divider!
- When in doubt, ASK!

**Let's get hands-on! Button activity first...**

---

## Teaching Notes

### Timing Tips
- If running short, combine button states with floating problem
- PIR explanation can be shortened to 2 minutes if needed
- Ultrasonic can be made optional for homework

### Visual Aids Needed
- GPIO pin diagram showing input vs output
- Circuit diagram: button with pull-down
- Sensor photos (large, so everyone can see)
- Wiring diagram for each sensor

### Common Questions & Answers

**Q**: "Why can't Pi read analog?"
**A**: "Pi is digital computer - thinks in 1s and 0s. Needs converter to turn 'how much' into numbers. Some other boards (like Arduino) have converters built-in."

**Q**: "What's the difference between pull-up and pull-down?"
**A**: "Just which way we pull! Pull-down pulls to LOW (0V), pull-up pulls to HIGH (3.3V). Choice depends on how we want button to work."

**Q**: "Can I use external resistors instead of internal?"
**A**: "Yes! 10kΩ resistor works great. But internal is easier - just one line of code!"

**Q**: "Why does DHT sensor fail sometimes?"
**A**: "It's communicating with tiny signals, and electrical noise can interfere. That's why we always check if reading is None and retry. Professional systems do the same thing!"

**Q**: "How accurate are these sensors?"
**A**: "DHT11: ±2°C (good enough for most projects). DHT22: ±0.5°C (pretty good!). Ultrasonic: ±3mm (very good!). For hobby projects, these are great!"

### Interactive Elements
- Ask for predictions before demonstrations
- Have students raise hands for types of sensors they've seen
- Quick quiz: "Is this sensor digital or analog?"
- Show excited demo at start for motivation

### Differentiation
- Visual learners: Draw everything on board
- Kinesthetic learners: Pass sensors around during lecture
- Advanced students: Mention ADC for future analog work
- Struggling students: Focus on button first, sensor optional

---

## Key Takeaways

Students should leave this lecture understanding:
1. ✓ Input pins READ, output pins WRITE
2. ✓ Digital input = HIGH or LOW only
3. ✓ Floating pins are bad - use pull-down/pull-up
4. ✓ Sensors convert physical world to electrical signals
5. ✓ Different sensor types: digital, analog, serial
6. ✓ Each sensor has specific voltage and timing requirements
7. ✓ Safety: Check voltage before connecting!

---

**Next up**: Hands-on activities! Let's build circuits! 🔘🌡️
