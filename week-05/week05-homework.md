# Week 5 Homework: Sensors & Input Practice

**Due**: Before Week 6 class  
**Submission**: Photos of circuits + Python files + written reflections  
**Estimated Time**: 90-120 minutes

---

## Instructions

Complete the required programs below. For each program, you must submit:
1. Photo of your working circuit (clearly showing connections)
2. Python code file (.py)
3. Short description (2-3 sentences) of what you learned

**Safety Reminder**: Always power off Pi before changing circuits, verify sensor voltage requirements, and double-check connections!

---

## Part 1: Required Programs (Complete All 3)

### Program 1: Button-Controlled RGB Pattern (Medium)

**Filename**: `button_patterns.py`

Create a system where button presses cycle through different LED patterns.

**Requirements**:
1. Use one button on GPIO 17
2. Use three LEDs (different colors if possible) on GPIO 27, 22, 23
3. Each button press changes the pattern:
   - Press 1: All LEDs off
   - Press 2: Red LED only
   - Press 3: Green LED only
   - Press 4: Blue LED only
   - Press 5: All LEDs on
   - Press 6: Blink all LEDs together
   - Press 7: Return to pattern 1 (cycle repeats)
4. Print current pattern name to terminal
5. Implement proper debouncing (0.2 second delay)

**Circuit**:
```
GPIO 17 → Button → 3.3V (with internal pull-down)
GPIO 27 → 560Ω → Red LED → GND
GPIO 22 → 560Ω → Green LED → GND
GPIO 23 → 560Ω → Blue LED → GND
```

**Example Output**:
```
LED Pattern Controller
Pattern 1: All OFF
[Button pressed]
Pattern 2: Red only
[Button pressed]
Pattern 3: Green only
```

**Hints**:
- Use a variable to track current pattern number
- Detect button press (rising edge)
- Use if-elif statements or a dictionary to map patterns
- Create functions for each pattern

---

### Program 2: Motion-Activated Security Log (Medium-Hard)

**Filename**: `security_logger.py`

Create a security system that logs motion events with timestamps to a file.

**Requirements**:
1. Use PIR motion sensor on GPIO 17
2. Use LED on GPIO 27 to indicate armed status
3. System starts "armed" (LED on, slow blink)
4. When motion detected:
   - Record timestamp to file `security_log.txt`
   - Rapid blink LED for 3 seconds
   - Print alert to terminal
   - Return to armed state
5. Include sensor warmup countdown (60 seconds)
6. Allow user to exit cleanly (Ctrl+C)

**Circuit**:
```
PIR VCC → Pi 5V
PIR GND → Pi GND
PIR OUT → GPIO 17
LED: GPIO 27 → 560Ω → LED → GND
```

**Log File Format**:
```
2024-11-04 14:23:15 - Motion detected
2024-11-04 14:25:42 - Motion detected
2024-11-04 14:28:03 - Motion detected
```

**Example Output**:
```
Security System Initializing...
Sensor warmup: 60 seconds remaining...
System ARMED - Monitoring for motion
[Motion detected]
⚠️  ALERT! Motion at 2024-11-04 14:23:15
Logging event...
System ARMED - Monitoring for motion
```

**Hints**:
```python
import datetime

# Get timestamp:
timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

# Write to file:
with open('security_log.txt', 'a') as file:
    file.write(f"{timestamp} - Motion detected\n")
```

---

### Program 3: Temperature Monitor with Alerts (Medium-Hard)

**Filename**: `temp_monitor.py`

Create a temperature monitoring system with multiple alert levels.

**Requirements**:
1. Use DHT11 or DHT22 sensor on GPIO 4
2. Use three LEDs for different temperature ranges:
   - Blue LED (GPIO 17): Cold (< 20°C)
   - Green LED (GPIO 27): Comfortable (20-25°C)
   - Red LED (GPIO 22): Hot (> 25°C)
3. Display temperature, humidity, and comfort level
4. Calculate and display "feels like" temperature:
   - `feels_like = temperature + (humidity / 100 * 2)`
5. Update every 2 seconds
6. Track and display min/max temperatures

**Circuit**:
```
DHT VCC → Pi 3.3V or 5V (check sensor)
DHT GND → Pi GND
DHT DATA → GPIO 4

Blue LED: GPIO 17 → 560Ω → LED → GND
Green LED: GPIO 27 → 560Ω → LED → GND
Red LED: GPIO 22 → 560Ω → LED → GND
```

**Example Output**:
```
Temperature Monitor
==========================================
Temp: 23.2°C | Humidity: 48.5%
Feels like: 24.2°C
Status: COMFORTABLE ✓
Min: 22.8°C | Max: 23.5°C
------------------------------------------
Temp: 23.4°C | Humidity: 49.2%
Feels like: 24.4°C
Status: COMFORTABLE ✓
Min: 22.8°C | Max: 23.5°C
```

**Hints**:
- Only one LED should be on at a time
- Turn off LEDs before turning on new one
- Test by adjusting thresholds or warming sensor with your hand

---

## Part 2: Choose One Challenge (Pick 1)

### Challenge A: Ultrasonic Distance Sensor (Hard)

**Filename**: `distance_sensor.py`

**If you have HC-SR04 ultrasonic sensor:**

Build a distance measurement system with proximity alerts.

**Requirements**:
1. Use HC-SR04 sensor (TRIG on GPIO 23, ECHO on GPIO 24)
2. ⚠️ **CRITICAL**: Use voltage divider on ECHO pin (1kΩ + 2kΩ resistors)
3. Display distance in cm and inches
4. Use 3 LEDs for proximity:
   - Green: > 50cm (far)
   - Yellow: 20-50cm (medium)
   - Red: < 20cm (close)
5. Update 5 times per second

**Circuit**:
```
HC-SR04 VCC → Pi 5V
HC-SR04 GND → Pi GND
HC-SR04 TRIG → GPIO 23
HC-SR04 ECHO → 1kΩ → GPIO 24 → 2kΩ → GND (voltage divider!)

LEDs: GPIO 17, 27, 22 → 560Ω → LED → GND
```

**Hints**:
```python
def get_distance():
    # Send trigger pulse
    GPIO.output(TRIG, True)
    time.sleep(0.00001)
    GPIO.output(TRIG, False)
    
    # Wait for echo
    while GPIO.input(ECHO) == 0:
        pulse_start = time.time()
    while GPIO.input(ECHO) == 1:
        pulse_end = time.time()
    
    # Calculate distance
    duration = pulse_end - pulse_start
    distance = duration * 17150  # cm
    return round(distance, 2)
```

---

### Challenge B: Multi-Sensor Dashboard (Hard)

**Filename**: `sensor_dashboard.py`

**Combine multiple sensors:**

Create a real-time dashboard showing all sensors at once.

**Requirements**:
1. Button on GPIO 17 (with internal pull-down)
2. PIR sensor on GPIO 4 (after 60s warmup)
3. DHT sensor on GPIO 18
4. Display all readings in formatted table
5. Button press saves snapshot to file
6. Clear screen and update display every 2 seconds

**Example Output**:
```
╔══════════════════════════════════════╗
║      SENSOR DASHBOARD v1.0           ║
╚══════════════════════════════════════╝

Button Status:    Not Pressed
Motion Status:    No Motion Detected
Temperature:      23.5°C (74.3°F)
Humidity:         47.2%
Comfort Level:    COMFORTABLE

Last Update: 2024-11-04 14:23:45
Press button to save snapshot | Ctrl+C to exit
```

**Hints**:
```python
import os

# Clear screen:
os.system('clear')

# Box drawing:
print("╔" + "═" * 40 + "╗")
print("║" + " " * 40 + "║")
```

---

### Challenge C: Smart Home Simulator (Very Hard)

**Filename**: `smart_home.py`

**Create interactive smart home automation:**

Build a system that responds to multiple inputs intelligently.

**Requirements**:
1. PIR sensor (GPIO 17): Auto-light control
2. DHT sensor (GPIO 4): Temperature monitoring
3. Two buttons:
   - GPIO 22: Manual light override toggle
   - GPIO 23: System arm/disarm
4. LED outputs:
   - GPIO 27: Main light (auto or manual)
   - GPIO 5: Status LED (armed = green, disarmed = red)
5. Logic:
   - When armed: PIR triggers light (unless manual override)
   - When disarmed: Manual button controls light
   - Always monitor temperature (log if > threshold)
6. Display system status continuously

**Advanced Features**:
- Log all events with timestamps
- Calculate "light hours" (how long light was on)
- Add "away mode" (random light patterns)

---

## Part 3: Written Reflections (Required)

Answer these questions in a file called `week5_reflection.txt`:

### Question 1: Input vs Output (4-6 sentences)
Explain the difference between input and output in your own words. Give examples from this week's projects. Why do we need both?

### Question 2: Sensor Comparison (5-7 sentences)
Compare the three sensors you worked with (button, PIR, DHT or ultrasonic). Which was easiest to use? Which was most interesting? Which had the most real-world applications you could think of?

### Question 3: Pull-down Resistors (3-5 sentences)
Explain why we need pull-down (or pull-up) resistors for buttons. What happens without them? Why does Raspberry Pi let us use internal pull-downs?

### Question 4: Real-World Project Idea (6-10 sentences)
Design a project that uses at least two types of sensors from this week. Describe:
- What problem does it solve?
- Which sensors would you use and why?
- What would the outputs be (LEDs, display, sound)?
- Who would use this project?

---

## Submission Checklist

Before submitting, ensure you have:

**Files**:
- [ ] `button_patterns.py` with circuit photo
- [ ] `security_logger.py` with circuit photo
- [ ] `temp_monitor.py` with circuit photo
- [ ] One challenge program with circuit photo
- [ ] `week5_reflection.txt` with all 4 questions answered
- [ ] (Optional) Any additional programs you created

**Photos should show**:
- Clear view of breadboard connections
- Sensor labels visible
- All wires identifiable
- Overall setup

**Code should include**:
- Comments explaining what code does
- Proper GPIO cleanup
- Error handling where needed
- Print statements for user feedback

---

## Testing Your Programs

Before submitting, verify each program:

**Button Program**:
- [ ] All patterns work correctly
- [ ] Cycles through all 7 patterns
- [ ] Debouncing prevents double-triggers
- [ ] Terminal output is clear

**Security Logger**:
- [ ] 60-second warmup completes
- [ ] Motion triggers alerts
- [ ] Log file is created and updated
- [ ] Timestamps are accurate
- [ ] LED blinks appropriately

**Temperature Monitor**:
- [ ] All three LEDs work
- [ ] Temperature and humidity display
- [ ] Min/Max tracking works
- [ ] Feels-like calculation correct
- [ ] Updates every 2 seconds

**Challenge Program**:
- [ ] Meets all requirements
- [ ] No errors during operation
- [ ] Clean shutdown with Ctrl+C

---

## Grading Rubric

**Program 1 (Button Patterns)**: 25 points
- Functionality (15 pts)
- Code quality (5 pts)
- Circuit photo (5 pts)

**Program 2 (Security Logger)**: 25 points
- Functionality (15 pts)
- File logging (5 pts)
- Circuit photo (5 pts)

**Program 3 (Temperature Monitor)**: 25 points
- Functionality (15 pts)
- LED logic (5 pts)
- Circuit photo (5 pts)

**Challenge Program**: 15 points
- Meets requirements (10 pts)
- Circuit photo (5 pts)

**Written Reflections**: 10 points
- Completeness (5 pts)
- Thoughtfulness (5 pts)

**Total**: 100 points

---

## Tips for Success

**Time Management**:
- Start with Program 1 (easiest)
- Test each sensor individually first
- Don't rush - verify each step
- Budget time for debugging

**Debugging Strategy**:
1. Test power connections with multimeter
2. Print sensor values before processing
3. Verify GPIO pin numbers match physical connections
4. Check wiring against diagrams
5. Test components individually

**Code Quality**:
- Add comments explaining logic
- Use meaningful variable names
- Include docstrings for functions
- Handle errors gracefully
- Clean up GPIO properly

**Photography**:
- Take photos in good lighting
- Show connections clearly
- Include multiple angles if needed
- Label wires if helpful

---

## Extension Opportunities (Optional, Extra Credit)

### +5 Extra Credit: Data Visualization
Create graphs of temperature/humidity over time using matplotlib.

### +5 Extra Credit: Web Interface
Create a simple Flask web page displaying sensor data.

### +10 Extra Credit: Multi-Room System
Build a system with sensors in different locations communicating their data.

---

## Need Help?

**Resources**:
- Week 5 QUICK-START guide for code templates
- Activity files for detailed sensor info
- INSTRUCTOR-GUIDE troubleshooting section
- GPIO pinout: https://pinout.xyz

**If you get stuck**:
1. Review lecture notes and activity guides
2. Check troubleshooting sections
3. Test with simpler code first
4. Ask in class or office hours
5. Document what you tried (shows effort!)

---

## Looking Ahead to Week 6

Next week we'll:
- Combine multiple sensors in advanced projects
- Build interactive systems
- Create more complex automation
- Prepare for robot projects!

**Having solid input skills now will make Week 6 much easier!**

---

**Important**: This homework reinforces critical skills. Take your time, test thoroughly, and don't hesitate to ask questions. Sensors can be tricky, but learning to debug them is an invaluable skill!

**Good luck and have fun experimenting!** 🔘🌡️📍💡
