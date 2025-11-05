# Week 5 Troubleshooting Guide

## Quick Diagnostic Flowchart

```
Problem?
   │
   ├─ Button issues? → See "Button Problems" section
   ├─ PIR sensor issues? → See "PIR Sensor Problems" section
   ├─ DHT sensor issues? → See "DHT Sensor Problems" section
   ├─ Ultrasonic issues? → See "Ultrasonic Problems" section
   └─ General GPIO issues? → See "General Problems" section
```

---

## Button Problems

### Button always reads LOW (never detects press)

**Check**:
1. Is button properly inserted in breadboard?
   - All 4 legs should be in breadboard firmly
   - Button should straddle center gap
2. Is button connected to 3.3V?
   - Need connection from button to 3.3V pin
3. Is pull-down resistor enabled?
   ```python
   GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
   ```
4. Try different button (might be broken)
5. Test button with multimeter (continuity test)

---

### Button always reads HIGH (always pressed)

**Check**:
1. Are you using pull-UP instead of pull-DOWN?
   - With pull-up, logic is reversed!
   - Pressed = LOW, Not pressed = HIGH
2. Short circuit somewhere?
   - Check wires not touching
3. Wrong GPIO pin in code?
   - Verify pin number matches physical connection

---

### Button triggers multiple times per press

**This is normal!** It's called "bouncing"

**Solutions**:
```python
# Solution 1: Software debouncing with delay
if GPIO.input(BUTTON_PIN):
    print("Button pressed!")
    time.sleep(0.2)  # Debounce delay

# Solution 2: Using event detection
GPIO.add_event_detect(BUTTON_PIN, GPIO.RISING, 
                      callback=button_callback, 
                      bouncetime=200)
```

---

### Random readings without pressing button

**This is "floating" - pin has no defined voltage**

**Fix**:
```python
# Add pull-down resistor:
GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

# Or external 10kΩ resistor from GPIO to GND
```

---

## PIR Sensor Problems

### PIR constantly triggers (never stops)

**Most Common Causes**:

1. **Didn't wait for warmup**
   - MUST wait 60 seconds after power on
   - Sensor needs to stabilize to room temperature
   ```python
   print("Warming up sensor...")
   time.sleep(60)
   ```

2. **Sensor is moving**
   - PIR must be completely stable
   - Even slight movement triggers it
   - Solution: Tape sensor down, secure firmly

3. **Time delay set too high**
   - Output stays HIGH for too long
   - Solution: Turn Tx pot counterclockwise (shorter delay)

4. **Pointing at heat source**
   - Don't point at heater, AC vent, window
   - Sunlight changes temperature, triggers sensor
   - Solution: Point at stable area

5. **Sensitivity too high**
   - Triggers from far away or small movements
   - Solution: Turn Sx pot counterclockwise (less sensitive)

---

### PIR never triggers

**Check**:
1. **Power connection**
   - VCC must connect to 5V (not 3.3V!)
   - Verify with multimeter: Should read ~5V
2. **Output pin connection**
   - OUT pin to GPIO (check pin number in code)
3. **Sensor orientation**
   - Dome should face OUTWARD
   - Sensors are behind dome
4. **Try adjusting sensitivity**
   - Turn Sx pot clockwise (more sensitive)
5. **Defective sensor**
   - Try different PIR sensor
   - Some sensors DOA (Dead On Arrival)

---

### PIR has delayed response

**This is somewhat normal, but can be improved**:

1. **Time delay pot**
   - Turn Tx counterclockwise for faster reset
2. **Single vs Repeatable trigger**
   - Check jumper setting
   - H position = repeatable (better for projects)
   - L position = single trigger (waits for delay)

---

## DHT Sensor Problems

### "ImportError: No module named Adafruit_DHT"

**Library not installed**

**Fix**:
```bash
sudo pip3 install Adafruit_DHT --break-system-packages

# Verify:
python3 -c "import Adafruit_DHT; print('OK!')"
```

**If still failing**:
```bash
sudo apt-get update
sudo apt-get install python3-pip
sudo pip3 install --upgrade pip
sudo pip3 install Adafruit_DHT --break-system-packages
```

---

### Always returns None (no readings)

**Check**:
1. **Power connection**
   - VCC to 3.3V OR 5V (check sensor specs)
   - Most DHT modules work with 3.3V
   - Some sensors require 5V
2. **Data pin connection**
   - DATA pin to GPIO 4 (or whichever you're using)
   - Check pin number in code matches physical connection
3. **Sensor type in code**
   - DHT11: `Adafruit_DHT.DHT11`
   - DHT22: `Adafruit_DHT.DHT22`
   - Using wrong type = no readings
4. **Try different GPIO pin**
   - GPIO 4 recommended, but try 17, 27, 22
5. **Defective sensor**
   - DHT sensors can be finicky
   - Try different sensor if available

---

### Frequent read failures (getting None sometimes)

**This is NORMAL for DHT sensors!**

**Why it happens**:
- Single-wire serial protocol is sensitive to timing
- Electrical noise can interfere
- Temperature changes affect readings
- Professional systems have same issue

**Already handled**:
```python
# read_retry() automatically retries
humidity, temperature = Adafruit_DHT.read_retry(SENSOR_TYPE, DATA_PIN)
```

**If still too many failures**:
```python
# Add manual retry logic:
max_retries = 5
for attempt in range(max_retries):
    humidity, temperature = Adafruit_DHT.read(SENSOR_TYPE, DATA_PIN)
    if humidity is not None:
        break
    time.sleep(2)
```

---

### Readings seem incorrect

**Sensor accuracy**:
- DHT11: ±2°C, ±5% humidity (okay for hobby projects)
- DHT22: ±0.5°C, ±2-5% humidity (better accuracy)

**Check**:
1. **Sensor needs warmup**
   - Wait 1-2 minutes after power on
   - First few readings may be off
2. **Don't touch sensor**
   - Body heat affects reading
   - Hold by wires, not sensor
3. **Compare with known thermometer**
   - Should be within accuracy range
4. **Room temperature changing?**
   - AC/heater turning on affects readings
   - This is correct behavior!

---

## Ultrasonic Sensor Problems

### Always returns 0 or very small number

**Check**:
1. **Echo pin voltage divider**
   - Echo outputs 5V → MUST reduce to 3.3V
   - Need 1kΩ + 2kΩ resistors
   ```
   Echo → 1kΩ → GPIO → 2kΩ → GND
   ```
2. **Trigger and Echo pins swapped**
   - Trigger should be OUTPUT
   - Echo should be INPUT
3. **Power is 5V**
   - VCC must connect to 5V (not 3.3V)

---

### Erratic or impossible readings

**Check**:
1. **Clear line of sight**
   - No obstacles between sensor and target
   - Remove any objects in front of sensor
2. **Target within range**
   - Minimum: 2cm (too close = error)
   - Maximum: 400cm (too far = error)
3. **Target surface**
   - Soft/angled surfaces absorb sound
   - Flat, hard surfaces work best
4. **Calculation correct**
   ```python
   distance = pulse_duration * 17150
   # Speed of sound = 343 m/s = 34,300 cm/s
   # Divide by 2 (there and back) = 17,150
   ```

---

## General GPIO Problems

### "RuntimeError: The GPIO channel is already in use"

**Previous program didn't clean up GPIO**

**Fix**:
```bash
# Quick reset:
sudo python3 -c "import RPi.GPIO as GPIO; GPIO.cleanup()"
```

**Prevent**:
```python
# Always use try-finally:
try:
    # Your code here
    pass
finally:
    GPIO.cleanup()
```

---

### "RuntimeError: No access to /dev/mem"

**Not running with sudo**

**Fix**:
```bash
sudo python3 your_program.py
```

GPIO requires root privileges!

---

### "RuntimeError: Cannot determine SOC peripheral base address"

**GPIO library issue**

**Fix**:
```bash
# Update RPi.GPIO:
sudo pip3 install --upgrade RPi.GPIO
```

---

### Pin numbers don't match

**BCM vs BOARD numbering confusion**

**Always use BCM** (GPIO numbers):
```python
GPIO.setmode(GPIO.BCM)
# Now use GPIO numbers (17, 27, 22, etc.)
# NOT pin numbers (11, 13, 15, etc.)
```

**Reference**: https://pinout.xyz

---

## Wiring Problems

### How to verify connections

**Visual check**:
1. Compare circuit to diagram
2. Check each wire individually
3. Verify colors if using color coding
4. Look for loose connections

**Multimeter check**:
1. **Continuity test**
   - Set multimeter to continuity mode (beep symbol)
   - Touch probes to both ends of wire
   - Should beep if connected
2. **Voltage test**
   - Set multimeter to DC voltage
   - Check VCC pins: Should read 5V or 3.3V
   - Check GPIO pins: Should read 0V or 3.3V

---

### Common wiring mistakes

1. **Breadboard rows**
   - Top/bottom rails: connected horizontally
   - Main area: connected vertically in columns
   - Center gap NOT connected!

2. **Power connections**
   - 5V and 3.3V are DIFFERENT!
   - Don't mix them up
   - Most sensors need 5V power

3. **Ground connections**
   - ALL grounds must connect together
   - Sensor GND → Breadboard GND → Pi GND

4. **Loose wires**
   - Push wires firmly into breadboard
   - Should require slight force
   - Wiggle test: connections shouldn't move

---

## Python Code Problems

### Program doesn't print anything

**Buffering issue**:
```python
# Add flush=True to print statements:
print("Hello", flush=True)

# Or add this at top of file:
import sys
sys.stdout.flush()
```

---

### Program doesn't stop with Ctrl+C

**Missing KeyboardInterrupt handler**:
```python
try:
    while True:
        # Your code
        pass
except KeyboardInterrupt:
    print("Exiting...")
finally:
    GPIO.cleanup()
```

---

### "IndentationError"

**Python cares about indentation!**

**Fix**:
- Use 4 spaces per indent level
- Be consistent (don't mix tabs and spaces)
- Check all if/while/for blocks

---

## Testing Methodology

### Systematic debugging approach:

1. **Isolate the problem**
   - Does LED work by itself?
   - Does sensor work with simple test program?
   - Add components one at a time

2. **Print debug information**
   ```python
   print(f"Button state: {GPIO.input(BUTTON_PIN)}")
   print(f"Sensor reading: {temperature}")
   ```

3. **Check power first**
   - Use multimeter to verify voltages
   - VCC should be 5V or 3.3V
   - GPIO should be 0V or 3.3V

4. **Swap components**
   - Try different button/sensor/LED
   - Try different GPIO pin
   - Try different breadboard location

5. **Simplify code**
   - Remove all extra features
   - Test basic functionality first
   - Add complexity gradually

---

## When to Ask for Help

**Before asking**:
- [ ] Checked this troubleshooting guide
- [ ] Verified wiring with diagram
- [ ] Tested with simple example code
- [ ] Checked for error messages
- [ ] Tried different GPIO pin/component

**When asking, provide**:
1. Photo of circuit
2. Code you're running
3. Error message (if any)
4. What you've tried already
5. What behavior you're seeing vs. expecting

---

## Prevention Tips

**Avoid problems before they start**:

1. **Always power off before wiring**
   ```bash
   sudo shutdown -h now
   ```

2. **Double-check connections**
   - VCC to VCC, GND to GND
   - Verify GPIO pin numbers
   - Check polarity (LEDs, sensors)

3. **Test incrementally**
   - One sensor at a time
   - Get working before adding more

4. **Use consistent naming**
   ```python
   BUTTON_PIN = 17  # Not just "pin" or "p"
   PIR_PIN = 4      # Clear, descriptive names
   ```

5. **Comment your code**
   ```python
   # Wait for DHT sensor (needs 2 sec between reads)
   time.sleep(2)
   ```

6. **Keep workspace organized**
   - Neat wiring easier to debug
   - Label components if identical
   - Take photos of working circuits

---

## Additional Resources

**Online**:
- GPIO Pinout: https://pinout.xyz
- RPi.GPIO Docs: https://sourceforge.net/p/raspberry-gpio-python/wiki/
- Adafruit Tutorials: https://learn.adafruit.com

**In Course Materials**:
- QUICK-START.md: Code templates
- Activity guides: Detailed instructions
- Lecture notes: Theory and explanations

**Hardware References**:
- Sensor datasheets (check resources/ folder)
- Resistor color code chart
- Breadboard layout diagram

---

**Remember**: Debugging is a SKILL! Every problem you solve makes you better at finding the next one. Don't get frustrated - you're learning!

**Most common issue**: Wiring mistake. Always check wiring first! 🔍🔌
