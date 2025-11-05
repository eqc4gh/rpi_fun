# Sensor Quick Reference Card

**Week 5: Sensors & Input**

Print this page for quick reference while building circuits!

---

## Button / Tactile Switch

**Type**: Digital Input  
**Power**: None needed (uses Pi power)  
**Pins**: 2 (any orientation)

### Wiring
```
Button → 3.3V
Button → GPIO pin
GPIO pin → 10kΩ → GND (or use internal pull-down)
```

### Code
```python
GPIO.setup(17, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
state = GPIO.input(17)  # True = pressed, False = not pressed
```

### Key Facts
- ✓ Non-directional (works both ways)
- ✓ MUST use pull-down or pull-up resistor
- ✓ Needs debouncing (0.2s delay)
- ✓ Simple and reliable

---

## PIR Motion Sensor (HC-SR501)

**Type**: Digital Input  
**Power**: 5V  
**Pins**: VCC, OUT, GND

### Wiring
```
PIR VCC → Pi 5V (Pin 2)
PIR GND → Pi GND (Pin 6)
PIR OUT → Pi GPIO 17 (Pin 11)
```

### Code
```python
GPIO.setup(17, GPIO.IN)
motion = GPIO.input(17)  # True = motion, False = no motion
```

### Key Facts
- ⏱️ Needs 60 second warmup
- 🎯 Detection range: 3-7 meters
- 🔧 Has two adjustment pots (Sx, Tx)
- ⚡ Output is 3.3V (safe for GPIO)
- ✓ Keep sensor stable, don't move it

---

## DHT11 Temperature/Humidity Sensor

**Type**: Serial Digital  
**Power**: 3.3V or 5V (check sensor)  
**Pins**: VCC, DATA, GND

### Wiring
```
DHT VCC  → Pi 3.3V (Pin 1) or 5V (Pin 2)
DHT GND  → Pi GND (Pin 6)
DHT DATA → Pi GPIO 4 (Pin 7)
```

### Code
```python
import Adafruit_DHT

SENSOR = Adafruit_DHT.DHT11
humidity, temp = Adafruit_DHT.read_retry(SENSOR, 4)

if humidity is not None and temp is not None:
    print(f"{temp}°C, {humidity}%")
```

### Key Facts
- 📚 Requires Adafruit_DHT library
- ⏱️ Wait 2 seconds between readings
- ❌ Sometimes returns None (normal!)
- 📊 Accuracy: ±2°C, ±5% humidity
- 🌡️ Range: 0-50°C, 20-80%

---

## DHT22 Temperature/Humidity Sensor

**Type**: Serial Digital  
**Power**: 3.3V or 5V  
**Pins**: VCC, DATA, GND

### Wiring
```
Same as DHT11
```

### Code
```python
import Adafruit_DHT

SENSOR = Adafruit_DHT.DHT22  # Only difference from DHT11
humidity, temp = Adafruit_DHT.read_retry(SENSOR, 4)
```

### Key Facts
- 📚 Same library as DHT11
- 📊 Better accuracy: ±0.5°C, ±2-5% humidity
- 🌡️ Wider range: -40-80°C, 0-100%
- 💰 More expensive than DHT11
- ⏱️ Wait 2 seconds between readings

---

## HC-SR04 Ultrasonic Distance Sensor

**Type**: Digital (pulse timing)  
**Power**: 5V  
**Pins**: VCC, TRIG, ECHO, GND

### Wiring ⚠️ VOLTAGE DIVIDER REQUIRED!
```
HC-SR04 VCC  → Pi 5V (Pin 2)
HC-SR04 GND  → Pi GND (Pin 6)
HC-SR04 TRIG → Pi GPIO 23 (Pin 16)
HC-SR04 ECHO → 1kΩ → Pi GPIO 24 (Pin 18) → 2kΩ → GND
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                     VOLTAGE DIVIDER REQUIRED ON ECHO!
```

### Code
```python
GPIO.setup(23, GPIO.OUT)  # TRIG
GPIO.setup(24, GPIO.IN)   # ECHO

GPIO.output(23, True)
time.sleep(0.00001)
GPIO.output(23, False)

while GPIO.input(24) == 0:
    start = time.time()
while GPIO.input(24) == 1:
    end = time.time()

distance = (end - start) * 17150  # cm
```

### Key Facts
- ⚠️ ECHO pin outputs 5V → MUST use voltage divider!
- 📏 Range: 2cm - 400cm
- 🎯 Accuracy: ±3mm
- 🔊 Uses 40kHz sound (inaudible)
- 📐 Needs clear line-of-sight

---

## Comparison Chart

| Sensor | Difficulty | Warmup | Power | Common Issues |
|--------|-----------|--------|-------|---------------|
| **Button** | ⭐ Easy | None | None | Forgetting pull-down |
| **PIR** | ⭐⭐ Medium | 60s | 5V | Constant triggering |
| **DHT11** | ⭐⭐ Medium | 1s | 3.3V/5V | Library install, None readings |
| **DHT22** | ⭐⭐ Medium | 1s | 3.3V/5V | Same as DHT11 |
| **HC-SR04** | ⭐⭐⭐ Hard | None | 5V | Voltage divider, erratic readings |

---

## GPIO Pin Recommendations

**Good pins for input**:
- GPIO 4 (Pin 7) - Good for DHT sensors
- GPIO 17 (Pin 11) - General purpose
- GPIO 27 (Pin 13) - General purpose
- GPIO 22 (Pin 15) - General purpose
- GPIO 23 (Pin 16) - Good for ultrasonic TRIG
- GPIO 24 (Pin 18) - Good for ultrasonic ECHO

**Avoid these pins** (special functions):
- GPIO 2, 3 (I2C)
- GPIO 14, 15 (UART/Serial)
- GPIO 9, 10, 11 (SPI)

---

## Power Pin Reference

**5V Pins** (for PIR, ultrasonic):
- Pin 2, Pin 4

**3.3V Pins** (for DHT, some modules):
- Pin 1, Pin 17

**Ground Pins** (use any):
- Pin 6, Pin 9, Pin 14, Pin 20, Pin 25, Pin 30, Pin 34, Pin 39

---

## Common Code Patterns

### Button with Event Detection
```python
def button_pressed(channel):
    print("Button pressed!")

GPIO.add_event_detect(17, GPIO.RISING, 
                      callback=button_pressed, 
                      bouncetime=200)
```

### Button Toggle
```python
led_state = False
last_button = False

current_button = GPIO.input(17)
if current_button and not last_button:  # Rising edge
    led_state = not led_state
    GPIO.output(27, led_state)
    time.sleep(0.2)  # Debounce
last_button = current_button
```

### PIR with LED
```python
if GPIO.input(PIR_PIN):
    GPIO.output(LED_PIN, True)
else:
    GPIO.output(LED_PIN, False)
```

### DHT with Error Handling
```python
humidity, temp = Adafruit_DHT.read_retry(DHT11, 4)
if humidity is not None and temp is not None:
    print(f"{temp}°C, {humidity}%")
else:
    print("Failed to read")
time.sleep(2)  # Must wait!
```

---

## Safety Checklist

Before powering on:
- [ ] All VCC to correct voltage (3.3V or 5V)
- [ ] All GND connected to Pi GND
- [ ] GPIO pins not exceeding 3.3V input
- [ ] Voltage divider on 5V outputs (like ultrasonic ECHO)
- [ ] No shorts between VCC and GND
- [ ] All connections firm

---

## Troubleshooting Quick Checks

**Sensor not working?**
1. ⚡ Check power (VCC, GND) with multimeter
2. 🔌 Verify GPIO pin number in code matches physical
3. 📝 Print raw sensor values
4. 🔄 Try different GPIO pin
5. 💡 Test with known-good example code
6. 🔧 Check if sensor is defective (swap it)

**Getting errors?**
- "GPIO in use" → `GPIO.cleanup()`
- "No access to /dev/mem" → Use `sudo`
- "ImportError" → Install library
- Wrong values → Check sensor type in code

---

## Installation Commands

### DHT Library
```bash
sudo pip3 install Adafruit_DHT --break-system-packages
```

### Verify GPIO
```bash
python3 -c "import RPi.GPIO; print('OK')"
```

### Reset GPIO
```bash
sudo python3 -c "import RPi.GPIO as GPIO; GPIO.cleanup()"
```

---

## Useful Links

📍 **GPIO Pinout**: https://pinout.xyz  
📚 **RPi.GPIO Docs**: https://sourceforge.net/p/raspberry-gpio-python/wiki/  
🔧 **Adafruit Learn**: https://learn.adafruit.com

---

## Temperature Conversions

**Celsius to Fahrenheit**:
```python
fahrenheit = (celsius * 9/5) + 32
```

**Fahrenheit to Celsius**:
```python
celsius = (fahrenheit - 32) * 5/9
```

---

## Resistor Color Codes (for voltage divider)

**1kΩ** (1,000 Ω):  
Brown-Black-Red-Gold

**2kΩ** (2,000 Ω):  
Red-Black-Red-Gold

**10kΩ** (10,000 Ω):  
Brown-Black-Orange-Gold

---

**Pro Tip**: Take photos of working circuits! Makes it easy to rebuild or debug later. 📸

**Remember**: Sensor problems are usually wiring issues. Check connections first! 🔍

---

*Keep this handy while building your sensor projects!*
