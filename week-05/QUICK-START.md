# Week 5 Quick Start: Sensors & Input Reference

## Quick GPIO Input Setup

```python
import RPi.GPIO as GPIO
import time

# Setup
GPIO.setmode(GPIO.BCM)
GPIO.setup(pin_number, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

# Read input
state = GPIO.input(pin_number)  # Returns True or False

# Cleanup when done
GPIO.cleanup()
```

---

## Button Input Template

```python
import RPi.GPIO as GPIO

BUTTON_PIN = 17

GPIO.setmode(GPIO.BCM)
GPIO.setup(BUTTON_PIN, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

try:
    while True:
        if GPIO.input(BUTTON_PIN):
            print("Button pressed!")
        time.sleep(0.1)
except KeyboardInterrupt:
    GPIO.cleanup()
```

### Button with Event Detection

```python
def button_callback(channel):
    print("Button was pressed!")

GPIO.setup(BUTTON_PIN, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.add_event_detect(BUTTON_PIN, GPIO.RISING, callback=button_callback, bouncetime=200)
```

---

## PIR Motion Sensor (HC-SR501)

### Wiring
```
PIR VCC  → Raspberry Pi 5V (Pin 2 or 4)
PIR GND  → Raspberry Pi GND
PIR OUT  → GPIO Pin (e.g., GPIO 17)
```

### Code Template
```python
import RPi.GPIO as GPIO
import time

PIR_PIN = 17

GPIO.setmode(GPIO.BCM)
GPIO.setup(PIR_PIN, GPIO.IN)

print("Warming up PIR sensor... (60 seconds)")
time.sleep(60)
print("Ready!")

try:
    while True:
        if GPIO.input(PIR_PIN):
            print("Motion detected!")
            time.sleep(1)  # Prevent spam
        else:
            print("No motion")
        time.sleep(0.1)
except KeyboardInterrupt:
    GPIO.cleanup()
```

### PIR Sensor Adjustments
- **Sensitivity knob**: How far it detects (clockwise = more sensitive)
- **Time delay knob**: How long output stays HIGH after trigger
- **Jumper**: Single trigger vs repeatable trigger mode

---

## DHT Temperature/Humidity Sensor

### Install Library (First Time Only)
```bash
sudo pip3 install Adafruit_DHT --break-system-packages
```

### Wiring (DHT11 or DHT22)
```
DHT VCC  → Raspberry Pi 3.3V or 5V
DHT GND  → Raspberry Pi GND
DHT DATA → GPIO Pin (e.g., GPIO 4)
```

### DHT11 Code Template
```python
import Adafruit_DHT
import time

SENSOR_TYPE = Adafruit_DHT.DHT11  # Or DHT22
DATA_PIN = 4

while True:
    humidity, temperature = Adafruit_DHT.read_retry(SENSOR_TYPE, DATA_PIN)
    
    if humidity is not None and temperature is not None:
        print(f"Temperature: {temperature}°C")
        print(f"Humidity: {humidity}%")
    else:
        print("Failed to read sensor")
    
    time.sleep(2)  # DHT needs 2 seconds between readings
```

### DHT22 Code (Higher Accuracy)
```python
SENSOR_TYPE = Adafruit_DHT.DHT22  # Only change this line
DATA_PIN = 4
# Rest of code is identical
```

---

## Ultrasonic Distance Sensor (HC-SR04)

### Wiring
```
HC-SR04 VCC     → Raspberry Pi 5V
HC-SR04 GND     → Raspberry Pi GND
HC-SR04 TRIG    → GPIO 23
HC-SR04 ECHO    → GPIO 24 (through voltage divider!)
```

**⚠️ WARNING**: Echo pin outputs 5V, but Pi needs 3.3V!
Use voltage divider: 1kΩ resistor from Echo to GPIO, 2kΩ resistor from GPIO to GND

### Code Template
```python
import RPi.GPIO as GPIO
import time

TRIG = 23
ECHO = 24

GPIO.setmode(GPIO.BCM)
GPIO.setup(TRIG, GPIO.OUT)
GPIO.setup(ECHO, GPIO.IN)

def get_distance():
    # Send 10μs pulse
    GPIO.output(TRIG, False)
    time.sleep(0.00001)
    GPIO.output(TRIG, True)
    time.sleep(0.00001)
    GPIO.output(TRIG, False)
    
    # Wait for echo
    while GPIO.input(ECHO) == 0:
        pulse_start = time.time()
    
    while GPIO.input(ECHO) == 1:
        pulse_end = time.time()
    
    # Calculate distance
    pulse_duration = pulse_end - pulse_start
    distance = pulse_duration * 17150  # Speed of sound = 34300 cm/s
    distance = round(distance, 2)
    
    return distance

try:
    while True:
        dist = get_distance()
        print(f"Distance: {dist} cm")
        time.sleep(0.5)
except KeyboardInterrupt:
    GPIO.cleanup()
```

---

## Common Input Patterns

### Toggle LED with Button
```python
import RPi.GPIO as GPIO

BUTTON = 17
LED = 27

GPIO.setmode(GPIO.BCM)
GPIO.setup(BUTTON, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(LED, GPIO.OUT)

led_state = False
last_button_state = False

try:
    while True:
        button_state = GPIO.input(BUTTON)
        
        # Detect button press (rising edge)
        if button_state and not last_button_state:
            led_state = not led_state  # Toggle
            GPIO.output(LED, led_state)
            time.sleep(0.2)  # Debounce
        
        last_button_state = button_state
        time.sleep(0.01)
except KeyboardInterrupt:
    GPIO.cleanup()
```

### Motion-Activated LED
```python
import RPi.GPIO as GPIO

PIR = 17
LED = 27

GPIO.setmode(GPIO.BCM)
GPIO.setup(PIR, GPIO.IN)
GPIO.setup(LED, GPIO.OUT)

print("Warming up...")
time.sleep(60)

try:
    while True:
        if GPIO.input(PIR):
            GPIO.output(LED, True)
            print("Motion detected - LED ON")
        else:
            GPIO.output(LED, False)
        time.sleep(0.1)
except KeyboardInterrupt:
    GPIO.cleanup()
```

---

## Pull-up/Pull-down Resistor Quick Reference

### Without Resistor (BAD)
```
Button not pressed → Pin reads RANDOM values (floating)
```

### With Pull-down Resistor (GOOD)
```
Button not pressed → Pin reads LOW (0V)
Button pressed     → Pin reads HIGH (3.3V)
```

### With Pull-up Resistor
```
Button not pressed → Pin reads HIGH (3.3V)
Button pressed     → Pin reads LOW (0V)
```

### Using Internal Pull-down (Easiest)
```python
GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)  # Internal pull-down
GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)    # Internal pull-up
```

---

## Troubleshooting Flowchart

### Button Issues
1. Print `GPIO.input(pin)` in loop → See if values change
2. Check if pull-down enabled → `GPIO.PUD_DOWN`
3. Verify button is in breadboard firmly → Try different holes
4. Test with multimeter → Button should show continuity when pressed

### Sensor Not Working
1. Check power connections → VCC and GND correct?
2. Verify voltage (3.3V vs 5V) → Check sensor datasheet
3. Check data pin connection → Firmly connected to GPIO?
4. Add debug prints → Print raw sensor values
5. Try different GPIO pin → Some pins have special functions
6. Check sensor orientation → Some sensors have specific orientation

### Erratic Readings
1. Add delays between readings → `time.sleep(0.1)`
2. Check for loose wires → Wiggle test
3. Stabilize sensor → Tape down, reduce vibration
4. Add debouncing → Software delays or hardware capacitors
5. Check for interference → Keep away from power cables

---

## Pin Reference

### Recommended GPIO Pins for Input
- **GPIO 17, 27, 22** - Good general purpose
- **GPIO 4** - Often used for DHT sensors
- **GPIO 23, 24** - Good pair for ultrasonic sensors
- Avoid GPIO 2, 3 (I2C), GPIO 14, 15 (UART)

### Power Pins
- **5V**: Pin 2, Pin 4 (for sensors needing 5V)
- **3.3V**: Pin 1, Pin 17 (for 3.3V sensors)
- **GND**: Pins 6, 9, 14, 20, 25, 30, 34, 39 (any ground)

---

## Sensor Comparison Chart

| Sensor | Type | Power | Data Pins | Range/Accuracy | Warmup | Library |
|--------|------|-------|-----------|----------------|---------|---------|
| **Button** | Digital | 3.3V | 1 | - | None | RPi.GPIO |
| **PIR** | Digital | 5V | 1 | 3-7m range | 60s | RPi.GPIO |
| **DHT11** | Serial | 3.3V/5V | 1 | ±2°C, ±5% | 1s | Adafruit_DHT |
| **DHT22** | Serial | 3.3V/5V | 1 | ±0.5°C, ±2% | 1s | Adafruit_DHT |
| **HC-SR04** | Digital | 5V | 2 | 2-400cm, ±3mm | None | RPi.GPIO |

---

## Safety Reminders

- ⚡ **Never exceed 3.3V on GPIO input pins**
- 🔌 **Check sensor voltage requirements before connecting**
- 🛑 **Power off before changing circuits**
- 🔍 **Double-check VCC and GND connections**
- 📏 **Use voltage dividers for 5V sensor outputs**

---

## Quick Reference Links

- **GPIO Pinout**: https://pinout.xyz
- **RPi.GPIO Documentation**: https://sourceforge.net/p/raspberry-gpio-python/wiki/Home/
- **Adafruit DHT Tutorial**: https://learn.adafruit.com/dht-humidity-sensing-on-raspberry-pi-with-gdocs-logging

---

**Remember**: Most sensor problems are wiring issues. Check your connections twice, power off before changes, and use print statements liberally for debugging!
