# Week 6: Simple Robotics - Motors & Movement

## Overview
This week introduces the exciting world of robotics by learning how to control motors with your Raspberry Pi! Students will learn about DC motors, motor drivers, and how to create controlled movement. By combining sensors from Week 5 with motors, you'll build the foundation for autonomous robots. This week focuses on simple, safe motor control perfect for beginners.

## Learning Objectives
By the end of this week, students will be able to:
- Understand how DC motors work
- Explain why we need motor drivers (can't power motors directly from GPIO)
- Connect and control a DC motor using an L298N motor driver
- Control motor speed using PWM (Pulse Width Modulation)
- Control motor direction (forward and reverse)
- Combine sensors with motors for basic autonomous behavior
- Implement safe motor control practices
- Build a simple motorized project

## Topics Covered
1. **Motor Basics**
   - What is a DC motor?
   - How motors convert electricity to motion
   - Motor specifications (voltage, current, RPM)
   - Why GPIO pins can't power motors directly

2. **Motor Drivers (L298N)**
   - What is a motor driver?
   - H-bridge concept (simplified)
   - L298N module overview
   - Power requirements and safety

3. **Speed Control (PWM)**
   - Review of PWM from Week 4
   - Applying PWM to motors
   - Speed control through duty cycle
   - Smooth acceleration and deceleration

4. **Direction Control**
   - Forward and reverse
   - Controlling with two GPIO pins
   - Truth tables for motor control
   - Making motors stop, coast, and brake

5. **Sensors + Motors**
   - Using buttons to control motor speed/direction
   - Motion sensor to trigger motor
   - Distance sensor for obstacle avoidance (preview)
   - Combining input and output for robotics

## Materials Needed
From your kit:
- Raspberry Pi (set up from previous weeks)
- Breadboard
- L298N Motor Driver Module (or similar H-bridge)
- Small DC motor (3-6V)
- External power supply for motor (4x AA battery pack, 6V)
- Jumper wires (Male-to-Female, Male-to-Male)
- Push button (from Week 5)
- LED and resistor (for testing)
- Optional: PIR or ultrasonic sensor (from Week 5)

**New This Week**: L298N motor driver, DC motor, battery pack

## ⚠️ CRITICAL SAFETY & BEST PRACTICES

**MOTOR SAFETY RULES:**
1. **NEVER connect motor directly to GPIO pin** - Will damage Pi instantly!
2. **ALWAYS use separate power for motors** - Battery pack, NOT Pi's power supply
3. **Keep motor power separate from Pi power** - Common ground ONLY
4. **Check battery polarity** - Red to +, Black to -
5. **Power off before changing circuits** - `sudo shutdown -h now`
6. **Secure loose wires** - Spinning motors can catch wires
7. **No fingers near moving parts** - Motors are powerful
8. **Disconnect motor power when not testing** - Save batteries

**MOTOR DRIVER SAFETY:**
- Verify correct voltage to driver (6-12V typical)
- Don't exceed motor driver's current rating
- Heat sink on driver may get warm (normal)
- Don't short motor driver outputs together
- Keep driver away from conductive surfaces

**BATTERY SAFETY:**
- Use fresh batteries for consistent power
- Remove batteries when storing
- Don't mix old and new batteries
- Watch for battery pack getting warm
- Rechargeable batteries = 1.2V each (4x = 4.8V)
- Alkaline batteries = 1.5V each (4x = 6V)

## Class Structure
- **Week 5 Review & Motor Introduction**: 15 minutes
- **Motor Theory & Safety Lecture**: 15 minutes
- **Motor Driver Setup Demo**: 10 minutes
- **Hands-on Activity 1 (Basic Motor Control)**: 20 minutes
- **Break**: 5 minutes
- **Speed & Direction Theory**: 10 minutes
- **Hands-on Activity 2 (Speed Control with Button)**: 20 minutes
- **Demo & Discussion**: 5 minutes

## Files in This Week's Folder
- `README.md` - This file, overview of the week
- `QUICK-START.md` - Quick reference for motor control
- `INSTRUCTOR-GUIDE.md` - Teaching notes and setup tips
- `lecture/` - Detailed lecture notes on motors
- `activities/` - In-class hands-on projects
- `diagrams/` - Motor driver wiring diagrams
- `resources/` - Motor specifications and troubleshooting
- `week06-homework.md` - Take-home practice assignments

## Getting Started

### Before You Begin
1. **Review Week 5 sensor concepts** - We'll combine sensors with motors
2. **Gather motor components** - Motor, driver, battery pack
3. **Fresh batteries** - 4x AA batteries for 6V
4. **Read motor specifications** - Voltage and current ratings
5. **Clear workspace** - Motors need room to move safely

### First Steps
1. Power off Raspberry Pi: `sudo shutdown -h now`
2. Identify L298N motor driver components (we'll explain in class)
3. Test motor with battery pack directly (supervised!)
4. Plan circuit carefully before connecting
5. Remember: Motor power is SEPARATE from Pi power!

## Key Concepts to Remember

### Why We Need Motor Drivers
```
GPIO Pin: Max 16mA (0.016A)
Small Motor: Needs 200-500mA (0.2-0.5A)
Large Motor: Needs 1-2A

Result: Motor needs 10-100x more current than GPIO can provide!

Solution: Motor Driver
- GPIO gives low-power signal
- Driver provides high-power output
- Pi stays safe, motor gets power it needs
```

### Power Supply Rules
```
Raspberry Pi Power:
- 5V from wall adapter
- Powers Pi only
- NOT enough for motors

Motor Power:
- 6V from battery pack
- Powers motor driver and motors
- Separate from Pi power
- Common ground connects both
```

### Motor Control Basics
```
Speed Control: PWM on Enable pin
- 0% duty cycle = Stopped
- 50% duty cycle = Half speed
- 100% duty cycle = Full speed

Direction Control: Two GPIO pins (IN1, IN2)
- IN1=HIGH, IN2=LOW → Forward
- IN1=LOW, IN2=HIGH → Reverse
- IN1=LOW, IN2=LOW → Stop (coast)
- IN1=HIGH, IN2=HIGH → Stop (brake)
```

### L298N Motor Driver Basics
- Controls up to 2 DC motors
- Needs 6-12V input power
- Each motor has 2 control pins (direction) + 1 enable pin (speed)
- Has voltage regulator for 5V output (optional use)
- Heat sink may get warm during use (normal)

## Tips for Success
- **Start simple** - Just make motor spin before trying speed control
- **Test with LED first** - Verify GPIO signals before connecting motor
- **Check connections twice** - Motor drivers are less forgiving than LEDs
- **Fresh batteries** - Weak batteries cause erratic motor behavior
- **Secure motor** - Tape it down so it doesn't spin off table
- **Print debug info** - Use `print()` to show motor states
- **One thing at a time** - First forward, then reverse, then speed control
- **Ask for help** - Motors can be confusing at first!

## Common Beginner Mistakes (And How to Avoid Them)

1. **Connecting motor to GPIO directly** → ALWAYS use motor driver!
2. **No motor power supply** → Battery pack required, Pi power not enough
3. **No common ground** → Connect motor driver GND to Pi GND
4. **Wrong motor driver pins** → Use diagram, label connections
5. **Reversed motor power** → Check + and - on battery pack
6. **Expecting high speed on low battery** → Use fresh batteries
7. **Motor runs when it shouldn't** → Check your HIGH/LOW logic
8. **PWM frequency too low** → Use 1000 Hz for smooth motor control

## Troubleshooting Quick Checks

**Motor not spinning?**
- [ ] Is motor driver powered (check LED on driver)?
- [ ] Are IN1, IN2 set correctly for desired direction?
- [ ] Is Enable pin HIGH or getting PWM signal?
- [ ] Fresh batteries in battery pack?
- [ ] Motor connections secure?
- [ ] Try motor directly on battery (bypassing driver) to test motor

**Motor runs at full speed only?**
- [ ] Is PWM actually being used on Enable pin?
- [ ] Is PWM frequency set (1000 Hz recommended)?
- [ ] Check duty cycle value (should be 0-100)
- [ ] Try testing with LED on same PWM pin first

**Motor changes speed randomly?**
- [ ] Weak batteries? (most common cause!)
- [ ] Loose wire connections?
- [ ] PWM code running in loop correctly?
- [ ] Other programs interfering with GPIO?

**Motor driver getting hot?**
- [ ] Normal if warm, but not too hot to touch
- [ ] If very hot: Check for short circuit
- [ ] If very hot: Motor may be drawing too much current
- [ ] If very hot: Reduce duty cycle/speed

## Looking Ahead

**This Week**: Control individual motors
**Next Week**: Build a simple robot with two motors (steering)
**Future Weeks**: Add sensors for autonomous navigation!

## Why This Matters

Motors are the foundation of robotics and automation! With motor control, you can build:
- **Mobile robots** - Move around autonomously
- **Robotic arms** - Pick up and move objects
- **Smart fans** - Temperature-controlled cooling
- **Automated curtains** - Light-controlled window shades
- **Conveyor systems** - Move items automatically
- **Camera sliders** - Automated photography equipment

Combining motors with sensors (from Week 5) creates intelligent systems that interact with their environment!

## Real-World Applications

Students will see how this week's skills relate to:
- **Vacuum robots** - Navigate and clean autonomously
- **Drones** - Multiple motors for flight control
- **3D printers** - Precise motor control for positioning
- **CNC machines** - Computer-controlled manufacturing
- **Electric vehicles** - Motor control and regenerative braking
- **Assembly line robots** - Automated manufacturing
- **Warehouse robots** - Package sorting and delivery

---

**Important Reminder**: Motor circuits use higher current than LED circuits. Always double-check your wiring and use the motor driver properly. When in doubt, ask!

**Let's make things move!** 🤖⚙️🔋
