# Week 4 Circuit Diagrams

## Basic LED Circuit

### Schematic Diagram
```
Raspberry Pi                     LED              
GPIO 17 ----[560Ω]----+--|>|----+
                                |
                              Ground
```

### Breadboard Layout
```
Raspberry Pi GPIO 17 (Pin 11)
    |
    |  (wire)
    |
    +-- Row 7, Column a
            |
            | (resistor 560Ω)
            |
    +-- Row 10, Column a
            |
    +-- Row 10, Column e (LED long leg)
            |
            | (LED)
            |
    +-- Row 12, Column e (LED short leg)
            |
            | (wire)
            |
Raspberry Pi Ground (Pin 6)
```

### Component Checklist
- [ ] 1 LED (any color)
- [ ] 1 Resistor (560Ω to 1kΩ)
- [ ] 2 Jumper wires (male-to-female)
- [ ] Breadboard

---

## Traffic Light Circuit (3 LEDs)

### Schematic Diagram
```
GPIO 17 ----[560Ω]----+--|>|----+----+
                      Red LED        |
                                     |
GPIO 27 ----[560Ω]----+--|>|----+   |
                    Yellow LED      GND
                                     |
GPIO 22 ----[560Ω]----+--|>|----+---+
                     Green LED
```

### Breadboard Layout
```
Pi GPIO 17 → Row 3  → Resistor → Row 5  → Red LED (+) → Row 7  → Red LED (-) → Ground Rail
Pi GPIO 27 → Row 8  → Resistor → Row 10 → Yel LED (+) → Row 12 → Yel LED (-) → Ground Rail  
Pi GPIO 22 → Row 13 → Resistor → Row 15 → Grn LED (+) → Row 17 → Grn LED (-) → Ground Rail

Ground Rail → Pi Ground Pin
```

### Component Checklist
- [ ] 3 LEDs (red, yellow, green recommended)
- [ ] 3 Resistors (560Ω to 1kΩ)
- [ ] 4 Jumper wires (3 for GPIO, 1 for ground)
- [ ] Breadboard

---

## LED Polarity Guide

### LED Legs
```
  Long Leg (+)
      |
      |
    +---+
    | L |  ← LED body
    | E |
    | D |
    +---+
      |
      |
  Short Leg (-)
  
  Flat side → Cathode (-)
```

### Correct Connection
```
GPIO → Resistor → LED Long Leg (+) → LED Short Leg (-) → Ground
  ✓ CORRECT
```

### Incorrect Connection (Don't do this!)
```
GPIO → LED → Ground  (NO RESISTOR!)
  ✗ WRONG - Will damage GPIO pin!

GPIO → Resistor → LED Short Leg (-) → LED Long Leg (+) → Ground
  ✗ WRONG - LED backwards, won't light
```

---

## Resistor Color Code Reference

### 4-Band Resistor Reading
```
Band 1 | Band 2 | Band 3 | Band 4
Digit  | Digit  | Multi  | Tolerance
```

### Common Values
**220Ω** (Red-Red-Brown-Gold)
```
[Red][Red][Brown][Gold]
  2    2    ×10    ±5%
= 22 × 10 = 220Ω
```

**560Ω** (Green-Blue-Brown-Gold)
```
[Green][Blue][Brown][Gold]
   5     6     ×10    ±5%
= 56 × 10 = 560Ω
```

**1kΩ** (Brown-Black-Red-Gold)
```
[Brown][Black][Red][Gold]
   1      0    ×100  ±5%
= 10 × 100 = 1000Ω = 1kΩ
```

### Color Chart
| Color  | Digit |
|--------|-------|
| Black  | 0     |
| Brown  | 1     |
| Red    | 2     |
| Orange | 3     |
| Yellow | 4     |
| Green  | 5     |
| Blue   | 6     |
| Violet | 7     |
| Gray   | 8     |
| White  | 9     |

**Multiplier**:
- Brown = ×10
- Red = ×100
- Orange = ×1000

---

## Breadboard Connection Guide

### How Breadboards Work
```
Power Rails (vertical connection):
+ + + + + + + + + + (all connected)
- - - - - - - - - - (all connected)

Main Area (horizontal connection):
     a b c d e | f g h i j
 1   · · · · · | · · · · ·
 2   · · · · · | · · · · ·
     [Row 1 a-e connected]
     [Row 1 f-j connected]
     [Not connected across gap]
```

### Good Connection Example
```
Row 5:  a[Resistor]---b c[Wire]---d e[LED+]
Row 7:  a b c d e[LED-]---f[Wire to Ground]

Resistor and Wire both in Row 5 → Connected ✓
LED legs in different rows → Not shorted ✓
```

### Bad Connection Example
```
Row 5:  a[LED+] b c[LED-]  ← Both legs same row!
        ✗ WRONG - Short circuit!
```

---

## Common Circuit Mistakes

### Mistake 1: No Resistor
```
❌ GPIO → LED → Ground
   Will damage GPIO pin!

✓ GPIO → Resistor → LED → Ground
   Safe and correct!
```

### Mistake 2: LED Backwards
```
❌ GPIO → Resistor → LED Short Leg → LED Long Leg → Ground
   LED won't light (but safe)

✓ GPIO → Resistor → LED Long Leg → LED Short Leg → Ground
   LED lights up!
```

### Mistake 3: Using 5V
```
❌ 5V Power → Resistor → LED → Ground
   LED always on, can't control!

✓ GPIO Pin → Resistor → LED → Ground
   Can control with code!
```

### Mistake 4: Ground to GPIO
```
❌ GPIO Pin → Ground Pin
   Short circuit! Damages Pi!

✓ GPIO Pin → Resistor → LED → Ground Pin
   Complete circuit, safe!
```

---

## Wire Color Conventions

**Recommended Color Scheme**:
- **Red**: Power connections (3.3V, GPIO outputs)
- **Black**: Ground connections
- **Yellow/Green/Blue**: Signal/data connections

**Example**:
- Red wire: GPIO 17 to breadboard
- Black wire: Breadboard ground rail to Pi ground
- Green wire: GPIO 27 to breadboard

**Benefits**:
- Easy to trace circuits
- Quick visual checking
- Professional appearance
- Easier debugging

---

## Voltage and Current Guide

### GPIO Output
- **Voltage**: 3.3V when HIGH
- **Current**: Up to 16mA safely per pin
- **Total**: Max 50mA all pins combined

### LED Requirements
- **Forward Voltage**: 2.0-2.2V (red/yellow/green)
- **Forward Current**: 10-20mA typical
- **We aim for**: 10-15mA to be safe

### Resistor Calculation
```
V_gpio = 3.3V
V_led = 2.0V
V_resistor = 3.3V - 2.0V = 1.3V

Target current = 10mA = 0.01A

R = V / I
R = 1.3V / 0.01A
R = 130Ω minimum

Use 220-1000Ω for safety margin!
```

---

## Safety Checklist

Before powering on ANY circuit:
- [ ] Power is OFF (Pi shutdown)
- [ ] All LEDs have resistors
- [ ] LED polarity correct (long leg to +)
- [ ] Using GPIO pins, not 5V
- [ ] Ground connections secure
- [ ] No loose wires
- [ ] No short circuits (wires touching)
- [ ] Pins match code (GPIO 17, 27, 22)
- [ ] Someone has double-checked
- [ ] Instructor has approved (first time)

---

## Testing Procedures

### Test 1: Visual Inspection
1. Check all connections visible
2. Verify LED orientations
3. Count resistors (one per LED)
4. Look for loose wires
5. Check for crossed wires

### Test 2: Continuity Check (with multimeter)
1. Pi is OFF
2. Check resistor connections
3. Verify ground paths
4. Check no shorts between GPIO and ground

### Test 3: Simple Test Program
```python
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
GPIO.setup(17, GPIO.OUT)

# Quick test
GPIO.output(17, GPIO.HIGH)
time.sleep(2)
GPIO.output(17, GPIO.LOW)

GPIO.cleanup()
```

---

## Troubleshooting Flowchart

```
LED doesn't light?
    |
    ├─> Check LED polarity → Flip if wrong
    |
    ├─> Check resistor present → Add if missing
    |
    ├─> Check wire connections → Push in firmly
    |
    ├─> Check code pin number → Match circuit
    |
    ├─> Test LED separately → Replace if dead
    |
    └─> Check GPIO output → Try different pin
```

---

## Advanced: Multiple Ground Options

### Option A: Individual Grounds
```
LED 1 → Ground Pin 6
LED 2 → Ground Pin 9
LED 3 → Ground Pin 14
```
- Simple to understand
- Uses more wires
- Takes more Pi ground pins

### Option B: Shared Ground Rail (Recommended)
```
LED 1 → Breadboard Ground Rail
LED 2 → Breadboard Ground Rail  
LED 3 → Breadboard Ground Rail
Ground Rail → Pi Ground Pin 6
```
- Cleaner wiring
- Fewer wires
- More organized
- Professional approach

---

## Quick Reference Card

**Print and keep this nearby!**

```
┌─────────────────────────────────┐
│  QUICK LED CIRCUIT REFERENCE    │
├─────────────────────────────────┤
│ Standard Setup:                  │
│  GPIO 17 → 560Ω → LED → Ground  │
│                                  │
│ LED Polarity:                    │
│  Long leg = + (Anode)            │
│  Short leg = - (Cathode)         │
│                                  │
│ Resistor: 220Ω to 1kΩ           │
│                                  │
│ Safety:                          │
│  ✓ Power OFF before changes      │
│  ✓ Always use resistor          │
│  ✓ Check LED polarity           │
│  ✓ Double-check before power on │
└─────────────────────────────────┘
```

---

**Keep these diagrams handy while building circuits!** 📐🔧
