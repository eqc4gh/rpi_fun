# Week 7 Circuit Diagrams - Line Following Robot

## Complete System Wiring Diagram

### Full Robot Connection Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    LINE FOLLOWING ROBOT                          │
│                     Complete Wiring Diagram                      │
└─────────────────────────────────────────────────────────────────┘

    ╔═══════════════════════╗
    ║  RASPBERRY PI (Top)   ║
    ║                       ║
    ║  GPIO Pins:           ║
    ║    17, 27, 12 ────────╫───┐  Motor A Control
    ║    22, 23, 13 ────────╫───┼─┐  Motor B Control
    ║    5, 6, 19   ────────╫───┼─┼─┐  Line Sensors
    ║    GND (Multiple) ────╫───┼─┼─┼─┐  Common Ground
    ║    5V (Pin 2,4) ──────╫───┼─┼─┼─┼─┐  Sensor Power
    ╚═══════════════════════╝   │ │ │ │ │
                                │ │ │ │ │
    ┌───────────────────────────┘ │ │ │ │
    │   ┌─────────────────────────┘ │ │ │
    │   │   ┌───────────────────────┘ │ │
    │   │   │   ┌─────────────────────┘ │
    │   │   │   │   ┌───────────────────┘
    │   │   │   │   │
    │   │   │   ▼   ▼
    │   │   │  ╔═══════════════╗
    │   │   │  ║ LINE SENSORS  ║
    │   │   │  ║  [L] [C] [R]  ║
    │   │   │  ║               ║
    │   │   │  ║  VCC ←────────╫──── 5V
    │   │   │  ║  GND ←────────╫──── GND
    │   │   │  ║  S1  ←────────╫──── GPIO 5
    │   │   │  ║  S2  ←────────╫──── GPIO 19
    │   │   │  ║  S3  ←────────╫──── GPIO 6
    │   │   │  ╚═══════════════╝
    │   │   │         ▲
    │   │   │         │ 5mm above ground
    │   │   │         │
    │   │   ▼  ═══════▼════════  ← Black Line
    │   │   
    │   │   ╔═══════════════════════════╗
    │   └───║     L298N MOTOR DRIVER    ║
    │       ║                           ║
    │   ┌───║  IN1 ← GPIO 17           ║
    │   │   ║  IN2 ← GPIO 27           ║
    │   │   ║  ENA ← GPIO 12 (PWM)     ║
    │   │   ║                           ║
    │   │   ║  IN3 ← GPIO 22           ║
    │   │   ║  IN4 ← GPIO 23           ║
    │   └───║  ENB ← GPIO 13 (PWM)     ║
    │       ║                           ║
    │       ║  GND ← Pi GND            ║
    │       ║                           ║
    │       ║  Motor A    Motor B      ║
    │       ║   ┌──┐       ┌──┐        ║
    │       ║   │●●│       │●●│        ║
    │       ╚═══╪══╪═══════╪══╪════════╝
    │           │  │       │  │
    │           ▼  ▼       ▼  ▼
    │       ┌────────┐ ┌────────┐
    │       │ LEFT   │ │ RIGHT  │
    │       │ MOTOR  │ │ MOTOR  │
    │       └────┬───┘ └───┬────┘
    │            │         │
    │          [⚫]       [⚫]  ← Wheels
    │
    │       ╔════════════╗
    │       ║  Battery   ║
    │       ║   Pack     ║
    │       ║  (6V, 4xAA)║
    │       ╚════╤═══╤═══╝
    │            │   │
    │         (+)│   │(-)
    │            │   │
    └────────────┘   └──────────┐
             ╔═════════════════╗│
             ║ Motor Driver    ║│
             ║ Power Input:    ║│
             ║   12V/GND       ║│
             ╚═════════════════╝│
                                │
                    Common Ground Connection
```

---

## Detailed Connection Tables

### Table 1: Raspberry Pi GPIO to L298N Motor Driver

| L298N Pin | Description | Raspberry Pi Pin | GPIO Number | Physical Pin # |
|-----------|-------------|------------------|-------------|----------------|
| IN1 | Left Motor Direction A | GPIO 17 | BCM 17 | 11 |
| IN2 | Left Motor Direction B | GPIO 27 | BCM 27 | 13 |
| ENA | Left Motor Speed (PWM) | GPIO 12 | BCM 12 | 32 |
| IN3 | Right Motor Direction A | GPIO 22 | BCM 22 | 15 |
| IN4 | Right Motor Direction B | GPIO 23 | BCM 23 | 16 |
| ENB | Right Motor Speed (PWM) | GPIO 13 | BCM 13 | 33 |
| GND | Common Ground | GND | - | 6, 9, 14, 20, 25, 30, 34, or 39 |

### Table 2: Raspberry Pi GPIO to Line Sensors

| Sensor Pin | Description | Raspberry Pi Pin | GPIO Number | Physical Pin # |
|------------|-------------|------------------|-------------|----------------|
| VCC | Power (5V) | 5V | - | 2 or 4 |
| GND | Ground | GND | - | 6, 9, 14, 20, etc. |
| S1 | Left Sensor Output | GPIO 5 | BCM 5 | 29 |
| S2 | Center Sensor Output | GPIO 19 | BCM 19 | 35 |
| S3 | Right Sensor Output | GPIO 6 | BCM 6 | 31 |

**For 2-Sensor Module**: Use only S1 (GPIO 5) and S3 (GPIO 6)  
**For 5-Sensor Module**: Add GPIO 16, 20, 21, 26 for additional sensors

### Table 3: L298N Motor Driver Power Connections

| Connection | Source | Destination | Notes |
|------------|--------|-------------|-------|
| Motor Power | Battery Pack (+) | 12V Terminal | Red wire from battery |
| Motor Ground | Battery Pack (-) | GND Terminal | Black wire from battery |
| Common Ground | Pi GND | Motor Driver GND | **CRITICAL CONNECTION** |

⚠️ **NEVER** connect Raspberry Pi 5V to motor driver 5V output!

### Table 4: Motor Connections

| Motor | L298N Terminal | Wire Color (Typical) | Direction |
|-------|----------------|----------------------|-----------|
| Left Motor | OUT1 | Red or Blue | Forward/Reverse |
| Left Motor | OUT2 | Black or Yellow | Reverse/Forward |
| Right Motor | OUT3 | Red or Blue | Forward/Reverse |
| Right Motor | OUT4 | Black or Yellow | Reverse/Forward |

*Note: If motor spins backwards, swap the two motor wires*

---

## Pin-by-Pin Wiring Guide

### Raspberry Pi Pinout Reference (GPIO BCM Mode)

```
        3.3V  [ 1] [ 2]  5V      ← Sensor Power
       GPIO2  [ 3] [ 4]  5V
       GPIO3  [ 5] [ 6]  GND     ← Common Ground to Motor Driver
       GPIO4  [ 7] [ 8]  GPIO14
         GND  [ 9] [10]  GPIO15
  GPIO17 (M1) [11] [12]  GPIO18
  GPIO27 (M1) [13] [14]  GND     ← Another GND option
      GPIO22  [15] [16]  GPIO23  ← Right Motor Direction
        3.3V  [17] [18]  GPIO24
      GPIO10  [19] [20]  GND
       GPIO9  [21] [22]  GPIO25
      GPIO11  [23] [24]  GPIO8
         GND  [25] [26]  GPIO7
       GPIO0  [27] [28]  GPIO1
   GPIO5 (S1) [29] [30]  GND
   GPIO6 (S3) [31] [32]  GPIO12 (PWM-L) ← Left Motor PWM
  GPIO13 (PWM-R) [33] [34]  GND
  GPIO19 (S2) [35] [36]  GPIO16
      GPIO26  [37] [38]  GPIO20
         GND  [39] [40]  GPIO21

Legend:
(M1) = Motor 1 (Left)
(M2) = Motor 2 (Right)
(S1) = Sensor 1 (Left)
(S2) = Sensor 2 (Center)
(S3) = Sensor 3 (Right)
(PWM-L) = PWM for Left Motor
(PWM-R) = PWM for Right Motor
```

---

## Simplified Diagram for 2-Sensor Robot

For beginners using a 2-sensor setup:

```
╔═════════════════════╗
║   RASPBERRY PI      ║
║                     ║
║   GPIO 17 ──────────╫──┐
║   GPIO 27 ──────────╫──┼──┐      ╔══════════════╗
║   GPIO 12 ──────────╫──┼──┼──────║   L298N      ║
║                     ║  │  │      ║   Motor      ║
║   GPIO 22 ──────────╫──┼──┼──┐   ║   Driver     ║
║   GPIO 23 ──────────╫──┼──┼──┼───║              ║
║   GPIO 13 ──────────╫──┼──┼──┼───║   ╔═══╗      ║
║                     ║  │  │  │   ║   ║ L ║──────╫─── Left Motor
║   GPIO 5 ───────────╫──┼──┼──┼───║   ╚═══╝      ║
║   GPIO 6 ───────────╫──┼──┼──┼───║   ╔═══╗      ║
║                     ║  │  │  │   ║   ║ R ║──────╫─── Right Motor
║   5V ───────────────╫──┼──┼──┼───║   ╚═══╝      ║
║   GND ──────────────╫──┘  │  │   ║              ║
╚═════════════════════╝      │  │   ╚══════════════╝
                             │  │
      ╔══════════════════════╪══╪═════╗
      ║  LINE SENSORS        │  │     ║
      ║  [Left]  [Right]     │  │     ║
      ║    │       │          │  │     ║
      ║  VCC     VCC ─────────┼──┘     ║
      ║  GND     GND ─────────┘        ║
      ║   S1      S2                   ║
      ╚════════════════════════════════╝

      Battery Pack (6V)
      ┌──────────┐
      │  + : - : │
      └──┬───┬───┘
         │   │
         │   └──────── To Motor Driver GND
         └──────────── To Motor Driver 12V
```

---

## Motor Driver (L298N) Detailed Diagram

```
╔═══════════════════════════════════════════════════════════╗
║               L298N H-BRIDGE MOTOR DRIVER                 ║
╠═══════════════════════════════════════════════════════════╣
║                                                           ║
║  Power Input Section:                                     ║
║  ┌────────────────┐                                       ║
║  │  12V  ●  ●  GND  │ ← Battery Power (4-12V)            ║
║  └────────────────┘                                       ║
║                                                           ║
║  Motor A Control:              Motor B Control:          ║
║  ┌──────────────┐               ┌──────────────┐         ║
║  │  IN1   ●     │ ← GPIO 17     │  IN3   ●     │ ← GPIO 22
║  │  IN2   ●     │ ← GPIO 27     │  IN4   ●     │ ← GPIO 23
║  │  ENA   ●     │ ← GPIO 12     │  ENB   ●     │ ← GPIO 13
║  └──────────────┘    (PWM)      └──────────────┘  (PWM)  ║
║      [🔲] ← EN Jumper               [🔲] ← EN Jumper     ║
║                                                           ║
║  Motor Outputs:                                           ║
║  ┌──────────────┐               ┌──────────────┐         ║
║  │ OUT1  ●  ●  OUT2 │ ← LEFT    │ OUT3  ●  ●  OUT4 │ ← RIGHT
║  └──────────────┘    MOTOR      └──────────────┘   MOTOR ║
║                                                           ║
║  5V Regulator Output (Optional, DON'T USE FOR PI!):      ║
║  ┌──────────────┐                                         ║
║  │  +5V  ●  ●  GND  │                                    ║
║  └──────────────┘                                         ║
║      [🔲] ← 5V Enable Jumper (remove if using >12V)      ║
║                                                           ║
║  Status LEDs:                                             ║
║  ● ● ● ← Power & Motor Activity Indicators               ║
╚═══════════════════════════════════════════════════════════╝

Notes:
- EN Jumpers: MUST be installed for motors to work
- 5V Regulator: Can power sensors, but NOT Raspberry Pi
- Power LED: Should light when battery connected
- If using >12V input, remove 5V jumper to protect regulator
```

---

## Line Sensor Module Diagram

### 3-Sensor Module (Typical Layout)

```
╔═══════════════════════════════════════════════════════╗
║         LINE FOLLOWER SENSOR MODULE (3 Sensor)        ║
╠═══════════════════════════════════════════════════════╣
║                                                       ║
║  Connection Pins:                                     ║
║  ┌─────────────────────────────┐                      ║
║  │ VCC  GND  S1  S2  S3  [EN] │                      ║
║  └───●───●────●───●───●────●───┘                      ║
║       │   │    │   │   │    │                         ║
║      5V GND GPIO5 GPIO19 GPIO6 (optional)            ║
║                                                       ║
║  Sensor Array (Front View):                          ║
║  ┌─────────────────────────────────────────────┐     ║
║  │  ╭─────╮    ╭─────╮    ╭─────╮             │     ║
║  │  │ LED │    │ LED │    │ LED │ ← Indicators│     ║
║  │  ╰─────╯    ╰─────╯    ╰─────╯             │     ║
║  │     │          │          │                 │     ║
║  │  [  ●  ]   [  ●  ]   [  ●  ]               │     ║
║  │  Sensor 1  Sensor 2  Sensor 3              │     ║
║  │   (Left)   (Center)   (Right)              │     ║
║  └─────────────────────────────────────────────┘     ║
║                                                       ║
║  Sensitivity Adjustment:                              ║
║  ┌──┐   ┌──┐   ┌──┐                                  ║
║  │🔧│   │🔧│   │🔧│ ← Potentiometers (if present)    ║
║  └──┘   └──┘   └──┘    Turn with small screwdriver  ║
║   S1     S2     S3                                    ║
║                                                       ║
║  Detection Zone (Side View):                         ║
║         ┌───┐ ┌───┐ ┌───┐                            ║
║         │IR │ │IR │ │IR │ ← IR LED + Phototransistor║
║         │LED│ │LED│ │LED│                            ║
║         └─┬─┘ └─┬─┘ └─┬─┘                            ║
║  Range:   ↓     ↓     ↓                              ║
║         ┆┆┆   ┆┆┆   ┆┆┆  3-8mm optimal              ║
║  ═══════════════════════════  ← Surface              ║
║         █████████████  ← Black Line                  ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝

Operation:
- LED ON  = Sensor detecting BLACK (output LOW/0)
- LED OFF = Sensor detecting WHITE (output HIGH/1)
```

### 5-Sensor Module Layout

```
╔═══════════════════════════════════════════════════════════╗
║      LINE FOLLOWER SENSOR MODULE (5 Sensor)               ║
╠═══════════════════════════════════════════════════════════╣
║                                                           ║
║  Connection Pins:                                         ║
║  VCC GND  S1   S2   S3   S4   S5                          ║
║   ●   ●    ●    ●    ●    ●    ●                          ║
║   │   │    │    │    │    │    │                          ║
║  5V  GND GPIO5 GPIO19 GPIO6 GPIO16 GPIO20                ║
║                                                           ║
║  Sensor Array:                                            ║
║  ┌────────────────────────────────────────────────┐       ║
║  │   ●      ●      ●      ●      ●               │       ║
║  │   S1     S2     S3     S4     S5              │       ║
║  │  (Far  (Left) (Ctr) (Right) (Far             │       ║
║  │  Left)                      Right)            │       ║
║  └────────────────────────────────────────────────┘       ║
║                                                           ║
║  Provides better precision:                               ║
║  - More granular position detection                       ║
║  - Smoother proportional control                          ║
║  - Better curve handling                                  ║
╚═══════════════════════════════════════════════════════════╝
```

---

## Complete Robot Layout (Top View)

```
                    ┌─────────────────┐
                    │                 │
                    │  Line Sensors   │ ← FRONT
                    │   [●] [●] [●]   │
                    └────────┬────────┘
                             │ 5mm gap
    ═══════════════════════════════════════  ← Black Line on Floor
                             │
                    ┌────────┴────────┐
                    │                 │
    ┌───────────────┤  Battery Pack   ├──────────────┐
    │               │                 │              │
    │               └─────────────────┘              │
    │                                                │
    │   ┌──────────────────────────────────┐        │
    │   │      L298N Motor Driver          │        │
    │   │                                  │        │
    │   │    ┌────────┐    ┌────────┐     │        │
    │   │    │ Motor  │    │ Motor  │     │        │
    │   │    │   A    │    │   B    │     │        │
    │   │    │ (Left) │    │(Right) │     │        │
    │   │    └────┬───┘    └───┬────┘     │        │
    │   └─────────┼────────────┼──────────┘        │
    │             │            │                    │
    │             ▼            ▼                    │
    │         ┌───────┐    ┌───────┐               │
    └─────────│  ⚫   │    │  ⚫   │───────────────┘
              │ Wheel│    │ Wheel│
              │ Left │    │ Right│
              └───────┘    └───────┘
                  │            │
                  └────────────┘
                        │
                        ▼
                   ┌────────┐
                   │   ⚪   │ ← Caster Wheel (REAR)
                   │ Caster │
                   └────────┘
```

---

## Safety and Best Practices

### ⚠️ CRITICAL CONNECTIONS

1. **Common Ground**
   ```
   Raspberry Pi GND ───┬─── L298N GND
                       │
                       └─── Battery (-)
   ```
   Without this, nothing works correctly!

2. **Power Isolation**
   ```
   ✓ CORRECT:
   Battery → Motor Driver → Motors
   Wall Adapter → Raspberry Pi
   
   ✗ WRONG:
   Motor Driver 5V → Raspberry Pi 5V
   (Can damage your Pi!)
   ```

3. **Enable Jumpers**
   ```
   L298N requires jumpers on ENA and ENB
   [●─●] ← Jumper must be installed
   ```

### Wire Color Coding (Recommended)

- **Red** = Positive power connections
- **Black** = Ground connections
- **Yellow/Orange** = Motor signals (IN1-IN4)
- **Blue/Green** = PWM signals (ENA, ENB)
- **White/Gray** = Sensor signals
- **Purple/Brown** = Other control signals

### Zip Tie Placement

```
Secure points for wire management:
     🔗        🔗        🔗
      │         │         │
   ───┴────────┴────────┴────
   │                        │
   │   Robot Chassis        │
   │                        │
   └────────────────────────┘

- Along chassis edges
- Near connection points
- Away from moving parts (wheels!)
- Every 3-4 inches of wire
```

---

## Troubleshooting Wiring Issues

### No Power Indicator LED on Motor Driver
- Check battery installed and powered on
- Verify (+) to 12V and (-) to GND
- Test battery voltage (should be ~6V for 4xAA)
- Check for loose connections

### Motors Don't Respond
- Verify EN jumpers are installed
- Check all 6 GPIO control wires connected
- Verify common ground connection (most common issue!)
- Test motors with direct battery connection
- Check code uses correct GPIO numbers

### Sensors Always Show Same Value
- Check VCC (5V) and GND connected
- Verify sensor signal wires to correct GPIO pins
- Test with sensor_test.py program
- Adjust sensitivity potentiometers
- Check sensor height (3-8mm optimal)

### One Motor Works, Other Doesn't
- Swap motor connections to isolate issue
- Check specific motor's control wires (IN1-4)
- Test PWM pin with LED
- Verify both EN jumpers installed

### Robot Moves But Erratically
- Replace batteries (weak batteries cause problems!)
- Check for loose connections (wiggle test)
- Verify all wires secured with zip ties
- Ensure wires not touching wheels

---

## Quick Reference Card (Print This!)

```
╔══════════════════════════════════════════════════════════╗
║          WEEK 7 LINE FOLLOWER QUICK REFERENCE            ║
╠══════════════════════════════════════════════════════════╣
║                                                          ║
║  MOTOR CONTROL (L298N → Pi):                            ║
║    IN1 → GPIO 17  │  IN3 → GPIO 22                      ║
║    IN2 → GPIO 27  │  IN4 → GPIO 23                      ║
║    ENA → GPIO 12  │  ENB → GPIO 13                      ║
║                                                          ║
║  LINE SENSORS (Module → Pi):                            ║
║    VCC → 5V       │  S1 (Left) → GPIO 5                 ║
║    GND → GND      │  S2 (Ctr)  → GPIO 19                ║
║                   │  S3 (Right)→ GPIO 6                 ║
║                                                          ║
║  POWER:                                                  ║
║    Battery (+) → Motor Driver 12V                       ║
║    Battery (-) → Motor Driver GND                       ║
║    Pi GND → Motor Driver GND ← CRITICAL!               ║
║                                                          ║
║  SENSOR LOGIC:                                           ║
║    0 (LOW)  = On black line                             ║
║    1 (HIGH) = On white surface                          ║
║                                                          ║
║  TYPICAL SPEEDS:                                         ║
║    BASE_SPEED = 60  (Forward)                           ║
║    TURN_SPEED = 40  (Turning)                           ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝
```

---

**Refer to this guide while building your robot!** 🤖🔌
