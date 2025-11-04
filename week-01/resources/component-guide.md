# Raspberry Pi 4 Component Identification Guide

## Top View (Component Side)

```
                    ┌─────────────────────────────┐
                    │  DSI       CSI              │
                    │  Display   Camera           │
                    │  Port      Port             │
        ┌───────────┼─────────────────────────────┤
        │ GPIO      │                             │
        │ Pins      │      [CPU with Heatsink]    │
        │ (40-pin)  │                             │
        │           │  [RAM Chip - Silver Square] │
        │           │                             │
        └───────────┼─────────────────────────────┤
                    │     ┌──┐ ┌──┐               │
                    │     │  │ │  │  USB 2.0      │
                    │     └──┘ └──┘  (Black)      │
                    │     ┌──┐ ┌──┐               │
                    │     │  │ │  │  USB 3.0      │
                    │     └──┘ └──┘  (Blue)       │
                    │                             │
                    │         [Ethernet Port]     │
                    │                             │
                    │  ♪ Audio                    │
                    │    Jack                     │
                    │                             │
                    │  [HDMI 0] [HDMI 1]          │
                    │  (micro)  (micro)           │
                    │                             │
                    │            [USB-C Power]    │
                    └─────────────────────────────┘
```

## Component List & Functions

### 1. GPIO Pins (40-pin header)
**Location**: Left side
**Purpose**: Connect sensors, LEDs, motors, and other electronics
**Important**: 3.3V logic level - don't connect 5V directly!

### 2. CPU (Broadcom BCM2711)
**Location**: Center, usually covered by heatsink
**Purpose**: The "brain" - processes all instructions
**Specs**: Quad-core Cortex-A72 @ 1.5GHz

### 3. RAM Chip
**Location**: Center, silver square integrated circuit
**Purpose**: Temporary memory for running programs
**Size**: 4GB LPDDR4

### 4. USB 3.0 Ports (Blue)
**Location**: Right side, upper
**Purpose**: Fast data transfer - keyboards, mice, storage
**Speed**: Up to 5 Gbps

### 5. USB 2.0 Ports (Black)
**Location**: Right side, lower
**Purpose**: Compatible with older USB devices
**Speed**: Up to 480 Mbps

### 6. Ethernet Port (RJ45)
**Location**: Right side
**Purpose**: Wired network connection
**Speed**: Gigabit (1000 Mbps)

### 7. Micro-HDMI Ports (x2)
**Location**: Bottom right
**Purpose**: Video and audio output to monitors
**Note**: Port 0 (closest to USB-C) is primary

### 8. USB-C Power Port
**Location**: Bottom center
**Purpose**: Power input (5V, 3A minimum)
**Important**: Use quality power supply!

### 9. Audio Jack (3.5mm)
**Location**: Upper right
**Purpose**: Headphones and composite video output

### 10. CSI Camera Port
**Location**: Top center
**Purpose**: Connect official Raspberry Pi camera
**Type**: 15-pin ribbon cable connector

### 11. DSI Display Port
**Location**: Top left
**Purpose**: Connect official Raspberry Pi touchscreen
**Type**: 15-pin ribbon cable connector

## Bottom View

```
                    ┌─────────────────────────────┐
                    │                             │
                    │         [PoE Header]        │
                    │         (4 pins)            │
                    │                             │
                    │    [MicroSD Card Slot]      │
                    │    (spring-loaded)          │
                    │                             │
                    │                             │
                    │  Mounting holes (x4)        │
                    │  ○                      ○   │
                    │                             │
                    │  ○                      ○   │
                    │                             │
                    └─────────────────────────────┘
```

### Bottom Components

#### MicroSD Card Slot
**Location**: Center bottom
**Purpose**: Holds operating system and storage
**Note**: Push to insert/eject, contacts face UP

#### PoE Header
**Location**: Near Ethernet port
**Purpose**: Power over Ethernet (requires HAT)
**Note**: Optional, not needed for basic use

#### Mounting Holes
**Location**: Four corners
**Purpose**: Secure to case or mount
**Size**: M2.5 screws

## LED Indicators

### Power LED (Red)
**Location**: Near USB-C port
**Meaning**: 
- Solid = Good power
- Dim/Off = Under-voltage warning

### Activity LED (Green)
**Location**: Near Ethernet port
**Meaning**:
- Blinking = SD card activity
- Off = No activity or SD error

## Size Reference
- **Length**: 88mm (3.46 inches)
- **Width**: 58mm (2.28 inches)
- **Height**: 19.5mm (0.77 inches)
- **Weight**: 46 grams (1.6 ounces)

## Temperature Zones
```
    Coolest              Warmest
      │                    │
      ▼                    ▼
    [GPIO]  [Ethernet]  [CPU]  [USB]
```

**Note**: CPU area gets warmest - consider adding heatsink!

## Safety Zones

### ✓ SAFE to touch:
- Edges of the board
- GPIO pins (when powered off)
- Mounting holes
- Ports when connecting/disconnecting carefully

### ✗ AVOID touching:
- Any components while powered on
- CPU/RAM chips
- Small surface-mount components
- Bottom of board (can short on metal)

## Connection Priority Order

When setting up, connect in this order:

1. ✓ MicroSD card (FIRST)
2. ✓ HDMI cable
3. ✓ Keyboard
4. ✓ Mouse
5. ✓ Ethernet (if using)
6. ✓ USB-C power (LAST)

When shutting down:

1. ✓ Proper software shutdown
2. ✓ Wait for green LED to stop
3. ✓ Disconnect power
4. ✓ Then remove other connections

## Common HATs (Hardware Attached on Top)

Optional add-ons that connect to GPIO:

- **Sense HAT**: Sensors and LED matrix
- **Camera Module**: Official camera
- **Display HAT**: Small LCD screens
- **PoE HAT**: Power via Ethernet
- **Cooling HAT**: Fan and heatsink
- **Prototyping HAT**: For building circuits

## Print This Page!

This guide is designed to be printed and used as a reference while working with your Raspberry Pi. Consider laminating it for durability.

---

## Student Activity: Component Identification

Use this checklist while examining your Raspberry Pi:

- [ ] Located all 40 GPIO pins
- [ ] Found the CPU (under heatsink)
- [ ] Identified RAM chip
- [ ] Counted USB ports (2 blue, 2 black)
- [ ] Found both micro-HDMI ports
- [ ] Located USB-C power port
- [ ] Found Ethernet port
- [ ] Located audio jack
- [ ] Found camera connector (CSI)
- [ ] Found display connector (DSI)
- [ ] Located microSD slot (bottom)
- [ ] Identified power LED (red)
- [ ] Identified activity LED (green)
- [ ] Found all 4 mounting holes

**Teacher Initial**: _______ **Date**: _______
