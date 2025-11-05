# Week 5 Circuit Diagrams

**Note**: These are text-based diagrams. For visual learners, instructor should draw these on board or project them.

---

## Button Circuit with Internal Pull-down

```
Raspberry Pi                     
                                 
GPIO 17 ────┐                    
            │                    
        [BUTTON]                 
            │                    
         3.3V Pin                
                                 
Internal Pull-down              
(enabled in code):              
                                 
GPIO 17 ────┬─ (internal 50kΩ)  
            │                    
           GND                   
```

**Code**: `GPIO.setup(17, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)`

---

## Button Circuit with External Pull-down

```
         3.3V Pin
            │
        [BUTTON]
            │
            ├─────→ GPIO 17
            │
        [10kΩ Resistor]
            │
           GND
```

---

## PIR Motion Sensor

```
PIR Sensor              Raspberry Pi
──────────              ────────────

   [VCC] ────────────────→ 5V (Pin 2)
                           
   [OUT] ────────────────→ GPIO 17 (Pin 11)
                           
   [GND] ────────────────→ GND (Pin 6)
```

**Note**: PIR output is 3.3V (safe for GPIO)

---

## DHT11/DHT22 Temperature Sensor

```
DHT Sensor              Raspberry Pi
──────────              ────────────

   [VCC] ────────────────→ 3.3V (Pin 1) or 5V (Pin 2)
                           
  [DATA] ────────────────→ GPIO 4 (Pin 7)
                           
   [GND] ────────────────→ GND (Pin 6)
```

**Note**: Check your sensor's voltage requirement

---

## HC-SR04 Ultrasonic Sensor with Voltage Divider

```
HC-SR04                 Raspberry Pi
───────                 ────────────

   [VCC] ────────────────→ 5V (Pin 2)
                           
  [TRIG] ────────────────→ GPIO 23 (Pin 16)
                           
  [ECHO] ───→ 1kΩ ───┬───→ GPIO 24 (Pin 18)
                     │
                    2kΩ
                     │
                    GND

   [GND] ────────────────→ GND (Pin 6)
```

**⚠️ CRITICAL**: Voltage divider is REQUIRED on ECHO pin!

---

## Voltage Divider Explained

```
Echo Pin (5V output)
      │
   [1kΩ Resistor]
      │
      ├─────→ GPIO Pin (reads 3.3V)
      │
   [2kΩ Resistor]
      │
     GND

Calculation:
Vout = Vin × (R2 / (R1 + R2))
     = 5V × (2kΩ / (1kΩ + 2kΩ))
     = 5V × (2/3)
     = 3.33V ✓ (safe for GPIO)
```

---

## Complete Button + LED Circuit

```
Raspberry Pi                        Breadboard
────────────                        ──────────

3.3V (Pin 1) ─────────────────────→ Button (one leg)
                                    │
                                    Button (other leg)
                                    │
GPIO 17 (Pin 11) ──────────────────┤
                (internal pull-down)│
                                   GND


GPIO 27 (Pin 13) ──→ [560Ω] ──→ LED+ ──→ LED- ──→ GND (Pin 6)
```

---

## Complete PIR + LED Circuit

```
Raspberry Pi                        Sensors/Components
────────────                        ──────────────────

5V (Pin 2) ──────────────────────→ PIR VCC

GND (Pin 6) ─────────────────────→ PIR GND

GPIO 17 (Pin 11) ────────────────→ PIR OUT


GPIO 27 (Pin 13) ──→ [560Ω] ──→ LED+ ──→ LED- ──→ GND (Pin 6)
```

---

## Complete Temperature Monitor (3 LEDs)

```
Raspberry Pi                        Sensors/Components
────────────                        ──────────────────

3.3V (Pin 1) ─────────────────────→ DHT VCC

GND (Pin 6) ──────────────────────→ DHT GND

GPIO 4 (Pin 7) ───────────────────→ DHT DATA


GPIO 17 (Pin 11) ──→ [560Ω] ──→ Blue LED+ ──→ LED- ──→ GND (Pin 6)
                                  (Cold alert)

GPIO 27 (Pin 13) ──→ [560Ω] ──→ Green LED+ ──→ LED- ──→ GND (Pin 6)
                                  (Comfortable)

GPIO 22 (Pin 15) ──→ [560Ω] ──→ Red LED+ ──→ LED- ──→ GND (Pin 6)
                                  (Hot alert)
```

---

## Breadboard Layout - Button Circuit

```
     Breadboard
     ─────────────────────────────
     + Rail (not used)
     ─────────────────────────────
     
     
     Main Area:
     
     Row 10:  [Button Leg 1] ───────→ (to 3.3V)
     Row 11:  [Button Leg 2] 
     Row 12:  
     Row 13:  [Button Leg 3] ───────→ (to GPIO 17)
     Row 14:  [Button Leg 4]
     
     
     ─────────────────────────────
     - Rail: Connected to GND
     ─────────────────────────────
```

**Note**: Button legs 1-2 connected, legs 3-4 connected. Pressing connects them.

---

## Breadboard Layout - PIR Sensor

```
PIR sensor typically doesn't go IN breadboard.
Connect directly with female-to-male jumper wires:

PIR Pins → Jumper Wires → Raspberry Pi
   VCC   → Red wire    → 5V
   OUT   → Yellow wire → GPIO 17
   GND   → Black wire  → GND
```

---

## Raspberry Pi GPIO Header (Partial)

```
     Pin 1  Pin 2
     ─────  ─────
     3.3V    5V     ← Power pins
     
     Pin 7  Pin 11
     ─────  ──────
     GPIO4  GPIO17  ← Good for sensors
     
     Pin 13 Pin 15
     ──────  ──────
     GPIO27 GPIO22  ← Good for LEDs
     
     Pin 6
     ─────
     GND            ← Ground
```

**Full pinout**: https://pinout.xyz

---

## Pull-down vs Pull-up Comparison

### Pull-down (Default LOW)
```
Button NOT pressed:

GPIO ──┬── (50kΩ internal) ──→ GND
       │
    (reads LOW)

Button pressed:

GPIO ──┬─── Button ─── 3.3V
       │
    (reads HIGH)
```

### Pull-up (Default HIGH)
```
Button NOT pressed:

GPIO ──┬── (50kΩ internal) ──→ 3.3V
       │
    (reads HIGH)

Button pressed:

GPIO ──┬─── Button ─── GND
       │
    (reads LOW)
```

---

## LED Polarity

```
     LED Symbol:
     
     ───┬───  ← Cathode (negative, short leg)
        │
       ─┴─   ← Anode (positive, long leg)
```

**Always**: Long leg → Positive (from GPIO through resistor)  
**Always**: Short leg → Negative (to GND)

---

## Resistor Placement

### Correct (resistor before LED):
```
GPIO → [560Ω] → LED+ → LED- → GND  ✓
```

### Also Correct (resistor after LED):
```
GPIO → LED+ → LED- → [560Ω] → GND  ✓
```

**Both work!** Current limiting works either way.

---

## Multiple Components Sharing Ground

```
                 Raspberry Pi GND
                       │
          ┌────────────┼────────────┐
          │            │            │
       LED 1         LED 2        PIR
       GND           GND          GND

All grounds connect together!
```

---

## Sensor Testing Circuit (Minimal)

### Just the sensor (no LED):

```
Sensor VCC  → Pi power (3.3V or 5V)
Sensor GND  → Pi GND
Sensor OUT  → Pi GPIO
```

This is good for initial testing!

---

## Common Mistakes - Visual

### ❌ Wrong: Floating Button
```
GPIO 17 ────[BUTTON]──── 3.3V
     (No pull-down = random readings!)
```

### ✓ Correct: Button with Pull-down
```
GPIO 17 ────┬────[BUTTON]──── 3.3V
            │
         [10kΩ]
            │
           GND
```

---

### ❌ Wrong: No LED Resistor
```
GPIO 27 ─── LED+ ──── LED- ──── GND
     (Can damage GPIO pin!)
```

### ✓ Correct: LED with Resistor
```
GPIO 27 ─── [560Ω] ─── LED+ ──── LED- ──── GND
```

---

### ❌ Wrong: LED Backwards
```
GPIO 27 ─── [560Ω] ─── LED- ──── LED+ ──── GND
     (Won't light up!)
```

### ✓ Correct: LED Forward
```
GPIO 27 ─── [560Ω] ─── LED+ ──── LED- ──── GND
```

---

### ❌ Wrong: 5V to GPIO Input Directly
```
Sensor 5V OUT ──────→ GPIO Pin
     (Will damage Pi!)
```

### ✓ Correct: Voltage Divider
```
Sensor 5V OUT ──→ 1kΩ ──┬──→ GPIO Pin
                        2kΩ
                         │
                        GND
```

---

## Reading Circuit Diagrams

### Symbol Key

```
──────   Wire / Connection
  
[XXXX]   Component (resistor, button, etc.)

  ┬──    Junction (wires connect)
  
  ├──    Junction with continuation

  └──    End of branch

  │      Vertical connection

─ ─ ─    Optional/internal connection
```

---

## Drawing Your Own Circuits

**Tips**:
1. Start with power (VCC, GND)
2. Add sensor connections
3. Add outputs (LEDs)
4. Label all GPIO pins
5. Show component values (560Ω, etc.)
6. Note voltage levels

---

## Troubleshooting with Diagrams

**When something doesn't work**:
1. Print/draw the diagram
2. Check each connection with finger or pen
3. Mark each verified connection with checkmark
4. Find the missing/wrong connection!

---

**For more detailed visual diagrams**:
- Fritzing software (free circuit diagram tool)
- Draw on whiteboard/paper
- Take photos of working circuits for reference

---

*These text diagrams are starting points. Instructor should demonstrate with actual components!*
