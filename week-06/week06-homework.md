# Week 6 Homework: Motor Control Practice

**Due**: Before Week 7 class  
**Submission**: Photos of circuits + Python files + written reflections  
**Estimated Time**: 90-120 minutes

---

## Instructions

Complete the required programs below. For each program, you must submit:
1. Photo of your working circuit (clearly showing motor driver connections)
2. Python code file (.py)
3. Short description (2-3 sentences) of what you learned
4. Video (optional but recommended) showing motor working

**Safety Reminder**: Always power off Pi before changing circuits, verify connections before applying power, secure motor to prevent it flying off table, and keep fingers away from spinning parts!

---

## Part 1: Required Programs (Complete All 3)

### Program 1: Timed Motor Sequence (Medium)

**Filename**: `motor_sequence.py`

Create an automated motor routine that runs through a sequence of movements.

**Requirements**:
1. Motor connected via L298N driver (from class)
2. Implement this exact sequence:
   - Forward at 50% speed for 3 seconds
   - Stop (coast) for 1 second
   - Forward at 100% speed for 2 seconds
   - Brake for 1 second
   - Reverse at 75% speed for 3 seconds
   - Stop (coast) for 1 second
   - Repeat entire sequence 3 times
3. Print clear status messages during each step
4. Include countdown timer showing time remaining in each phase
5. Clean GPIO on exit

**Example Output**:
```
Motor Sequence Starting...

Cycle 1/3
[Forward 50%] Time remaining: 3s
[Forward 50%] Time remaining: 2s
[Forward 50%] Time remaining: 1s
[Coast Stop] Time remaining: 1s
[Forward 100%] Time remaining: 2s
[Forward 100%] Time remaining: 1s
...
```

**Hints**:
- Use PWM for speed control
- Use `time.sleep(1)` in a loop with countdown
- Create functions for each motor state
- Don't forget to remove enable jumper!

---

### Program 2: PIR Motion-Activated Motor (Medium-Hard)

**Filename**: `motion_motor.py`

Create a system where motor speed depends on motion detection.

**Requirements**:
1. Use PIR motion sensor on GPIO 17 (from Week 5)
2. Use motor on L298N driver (from class)
3. Use LED on GPIO 27 for status indicator
4. Implement these states:
   - **No motion**: Motor off, LED slow blink (0.5s on, 0.5s off)
   - **Motion detected**: Motor forward at 60% speed, LED solid on
   - **Timeout**: Motor continues 5 seconds after last motion detected
   - After timeout: Return to no motion state
5. Display motion events with timestamps
6. Include 60-second PIR warmup with countdown
7. Allow clean exit with Ctrl+C

**Circuit**:
```
PIR VCC → Pi 5V
PIR GND → Pi GND
PIR OUT → GPIO 17

Motor via L298N (from class)
IN1 → GPIO 22
IN2 → GPIO 23
ENA → GPIO 24

LED: GPIO 27 → 560Ω → LED → GND
```

**Example Output**:
```
PIR Motion Motor Control
Warming up PIR sensor: 60s remaining...
Warming up PIR sensor: 59s remaining...
...
System armed and ready!

[2024-11-06 10:23:15] No motion - Motor OFF
[2024-11-06 10:23:47] Motion detected! Motor ON
[2024-11-06 10:23:52] Motion continues...
[2024-11-06 10:24:03] No motion for 5s - Motor OFF
```

**Hints**:
- Import `datetime` for timestamps: `from datetime import datetime`
- Track last motion time to implement timeout
- Use separate thread or careful timing for LED blink during no motion
- Test motor control first, then add PIR, then add LED

---

### Program 3: Button Speed Ramp Controller (Hard)

**Filename**: `button_speed_ramp.py`

Create an advanced motor controller with smooth speed ramping and two-button control.

**Requirements**:
1. Use two buttons:
   - Button 1 (GPIO 18): Increase speed
   - Button 2 (GPIO 19): Decrease speed
2. Motor direction controlled by which button pressed last:
   - Button 1 (increase) when speed ≥ 0: Forward
   - Button 2 (decrease) when speed ≤ 0: Reverse
3. Speed range: -100 to +100 (negative = reverse, positive = forward)
4. Each button press changes speed by 10
5. Smooth ramping: Don't change speed instantly, ramp to target over 1 second
6. Display current speed with graphical bar
7. Stop at 0 speed (coast mode)

**Circuit**:
```
Motor via L298N (from class)

Button 1: GPIO 18 → Button → 3.3V (internal pull-down)
Button 2: GPIO 19 → Button → 3.3V (internal pull-down)
```

**Example Output**:
```
Button Speed Ramp Controller
Speed: 0% |          | Direction: STOPPED

[Button 1 pressed]
Ramping to 10%...
Speed: 10% |█         | Direction: FORWARD

[Button 1 pressed]
Ramping to 20%...
Speed: 20% |██        | Direction: FORWARD

[Button 2 pressed]
Ramping to 10%...
Speed: 10% |█         | Direction: FORWARD

[Button 2 pressed repeatedly]
Ramping to 0%...
Speed: 0% |          | Direction: STOPPED
Ramping to -10%...
Speed: -10% |█        | Direction: REVERSE
```

**Hints**:
- Use signed integer for speed (-100 to +100)
- When speed positive: forward direction, abs(speed) duty cycle
- When speed negative: reverse direction, abs(speed) duty cycle
- Ramping: Loop from current speed to target speed incrementally
- Create function to display speed bar: `"█" * (abs(speed)//10)`

**Extension**: Add acceleration limit - max 5 speed change per button press, require multiple presses for large changes

---

## Part 2: Choose One Challenge Project

Pick ONE of these more advanced projects:

### Challenge A: Ultrasonic Distance-Based Speed Control

**Filename**: `distance_motor.py`

Motor speed controlled by distance sensor reading.

**Requirements**:
- Ultrasonic sensor measures distance
- Motor speed proportional to distance:
  - 0-10cm: Motor stopped (too close!)
  - 10-20cm: Motor 30% speed
  - 20-40cm: Motor 60% speed
  - 40cm+: Motor 100% speed
- Display current distance and speed
- LED indicates speed level (off/slow blink/fast blink/solid)
- Direction toggle with button

---

### Challenge B: Temperature-Controlled Fan Simulation

**Filename**: `temp_fan.py`

Simulate automatic fan control based on temperature.

**Requirements**:
- DHT sensor reads temperature
- Motor speed based on temperature ranges:
  - Below 20°C: Motor off (fan off)
  - 20-24°C: Motor 40% (low fan speed)
  - 24-28°C: Motor 70% (medium fan speed)
  - Above 28°C: Motor 100% (high fan speed)
- Display temperature and fan speed every 5 seconds
- Button to override: Force fan on at 100% for 30 seconds
- LED indicates current fan mode (off/low/medium/high)

**Bonus**: Log temperature and fan speed to CSV file with timestamps

---

### Challenge C: Morse Code Motor Messenger

**Filename**: `morse_motor.py`

Make motor spell words in morse code!

**Requirements**:
- User inputs text via keyboard
- Convert to morse code
- Motor spells morse with movement:
  - Dot: Forward 0.5s, stop 0.5s
  - Dash: Forward 1.5s, stop 0.5s
  - Letter gap: Stop 1.5s
  - Word gap: Stop 3.5s
- Display morse code as it's being spelled
- LED blinks along with motor (visual + motion)
- Library functions for morse conversion

**Example**:
```
Enter message: SOS
Converting to morse: ... --- ...

Spelling 'S' (...)
[Motor forward 0.5s] . 
[Stop 0.5s]
[Motor forward 0.5s] .
[Stop 0.5s]
[Motor forward 0.5s] .
[Letter gap 1.5s]

Spelling 'O' (---)
[Motor forward 1.5s] -
[Stop 0.5s]
...
```

---

## Part 3: Written Reflections

Answer these questions (2-3 sentences each):

1. **Why can't motors connect directly to GPIO pins?**
   - Explain current and voltage requirements

2. **What is the purpose of the enable jumper on L298N?**
   - When should it be in? When removed?

3. **Explain how PWM controls motor speed**
   - Use duty cycle in your explanation

4. **What's the difference between coast and brake stop?**
   - When would you use each?

5. **Biggest challenge this week?**
   - How did you solve it?

6. **Most interesting application you can think of for motor control?**
   - Be creative!

---

## Bonus Explorations (Optional, for Extra Credit)

### Bonus 1: Two Motors (Preparation for Week 7)
- Connect second motor to Motor B outputs on L298N
- Control both motors independently
- Create patterns (both forward, opposite directions, circle pattern)

### Bonus 2: Servo Motor Comparison
- Research difference between DC and servo motors
- If you have a servo, connect and control it
- Compare code and capabilities

### Bonus 3: Motor Current Measurement
- Use multimeter to measure motor current at different speeds
- Create table showing duty cycle vs current draw
- Calculate power consumption

### Bonus 4: Advanced PWM Frequencies
- Experiment with different PWM frequencies (100 Hz to 5000 Hz)
- Determine optimal frequency for your motor
- Document motor behavior at each frequency

---

## Submission Checklist

For EACH required program:
- [ ] Python file (.py) with clean, commented code
- [ ] Photo of circuit (clear, well-lit, shows connections)
- [ ] Short reflection (2-3 sentences on what you learned)
- [ ] Optional: Video showing motor working

Additional:
- [ ] All 3 required programs completed
- [ ] At least 1 challenge project completed
- [ ] Written reflections answered (6 questions)
- [ ] Code includes proper GPIO cleanup
- [ ] Code has safety checks (try/except/finally)

---

## Grading Rubric

**Required Programs (60 points)**
- Program 1 (Sequence): 20 points
- Program 2 (PIR Motor): 20 points  
- Program 3 (Button Ramp): 20 points

**Challenge Project (20 points)**
- Functionality: 15 points
- Code quality: 5 points

**Reflections (10 points)**
- Completeness and thoughtfulness

**Code Quality (10 points)**
- Comments and documentation
- Proper error handling
- GPIO cleanup
- Safe practices

**Total: 100 points**

**Bonus: Up to 20 extra credit points for bonus explorations**

---

## Tips for Success

**Planning**:
- Sketch circuit before building
- Test each component separately first
- Build incrementally (motor first, then sensors, then integration)

**Debugging**:
- Print debug messages liberally
- Test with simple programs first
- Check connections with multimeter
- Verify PWM with LED before connecting motor

**Code Quality**:
- Use functions to organize code
- Add comments explaining complex logic
- Include helpful user messages
- Always handle Ctrl+C gracefully

**Safety**:
- Never connect motor directly to GPIO
- Always use common ground
- Secure motor so it doesn't fly off
- Power off before circuit changes
- Have instructor verify if unsure

---

## Common Pitfalls to Avoid

1. **Forgetting to remove enable jumper** → No speed control works
2. **No common ground** → Motor won't run at all
3. **Weak batteries** → Erratic motor behavior
4. **Loose terminal screws** → Intermittent operation
5. **Wrong GPIO pin numbers** → Nothing works as expected
6. **No GPIO cleanup** → Next program can't access GPIO
7. **Instant speed changes** → Jerky, unprofessional looking motion

---

## Need Help?

**During homework:**
- Review class activities and notes
- Check QUICK-START.md for reference
- Review troubleshooting sections in activities
- Post questions in class forum/chat

**Stuck on a bug:**
- Simplify to minimal working example
- Test components individually
- Print values to see what's happening
- Check all connections match diagram

**Circuit not working:**
- Power off and check all connections
- Test motor driver power LED (should be on)
- Measure battery voltage (should be ~6V)
- Verify common ground present
- Test motor directly with battery

---

## Looking Ahead

**Week 7 Preview**: 
We'll build a mobile robot with TWO motors for steering! Your motor control skills from this week are essential preparation. Make sure you understand:
- Motor driver wiring
- Direction control (IN1/IN2)
- Speed control (PWM on enable)
- Combining sensors with motors

**Get excited - robots are next!** 🤖

---

## Reflection Prompt

After completing homework, think about:
- How does motor control compare to LED control (from Week 4)?
- What real-world applications could you build with these skills?
- What would you need to learn to build a self-driving robot?
- How do sensors and motors work together to create intelligent systems?

---

**Remember**: Motors are powerful and exciting, but also require careful handling. Double-check your circuits, verify connections, and never skip safety steps. When in doubt, ask for help!

**Have fun making things move!** ⚙️✨🎉
