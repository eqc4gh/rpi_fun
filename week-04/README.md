# Week 4: GPIO Basics & LED Control

## Overview
Welcome to Week 4! This week marks an exciting milestone - we'll use the Python skills from Week 3 to control real hardware. You'll learn how to safely use the Raspberry Pi's GPIO (General Purpose Input/Output) pins to control LEDs, creating your first physical computing projects!

## Learning Objectives
By the end of this week, students will be able to:
- Understand what GPIO pins are and how they work
- Identify GPIO pin numbers using both numbering schemes
- Build simple circuits on a breadboard safely
- Write Python programs to control LEDs
- Turn LEDs on and off programmatically
- Create blinking LED patterns
- Build a traffic light simulator
- Follow electrical safety best practices

## Topics Covered
1. **Introduction to GPIO**
   - What are GPIO pins?
   - Pin numbering: BCM vs BOARD
   - GPIO capabilities and limitations
   - Safety warnings and best practices

2. **Basic Electronics Review**
   - How LEDs work
   - Why we need resistors
   - Reading resistor color codes
   - Basic circuit concepts

3. **Breadboard Basics**
   - How breadboards work
   - Building circuits without soldering
   - Connecting components properly
   - Common breadboard mistakes

4. **Using RPi.GPIO Library**
   - Importing and setting up GPIO
   - Setting pin modes (INPUT/OUTPUT)
   - Turning pins HIGH and LOW
   - Cleaning up GPIO properly

5. **LED Control**
   - Connecting an LED safely
   - Turning LED on/off with code
   - Blinking an LED
   - Controlling multiple LEDs
   - Creating LED patterns

## Materials Needed
From your kit:
- Raspberry Pi (set up from Week 1)
- Breadboard
- LEDs (at least 3 - red, yellow, green recommended for traffic light)
- Resistors (560Ω to 1kΩ)
- Jumper wires (Male-to-Female)
- Monitor, keyboard, and mouse
- Power supply

## ⚠️ Safety First!

**CRITICAL GPIO SAFETY RULES:**
1. **NEVER connect 5V or 3.3V directly to GND** - This will damage your Pi!
2. **ALWAYS use resistors with LEDs** - Without them, you can damage GPIO pins
3. **Check your wiring before powering on** - Take time to verify connections
4. **Turn off Pi before changing circuits** - Use `sudo shutdown -h now`
5. **No more than 16mA per pin** - Keep current low
6. **Maximum 50mA total for all pins** - Don't use too many LEDs at once
7. **Be gentle** - GPIO pins can bend or break if forced

**If you're unsure about a connection, ASK before powering on!**

## Class Structure
- **Review of Week 3 Python**: 10 minutes
- **GPIO Theory & Safety Lecture**: 20 minutes
- **Breadboard & Circuit Demo**: 15 minutes
- **Hands-on Activity 1 (Blink an LED)**: 20 minutes
- **Break**: 5 minutes
- **Hands-on Activity 2 (Traffic Light)**: 25 minutes
- **Review and Q&A**: 10 minutes

## Files in This Week's Folder
- `README.md` - This file, overview of the week
- `QUICK-START.md` - Quick reference for GPIO and circuits
- `INSTRUCTOR-GUIDE.md` - Teaching notes and safety tips
- `lecture/` - Detailed lecture notes with diagrams
- `activities/` - In-class hands-on projects
- `diagrams/` - Circuit diagrams and pin reference
- `resources/` - Additional learning materials
- `week04-homework.md` - Take-home practice assignments

## Getting Started

### Before You Begin
1. **Review Week 3 Python concepts** - We'll use variables, loops, and if statements
2. **Organize your components** - Have LEDs, resistors, wires ready
3. **Clear workspace** - You'll be building physical circuits
4. **Have patience** - Physical computing takes practice!

### First Steps
1. Power off your Raspberry Pi: `sudo shutdown -h now`
2. Identify your GPIO pins (look for the 40-pin header)
3. Get familiar with your breadboard layout
4. Sort your resistors (we'll learn to read the color codes)
5. Test LEDs (we'll learn how to do this safely)

## Key Concepts to Remember

### GPIO Basics
- **GPIO** = General Purpose Input/Output
- **Pins** can be programmed as INPUT (read data) or OUTPUT (send signals)
- This week focuses on **OUTPUT** to control LEDs
- GPIO pins provide **3.3V** when HIGH (not 5V!)
- Pin numbering matters - we'll use **BCM numbering**

### Circuit Basics
- **Current flows** from positive (+) to negative (-)
- **Resistors limit current** to protect components
- **LEDs have polarity** - long leg is positive (+), short leg is negative (-)
- **Breadboards** connect components in rows and columns

### Programming GPIO
- Must run Python programs with **sudo** (superuser access)
- Always **import RPi.GPIO as GPIO**
- Set the pin numbering mode: **GPIO.setmode(GPIO.BCM)**
- Set up pins before using them: **GPIO.setup(pin, GPIO.OUT)**
- Clean up when done: **GPIO.cleanup()**

## Tips for Success
- **Double-check circuits** before powering on
- **Start simple** - Get one LED working before adding more
- **Use the diagrams** - Visual references are your friend
- **Test incrementally** - Don't build everything at once
- **Keep wires organized** - Messy circuits are hard to debug
- **Don't force connections** - Components should fit easily
- **Ask questions** - Better safe than sorry!

## Common Beginner Mistakes (And How to Avoid Them)

1. **Wrong pin numbering** → Always use BCM numbering (GPIO numbers)
2. **Forgetting resistors** → ALWAYS use resistors with LEDs
3. **LED backwards** → Long leg goes to positive (through resistor)
4. **Loose connections** → Push wires firmly into breadboard
5. **Forgetting GPIO.cleanup()** → Always clean up at program end
6. **Running without sudo** → Use `sudo python3 program.py`
7. **Not shutdown properly** → Use `sudo shutdown -h now` before wiring changes

## Troubleshooting Quick Checks

**LED won't light up?**
- [ ] Is the Pi powered on?
- [ ] Is LED connected correctly (long leg to +)?
- [ ] Is there a resistor in the circuit?
- [ ] Are all wires firmly connected?
- [ ] Did you set the pin to OUTPUT?
- [ ] Did you set the pin to HIGH?
- [ ] Try a different LED (might be broken)

**Error messages in Python?**
- [ ] Did you run with `sudo`?
- [ ] Did you import RPi.GPIO?
- [ ] Did you set the mode (BCM)?
- [ ] Is the pin number correct?
- [ ] Did another program not clean up GPIO?

## Looking Ahead

**This Week**: Learn GPIO basics and control LEDs
**Next Week**: Add user input with buttons and sensors
**Future Weeks**: Build robots, create interactive projects, and more!

## Why This Matters

GPIO pins are what make Raspberry Pi special! Once you understand how to control LEDs, you can control:
- Motors (for robots)
- Buzzers (for alarms)
- Displays (for information)
- Relays (to control high-power devices)
- And much more!

This week's skills are the foundation for all physical computing projects.

---

**Important Reminder**: Physical computing involves electricity. Always follow safety guidelines, double-check your wiring, and ask for help when unsure. Better to take an extra minute to verify than to damage components!

**Have fun and stay safe!** 🔴🟡🟢
