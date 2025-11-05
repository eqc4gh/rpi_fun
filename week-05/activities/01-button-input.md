# Activity 1: Button Input & LED Control

## Duration: 20 minutes
## Difficulty: Beginner
## Skills: GPIO input, button reading, combining input/output

---

## Overview
Build your first input circuit! You'll connect a button to your Raspberry Pi and use it to control an LED. This combines last week's output skills with this week's input concepts.

## Learning Objectives
- Set up GPIO pin for input
- Read button states
- Understand pull-down resistors
- Combine input and output
- Implement button debouncing

---

## Materials Needed
- Raspberry Pi (running)
- Breadboard
- 1 push button (tactile switch)
- 1 LED (any color)
- 1 resistor for LED (560Ω - 1kΩ)
- Jumper wires:
  - 2 male-to-female (for GPIO connections)
  - 2-3 male-to-male (for breadboard)

---

## Part 1: Understanding Your Button (5 minutes)

### Button Anatomy

Your button is a "tactile switch" with 4 legs:

```
    Top View
   ┌──────┐
 1 │      │ 3
   │  ▢   │     ▢ = button top
   │      │
 2 │      │ 4
   └──────┐
```

**Important**: Legs 1-2 are connected, Legs 3-4 are connected
- Pressing button connects 1-2 to 3-4
- Doesn't matter which legs you use!

### Test Your Button

1. Insert button into breadboard - it should straddle the center gap
2. Button should sit flat against breadboard
3. Legs should be in different rows
4. Don't force it - should insert easily!

---

## Part 2: Circuit Diagram

### Wiring Plan

```
Raspberry Pi GPIO 17 ──────┐
                           │
                       [BUTTON]
                           │
                        (3.3V)
                      
Raspberry Pi GPIO 27 ──────┬──── [560Ω] ──── [LED] ──── GND
                           │
                     (We'll use
                      internal
                      pull-down)
```

### Explanation
- **GPIO 17**: Button input (we'll use internal pull-down)
- **Button connects to 3.3V**: When pressed, GPIO 17 reads HIGH
- **GPIO 27**: LED output (from last week)
- **LED has resistor**: Protects GPIO pin

---

## Part 3: Build the Circuit (7 minutes)

### Step 1: Power Off Pi
```bash
sudo shutdown -h now
```
Wait for Pi to fully shut down (30 seconds), then unplug power.

### Step 2: Insert Button
1. Find center gap in breadboard
2. Insert button straddling the gap
3. All 4 legs should be in breadboard firmly
4. Note which rows the legs are in

### Step 3: Connect Button to 3.3V
1. Use male-to-male jumper wire
2. Connect from one button leg to a new breadboard row
3. Use male-to-female jumper wire
4. Connect from that breadboard row to Pi's 3.3V (Pin 1)

### Step 4: Connect Button to GPIO 17
1. Use male-to-male jumper wire
2. Connect from OTHER side of button to new breadboard row
3. Use male-to-female jumper wire
4. Connect from that row to Pi's GPIO 17 (Pin 11)

**Visual Check**:
```
Button leg 1 ──── 3.3V (Pin 1)
Button leg 3 ──── GPIO 17 (Pin 11)
```

### Step 5: Connect LED (Review from Week 4)
1. Insert LED into breadboard
2. Remember: LONG leg = positive (+)
3. Connect GPIO 27 (Pin 13) → 560Ω resistor → LED long leg
4. Connect LED short leg → GND (Pin 6)

### Step 6: Double-Check Everything
- [ ] Button properly inserted
- [ ] Button connects to 3.3V
- [ ] Button connects to GPIO 17
- [ ] LED resistor in place
- [ ] LED polarity correct (long leg to resistor)
- [ ] LED connects to GND

**If everything looks good, power on Pi!**

---

## Part 4: Write the Code (6 minutes)

### Program 1: Simple Button Reader

Create new file: `button_test.py`

```python
import RPi.GPIO as GPIO
import time

# Pin definitions
BUTTON_PIN = 17

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setup(BUTTON_PIN, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

print("Button Test - Press Ctrl+C to exit")
print("Press the button to see state changes...")

try:
    while True:
        button_state = GPIO.input(BUTTON_PIN)
        
        if button_state:
            print("Button PRESSED (HIGH)")
        else:
            print("Button not pressed (LOW)")
        
        time.sleep(0.2)

except KeyboardInterrupt:
    print("\nExiting...")

finally:
    GPIO.cleanup()
    print("GPIO cleaned up")
```

### Run It
```bash
sudo python3 button_test.py
```

### What to Expect
- When NOT pressing button: "Button not pressed (LOW)"
- When pressing button: "Button PRESSED (HIGH)"

### Troubleshooting
- **Always reads LOW**: Check 3.3V connection
- **Always reads HIGH**: Check GPIO pin number, verify wiring
- **Random readings**: Need to enable pull-down (check code line 9)

---

## Part 5: Button Controls LED (3 minutes)

Now let's make the button control the LED!

### Program 2: Button-Controlled LED

Create new file: `button_led.py`

```python
import RPi.GPIO as GPIO
import time

# Pin definitions
BUTTON_PIN = 17
LED_PIN = 27

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setup(BUTTON_PIN, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(LED_PIN, GPIO.OUT)

print("Button LED Control - Press Ctrl+C to exit")
print("Press button to turn LED on!")

try:
    while True:
        button_state = GPIO.input(BUTTON_PIN)
        
        if button_state:  # Button pressed
            GPIO.output(LED_PIN, True)   # LED ON
            print("Button pressed - LED ON")
        else:  # Button not pressed
            GPIO.output(LED_PIN, False)  # LED OFF
        
        time.sleep(0.01)  # Small delay to prevent CPU overload

except KeyboardInterrupt:
    print("\nExiting...")

finally:
    GPIO.cleanup()
    print("GPIO cleaned up")
```

### Run It
```bash
sudo python3 button_led.py
```

### Expected Behavior
- Press button → LED turns ON
- Release button → LED turns OFF
- LED follows button state instantly

---

## Part 6: Toggle Mode (Bonus Challenge)

### Program 3: Toggle LED On/Off

Make the LED toggle (flip state) each time you press the button.

Create new file: `button_toggle.py`

```python
import RPi.GPIO as GPIO
import time

# Pin definitions
BUTTON_PIN = 17
LED_PIN = 27

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setup(BUTTON_PIN, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(LED_PIN, GPIO.OUT)

# Variables
led_state = False
last_button_state = False

print("Button Toggle - Press Ctrl+C to exit")
print("Each button press toggles LED")

try:
    while True:
        current_button_state = GPIO.input(BUTTON_PIN)
        
        # Detect button press (transition from LOW to HIGH)
        if current_button_state and not last_button_state:
            led_state = not led_state  # Toggle LED state
            GPIO.output(LED_PIN, led_state)
            
            if led_state:
                print("LED turned ON")
            else:
                print("LED turned OFF")
            
            time.sleep(0.2)  # Debounce delay
        
        last_button_state = current_button_state
        time.sleep(0.01)

except KeyboardInterrupt:
    print("\nExiting...")

finally:
    GPIO.cleanup()
    print("GPIO cleaned up")
```

### Run It
```bash
sudo python3 button_toggle.py
```

### Expected Behavior
- First press → LED ON (stays on)
- Second press → LED OFF (stays off)
- Third press → LED ON again
- Each press toggles the LED state

### Understanding the Code

**Key concept**: We detect the EDGE (moment of change) not the state
- `last_button_state` = what button was doing last loop
- `current_button_state` = what button is doing now
- If went from False → True, that's a PRESS!
- Toggle LED only on press, not while held

**Debouncing**: `time.sleep(0.2)` after toggle prevents multiple triggers from one press

---

## Understanding Pull-down Resistors

### Why Do We Need Them?

Without pull-down resistor:
```
Button not pressed → GPIO pin "floating"
                  → Random readings!
```

With pull-down resistor:
```
Button not pressed → Resistor connects pin to GND
                  → GPIO reads LOW (0V)

Button pressed     → Button connects pin to 3.3V
                  → GPIO reads HIGH (3.3V)
```

### Internal vs External

**External pull-down** (hardware):
```
GPIO ──┐
       │
   [10kΩ resistor]
       │
      GND
```

**Internal pull-down** (software):
```python
GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
```

**We use internal because**:
- ✓ Easier - no extra components
- ✓ One line of code
- ✓ Cleaner circuit
- ✓ Works great for buttons

---

## Common Issues & Solutions

### Button doesn't respond
- **Check**: Is button firmly in breadboard?
- **Check**: Both button legs connected?
- **Check**: GPIO pin number correct?
- **Try**: Different button (might be broken)

### LED doesn't light
- **Check**: LED polarity (long leg to resistor)
- **Check**: LED resistor in circuit
- **Check**: LED might be burned out - try different LED
- **Check**: GPIO 27 pin number correct

### Multiple toggles from one press
- **Add**: Longer debounce delay (0.3 or 0.5 seconds)
- **This is normal!** Mechanical buttons bounce

### Program says GPIO in use
```bash
# Another program didn't cleanup - reset it:
sudo python3 -c "import RPi.GPIO as GPIO; GPIO.cleanup()"
```

---

## Extension Challenges

### Challenge 1: Multiple Buttons
Add a second button to control a second LED independently.

**Hint**:
- Use GPIO 22 for second button
- Use GPIO 23 for second LED
- Set both up as input and output respectively

### Challenge 2: Button Counter
Count and display how many times button has been pressed.

**Hint**:
- Add `count` variable starting at 0
- Increment on each button press detection
- Print count when button pressed

### Challenge 3: Long Press Detection
Detect if button is held for more than 2 seconds.

**Hint**:
- Record time when button first pressed: `start_time = time.time()`
- Check elapsed time while button held
- If > 2 seconds, trigger special action

### Challenge 4: Morse Code Input
Let user input dots (short press) and dashes (long press) to spell letters.

---

## Key Concepts Review

**By completing this activity, you learned:**
- ✓ GPIO pins can be INPUT or OUTPUT
- ✓ Input pins read HIGH (True) or LOW (False)
- ✓ Pull-down resistors prevent floating states
- ✓ Internal pull-downs are enabled in code
- ✓ Edge detection finds the moment of button press
- ✓ Debouncing prevents multiple triggers
- ✓ Combining input and output creates interactivity

---

## Next Steps

Now that you can read buttons, you're ready for more complex sensors! In Activity 2, choose one of these:
- **PIR Motion Sensor** (Easiest) - Detect movement
- **DHT Temperature Sensor** (Medium) - Read temperature
- **Ultrasonic Distance** (Advanced) - Measure distance

**Great job building your first input circuit!** 🔘💡
