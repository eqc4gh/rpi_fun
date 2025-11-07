# Week 6 Quick Start: Motor Control Reference

## ⚠️ SAFETY FIRST!
- **NEVER** connect motor directly to GPIO pin
- **ALWAYS** use separate battery power for motors  
- **ALWAYS** connect motor driver GND to Pi GND (common ground)
- Power off before changing circuits: `sudo shutdown -h now`

---

## L298N Motor Driver Pinout

```
         L298N Motor Driver
    ┌─────────────────────────┐
    │                         │
12V ●  ← Battery + (red)      │
GND ●  ← Battery - (black) & Pi GND
 5V ●  ← Optional 5V output   │
    │                         │
    │    [HEAT SINK]          │
    │                         │
IN1 ●  ← Pi GPIO 17 (Dir 1)   │
IN2 ●  ← Pi GPIO 27 (Dir 2)   │
ENA ●  ← Pi GPIO 22 (Speed)   │
    │                         │
    │  [Remove jumper for     │
    │   PWM speed control]    │
    │                         │
    │      Motor A Outputs    │
OUT1 ●  → Motor wire 1        │
OUT2 ●  → Motor wire 2        │
    │                         │
    └─────────────────────────┘
```

---

## Basic Wiring Checklist

**Power Connections:**
- [ ] Battery + (red) → Motor Driver 12V
- [ ] Battery - (black) → Motor Driver GND
- [ ] Pi GND → Motor Driver GND (CRITICAL!)

**Motor Connections:**
- [ ] Motor wire 1 → OUT1
- [ ] Motor wire 2 → OUT2

**Control Connections (Pi GPIO):**
- [ ] Pi GPIO 17 → Motor Driver IN1
- [ ] Pi GPIO 27 → Motor Driver IN2
- [ ] Pi GPIO 22 → Motor Driver ENA

**For PWM Speed Control:**
- [ ] Remove enable jumper near ENA pin

---

## Motor Control Truth Table

| IN1 | IN2 | ENA | Result |
|-----|-----|-----|--------|
| HIGH | LOW | HIGH | Forward (full speed) |
| LOW | HIGH | HIGH | Reverse (full speed) |
| LOW | LOW | any | Stop (coast) |
| HIGH | HIGH | any | Stop (brake) |
| HIGH | LOW | PWM | Forward (variable speed) |
| LOW | HIGH | PWM | Reverse (variable speed) |

---

## Basic Motor Control Code

### Setup
```python
import RPi.GPIO as GPIO
import time

# Pin definitions
IN1 = 17  # Direction control 1
IN2 = 27  # Direction control 2
ENA = 22  # Speed control (PWM)

# GPIO setup
GPIO.setmode(GPIO.BCM)
GPIO.setup(IN1, GPIO.OUT)
GPIO.setup(IN2, GPIO.OUT)
GPIO.setup(ENA, GPIO.OUT)

# Create PWM object
pwm = GPIO.PWM(ENA, 1000)  # 1000 Hz frequency
pwm.start(0)  # Start with 0% duty cycle (stopped)
```

### Motor Forward (Full Speed)
```python
GPIO.output(IN1, True)   # IN1 = HIGH
GPIO.output(IN2, False)  # IN2 = LOW
pwm.ChangeDutyCycle(100) # Full speed
```

### Motor Reverse (Full Speed)
```python
GPIO.output(IN1, False)  # IN1 = LOW
GPIO.output(IN2, True)   # IN2 = HIGH
pwm.ChangeDutyCycle(100) # Full speed
```

### Motor Stop (Coast)
```python
GPIO.output(IN1, False)  # IN1 = LOW
GPIO.output(IN2, False)  # IN2 = LOW
pwm.ChangeDutyCycle(0)   # 0% speed
```

### Motor Stop (Brake)
```python
GPIO.output(IN1, True)   # IN1 = HIGH
GPIO.output(IN2, True)   # IN2 = HIGH
pwm.ChangeDutyCycle(0)   # 0% speed
```

### Speed Control (50% Speed Forward)
```python
GPIO.output(IN1, True)   # IN1 = HIGH (forward)
GPIO.output(IN2, False)  # IN2 = LOW
pwm.ChangeDutyCycle(50)  # 50% speed
```

### Cleanup (ALWAYS at end)
```python
pwm.stop()
GPIO.cleanup()
```

---

## Complete Example: Forward, Stop, Reverse

```python
import RPi.GPIO as GPIO
import time

# Pin setup
IN1, IN2, ENA = 17, 27, 22

GPIO.setmode(GPIO.BCM)
GPIO.setup(IN1, GPIO.OUT)
GPIO.setup(IN2, GPIO.OUT)
GPIO.setup(ENA, GPIO.OUT)

pwm = GPIO.PWM(ENA, 1000)
pwm.start(0)

try:
    # Forward 2 seconds
    print("Forward")
    GPIO.output(IN1, True)
    GPIO.output(IN2, False)
    pwm.ChangeDutyCycle(75)
    time.sleep(2)
    
    # Stop 1 second
    print("Stop")
    GPIO.output(IN1, False)
    GPIO.output(IN2, False)
    pwm.ChangeDutyCycle(0)
    time.sleep(1)
    
    # Reverse 2 seconds
    print("Reverse")
    GPIO.output(IN1, False)
    GPIO.output(IN2, True)
    pwm.ChangeDutyCycle(75)
    time.sleep(2)
    
    # Final stop
    print("Stop")
    GPIO.output(IN1, False)
    GPIO.output(IN2, False)
    pwm.ChangeDutyCycle(0)

finally:
    pwm.stop()
    GPIO.cleanup()
    print("Done!")
```

---

## Speed Control Function

```python
def set_motor(direction, speed):
    """
    Control motor direction and speed
    
    Args:
        direction: 'forward', 'reverse', 'coast', or 'brake'
        speed: 0-100 (percentage)
    """
    if direction == 'forward':
        GPIO.output(IN1, True)
        GPIO.output(IN2, False)
        pwm.ChangeDutyCycle(speed)
    elif direction == 'reverse':
        GPIO.output(IN1, False)
        GPIO.output(IN2, True)
        pwm.ChangeDutyCycle(speed)
    elif direction == 'coast':
        GPIO.output(IN1, False)
        GPIO.output(IN2, False)
        pwm.ChangeDutyCycle(0)
    elif direction == 'brake':
        GPIO.output(IN1, True)
        GPIO.output(IN2, True)
        pwm.ChangeDutyCycle(0)

# Usage examples:
set_motor('forward', 75)   # 75% speed forward
time.sleep(2)
set_motor('reverse', 50)   # 50% speed reverse
time.sleep(2)
set_motor('coast', 0)      # Stop
```

---

## Troubleshooting Guide

### Motor Not Spinning
1. Check battery voltage (should be ~6V)
2. Verify motor driver power LED is ON
3. Check common ground: Pi GND → Driver GND
4. Test motor directly with battery (bypass driver)
5. Verify IN1/IN2/ENA connections
6. Check GPIO pin numbers in code

### Motor Only Goes One Speed
1. Remove enable jumper from driver
2. Verify PWM is running on ENA pin
3. Check duty cycle values (0-100)
4. Test ENA pin with LED to verify PWM working

### Motor Runs Wrong Direction
- Normal! Just swap motor wires OR swap IN1/IN2 in code
- Not a bug, just calibration

### Motor Behavior Erratic
1. Check for loose connections (motors vibrate)
2. Replace weak batteries
3. Verify terminal screws are tight
4. Check for wire shorts

### Motor Driver Getting Hot
- Warm is normal
- Very hot = problem! Check:
  - Motor current vs driver rating
  - Short circuits
  - Battery voltage too high

---

## PWM Speed Reference

| Duty Cycle | Motor Speed | Description |
|------------|-------------|-------------|
| 0% | 0% | Stopped |
| 25% | ~25% | Slow crawl |
| 50% | ~50% | Medium speed |
| 75% | ~75% | Fast |
| 100% | 100% | Full speed |

**Note**: Motor may not spin below ~30% duty cycle due to friction

---

## Best Practices

### Before Running Code
- [ ] Double-check all connections
- [ ] Verify battery polarity
- [ ] Confirm common ground present
- [ ] Fresh batteries installed
- [ ] Motor secured to table

### In Code
- [ ] Always use `GPIO.cleanup()` in `finally` block
- [ ] Use try-except for Ctrl+C handling
- [ ] Stop motor before direction change
- [ ] Use 1000 Hz PWM frequency
- [ ] Keep duty cycle 0-100

### Physical Setup
- [ ] Tape motor to table (prevents spinning off)
- [ ] Organize wires with cable ties
- [ ] Label IN1/IN2/ENA connections
- [ ] Keep workspace clear of loose items
- [ ] Have fire extinguisher nearby

---

## Common Code Patterns

### Gradual Speed Increase
```python
for speed in range(0, 101, 10):
    pwm.ChangeDutyCycle(speed)
    print(f"Speed: {speed}%")
    time.sleep(0.5)
```

### Button-Controlled Speed
```python
BUTTON = 18
GPIO.setup(BUTTON, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

speeds = [0, 25, 50, 75, 100]
speed_index = 0

while True:
    if GPIO.input(BUTTON):
        speed_index = (speed_index + 1) % len(speeds)
        pwm.ChangeDutyCycle(speeds[speed_index])
        print(f"Speed: {speeds[speed_index]}%")
        time.sleep(0.3)  # Debounce
```

### Sensor-Triggered Motor
```python
PIR = 17  # Motion sensor

if GPIO.input(PIR):  # Motion detected
    print("Motion! Motor ON")
    set_motor('forward', 75)
else:
    print("No motion. Motor OFF")
    set_motor('coast', 0)
```

---

## Pin Reference Quick Chart

| Connection | Pi Pin | Driver Pin | Notes |
|------------|--------|------------|-------|
| Direction 1 | GPIO 17 | IN1 | Control forward/reverse |
| Direction 2 | GPIO 27 | IN2 | Control forward/reverse |
| Speed | GPIO 22 | ENA | PWM for speed control |
| Common Ground | GND | GND | CRITICAL connection |
| Motor Power | - | 12V | From battery + |
| Motor Ground | - | GND | From battery - |
| Motor A | - | OUT1 | Motor wire 1 |
| Motor A | - | OUT2 | Motor wire 2 |

---

## Emergency Stops

### Keyboard Interrupt
```python
try:
    # Motor control code here
    pass
except KeyboardInterrupt:
    print("\nEmergency stop!")
    set_motor('brake', 0)
finally:
    pwm.stop()
    GPIO.cleanup()
```

### Physical Emergency
1. Disconnect battery pack (instant stop)
2. Press Ctrl+C in terminal
3. Power off Raspberry Pi if needed

---

## Additional Notes

- **Motor polarity doesn't matter** - Just controls which direction is "forward"
- **PWM frequency**: 1000 Hz works well, can use 500-2000 Hz
- **Duty cycle**: Keep between 0-100, motor may not spin below 30%
- **Battery life**: Motors drain batteries fast, have spares ready
- **Driver heat**: Warm is okay, very hot is problem
- **Wire gauge**: Thicker is better for motor power connections

---

**Save this guide for quick reference during labs!** 🤖⚙️
