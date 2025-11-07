# Week 6 Circuit Diagrams

## Overview
This document contains wiring diagrams for all Week 6 motor control circuits. Print this file for easy reference during lab activities.

---

## Diagram 1: Basic Motor Control (Activity 1)

### Components
- Raspberry Pi
- L298N Motor Driver Module
- DC Motor (3-6V)
- 4x AA Battery Pack (6V)
- Jumper wires

### Wiring Table

| From | To | Wire Color (Suggested) | Notes |
|------|-----|----------------------|-------|
| Battery + (red) | Motor Driver 12V | Red | Power for motor |
| Battery - (black) | Motor Driver GND | Black | Power ground |
| Pi GND (Pin 6) | Motor Driver GND | Black | CRITICAL: Common ground |
| Pi GPIO 17 (Pin 11) | Motor Driver IN1 | Orange | Direction control 1 |
| Pi GPIO 27 (Pin 13) | Motor Driver IN2 | Yellow | Direction control 2 |
| Pi GPIO 22 (Pin 15) | Motor Driver ENA | Blue | Speed control (enable) |
| Motor wire 1 | Motor Driver OUT1 | Motor wire | Polarity doesn't matter |
| Motor wire 2 | Motor Driver OUT2 | Motor wire | Polarity doesn't matter |

### ASCII Diagram

```
                    Raspberry Pi
                    ┌─────────────┐
                    │             │
                    │  Pin 6  GND ●────────┐
                    │  Pin 11 G17 ●─────┐  │
                    │  Pin 13 G27 ●───┐ │  │
                    │  Pin 15 G22 ●─┐ │ │  │
                    │             │ │ │ │  │
                    └─────────────┘ │ │ │  │
                                    │ │ │  │
         4x AA Battery Pack         │ │ │  │
         ┌────────────┐             │ │ │  │
         │            │             │ │ │  │
    +-●  │  [6V]      │             │ │ │  │
    │    │            │             │ │ │  │
    -●   └────────────┘             │ │ │  │
    │                                │ │ │  │
    │         L298N Motor Driver     │ │ │  │
    │    ┌─────────────────────────┐ │ │ │  │
    │    │                         │ │ │ │  │
    ├───●12V                   ENA ●─┘ │ │  │
    │    │                         │   │ │  │
    │    │      [HEAT SINK]        │   │ │  │
    │    │                         │   │ │  │
    │  ┌─●GND                   IN1 ●───┘ │  │
    │  │ │                         │     │  │
    │  │ │                     IN2 ●─────┘  │
    │  │ │                         │        │
    │  │ │                    OUT1 ●──┐     │
    │  │ │                         │  │     │
    │  │ │                    OUT2 ●─┐│     │
    │  │ │                         │ ││     │
    │  │ └─────────────────────────┘ ││     │
    │  │                              ││     │
    │  └──────────────────────────────┘│     │
    │                                  │     │
    │                                  │     │
    │         DC Motor                 │     │
    │         ┌──────┐                 │     │
    │         │      │                 │     │
    │         │ [M]  │                 │     │
    │         │      │                 │     │
    └─────────●──────●─────────────────┘     │
              └──────┘                       │
                                             │
                                             │
         Common Ground Connection ───────────┘
```

### Important Notes
1. **Common Ground**: Motor Driver GND must connect to BOTH battery - and Pi GND
2. **Enable Jumper**: Leave installed for Activity 1 (full speed mode)
3. **Motor Polarity**: Doesn't matter which wire goes to OUT1 vs OUT2 (just affects direction)
4. **Power Sequence**: Connect battery last, disconnect battery first

---

## Diagram 2: PWM Speed Control (Activity 2)

### Changes from Diagram 1
- **Remove enable jumper** from ENA pin on motor driver
- All other connections remain the same

### Enable Jumper Location

```
L298N Motor Driver (Close-up)
┌─────────────────┐
│                 │
│    ENA  ENB     │
│     ●    ●      │  ← Jumper positions
│    [─]  [─]     │  Remove these jumpers!
│                 │
│   IN1  IN2      │
│    ●    ●       │
│                 │
└─────────────────┘
```

### PWM Connection Detail

```
Pi GPIO 22 (Pin 15) ──────→ Motor Driver ENA
                             (No jumper installed)
                             
When jumper removed:
- ENA pin controlled by GPIO 22
- PWM signal controls motor speed
- Duty cycle 0-100% = Speed 0-100%

When jumper installed:
- ENA pin tied to 5V internally
- Motor always at full speed
- No speed control possible
```

---

## Diagram 3: Button-Controlled Motor (Activity 2)

### Additional Components
- 1 Push button
- Connection to GPIO 18

### Complete Wiring

```
                    Raspberry Pi
                    ┌─────────────┐
                    │             │
                    │  Pin 1 3.3V ●────────┐
                    │  Pin 6  GND ●──────┐ │
                    │  Pin 11 G17 ●────┐ │ │
                    │  Pin 12 G18 ●──┐ │ │ │  ← NEW: Button
                    │  Pin 13 G27 ●─┐│ │ │ │
                    │  Pin 15 G22 ●┐││ │ │ │
                    │             │││ │ │ │
                    └─────────────┘│││ │ │ │
                                   │││ │ │ │
         Button (on breadboard)    │││ │ │ │
         ┌──────┐                  │││ │ │ │
    ┌────┤      ├────┬─────────────┘││ │ │ │
    │    │  ▢   │    │              ││ │ │ │
    │    └──────┘    │              ││ │ │ │
    │                │              ││ │ │ │
    └────────────────┘              ││ │ │ │
                                    ││ │ │ │
         [Rest of motor circuit     ││ │ │ │
          same as Diagram 2]        ││ │ │ │
                                    ││ │ │ │
         L298N connections:         ││ │ │ │
         ENA ←─────────────────────┘│ │ │ │
         IN1 ←──────────────────────┘ │ │ │
         IN2 ←────────────────────────┘ │ │
         GND ←──────────────────────────┘ │
         12V ← Battery +                  │
         GND ← Battery - ──────────────────┘
```

### Button Configuration
- One leg to 3.3V
- Other leg to GPIO 18
- Internal pull-down resistor enabled in code: `GPIO.PUD_DOWN`
- Button pressed = GPIO 18 reads HIGH
- Button released = GPIO 18 reads LOW

---

## Diagram 4: Motor with PIR Sensor (Homework)

### Additional Components
- PIR Motion Sensor (from Week 5)
- LED for status indicator

### Complete Wiring

```
                    Raspberry Pi
                    ┌─────────────┐
                    │             │
                    │  Pin 2  5V  ●────────────────┐
                    │  Pin 6  GND ●──────┬─────┐   │
                    │  Pin 11 G17 ●────┐ │     │   │  ← PIR sensor
                    │  Pin 13 G27 ●──┐ │ │     │   │  ← LED
                    │  Pin 16 G23 ●─┐│ │ │     │   │
                    │  Pin 18 G24 ●┐││ │ │     │   │
                    │             │││ │ │      │   │
                    └─────────────┘│││ │ │     │   │
                                   │││ │ │     │   │
         PIR Sensor                │││ │ │     │   │
         ┌──────┐                  │││ │ │     │   │
         │ [□]  │                  │││ │ │     │   │
    VCC ─●      ●─ VCC ────────────┘││ │ │     │   │
    GND ─●      ●─ GND ──────────────┘│ │ │     │   │
    OUT ─●      ●─ OUT ───────────────┘ │ │     │   │
         └──────┘                       │ │     │   │
                                        │ │     │   │
         LED Circuit                    │ │     │   │
         GPIO 27 ────────────────────────┘ │     │   │
                │                         │     │   │
              [560Ω]                      │     │   │
                │                         │     │   │
              [LED]                       │     │   │
               (+)                        │     │   │
                │                         │     │   │
               GND ────────────────────────┘     │   │
                                                 │   │
         L298N Motor Driver                      │   │
         (Same as previous diagrams)             │   │
         IN1 ← GPIO 23 ──────────────────────────┘   │
         IN2 ← GPIO 24 ──────────────────────────────┘
         ENA ← (Can use GPIO 25 or tie HIGH)
         GND ← Pi GND & Battery -
         12V ← Battery +
```

### PIR Sensor Pinout
```
Looking at sensor from front:
┌──────────┐
│   [□]    │  ← White dome
│          │
│  ●  ●  ●│
│  │  │  │ │
│  V  G  O │
│  C  N  U │
│  C  D  T │
└──────────┘

VCC: 5V power
GND: Ground
OUT: Signal (3.3V when motion detected)
```

---

## Diagram 5: Two-Motor Setup (Bonus/Week 7 Preview)

### Components
- Same as before, but using both Motor A and Motor B outputs

### L298N Dual Motor Wiring

```
         L298N Motor Driver
    ┌─────────────────────────┐
    │                         │
12V ●← Battery +              │
GND ●← Battery - & Pi GND     │
    │                         │
    │    Motor A Controls     │
IN1 ●← Pi GPIO 17             │
IN2 ●← Pi GPIO 27             │
ENA ●← Pi GPIO 22 (PWM)       │
    │                         │
OUT1●→ Motor A wire 1         │
OUT2●→ Motor A wire 2         │
    │                         │
    │    Motor B Controls     │
IN3 ●← Pi GPIO 23             │
IN4 ●← Pi GPIO 24             │
ENB ●← Pi GPIO 25 (PWM)       │
    │                         │
OUT3●→ Motor B wire 1         │
OUT4●→ Motor B wire 2         │
    │                         │
    └─────────────────────────┘

         Motor A        Motor B
         ┌──────┐      ┌──────┐
         │      │      │      │
         │ [M]  │      │ [M]  │
         │      │      │      │
         ●──────●      ●──────●
```

### GPIO Pin Assignments (Two Motors)

| Motor | IN1 | IN2 | Enable (PWM) | Speed |
|-------|-----|-----|--------------|-------|
| Motor A | GPIO 17 | GPIO 27 | GPIO 22 | PWM on 22 |
| Motor B | GPIO 23 | GPIO 24 | GPIO 25 | PWM on 25 |

### Differential Drive (Robot Steering)
```
Both motors forward → Straight forward
Both motors reverse → Straight backward
Motor A forward, Motor B reverse → Turn right
Motor A reverse, Motor B forward → Turn left
Motor A fast, Motor B slow → Gradual right turn
Different speeds → Variable turn radius
```

---

## Power Supply Diagram

### Understanding Separate Power

```
Wall Power (120V AC)
      ↓
[Power Adapter]
      ↓
   5V DC ──────────→ Raspberry Pi ONLY
                     (Powers Pi, not motors!)

4x AA Batteries
      ↓
   6V DC ──────────→ L298N Motor Driver
                     (Powers motors only!)
                     
Both systems connected by:
Common Ground (GND)
         ↓
    ┌────┴────┐
    │         │
Pi GND   Driver GND
```

### Why Separate Power?

**Raspberry Pi Power Supply**:
- Voltage: 5V DC
- Current: 2.5A maximum
- Purpose: Run Raspberry Pi, GPIO signals
- Cannot provide motor power!

**Motor Battery Pack**:
- Voltage: 6V DC (4x 1.5V AA)
- Current: Several amps available
- Purpose: Power motors through driver
- Independent from Pi power

**Common Ground Required**:
- Without common ground: No voltage reference
- GPIO signals meaningless to motor driver
- System won't work!

---

## Troubleshooting Guide

### Motor Not Spinning

**Check these connections:**
```
1. Battery + to Driver 12V    [ ]
2. Battery - to Driver GND    [ ]
3. Driver GND to Pi GND       [ ] ← MOST IMPORTANT!
4. Pi GPIO to Driver IN1      [ ]
5. Pi GPIO to Driver IN2      [ ]
6. Pi GPIO to Driver ENA      [ ]
7. Motor to OUT1 and OUT2     [ ]
8. Motor driver power LED ON  [ ]
```

### Motor Spins Wrong Direction

**Not a problem!** Two solutions:
```
Solution 1: Swap motor wires
OUT1 ←→ OUT2 on motor driver

Solution 2: Swap IN1/IN2 in code
GPIO 17 ←→ GPIO 27 assignments
```

### Motor Only Full Speed (No PWM Control)

**Check:**
```
1. Enable jumper removed?     [ ]
2. PWM code actually running? [ ]
3. ENA pin connected to GPIO? [ ]
4. Test ENA pin with LED      [ ]
```

### Loose Connections

**Motors vibrate! Check:**
```
1. Terminal screws tight?      [ ]
2. Jumper wires fully inserted?[ ]
3. Breadboard connections firm?[ ]
4. Motor secured to prevent movement? [ ]
```

---

## Component Reference

### L298N Motor Driver Pinout

```
Top View:
┌─────────────────────────────┐
│                             │
│ 12V  GND  5V                │  Power inputs
│  ●    ●    ●                │
│                             │
│     [  HEAT SINK  ]         │
│                             │
│        [L298N]              │
│                             │
│  ENA  IN1  IN2  IN3  IN4  ENB │  Control inputs
│   ●    ●    ●    ●    ●    ● │
│  [─]                     [─]│  ← Jumper positions
│                             │
│ OUT1 OUT2 OUT3 OUT4         │  Motor outputs
│   ●    ●    ●    ●          │
│                             │
└─────────────────────────────┘
```

### Raspberry Pi GPIO Pinout (Relevant Pins)

```
┌────────────────┐
│ 1  3.3V    5V  2│
│ 3       5V  4│
│ 5  6  GND      │
│ 7       8│
│ 9  GND     10│
│11  G17     12│
│13  G27     14│  GND
│15  G22     16│
│17  3.3V  G23 18│
│19       G24 20│  GND
│21       G25 22│
└────────────────┘

Our assignments:
Pin 1:  3.3V (for button)
Pin 6:  GND (common ground)
Pin 11: GPIO 17 (IN1)
Pin 13: GPIO 27 (IN2)
Pin 15: GPIO 22 (ENA)
```

---

## Safety Checklist

**Before powering on ANY circuit:**
- [ ] Pi powered off
- [ ] Battery disconnected
- [ ] All connections match diagram
- [ ] Terminal screws tight
- [ ] No wire shorts or crossed connections
- [ ] Common ground present (Driver GND to Pi GND)
- [ ] Motor secured to table
- [ ] Instructor verified circuit (if first time)

**During operation:**
- [ ] Motor secured (not flying off table)
- [ ] Batteries fresh (6V)
- [ ] Driver not too hot (warm OK, burning hot BAD)
- [ ] Ready to disconnect battery if needed

**After use:**
- [ ] Stop motor in code
- [ ] Disconnect battery
- [ ] Power off Pi properly: `sudo shutdown -h now`
- [ ] Store batteries separately

---

## Quick Reference: Motor Control Truth Table

### Direction Control (IN1, IN2)

| IN1 | IN2 | Direction | Description |
|-----|-----|-----------|-------------|
| HIGH | LOW | Forward | Motor spins one way |
| LOW | HIGH | Reverse | Motor spins opposite way |
| LOW | LOW | Coast | Motor stops, freewheels |
| HIGH | HIGH | Brake | Motor stops, resists turning |

### Speed Control (ENA with PWM)

| Duty Cycle | Speed | Notes |
|------------|-------|-------|
| 0% | Stopped | Motor not spinning |
| 20-30% | Starting | May not spin from stop |
| 30-50% | Slow | Depends on motor |
| 50-75% | Medium | Good operating range |
| 75-100% | Fast | Full speed at 100% |

### Combined Control Example

```python
# Forward at 60% speed
GPIO.output(IN1, True)   # Forward direction
GPIO.output(IN2, False)
pwm.ChangeDutyCycle(60)  # 60% speed

# Reverse at 40% speed
GPIO.output(IN1, False)  # Reverse direction
GPIO.output(IN2, True)
pwm.ChangeDutyCycle(40)  # 40% speed

# Coast (stop, freewheeling)
GPIO.output(IN1, False)  # Coast
GPIO.output(IN2, False)
pwm.ChangeDutyCycle(0)

# Brake (stop, holding position)
GPIO.output(IN1, True)   # Brake
GPIO.output(IN2, True)
pwm.ChangeDutyCycle(0)
```

---

**Print this document for lab reference!**

**Remember**: Double-check ALL connections before powering on. Common ground is CRITICAL. When in doubt, ask instructor!
