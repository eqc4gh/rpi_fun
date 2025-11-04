# Week 1 Lecture: Introduction to Computing & Raspberry Pi

## Duration: 45 minutes

---

## Part 1: What is a Computer? (10 minutes)

### Opening Question
**Ask students**: "What makes something a computer? Is your phone a computer? What about a calculator? A smart watch?"

### Core Definition
A computer is a machine that:
1. Takes **INPUT** (keyboard, mouse, sensors)
2. **PROCESSES** information (calculations, decisions)
3. Stores data in **MEMORY**
4. Produces **OUTPUT** (screen, speakers, lights)

### Everyday Examples
- Smartphone: Touch screen (input) → Apps process data → Display/sound (output)
- Game console: Controller (input) → Game logic (process) → TV screen (output)
- Smart thermostat: Temperature sensor (input) → Compare to settings (process) → Turn heat on/off (output)

**Key Point**: Computers are everywhere, not just on desks!

---

## Part 2: Computer Architecture Basics (15 minutes)

### The Four Main Components

#### 1. CPU - The Brain 🧠
- **What it does**: Performs calculations and makes decisions
- **Example**: "If temperature > 75°F, turn on fan"
- **In Raspberry Pi**: Broadcom processor (4 cores!)
- **Analogy**: Like your brain solving a math problem

**Show**: Point out the CPU chip on the Raspberry Pi board (under the heatsink)

#### 2. RAM - Short-term Memory 📝
- **What it does**: Temporarily stores information while the computer is working
- **Example**: Like keeping notes on a desk while doing homework
- **In Raspberry Pi**: 4GB (can hold millions of numbers at once!)
- **Important**: Data disappears when power is turned off!

**Demonstration**: Open several programs, explain RAM is being used

#### 3. Storage - Long-term Memory 💾
- **What it does**: Permanently stores programs and files
- **Example**: Like a backpack or locker - keeps things even when closed
- **In Raspberry Pi**: MicroSD card (we'll use 32GB)
- **Important**: Data stays even when powered off!

**Show**: Pass around a microSD card - "This tiny card holds your entire operating system!"

#### 4. Input/Output (I/O) - Communication 🔌
- **Input devices**: Keyboard, mouse, camera, sensors
- **Output devices**: Monitor, speakers, LEDs
- **Special in Raspberry Pi**: GPIO pins - 40 pins to connect electronics!

**Show**: Count the GPIO pins on the Raspberry Pi

### How They Work Together
```
INPUT → CPU processes using RAM → Results stored in STORAGE → OUTPUT
```

**Real example**: 
1. You type "Hello" (INPUT - keyboard)
2. CPU processes each letter press using RAM
3. Document saves to SD card (STORAGE)
4. You see "Hello" on screen (OUTPUT - monitor)

---

## Part 3: What Makes Raspberry Pi Special? (10 minutes)

### The Story
- Created in 2012 by the Raspberry Pi Foundation in UK
- Goal: Make computing accessible and affordable
- Named after fruit (Apple, Blackberry...) + Python programming language

### Why Raspberry Pi is Awesome for Learning

#### 1. **Affordable**
- Full computer for $35-75 (compare to laptop: $300-1000+)
- Can be used for real projects

#### 2. **Small but Powerful**
- Size of a credit card
- Can run a web server, games, robotics
- Uses less power (can run on battery!)

#### 3. **Educational Design**
- GPIO pins for connecting electronics (LEDs, sensors, motors)
- Designed for experimentation
- Can't really "break" it with software mistakes

#### 4. **Huge Community**
- Millions of users worldwide
- Tons of free projects and tutorials online
- Active help forums

### Raspberry Pi 4 Specifications
Walk through the board and identify each component:

- **CPU**: Quad-core Cortex-A72 (ARM) @ 1.5GHz
- **RAM**: 4GB LPDDR4
- **Storage**: MicroSD card slot
- **Connectivity**: WiFi, Bluetooth, Ethernet
- **USB Ports**: 2× USB 3.0, 2× USB 2.0
- **Video Output**: 2× micro-HDMI (can run 2 monitors!)
- **GPIO**: 40 pins for electronics
- **Power**: USB-C (5V, 3A)

**Activity**: Have students locate each component on their Raspberry Pi

---

## Part 4: Operating Systems (5 minutes)

### What is an Operating System?
- Software that manages the computer
- Controls hardware (keyboard, screen, memory)
- Runs other programs
- Provides a user interface

### Common Operating Systems
- **Windows**: Most common on PCs
- **macOS**: Apple computers
- **Linux**: Free, open-source (many varieties!)
- **Android/iOS**: Smartphones

### Raspberry Pi OS (formerly Raspbian)
- Based on Linux (Debian)
- Designed specifically for Raspberry Pi
- Free and open-source
- Includes programming tools
- Similar to desktop Linux but optimized for learning

**Why Linux?**
- Powers most web servers and supercomputers
- Great for learning how computers really work
- Free forever
- You can see and modify the code!

---

## Part 5: Safety & Handling (5 minutes)

### Important Safety Rules

#### Electrical Safety ⚡
1. **NEVER connect/disconnect components while powered on**
2. Always disconnect power FIRST
3. Use the official power supply (3A minimum)
4. Keep away from water and liquids

#### Physical Safety 🔧
1. **Handle by the edges** - avoid touching components
2. Work on a non-conductive surface (not metal!)
3. Be gentle - components can break
4. Watch for sharp edges on metal connectors

#### ESD (Static Electricity) Prevention
1. Touch a grounded metal object before handling
2. Don't work on carpet in dry weather
3. Don't rub the board on fabric

### Proper Shutdown
- **NEVER just unplug!** 
- Always use the shutdown menu
- Wait for green light to stop blinking
- Then disconnect power

**Analogy**: Like saving your game before turning off console

---

## Part 6: What We'll Do Today (2 minutes)

1. Image the microSD card with Raspberry Pi OS
2. Identify all components on the Raspberry Pi
3. Connect everything safely
4. Boot for the first time!
5. Complete initial setup
6. Explore the desktop

---

## Discussion Questions
1. What's the difference between RAM and storage?
2. Why might someone choose Raspberry Pi over a regular laptop?
3. What projects would you like to build with Raspberry Pi?

---

## Key Takeaways
✓ Computers have four main parts: CPU, RAM, Storage, and I/O
✓ Raspberry Pi is a small, affordable, educational computer
✓ GPIO pins let us connect electronics for projects
✓ Raspberry Pi OS is based on Linux
✓ Safety first: never connect/disconnect while powered on!

---

## Transition to Hands-On
"Now that we understand what a Raspberry Pi is, let's get our hands on one and set it up! Remember to handle carefully and ask questions if you're unsure about anything."
