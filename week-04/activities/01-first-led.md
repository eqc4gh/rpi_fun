# Activity 1: Your First LED

**Time**: 20 minutes  
**Group Size**: 2-3 students  
**Difficulty**: Beginner

## Objective
Build your first LED circuit and control it with Python code.

## ⚠️ Safety Check - MUST READ!
- [ ] Power OFF your Pi before building: `sudo shutdown -h now`
- [ ] Use resistor with LED (ALWAYS!)
- [ ] Check LED polarity (long leg = positive)
- [ ] Double-check all connections
- [ ] Ask instructor to verify before powering on

## Materials Needed
- Raspberry Pi (powered OFF)
- Breadboard
- 1 LED (any color)
- 1 resistor (560Ω to 1kΩ)
- 2 jumper wires (male-to-female)

---

## Part 1: Build the Circuit (8 minutes)

### Circuit Diagram
```
GPIO 17 (Pin 11) → Resistor → LED Long Leg → LED Short Leg → Ground (Pin 6)
```

### Step-by-Step Instructions

**Step 1**: Identify your components
- Find 1 LED
- Check which leg is longer (positive)
- Find 1 resistor (any value 560Ω-1kΩ is fine)
- Get 2 jumper wires

**Step 2**: Insert LED into breadboard
- Put LED long leg in row 10, column 'e'
- Put LED short leg in row 12, column 'e'
- Remember: long leg = positive!

**Step 3**: Insert resistor
- One end in row 10, column 'a'
- Other end in row 7, column 'a'
- Resistor connects to LED positive side

**Step 4**: Connect GPIO wire
- Plug wire into GPIO 17 (physical pin 11)
- Other end into breadboard row 7, column 'b'
- This connects Pi to resistor

**Step 5**: Connect ground wire
- Plug wire into any Ground pin (pin 6 recommended)
- Other end into breadboard row 12, column 'b'
- This completes the circuit!

**Step 6**: STOP - Get instructor to check circuit!

### Circuit Checklist
- [ ] LED long leg connects to resistor side
- [ ] LED short leg connects to ground side
- [ ] Resistor is in the circuit
- [ ] Using GPIO 17 (not 5V or 3.3V power pins!)
- [ ] Using a Ground pin
- [ ] All wires firmly in breadboard
- [ ] Instructor has approved circuit

---

## Part 2: Write the Code (6 minutes)

### Create the Program

**On your Raspberry Pi**:
1. Power on your Pi
2. Open Terminal
3. Create file: `nano first_led.py`
4. Type the following code:

```python
import RPi.GPIO as GPIO
import time

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Define LED pin
LED = 17

# Set pin as output
GPIO.setup(LED, GPIO.OUT)

# Turn LED ON
print("Turning LED ON...")
GPIO.output(LED, GPIO.HIGH)
time.sleep(3)

# Turn LED OFF
print("Turning LED OFF...")
GPIO.output(LED, GPIO.LOW)
time.sleep(1)

# Clean up
GPIO.cleanup()
print("Program finished!")
```

5. Save: `Ctrl+X`, then `Y`, then `Enter`

---

## Part 3: Test Your Circuit (6 minutes)

### Run the Program

```bash
sudo python3 first_led.py
```

### What Should Happen
1. Program prints "Turning LED ON..."
2. LED lights up for 3 seconds
3. Program prints "Turning LED OFF..."
4. LED turns off
5. Program prints "Program finished!"
6. Program exits

### Troubleshooting

**LED doesn't light up?**
- Check LED is right way around (flip if needed)
- Check all wire connections
- Verify you're using GPIO 17
- Make sure resistor is in circuit
- Try running program again

**Error: "No access to /dev/mem"?**
- Forgot `sudo`! Run: `sudo python3 first_led.py`

**Error: "This channel is already in use"?**
- Run `sudo python3` then `import RPi.GPIO as GPIO` then `GPIO.cleanup()`
- Or reboot Pi

**Different LED lights up?**
- Check you're using GPIO 17 (physical pin 11)

---

## Challenges (If you finish early)

### Challenge 1: Longer Timing
Modify the program to:
- Keep LED on for 5 seconds
- Keep LED off for 2 seconds

**Hint**: Change the `time.sleep()` values

### Challenge 2: Multiple Blinks
Make LED blink 3 times:
- On for 1 second
- Off for 1 second
- Repeat 3 times

**Hint**: Use a `for` loop!
```python
for i in range(3):
    GPIO.output(LED, GPIO.HIGH)
    time.sleep(1)
    GPIO.output(LED, GPIO.LOW)
    time.sleep(1)
```

### Challenge 3: User Control
Add user input to control timing:
```python
seconds = int(input("How many seconds to light LED? "))
GPIO.output(LED, GPIO.HIGH)
time.sleep(seconds)
GPIO.output(LED, GPIO.LOW)
```

### Challenge 4: Continuous Blink
Make LED blink forever (until Ctrl+C):

```python
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

### Challenge 5: SOS Signal
Make LED blink SOS in Morse code:
- S = 3 short blinks
- O = 3 long blinks
- S = 3 short blinks

**Morse timing**:
- Short (dit) = 0.2 seconds
- Long (dah) = 0.6 seconds
- Between letters = 0.6 seconds

---

## Understanding Your Code

### Import Statements
```python
import RPi.GPIO as GPIO
import time
```
- Loads GPIO library as "GPIO"
- Loads time library for sleep()

### Setup
```python
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
```
- Use BCM pin numbering
- Turn off warning messages

### Pin Configuration
```python
LED = 17
GPIO.setup(LED, GPIO.OUT)
```
- Define which pin we're using
- Set pin as OUTPUT (we control it)

### Control LED
```python
GPIO.output(LED, GPIO.HIGH)  # Turn ON
GPIO.output(LED, GPIO.LOW)   # Turn OFF
```
- HIGH = 3.3V = LED on
- LOW = 0V = LED off

### Cleanup
```python
GPIO.cleanup()
```
- Resets all GPIO pins
- Good practice - always do this!

---

## Reflection Questions

1. Why do we need a resistor with the LED?
2. What happens if you connect the LED backwards?
3. Why do we need to use `sudo` to run GPIO programs?
4. What does `GPIO.cleanup()` do and why is it important?
5. How could you make the LED blink faster?

---

## Show Your Work!

When finished, show your instructor:
- [ ] Working LED circuit on breadboard
- [ ] Program that turns LED on and off
- [ ] At least one challenge attempted
- [ ] Explain what each part of code does

---

## Cleanup

**Before leaving**:
1. Run your program one more time to verify it works
2. Take a photo of your circuit (for homework reference)
3. Properly shutdown: `sudo shutdown -h now`
4. Leave circuit intact if continuing to Activity 2
5. OR carefully remove wires and organize components

---

**Congratulations!** You've just controlled physical hardware with code! This is the foundation of all physical computing projects! 🎉
