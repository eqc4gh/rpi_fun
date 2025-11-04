# Week 1 Exploration Activities

These activities encourage students to explore and personalize their Raspberry Pi environment.

---

## Activity 1: Desktop Scavenger Hunt (15 minutes)

### Instructions
Complete each task below and check off when done. Ask for help if you get stuck!

### Tasks

#### Basic Exploration
- [ ] **Change the desktop wallpaper** to something other than the default
- [ ] **Find the Calculator application** and solve: 2048 ÷ 32
  - Answer: _______
- [ ] **Open the File Manager** and navigate to the Documents folder
- [ ] **Create a new folder** called "Week-01" on the Desktop
- [ ] **Find the Text Editor** application (hint: look under Accessories)

#### Application Discovery
- [ ] **Open Chromium Web Browser** (without going to any websites)
- [ ] **Find three games** pre-installed on your Raspberry Pi
  - Game 1: _______________________
  - Game 2: _______________________
  - Game 3: _______________________
- [ ] **Locate the Programming section** in the menu
  - How many programming applications do you see? _______

#### System Information
- [ ] **Find out your Raspberry Pi's hostname** 
  - Menu → Preferences → Raspberry Pi Configuration → System tab
  - Hostname: _______________________
- [ ] **Check your WiFi connection**
  - Click the WiFi icon in the top-right
  - What network are you connected to? _______________________
- [ ] **Adjust the volume** slider and test it works

#### Configuration Practice
- [ ] **Change the taskbar location**
  - Right-click on taskbar → Panel Settings → Geometry tab
  - Try "Bottom" position
  - Change it back to "Top"
- [ ] **Create a text file**
  - Open Text Editor
  - Type: "My name is _____ and this is my first Raspberry Pi project!"
  - Save it in your Documents folder as "intro.txt"

### Bonus Challenge
- [ ] **Take a screenshot** of your desktop
  - Press the Print Screen key
  - Find the screenshot in the Pictures folder
  - What is the filename? _______________________

---

## Activity 2: Customization Challenge (10 minutes)

Make your Raspberry Pi YOUR own!

### Choose 3 Customizations

#### Option 1: Custom Wallpaper
- Right-click desktop → Desktop Preferences
- Change to a different built-in wallpaper OR
- Find an image online, download it, and use it as wallpaper

#### Option 2: Adjust Panel Settings
- Right-click taskbar → Panel Settings
- Experiment with:
  - Panel size (height)
  - Icon size
  - Auto-hide setting
- Keep your favorite settings

#### Option 3: Create Desktop Shortcuts
- Create shortcuts to your 3 favorite applications
- Drag from menu to desktop
- Arrange them neatly

#### Option 4: Organize Folders
- In File Manager, create folders:
  - "Projects"
  - "Code"
  - "Resources"
- Practice moving files between folders

#### Option 5: Explore Preferences
- Menu → Preferences → Appearance Settings
- Try different:
  - Widget styles
  - Color schemes
  - Font sizes

---

## Activity 3: Application Exploration (15 minutes)

### Try These Pre-installed Applications

#### 1. Chromium Web Browser
**Task**: Visit the official Raspberry Pi website
1. Open Chromium
2. Go to: https://www.raspberrypi.org
3. Find the "Projects" section
4. Browse one interesting project
5. Write the project name here: _______________________

#### 2. LibreOffice Writer (Word Processor)
**Task**: Create a simple document
1. Menu → Office → LibreOffice Writer
2. Type a short paragraph about what you hope to learn
3. Practice bold, italic, and underline
4. Save as "My Goals.odt" in Documents

#### 3. Python 3 (Programming)
**Task**: Run your first program!
1. Menu → Programming → Python 3 (IDLE)
2. When the window opens, type: `print("Hello Raspberry Pi!")`
3. Press Enter
4. What appeared? _______________________

#### 4. Thonny (Python IDE)
**Task**: Explore the coding environment
1. Menu → Programming → Thonny Python IDE
2. Notice the different sections (editor, shell, variables)
3. Click Help → Help contents
4. Browse around (don't worry about understanding everything!)

#### 5. Minecraft Pi Edition
**Task**: Launch the game (if time permits)
1. Menu → Games → Minecraft Pi
2. Click "Start Game"
3. Create a new world
4. Walk around using WASD keys
5. Right-click to place blocks

---

## Activity 4: File System Explorer (10 minutes)

### Understanding Your Files

#### Part 1: Navigate the File System
Open File Manager and explore:

1. **Home Directory** (`/home/pi` or `/home/student`)
   - This is YOUR space
   - List 3 folders you see:
     - ________________
     - ________________
     - ________________

2. **Desktop Folder**
   - What's currently on your Desktop? ________________

3. **Documents Folder**
   - Create a test file here
   - What did you name it? ________________

4. **Create a Folder Structure**
```
Documents/
  └── RPi-Course/
      ├── Week-01/
      ├── Week-02/
      └── Notes/
```

#### Part 2: Practice File Operations
- [ ] Create a new text file in Week-01 folder
- [ ] Copy it to the Desktop
- [ ] Rename the desktop copy
- [ ] Delete the desktop copy
- [ ] Create a new folder for Week 2 (even though we haven't started it yet)

---

## Activity 5: Reflection Journal (5-10 minutes)

Open Text Editor and write short answers to these prompts:

### Questions
1. **What surprised you most about the Raspberry Pi today?**
   (2-3 sentences)

2. **What was the most challenging part of setup?**
   (1-2 sentences)

3. **What's one thing you want to learn to do with your Raspberry Pi?**
   (1-2 sentences)

4. **How is Raspberry Pi OS similar to or different from computers you've used before?**
   (2-3 sentences)

### Save Your Reflection
- Save as: "Week-01-Reflection.txt"
- Location: Documents/RPi-Course/Week-01/

---

## Activity 6: Hardware Observation (5 minutes)

### Physical Inspection

**Safety reminder**: Raspberry Pi should be powered OFF and unplugged for this!

#### Careful Observation Tasks
- [ ] **Count the GPIO pins**: How many? _______
- [ ] **Identify the CPU chip**: Does it have a heatsink? _______
- [ ] **Look at the USB ports**: How many are blue (USB 3.0)? _______
- [ ] **Find the status LEDs**: What colors are they? _______
- [ ] **Examine the microSD card slot**: Can you see the card? _______
- [ ] **Look at the bottom**: What text/labels do you see? 
   _______________________

#### Questions to Discuss
1. Why might the CPU have a heatsink?
2. Why are some USB ports blue and some black?
3. Where does the power come in?
4. What would happen if you touched the GPIO pins while powered on?

---

## Activity 7: Troubleshooting Practice (Optional)

### Simulation Exercises

Work with a partner or your instructor on these scenarios:

#### Scenario 1: Screen Goes Blank
"I turned on my Raspberry Pi but the screen is black!"
- What would you check first?
- What would you check second?
- What would you check third?

#### Scenario 2: Keyboard Not Working
"I plugged in my keyboard but nothing happens when I type!"
- What would you try?

#### Scenario 3: WiFi Won't Connect
"I entered my WiFi password but it says 'Failed to connect'!"
- What could be wrong?
- What would you try?

Write down your troubleshooting steps for each scenario.

---

## Activity 8: Command Discovery (Bonus)

### Terminal Preview

If you're feeling adventurous, open the Terminal (black icon) and try these safe commands:

```bash
# Display the date and time
date

# Show calendar for this month
cal

# Display a fun message
echo "Hello from the command line!"

# List files in current directory
ls

# Show which directory you're in
pwd
```

**Don't worry if you don't understand these yet** - we'll learn all about the Terminal next week!

Just try typing each command and pressing Enter. What happens?

- [ ] I tried the `date` command
- [ ] I tried the `cal` command
- [ ] I tried the `echo` command
- [ ] I tried the `ls` command
- [ ] I tried the `pwd` command

---

## Completion Checklist

By the end of these activities, you should have:
- [ ] Explored most pre-installed applications
- [ ] Customized your desktop in at least 2 ways
- [ ] Created an organized folder structure
- [ ] Practiced basic file operations
- [ ] Written a reflection about your experience
- [ ] Examined the Raspberry Pi hardware
- [ ] (Optional) Tried basic Terminal commands

## What's Next?

Next week we'll dive into the Terminal and learn how to control the computer using text commands - it's more powerful than you might think!

**Homework**: Practice turning on and shutting down your Raspberry Pi properly at least 3 times this week.
