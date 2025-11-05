# Activity 2B: DHT Temperature & Humidity Sensor

## Duration: 25 minutes
## Difficulty: Intermediate
## Skills: Serial sensor communication, data validation, library usage, environmental monitoring

---

## Overview
Build a temperature and humidity monitoring system using a DHT sensor! DHT sensors measure environmental conditions and send digital data to your Pi. You'll create your own weather station and learn how to work with sensors that communicate through digital protocols.

## Learning Objectives
- Understand digital serial sensors
- Install and use external Python libraries
- Read temperature and humidity data
- Handle sensor errors gracefully
- Display environmental readings
- Create temperature-responsive systems

---

## Materials Needed
- Raspberry Pi (running from Activity 1)
- Breadboard
- 1 DHT11 or DHT22 sensor
- 1 LED and resistor (optional, for temp alerts)
- Jumper wires:
  - 3 male-to-female (for DHT connections)

---

## Part 1: Understanding DHT Sensors (5 minutes)

### DHT11 vs DHT22

| Feature | DHT11 | DHT22 (AM2302) |
|---------|-------|----------------|
| **Temperature Range** | 0-50°C | -40-80°C |
| **Temperature Accuracy** | ±2°C | ±0.5°C |
| **Humidity Range** | 20-80% | 0-100% |
| **Humidity Accuracy** | ±5% | ±2-5% |
| **Sampling Rate** | 1 Hz (once/sec) | 0.5 Hz (once/2 sec) |
| **Price** | Lower | Higher |
| **Best For** | Hobbyist projects | Precision needed |

### How DHT Sensors Work

**Inside the DHT**:
1. **Thermistor**: Resistance changes with temperature
2. **Humidity sensor**: Capacitive sensor (moisture changes capacitance)
3. **Microcontroller**: Reads sensors, converts to digital data
4. **Serial output**: Sends data using custom timing protocol

**Communication**:
- Uses single-wire serial protocol (not I2C or SPI)
- Sends 40 bits of data:
  - 16 bits: Humidity
  - 16 bits: Temperature  
  - 8 bits: Checksum (for error detection)
- We need a library to decode this!

### Important Sensor Characteristics

**Timing requirements**:
- Need 1-2 seconds between readings
- DHT22: minimum 2 seconds
- DHT11: minimum 1 second
- Reading too fast returns errors!

**Reliability**:
- Sensors occasionally fail to read (normal!)
- Always check for None/null returns
- Professional systems use retry logic

---

## Part 2: Library Installation (5 minutes)

The DHT sensor uses a custom communication protocol. We need the Adafruit_DHT library to decode it.

### Step 1: Install Adafruit_DHT Library

```bash
sudo pip3 install Adafruit_DHT --break-system-packages
```

**Wait for installation...** (may take 1-2 minutes)

### Step 2: Verify Installation

```bash
python3 -c "import Adafruit_DHT; print('DHT library OK!')"
```

**Expected output**: "DHT library OK!"

**If you get an error**:
```bash
# Try alternative installation:
sudo apt-get install python3-pip
sudo pip3 install Adafruit_DHT --break-system-packages
```

---

## Part 3: Identify Your Sensor (2 minutes)

### DHT Sensor Pinout

**Most DHT sensors have 3 or 4 pins**:

**3-pin module** (most common):
```
[VCC] [DATA] [GND]
  │     │      │
 (+)   (S)    (-)
```

**4-pin sensor** (raw component):
```
Pin 1: VCC (3.3V or 5V)
Pin 2: DATA
Pin 3: NULL (not connected)
Pin 4: GND
```

**Check your sensor**:
- How many pins does it have?
- Look for labels: VCC/+, DATA/S, GND/-
- Note the pin order!

---

## Part 4: Build the Circuit (3 minutes)

### Wiring Plan

```
DHT Sensor           Raspberry Pi
──────────           ────────────
VCC (+)          →   3.3V (Pin 1) or 5V (Pin 2)*
DATA (S)         →   GPIO 4 (Pin 7)
GND (-)          →   GND (Pin 6)

* Check your sensor's specs - most work with either
```

### Step-by-Step Connection

**Power off Pi first!**
```bash
sudo shutdown -h now
```

**Connect DHT sensor**:
1. **VCC pin** → Pi 3.3V (Pin 1) [red wire recommended]
   - Some DHT sensors need 5V - check datasheet
   - Most modules work with 3.3V
2. **DATA pin** → Pi GPIO 4 (Pin 7) [yellow wire recommended]
3. **GND pin** → Pi GND (Pin 6) [black wire recommended]

**Double-check**:
- [ ] VCC to 3.3V or 5V (check sensor requirements)
- [ ] DATA to GPIO 4
- [ ] GND to GND
- [ ] Connections firm

**Power on Pi!**

---

## Part 5: Basic Temperature Reading (5 minutes)

### Program 1: Simple DHT Reader

Create new file: `dht_test.py`

```python
import Adafruit_DHT
import time

# Sensor configuration
SENSOR_TYPE = Adafruit_DHT.DHT11  # Change to DHT22 if you have that sensor
DATA_PIN = 4

print("DHT Sensor Test")
print("=" * 40)
print("Reading temperature and humidity...")
print("Press Ctrl+C to exit\n")

try:
    while True:
        # Read sensor (with retry logic built-in)
        humidity, temperature = Adafruit_DHT.read_retry(SENSOR_TYPE, DATA_PIN)
        
        # Check if reading was successful
        if humidity is not None and temperature is not None:
            # Display readings
            print(f"Temperature: {temperature:.1f}°C")
            print(f"Humidity: {humidity:.1f}%")
            print("-" * 40)
        else:
            print("Failed to read sensor. Retrying...")
        
        # Wait 2 seconds (DHT needs time between readings)
        time.sleep(2)

except KeyboardInterrupt:
    print("\n\nExiting...")
```

### If You Have DHT22

Change line 6 to:
```python
SENSOR_TYPE = Adafruit_DHT.DHT22
```

### Run It
```bash
sudo python3 dht_test.py
```

### What to Expect

**Successful reading**:
```
Temperature: 23.0°C
Humidity: 45.0%
----------------------------------------
Temperature: 23.1°C
Humidity: 45.2%
----------------------------------------
```

**Occasional failures** (normal!):
```
Failed to read sensor. Retrying...
Temperature: 23.0°C
Humidity: 45.0%
```

### Converting to Fahrenheit

Add this function to convert Celsius to Fahrenheit:

```python
def celsius_to_fahrenheit(celsius):
    return (celsius * 9/5) + 32

# In your loop:
temp_f = celsius_to_fahrenheit(temperature)
print(f"Temperature: {temperature:.1f}°C ({temp_f:.1f}°F)")
```

---

## Part 6: Temperature-Responsive LED (5 minutes)

Let's make an LED turn on when temperature exceeds a threshold!

### Program 2: Temperature Alert System

Create new file: `temp_alert.py`

```python
import Adafruit_DHT
import RPi.GPIO as GPIO
import time

# Configuration
SENSOR_TYPE = Adafruit_DHT.DHT11  # or DHT22
DATA_PIN = 4
LED_PIN = 27
TEMP_THRESHOLD = 25  # Temperature in Celsius (adjust for your room)

# Setup GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setup(LED_PIN, GPIO.OUT)

print("Temperature Alert System")
print("=" * 40)
print(f"Alert triggers at {TEMP_THRESHOLD}°C")
print("Press Ctrl+C to exit\n")

try:
    while True:
        humidity, temperature = Adafruit_DHT.read_retry(SENSOR_TYPE, DATA_PIN)
        
        if humidity is not None and temperature is not None:
            print(f"Temp: {temperature:.1f}°C | Humidity: {humidity:.1f}%", end=" ")
            
            # Check temperature threshold
            if temperature > TEMP_THRESHOLD:
                GPIO.output(LED_PIN, True)
                print("| 🌡️ TEMP ALERT! LED ON")
            else:
                GPIO.output(LED_PIN, False)
                print("| ✓ Normal - LED OFF")
        else:
            print("Sensor read failed. Retrying...")
        
        time.sleep(2)

except KeyboardInterrupt:
    print("\n\nExiting...")

finally:
    GPIO.output(LED_PIN, False)
    GPIO.cleanup()
    print("System shut down")
```

### Run It
```bash
sudo python3 temp_alert.py
```

### Adjust Threshold

**To test the LED**:
1. Set `TEMP_THRESHOLD` lower than room temperature
2. LED should turn on immediately
3. Or hold sensor between your fingers to warm it up!

---

## Extension Challenges

### Challenge 1: Temperature Logger
Save temperature readings to a file with timestamps.

**Hints**:
```python
import datetime

# In loop:
timestamp = datetime.datetime.now()
with open('temp_log.txt', 'a') as file:
    file.write(f"{timestamp}: {temperature}°C, {humidity}%\n")
```

### Challenge 2: Temperature Range LEDs
Use multiple LEDs for different temperature ranges:
- Blue LED: < 20°C (cold)
- Green LED: 20-25°C (comfortable)
- Red LED: > 25°C (hot)

### Challenge 3: Min/Max Tracker
Track and display the minimum and maximum temperatures recorded:

**Hints**:
```python
min_temp = float('inf')
max_temp = float('-inf')

# In loop:
if temperature < min_temp:
    min_temp = temperature
if temperature > max_temp:
    max_temp = temperature

print(f"Min: {min_temp}°C | Max: {max_temp}°C")
```

### Challenge 4: Comfort Index
Calculate and display a "comfort level" based on temperature and humidity:
- Comfortable: 20-25°C and 30-60% humidity
- Too hot/humid: High temp + high humidity
- Too dry: Low humidity

---

## Real-World Applications

**DHT sensors are used in**:
- Smart thermostats (Nest, Ecobee)
- Weather stations
- Greenhouse monitoring
- Incubators for eggs/reptiles
- HVAC systems
- Museum artifact preservation
- Server room monitoring
- DIY home automation

---

## Troubleshooting Guide

### Library won't install
```bash
# Update pip first:
sudo apt-get update
sudo apt-get install python3-pip
sudo pip3 install --upgrade pip
sudo pip3 install Adafruit_DHT --break-system-packages
```

### "ImportError: No module named Adafruit_DHT"
- Library not installed correctly
- Try installation commands again
- Check if using sudo: `sudo python3 script.py`

### Always getting None readings
- Check wiring:
  - VCC to 3.3V or 5V (some sensors require 5V)
  - DATA to GPIO 4
  - GND to GND
- Try different GPIO pin (GPIO 17, 27, 22)
- Sensor might be defective - try another
- Wait longer between readings (3+ seconds)

### Frequent read failures
- **This is normal!** DHT sensors fail occasionally
- Retry logic (`read_retry()`) usually handles this
- Make sure 2+ seconds between readings
- Check connections are firm

### Wrong sensor type error
- Verify if you have DHT11 or DHT22
- DHT11: Blue plastic, less accurate
- DHT22: White plastic, more accurate
- Change `SENSOR_TYPE` in code

### Readings seem wrong
- DHT11: accurate to ±2°C
- DHT22: accurate to ±0.5°C
- Sensor needs 1-2 minutes to stabilize after power on
- Don't hold sensor (body heat affects reading)
- Compare with room thermometer

---

## Understanding the Data

### Temperature Reading
- Measured in Celsius (can convert to Fahrenheit)
- DHT11: Only whole numbers (23.0, 24.0)
- DHT22: Decimal precision (23.4, 24.7)

### Humidity Reading
- Measured as percentage (0-100%)
- Relative humidity (RH%)
- Depends on temperature
- 30-60% is comfortable for humans

### Checksum Validation
- DHT sends checksum to verify data
- Library automatically checks this
- Bad checksum → read_retry tries again
- Ensures data accuracy

---

## Science Behind the Sensor

### How Temperature is Measured
**Thermistor**:
- Special resistor that changes resistance with temperature
- Higher temp → Lower resistance (for NTC thermistors)
- Microcontroller measures resistance
- Converts to temperature value

### How Humidity is Measured
**Capacitive sensor**:
- Two metal plates with dielectric between them
- Water vapor changes dielectric properties
- Changes capacitance
- Microcontroller measures capacitance
- Converts to humidity percentage

---

## Key Concepts Review

**By completing this activity, you learned:**
- ✓ Installing external Python libraries
- ✓ Reading serial sensor data
- ✓ Handling sensor errors with retry logic
- ✓ Converting between temperature units
- ✓ Creating responsive systems based on sensor data
- ✓ Understanding environmental monitoring
- ✓ Real-world applications of temperature sensing

---

## Going Further

**Try these projects**:
- Web-based temperature dashboard
- Temperature data graphing
- Email alerts for extreme temperatures
- Multi-room temperature comparison (multiple sensors)
- Integration with weather API for outdoor/indoor comparison

**Great job building a weather monitoring system!** 🌡️💨
