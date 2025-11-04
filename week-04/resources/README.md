# Week 4 Additional Resources

This folder contains supplementary materials for learning GPIO control and LED circuits.

## Files in This Folder

### Coming Soon
Additional resources and reference materials will be added here as needed.

---

## Online Resources

### Official Documentation
- **Raspberry Pi GPIO Documentation**: https://www.raspberrypi.org/documentation/usage/gpio/
- **RPi.GPIO Python Library**: https://sourceforge.net/projects/raspberry-gpio-python/
- **GPIO Pinout Interactive**: https://pinout.xyz

### Tutorials and Guides
- **Raspberry Pi Foundation Projects**: https://projects.raspberrypi.org
- **Adafruit Learn**: https://learn.adafruit.com/category/raspberry-pi
- **SparkFun Tutorials**: https://learn.sparkfun.com/tutorials/tags/raspberry-pi

### Video Tutorials
- **The Raspberry Pi Guy** (YouTube): Beginner-friendly GPIO tutorials
- **ExplainingComputers** (YouTube): Raspberry Pi project series
- **Raspberry Pi Foundation** (YouTube): Official tutorials

---

## GPIO Safety Resources

### Important Safety Guidelines
1. **Never exceed 16mA per GPIO pin**
2. **Never connect 5V to GPIO input pins**
3. **Always use resistors with LEDs**
4. **Power off before changing circuits**
5. **Double-check all connections**

### What to Do If Something Goes Wrong
1. **Immediately unplug power**
2. **Don't touch components until unplugged**
3. **Identify the problem**
4. **Document what happened**
5. **Ask instructor before retrying**

---

## Electronics Basics

### Understanding LEDs
- **LED** = Light Emitting Diode
- **Diode** = One-way component
- **Forward Voltage**: Voltage LED needs (typically 2-2.2V)
- **Forward Current**: Current LED needs (typically 10-20mA)

### Understanding Resistors
- **Purpose**: Limit current flow
- **Resistance**: Measured in Ohms (Ω)
- **Power Rating**: How much power resistor can handle
- **For LEDs**: Any 220Ω-1kΩ resistor works fine

### Ohm's Law
```
V = I × R

V = Voltage (Volts)
I = Current (Amperes)  
R = Resistance (Ohms)
```

**Example**:
```
Want 10mA through LED
GPIO = 3.3V, LED drops 2V
Voltage across resistor = 1.3V

R = V / I = 1.3V / 0.01A = 130Ω
Use 220Ω or higher for safety!
```

---

## Breadboard Tips

### How to Use Breadboards Effectively
1. **Plan your layout** before building
2. **Keep components close** to minimize wire length
3. **Use color-coded wires** for organization
4. **Test connections** as you build
5. **Take photos** of working circuits

### Breadboard Maintenance
- Don't reuse same holes excessively
- Clean with compressed air
- Check for bent contacts
- Replace if connections become unreliable

---

## GPIO Pin Reference Summary

### Our Standard Pins
- **GPIO 17** (Pin 11): Red LED / First LED
- **GPIO 27** (Pin 13): Yellow LED / Second LED
- **GPIO 22** (Pin 15): Green LED / Third LED

### Ground Pins
- **Pin 6**: Most convenient for single LED
- **Pin 9, 14, 20, 25, 30, 34, 39**: Additional grounds

### Power Pins (Use Carefully!)
- **3.3V**: Pins 1, 17
- **5V**: Pins 2, 4 (Don't use for LEDs!)

---

## Common Problems and Solutions

### Problem: LED Doesn't Light
**Possible Causes**:
- LED backwards → Flip it
- No resistor → Add one
- Loose connection → Check wires
- Wrong pin → Verify GPIO number
- Dead LED → Test with different LED
- Code not running → Check for errors

### Problem: LED Always On
**Possible Causes**:
- Connected to 3.3V or 5V power → Use GPIO pin
- Pin set to HIGH and not changing → Check code logic
- Different GPIO pin active → Verify pin numbers

### Problem: Python Error Messages
**"No access to /dev/mem"**
- Forgot to use `sudo`
- Solution: `sudo python3 program.py`

**"Channel already in use"**
- Previous program didn't cleanup
- Solution: Run `GPIO.cleanup()` in Python shell
- Or: Reboot Pi

**"NameError: name 'GPIO' is not defined"**
- Forgot to import
- Solution: Add `import RPi.GPIO as GPIO`

---

## Code Templates

### Basic LED Control Template
```python
import RPi.GPIO as GPIO
import time

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Your pin
LED = 17

# Configure pin
GPIO.setup(LED, GPIO.OUT)

# Your code here
# ...

# Cleanup
GPIO.cleanup()
```

### Blink Forever Template
```python
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
LED = 17
GPIO.setup(LED, GPIO.OUT)

try:
    while True:
        GPIO.output(LED, GPIO.HIGH)
        time.sleep(0.5)
        GPIO.output(LED, GPIO.LOW)
        time.sleep(0.5)
        
except KeyboardInterrupt:
    print("\nStopping...")
    
finally:
    GPIO.cleanup()
```

### Multiple LEDs Template
```python
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)

# Define all pins
LEDS = [17, 27, 22]

# Setup all pins
for led in LEDS:
    GPIO.setup(led, GPIO.OUT)

# Your code here
# ...

# Cleanup
GPIO.cleanup()
```

---

## Project Ideas

### Beginner Projects
1. **Blinking LED patterns** (done in class)
2. **Morse code transmitter** (homework)
3. **Binary counter with LEDs**
4. **Christmas light patterns**
5. **LED dice roller**

### Intermediate Projects
1. **Traffic light with pedestrian crossing**
2. **Simon Says memory game**
3. **LED bar graph display**
4. **Reaction time tester**
5. **Music visualizer**

### Advanced Projects (Future Weeks)
1. **LED matrix display**
2. **7-segment display controller**
3. **RGB LED color mixer**
4. **POV (Persistence of Vision) display**
5. **LED weather indicator**

---

## Study Tips

### To Master GPIO Control
1. **Build circuits slowly** - Don't rush
2. **Test incrementally** - One component at a time
3. **Document your work** - Take photos, write notes
4. **Experiment safely** - Try different patterns
5. **Help others** - Teaching reinforces learning

### Common Mistakes to Avoid
1. ❌ Forgetting resistors
2. ❌ LED backwards
3. ❌ Using wrong pin numbers
4. ❌ Not using sudo
5. ❌ Forgetting GPIO.cleanup()
6. ❌ Making changes while powered on

### Debugging Checklist
When something doesn't work:
- [ ] Check physical connections
- [ ] Verify LED polarity
- [ ] Confirm resistor present
- [ ] Match pin numbers in code and circuit
- [ ] Run with sudo
- [ ] Look at error messages
- [ ] Test with simple known-working code

---

## Component Reference

### LEDs
**Types**:
- Standard 5mm LEDs (what we use)
- High-brightness LEDs (need different resistors)
- RGB LEDs (3 colors in one)
- Bi-color LEDs (2 colors)

**Colors and Forward Voltage**:
- Red: ~2.0V
- Yellow/Green: ~2.2V
- Blue/White: ~3.0-3.3V

### Resistors
**Common Values for LEDs**:
- 220Ω - Bright
- 330Ω - Bright
- 560Ω - Medium (our standard)
- 1kΩ - Dimmer but safe

**Power Rating**:
- 1/4 Watt (standard) - Perfect for LEDs
- 1/8 Watt - Also works fine
- Don't need higher ratings for LEDs

---

## Tools and Equipment

### Essential Tools
- Raspberry Pi with Raspberry Pi OS
- Breadboard (400 or 830 tie-points)
- Jumper wires (male-to-female)
- LEDs (assorted colors)
- Resistors (assorted values)

### Helpful Tools (Optional)
- **Multimeter**: Test connections and voltages
- **Wire strippers**: If using solid core wire
- **Component organizer**: Keep parts sorted
- **Magnifying glass**: See small components
- **Good lighting**: Essential for detail work

---

## Next Steps

### After Week 4
You should be able to:
- ✓ Build simple LED circuits
- ✓ Control LEDs with Python
- ✓ Use multiple GPIO pins
- ✓ Create timed sequences
- ✓ Debug basic circuit problems

### Preparing for Week 5
Next week adds **input**:
- Reading button presses
- Responding to sensor data
- Interactive LED control
- Combining input and output

**Get ready by**:
- Reviewing Week 4 concepts
- Completing homework
- Being comfortable with GPIO basics
- Having questions ready

---

## Additional Help

### When You Need Help
1. **Review class materials** first
2. **Check this resources folder**
3. **Search online** for specific error messages
4. **Ask classmates** - collaboration helps!
5. **Ask instructor** - no question too basic!

### Online Communities
- **Raspberry Pi Forums**: https://forums.raspberrypi.com
- **r/raspberry_pi**: Reddit community
- **Stack Overflow**: For programming questions
- **Element14 Community**: Technical discussions

---

## Safety Reminder

**Always remember**:
1. Power OFF before changes
2. Use resistors with LEDs
3. Check LED polarity
4. Verify pin numbers
5. Double-check before power on
6. Ask when unsure

**If you damage something**:
- Don't panic - it happens
- Tell instructor immediately
- Learn from the mistake
- Follow safety rules next time

---

## Course Integration

### Week 4 Builds On
- **Week 1**: Raspberry Pi setup
- **Week 2**: Understanding hardware
- **Week 3**: Python programming basics

### Week 4 Prepares For
- **Week 5**: GPIO input (buttons)
- **Week 6**: Sensors and motors
- **Week 7**: Robot control

---

**GPIO control is the foundation of physical computing!** Master these basics and you'll be ready for amazing projects! 💡🔧✨
