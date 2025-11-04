# Week 4 Instructor Guide

## Pre-Class Preparation

### ⚠️ CRITICAL SAFETY REVIEW
Before class, you MUST:
- [ ] Review all safety warnings in this guide
- [ ] Test all circuits yourself before class
- [ ] Have a multimeter ready to test connections
- [ ] Prepare spare components (LEDs, resistors, wires)
- [ ] Know how to quickly shutdown a Pi if needed
- [ ] Have fire extinguisher location identified (standard classroom safety)

### Technical Setup (1-2 days before)
- [ ] Test GPIO on all Raspberry Pis
- [ ] Verify RPi.GPIO library is installed: `python3 -c "import RPi.GPIO"`
- [ ] Pre-sort component kits for each student/group
- [ ] Label GPIO pin diagrams for classroom display
- [ ] Test the example circuits on each Pi
- [ ] Charge any portable power banks (if using)
- [ ] Prepare camera/document camera for circuit demonstrations

### Component Preparation Per Station
- [ ] 1 breadboard
- [ ] 3+ LEDs (red, yellow, green ideal)
- [ ] 10+ resistors (560Ω-1kΩ)
- [ ] 10+ male-to-female jumper wires
- [ ] GPIO pin reference card (printed)
- [ ] Resistor color code chart (printed)

### Materials to Prepare
- [ ] Print Quick Start guides (1 per student)
- [ ] Print GPIO pinout diagrams (1 per station)
- [ ] Print circuit diagrams large for demonstration
- [ ] Prepare LED test setup for demonstration
- [ ] Have spare components ready
- [ ] Prepare "broken" circuit for troubleshooting demo

### Room Setup
- [ ] Extra lighting for seeing small components
- [ ] Magnifying glasses available (optional, helpful)
- [ ] First aid kit accessible
- [ ] Clear workspace at each station
- [ ] Fire extinguisher location reviewed
- [ ] Instructor has working example circuit ready

---

## Lesson Timing (90 minutes total)

### Review of Week 3 Python (10 minutes)
- Quick recap: variables, loops, if statements, functions
- Preview: "Today we control physical things with Python!"
- Show exciting demo: traffic light or blinking pattern

### Safety & GPIO Theory Lecture (20 minutes)
**CRITICAL**: Do NOT rush safety!
- GPIO safety warnings (emphasize multiple times)
- What are GPIO pins
- Pin numbering (BCM vs BOARD)
- How LEDs work
- Why resistors are essential
- Breadboard layout explanation

### Breadboard & Circuit Demo (15 minutes)
- Live demo of building LED circuit
- Think aloud while building
- Intentionally make and fix a mistake
- Show how to test connections
- Run simple on/off program

### Activity 1: Blink an LED (20 minutes)
- Students build basic LED circuit
- Write program to blink LED
- See activities/01-first-led.md
- Instructor circulates, checks circuits before power on

### Break (5 minutes)
- Students can troubleshoot issues
- Good time to help struggling students

### Activity 2: Traffic Light (25 minutes)
- Add two more LEDs to create traffic light
- Write program for traffic light sequence
- See activities/02-traffic-light.md
- Encourage creativity in timing patterns

### Wrap-up and Q&A (10 minutes)
- Review safety one more time
- Preview homework
- Remind about proper shutdown procedure
- Answer questions
- Collect components if not leaving with students

---

## Safety Protocol - ESSENTIAL

### Before EVERY Circuit Build
**Instructor must check EVERY student circuit before they power on for the first time.**

Checklist:
1. [ ] Resistor present in LED circuit
2. [ ] LED orientation correct (long leg to +)
3. [ ] Using Ground pin, not 5V
4. [ ] No short circuits (3.3V to Ground)
5. [ ] Wires firmly inserted
6. [ ] Pin numbers match code

### Emergency Procedures

**If you see sparks, smoke, or smell burning:**
1. **Immediately unplug the power supply**
2. **Do not touch the Pi until unplugged**
3. Let components cool before examining
4. Identify what went wrong
5. Replace damaged components
6. Review with student what happened

**Common causes:**
- 3.3V or 5V connected directly to Ground
- Forgot resistor with LED
- Wire touching multiple contacts

**If a student reports GPIO not working:**
- Could be damaged pin (recoverable - other pins work)
- Could be software issue
- Use multimeter to test pin
- Try different pin
- Document which pins are damaged (for future reference)

### What to Watch For During Class
- Students connecting components without powering off
- Students forcing wires into breadboard
- Wires precariously balanced (not fully inserted)
- Students working too quickly without checking
- Multiple students helping one station (can create confusion)
- Signs of frustration (offer immediate help)

---

## Teaching Tips

### Explaining GPIO Pins
**Effective Analogy**: "GPIO pins are like light switches you can control with code. When you flip the switch ON (HIGH), electricity flows. When you flip it OFF (LOW), it stops. But unlike a light switch, you can program WHEN the switch flips!"

**Visual Demo**: Use a flashlight with a manual button to demonstrate on/off before showing GPIO.

### Explaining Current Flow
**Effective Analogy**: "Think of electricity like water in pipes. Voltage is like water pressure, current is like the flow rate, and resistance (resistor) is like putting your thumb partially over the hose to slow the flow."

**Important**: Don't get too deep into electrical theory - keep it practical.

### Breadboard Explanation
**Demo Technique**:
1. Show breadboard with LEDs inserted
2. Light them up using a battery
3. Show which holes light the LED vs which don't
4. Use a multimeter to show continuity
5. Draw the internal connections on the board

### Resistor Color Codes
**Teaching Approach**:
- Focus on identifying 560Ω and 1kΩ only
- Give students pre-sorted resistors
- Mention color code exists but don't require memorization
- Say: "When you need other values later, you'll learn to read codes"
- Keep a chart visible for reference

### Troubleshooting Strategy
When a student's circuit doesn't work:

1. **Don't immediately fix it** - Guide them through diagnosis
2. Ask questions:
   - "Is your LED the right way around?"
   - "Can you trace the current flow for me?"
   - "Did you run the program with sudo?"
3. **Teach testing**: Use multimeter or test LED separately
4. **Praise problem-solving**: "Great job checking the resistor!"
5. **Document common errors** for future lessons

---

## Common Student Mistakes

### Circuit Mistakes

#### 1. LED Backwards
**Symptom**: LED doesn't light
**Fix**: Flip LED around
**Teaching moment**: Show the flat side on LED casing (cathode marker)

#### 2. Forgot Resistor
**Symptom**: LED very bright, might damage GPIO
**Danger**: HIGH! Fix immediately
**Fix**: Power off, add resistor
**Teaching moment**: Show why resistors matter with diagram

#### 3. Wrong GPIO Pin
**Symptom**: LED doesn't light
**Fix**: Check BCM pin number matches code
**Teaching moment**: Review BCM vs physical pin numbers

#### 4. Loose Connection
**Symptom**: LED flickers or doesn't light
**Fix**: Push wires firmly into breadboard
**Teaching moment**: Show how to properly insert wires

#### 5. Using 5V Instead of GPIO Pin
**Symptom**: LED always on, can't control
**Fix**: Move wire to GPIO pin
**Teaching moment**: Explain GPIO vs power pins

#### 6. No Ground Connection
**Symptom**: Circuit doesn't work
**Fix**: Connect ground wire
**Teaching moment**: Explain complete circuit necessity

### Programming Mistakes

#### 1. Forgot sudo
**Symptom**: "No access to /dev/mem" error
**Fix**: Run with `sudo python3 program.py`
**Teaching moment**: Explain why GPIO needs superuser access

#### 2. Wrong Pin Number
**Symptom**: Different LED lights or nothing happens
**Fix**: Verify pin number in code matches circuit
**Teaching moment**: Review pinout diagram

#### 3. Forgot GPIO.cleanup()
**Symptom**: "Channel already in use" on next run
**Fix**: Add cleanup at end or run `GPIO.cleanup()` in Python shell
**Teaching moment**: Explain cleanup importance

#### 4. Forgot to Set Pin Mode
**Symptom**: Error about pin not set up
**Fix**: Add `GPIO.setup(pin, GPIO.OUT)`
**Teaching moment**: Review setup sequence

#### 5. Typo in Pin Variable
**Symptom**: NameError or wrong pin activates
**Fix**: Check variable spelling
**Teaching moment**: Importance of consistent naming

---

## Differentiation Strategies

### For Struggling Students
- **Pre-built circuits**: Have a working circuit they can test
- **Color-coded wires**: Use red for power, black for ground
- **Simplified diagrams**: Remove extra details
- **Pair programming**: Partner with stronger student
- **Checklist approach**: Physical printed checklist to verify each step
- **One step at a time**: Build circuit in stages, test each stage

### For Advanced Students
- **Challenge problems**:
  - Create a binary counter with 4 LEDs
  - Make a Knight Rider scanning pattern
  - Add user input to control speed
  - Create random blinking patterns
  - Make a brightness fade (PWM - may need introduction)
- **Debugging helper**: Have them help troubleshoot other students
- **Documentation**: Have them create their own circuit diagrams
- **Exploration**: Let them try different resistor values (safely)

---

## Demonstration Best Practices

### Live Circuit Building
1. **Talk through every step**: "First, I'll insert the resistor here..."
2. **Face the class**: Use document camera or mirror setup
3. **Go slowly**: This is probably their first circuit
4. **Use color-coded wires**: Makes it easier to follow
5. **Explain why**: "I'm using Ground pin 6 because it's close..."
6. **Show the code**: Keep code and circuit visible simultaneously
7. **Test incrementally**: Show testing after each component added

### Intentional Mistakes Demo
Build a circuit with a common mistake, show it not working, troubleshoot:
- Builds confidence that mistakes are normal
- Shows problem-solving process
- Makes errors less scary
- Example: Build LED without resistor, show it doesn't work right, explain why

---

## Managing the Class

### If Students Finish Early
- Have them help nearby students (great learning)
- Challenge: Create different blink patterns
- Challenge: Add delays that create rhythms
- Challenge: Make LEDs chase each other
- Start homework problems
- Explore PWM for LED dimming (with guidance)

### If Running Behind
- Skip detailed resistor color code explanation
- Provide pre-wired circuits for Activity 1
- Combine activities: Demo traffic light, students do simpler version
- Assign Activity 2 as homework with detailed instructions
- Schedule extra open lab time

### If Many Circuits Fail
**STOP CLASS**
- Don't let students get frustrated with broken circuits
- Review common mistakes as a class
- Check one circuit together step-by-step
- Verify you didn't hand out bad components
- Consider taking a break while you help debug

---

## Assessment Checkpoints

### Mid-Lesson Check (after Activity 1)
Can students:
- [ ] Build a simple LED circuit correctly?
- [ ] Identify LED polarity?
- [ ] Write basic GPIO code?
- [ ] Turn an LED on and off?
- [ ] Use time.sleep() for blinking?

### End of Lesson Check (after Activity 2)
Can students:
- [ ] Control multiple LEDs independently?
- [ ] Create timed sequences?
- [ ] Debug basic circuit problems?
- [ ] Explain why resistors are needed?
- [ ] Properly shutdown and cleanup GPIO?

### Homework Review
Check for:
- Correct circuit construction in photos
- Working code that demonstrates concepts
- Proper safety practices mentioned
- Creative additions or explorations
- Understanding of GPIO concepts

---

## Lab Safety Procedures

### Start of Class
- Review safety rules (every class!)
- Check all workspaces are clear and organized
- Verify all Pis are powered off
- Ensure proper lighting

### During Class
- Circulate constantly
- Check circuits before first power-on
- Watch for signs of component damage
- Listen for unusual sounds (sparking)
- Smell for burning (distinctive odor)

### End of Class
- Verify all Pis properly shut down
- Check for overheated components
- Inventory components
- Note any damaged items
- Secure equipment if staying in room

---

## Component Management

### Pre-Class Sorting
- Sort resistors by value
- Test LEDs before distributing (some may be dead)
- Ensure mix of wire colors
- Check breadboards for bent contacts

### During Class
- Keep spare components accessible
- Have replacement LEDs ready (students will break some)
- Keep one "golden" reference kit intact

### After Class
- Count components
- Replace missing items
- Test suspicious components
- Organize for next week

---

## Troubleshooting Guide for Instructors

### LED Not Lighting - Systematic Approach

1. **Visual inspection**
   - LED polarity correct?
   - Resistor present?
   - Wires fully inserted?
   - Correct pins used?

2. **Test LED separately**
   - Use another Pi or battery
   - Confirms LED works

3. **Test GPIO pin**
   - Use multimeter
   - Check pin reads ~3.3V when HIGH
   - Try different pin

4. **Check code**
   - Correct pin number?
   - Set to OUTPUT?
   - Set to HIGH?
   - Using BCM mode?

5. **Check software**
   - Running with sudo?
   - Library imported?
   - GPIO not in use by other program?

### Multimeter Usage
**Teach students (optional advanced topic)**:
- Continuity mode: Check connections
- Voltage mode: Verify pin output
- Current mode: Measure LED current (advanced)

---

## Extension Ideas

### Mini-Challenges During Class
1. "Make your LED blink SOS in Morse code"
2. "Create a pattern that speeds up over time"
3. "Make two LEDs blink alternately"
4. "Create a heartbeat pattern (two quick blinks, pause)"

### Real-World Connections
- Traffic lights and timing systems
- Warning lights on equipment
- Status indicators on electronics
- Emergency vehicle lights
- Holiday light displays

### Cross-Curricular Connections
- **Math**: Timing calculations, patterns, frequencies
- **Science**: Electricity, circuits, conductivity
- **Art**: Light patterns, visual sequences
- **Music**: Create rhythmic patterns with lights

---

## Common Questions from Students

**Q: "Why do we need resistors?"**
A: LEDs want to draw too much current. Without resistors, they'll damage the GPIO pin or burn out. Resistors limit the current to safe levels.

**Q: "Can I use any resistor?"**
A: For LEDs, use 220Ω-1kΩ. Lower = brighter (but max 220Ω for safety), higher = dimmer.

**Q: "What if I forget the resistor?"**
A: You might damage the GPIO pin. Always use a resistor! If you forget once briefly, probably OK, but don't make it a habit.

**Q: "Why BCM and not BOARD numbering?"**
A: BCM numbers match the GPIO names in documentation. It's more universal across Raspberry Pi models.

**Q: "Can I leave it running overnight?"**
A: Yes, but not recommended for beginners. Always shut down properly when done.

**Q: "Why does it need sudo?"**
A: GPIO pins need hardware access, which requires superuser permissions for safety.

**Q: "My LED is really dim, is that OK?"**
A: Probably means resistor is too high (over 1kΩ). Try lower value. Or LED might be dying.

**Q: "Can I control more than 3 LEDs?"**
A: Yes! But remember total current limit. With resistors, 8-10 LEDs should be fine.

---

## Week 5 Preparation

Before next week:
- [ ] Students comfortable with basic GPIO
- [ ] All equipment working and inventoried
- [ ] Push buttons prepared for next week
- [ ] Review input vs output concepts
- [ ] Consider student groupings for paired activities

---

## Reflection Questions

After teaching this week:
1. How many students successfully completed both activities?
2. What safety issues came up?
3. Which troubleshooting issues were most common?
4. Did the pacing work?
5. What confused students most?
6. What should be emphasized more next time?
7. Were there any damaged components? How can we prevent that?

---

## Emergency Contacts

Keep readily available:
- School nurse
- Building maintenance (electrical issues)
- IT support (if Pi OS issues)
- Supplier contact (for emergency component orders)

---

**Remember**: Safety first, always! Better to go slower and be safe than rush and damage equipment or injure students. Physical computing is incredibly rewarding, but it requires careful attention to safety and detail.

**You've got this!** 🔴🟡🟢
