# Week 4 Homework: GPIO & LED Control Practice

**Due**: Before Week 5 class  
**Submission**: Photos of circuits + Python files on USB drive or demonstration  
**Estimated Time**: 60-75 minutes

## Instructions

Complete the required programs below. For each program, you must submit:
1. Photo of your working circuit
2. Python code file (.py)
3. Short description of what you learned

**Safety Reminder**: Always power off Pi before changing circuits, use resistors with LEDs, and double-check connections!

---

## Required Programs (Complete All 3)

### Program 1: Morse Code SOS (Medium)

**Filename**: `sos_signal.py`

Create a program that blinks an LED in Morse code SOS pattern.

**Requirements**:
1. Use one LED on any GPIO pin
2. SOS pattern in Morse code:
   - S = 3 short blinks (· · ·)
   - O = 3 long blinks (— — —)
   - S = 3 short blinks (· · ·)
3. Timing:
   - Short blink (dit) = 0.2 seconds on, 0.2 seconds off
   - Long blink (dah) = 0.6 seconds on, 0.2 seconds off
   - Between letters = 0.6 seconds pause
4. Repeat SOS pattern 3 times then stop
5. Print "S", "O", "S" as pattern plays

**Circuit**:
```
GPIO Pin (your choice) → 560Ω Resistor → LED → Ground
```

**Example Output**:
```
SOS Emergency Signal
S (dot dot dot)
O (dash dash dash)
S (dot dot dot)
[Pattern repeats 3 times]
Signal complete!
```

**Hints**:
- Use a function for dit and dah
- Use loops for repeated blinks
- Remember cleanup!

```python
def dit(pin):
    GPIO.output(pin, GPIO.HIGH)
    time.sleep(0.2)
    GPIO.output(pin, GPIO.LOW)
    time.sleep(0.2)

def dah(pin):
    GPIO.output(pin, GPIO.HIGH)
    time.sleep(0.6)
    GPIO.output(pin, GPIO.LOW)
    time.sleep(0.2)
```

---

### Program 2: LED Brightness Levels (Medium)

**Filename**: `brightness_levels.py`

Create a program that demonstrates 3 different brightness levels using one LED.

**Requirements**:
1. Use one LED on any GPIO pin
2. Show 3 brightness levels by varying on/off speed:
   - Bright: LED fully on for 3 seconds
   - Medium: Rapid blinking (on 0.01s, off 0.01s) for 3 seconds
   - Dim: Slower blinking (on 0.01s, off 0.04s) for 3 seconds
3. Cycle through each brightness level
4. Print current brightness level
5. Run sequence 2 times then exit

**Circuit**:
```
GPIO Pin (your choice) → 560Ω Resistor → LED → Ground
```

**Example Output**:
```
LED Brightness Demo
Brightness: BRIGHT
Brightness: MEDIUM
Brightness: DIM
[Repeat once more]
Demo complete!
```

**Explanation**: Fast blinking looks dimmer because LED is off part of the time! This simulates PWM (Pulse Width Modulation).

---

### Program 3: Interactive Traffic Control (Hard)

**Filename**: `interactive_traffic.py`

Create an interactive traffic light that responds to user commands.

**Requirements**:
1. Use 3 LEDs (red, yellow, green) like in Activity 2
2. Display menu of options:
   - 1: Normal traffic sequence (run 3 cycles)
   - 2: Emergency mode (red flashing)
   - 3: All green (test mode)
   - 4: All off
   - 5: Exit
3. User enters number to choose mode
4. Program executes choice then returns to menu
5. Proper cleanup on exit

**Circuit**:
```
GPIO 17 → Resistor → Red LED → Ground
GPIO 27 → Resistor → Yellow LED → Ground
GPIO 22 → Resistor → Green LED → Ground
```

**Example Output**:
```
Traffic Light Control System
1. Normal traffic sequence
2. Emergency mode
3. Test mode (all green)
4. All off
5. Exit

Enter choice: 1
Running normal traffic sequence...
GREEN - Go!
YELLOW - Caution!
RED - Stop!
[Repeat 3 times]

Enter choice: 2
EMERGENCY MODE - Flashing red!
[Flash 10 times]

Enter choice: 5
Shutting down. All lights off.
```

**Hints**:
- Use while loop for menu
- Use if-elif statements for choices
- Create functions for each mode
- Don't forget all_off() function

---

## Challenge Programs (Optional - Choose 1 or More)

### Challenge 1: Binary Counter

**Filename**: `binary_counter.py`

Use 4 LEDs to display binary numbers 0-15.

**Requirements**:
- 4 LEDs on GPIO pins (your choice)
- Count from 0 to 15 in binary
- LED on = 1, LED off = 0
- Show each number for 1 second
- Print both binary and decimal

**Example**:
```
0000 = 0
0001 = 1
0010 = 2
0011 = 3
... up to ...
1111 = 15
```

**Binary Review**:
```
LED4 LED3 LED2 LED1
 8    4    2    1    (values)
 
Number 5:
LED4=0, LED3=1, LED2=0, LED1=1
(4 + 1 = 5)
```

---

### Challenge 2: Simon Says Game

**Filename**: `simon_says.py`

Create a memory game with 3 LEDs.

**Requirements**:
- Show random sequence of LED blinks
- Sequence gets longer each round
- Print which LED should light
- Start with 3 blinks, add one each round
- Go for 5 rounds

**Example**:
```
Round 1: Watch the pattern!
[Red] [Green] [Yellow]
Pattern shown.

Round 2: Watch the pattern!
[Green] [Green] [Red] [Yellow]
Pattern shown.
```

**Hints**:
```python
import random

colors = ['RED', 'YELLOW', 'GREEN']
sequence = []

# Add random color
sequence.append(random.choice(colors))

# Show sequence
for color in sequence:
    # Light up that LED
```

---

### Challenge 3: Reaction Time Test

**Filename**: `reaction_test.py`

Test reaction time with LED timing.

**Requirements**:
- Wait random time (1-5 seconds)
- Light LED
- User presses Enter as fast as possible
- Calculate and display reaction time
- Run 5 trials, show average

**Example**:
```
Reaction Time Test
Get ready...

LED ON! Press Enter quickly!
[User presses Enter]
Reaction time: 0.347 seconds

Trial 1/5 complete.
[Repeat 5 times]

Average reaction time: 0.384 seconds
```

**Hints**:
```python
import time
import random

start = time.time()
# Turn on LED
input("Press Enter!")
end = time.time()
reaction = end - start
```

---

### Challenge 4: Heartbeat Pattern

**Filename**: `heartbeat.py`

Create LED pattern that looks like a heartbeat.

**Requirements**:
- One red LED
- Pattern: quick double-blink, pause, repeat
- Lub-dub, pause, lub-dub (like a heart)
- Timing:
  - First blink: 0.1s on, 0.1s off
  - Second blink: 0.1s on, 0.5s off
  - Repeat
- Run for 20 heartbeats

**Timing Pattern**:
```
ON(0.1) OFF(0.1) ON(0.1) OFF(0.5) [repeat]
 lub           dub           pause
```

---

### Challenge 5: RGB LED Control (Advanced)

**Filename**: `rgb_led.py`

If you have an RGB LED (or 3 LEDs), create color mixing!

**Requirements**:
- Control red, green, blue channels
- Show these colors:
  - Red only
  - Green only
  - Blue only
  - Yellow (red + green)
  - Cyan (green + blue)
  - Magenta (red + blue)
  - White (all on)
- Hold each color 2 seconds
- Cycle through 2 times

**Note**: Common cathode RGB LED has 4 legs: Red, Ground, Green, Blue

---

## Submission Checklist

For EACH program:
- [ ] Python file saved with correct filename
- [ ] Photo of working circuit (clear, in focus)
- [ ] Code has comments explaining what it does
- [ ] Code includes proper cleanup
- [ ] Tested and working
- [ ] Short description of what you learned (3-5 sentences)

### Photo Requirements
- Show complete circuit clearly
- Label which LED is which color (if multiple)
- Include Raspberry Pi in photo
- Can see breadboard connections
- LEDs and resistors visible

### Code Requirements
- File header with your name and program description
- Comments explaining each major section
- Proper indentation
- GPIO.cleanup() at end
- No syntax errors

---

## Reflection Questions

Answer these in a text file named `week4_reflection.txt`:

1. **Safety**: What are the three most important safety rules for GPIO?

2. **Circuit Building**: What was the hardest part of building LED circuits? How did you overcome it?

3. **Debugging**: Describe one problem you had and how you fixed it.

4. **Code Understanding**: Explain in your own words why we need the `try/except/finally` block.

5. **Creativity**: If you could control any device with GPIO, what would it be and why?

6. **Next Steps**: What would you like to learn next in physical computing?

---

## Common Mistakes to Avoid

1. **Forgetting resistors**
   - Every LED needs a resistor!
   - Check circuit before powering on

2. **LED backwards**
   - Long leg = positive
   - Check if LED doesn't light

3. **Wrong pin numbers**
   - Code must match circuit
   - Use BCM numbers, not physical

4. **Not using sudo**
   - All GPIO programs need: `sudo python3`

5. **No cleanup**
   - Always add GPIO.cleanup()
   - Prevents errors on next run

6. **Loose connections**
   - Push wires firmly in breadboard
   - Test by wiggling gently

---

## Testing Your Programs

For each program:
1. Build circuit carefully
2. Double-check all connections
3. Take photo of circuit
4. Run program: `sudo python3 program.py`
5. Verify behavior matches requirements
6. Test edge cases
7. Run 2-3 times to ensure consistency

---

## Getting Help

If stuck:
1. Review Week 4 lecture notes
2. Check Quick Start guide
3. Review Activity 1 and 2 instructions
4. Test LED and resistor separately
5. Verify pin numbers in code match circuit
6. Check for error messages and research them
7. Ask instructor or classmate

---

## Grading Criteria

**Required Programs** (75%):
- Circuit built correctly: 25%
- Code works as specified: 30%
- Code quality (comments, organization): 15%
- Photos and documentation: 5%

**Challenges** (15%):
- Attempted at least one: 10%
- Creativity and effort: 5%

**Reflection** (10%):
- Thoughtful answers: 10%

**Total**: 100%

---

## Extra Credit Opportunities

- Complete all 5 challenge programs: +10%
- Create your own original LED project: +5%
- Help a classmate debug their circuit: +5%
- Create a video demo of your traffic light: +5%

---

## Important Reminders

- Start early! Don't wait until the day before
- Test circuits incrementally
- Save your work frequently
- Take breaks if frustrated
- Physical computing takes practice
- Ask questions early
- Have fun experimenting!

---

## Looking Ahead to Week 5

Next week we'll add **input** to our GPIO skills:
- Push buttons
- Reading button presses
- Interactive LED control
- Combining input and output

Make sure you're comfortable with basic GPIO and LED control before Week 5!

---

**Good luck!** Remember: every circuit you build makes you better at physical computing. Don't rush, check your work, and enjoy bringing your code to life! 💡🚦✨
