# Week 1 Setup Guide: Getting Your Raspberry Pi Running

## Duration: 30-45 minutes

---

## Pre-Setup: Installing Raspberry Pi OS

### What You Need
- MicroSD card (32GB minimum)
- Computer with internet connection
- SD card reader (USB adapter or built-in)

### Step-by-Step Instructions

#### Step 1: Download Raspberry Pi Imager
1. Go to https://www.raspberrypi.com/software/
2. Download Raspberry Pi Imager for your computer (Windows/Mac/Linux)
3. Install and open the application

#### Step 2: Choose Operating System
1. Click **"Choose OS"**
2. Select **"Raspberry Pi OS (32-bit)"** (first recommended option)
3. This includes desktop environment and recommended software

#### Step 3: Choose Storage
1. Insert your microSD card into the computer
2. Click **"Choose Storage"**
3. Select your microSD card
   - ⚠️ **WARNING**: This will erase everything on the card!
   - Make sure you select the correct drive

#### Step 4: Configure Settings (Advanced Options)
1. Click the **gear icon** ⚙️ (bottom right)
2. Configure:
   - **Set hostname**: `raspberrypi-[yourname]` (e.g., raspberrypi-alex)
   - **Enable SSH**: Check this box (we'll use it later)
   - **Set username and password**: 
     - Username: `student` (or your choice)
     - Password: Create a memorable password
   - **Configure WiFi**: 
     - Enter your WiFi name (SSID)
     - Enter WiFi password
     - Select your country
   - **Set locale settings**: Select your timezone and keyboard layout
3. Click **"Save"**

#### Step 5: Write to SD Card
1. Click **"Write"**
2. Confirm you want to continue (data will be erased)
3. Wait 5-10 minutes for writing and verification
4. When complete, safely eject the SD card

**Teacher Note**: This step can be done ahead of time or students can do it in class if time permits.

---

## Hardware Assembly

### What You'll Need
- Raspberry Pi 4
- Imaged microSD card
- USB-C power supply
- Micro-HDMI to HDMI cable
- USB keyboard
- USB mouse
- Monitor with HDMI input

### Safety Reminder
✋ **Before starting**: Touch a grounded metal object to discharge static electricity

---

## Step 1: Identify the Components (5 minutes)

### Take the Raspberry Pi Board Tour

Work with your neighbor and find these components on your board:

#### Top Side
- [ ] **40-pin GPIO header** (two rows of pins)
- [ ] **CSI Camera connector** (ribbon cable port)
- [ ] **DSI Display connector** (ribbon cable port)
- [ ] **CPU chip** (usually has a heatsink or fan)
- [ ] **RAM chip** (the silver square IC)
- [ ] **USB 2.0 ports** (2 black ports)
- [ ] **USB 3.0 ports** (2 blue ports)
- [ ] **Ethernet port** (silver network connector)
- [ ] **Audio jack** (3.5mm port)
- [ ] **Micro-HDMI ports** (2 small ports, labeled 0 and 1)

#### Bottom Side
- [ ] **MicroSD card slot** (under the board)
- [ ] **USB-C power port**
- [ ] **PoE header** (4 pins near Ethernet)

**Activity**: Draw a simple diagram of your Raspberry Pi and label at least 5 components.

---

## Step 2: Insert the MicroSD Card (2 minutes)

1. **Turn the Raspberry Pi board over** (bottom side up)
2. Locate the microSD card slot
3. **Gently insert the card** with contacts facing up (toward the board)
4. Push until you hear/feel a soft click
5. Card should be mostly hidden under the board

**Troubleshooting**: 
- If card won't insert, try flipping it over
- Don't force it - it should slide in smoothly
- The card is spring-loaded; push to eject later

---

## Step 3: Connect Peripherals (5 minutes)

**IMPORTANT**: Make connections in this order BEFORE applying power!

### Connection Order:

1. **Monitor** 
   - Connect micro-HDMI to HDMI cable
   - Use the port closest to the USB-C power (labeled "HDMI 0")
   - Connect other end to your monitor
   - Turn monitor ON

2. **Keyboard**
   - Insert into any USB port (blue USB 3.0 ports preferred)
   - No drivers needed!

3. **Mouse**
   - Insert into any remaining USB port

4. **Ethernet (Optional)**
   - If not using WiFi, connect Ethernet cable now
   - WiFi will connect automatically if configured in Step 4

5. **Power - LAST!**
   - **Do NOT connect yet!**
   - Have the power supply ready

**Visual Check**:
- [ ] MicroSD card inserted
- [ ] Monitor connected and ON
- [ ] Keyboard connected
- [ ] Mouse connected
- [ ] Ethernet connected (if using wired)
- [ ] Power supply ready but NOT connected

---

## Step 4: First Boot! (10 minutes)

### Power On
1. **Connect the USB-C power supply** to the Raspberry Pi
2. Plug the power adapter into the wall outlet
3. **Watch for the red LED** (power indicator) on the board
4. **Green LED** will blink (disk activity)

### What You'll See
1. **Rainbow splash screen** (1-2 seconds)
2. **Boot text scrolling** (10-20 seconds)
3. **Desktop loading** (10-30 seconds)

### First Boot Setup Wizard

If you configured settings in the Imager:
- System will boot directly to desktop
- WiFi should connect automatically
- Skip to "Explore the Desktop" section

If you did NOT configure settings in the Imager:
- Setup wizard will appear
- Follow these steps:

#### Welcome Screen
- Click **"Next"**

#### Set Country
- Select your country
- Set language
- Set timezone
- Click **"Next"**

#### Change Password
- Enter a new password
- Re-enter to confirm
- **Write this down!**
- Click **"Next"**

#### Setup Screen
- Adjust if black borders around screen
- Click **"Next"**

#### Select WiFi Network
- Choose your WiFi network
- Enter password
- Click **"Next"**

#### Update Software
- Click **"Skip"** for now (we'll do this later)
- Or click **"Next"** to update (5-10 minutes)

#### Setup Complete
- Click **"Restart"** to reboot

---

## Step 5: Explore the Desktop (10 minutes)

### Desktop Overview

Your screen should show:
- **Wallpaper** (default: Raspberry Pi logo)
- **Menu bar** at top
- **Task bar** at top with icons

### Top Menu Bar (Left to Right)

1. **Raspberry Pi icon** (Menu button)
   - Click to see all programs
   - Like Windows Start Menu or Mac Finder

2. **Web Browser** (Chromium)
   - Click to open internet browser

3. **File Manager** 
   - Browse files and folders
   - Like Windows Explorer or Mac Finder

4. **Terminal**
   - Command line interface (we'll use next week!)

### Top Menu Bar (Right Side)

1. **Bluetooth icon**
2. **WiFi icon** (shows connection status)
3. **Volume control**
4. **Clock**
5. **Power button** (for shutdown)

### Try These Actions

#### Action 1: Open the Menu
1. Click the Raspberry Pi icon (top left)
2. Browse through categories:
   - Programming
   - Internet
   - Games
   - Accessories
   - More...

#### Action 2: Open File Manager
1. Click the folder icon
2. You'll see:
   - Desktop
   - Documents
   - Downloads
   - Pictures
   - Videos
   - More...

#### Action 3: Change Wallpaper
1. Right-click on the desktop
2. Select **"Desktop Preferences"**
3. Click **"Picture"** tab
4. Choose a new wallpaper from the list
5. Click **"OK"**

#### Action 4: Check System Information
1. Click Raspberry Pi menu icon
2. Go to **Preferences** → **Raspberry Pi Configuration**
3. Look at the **System** tab
   - See your hostname
   - Boot option
   - More settings
4. Click **"Cancel"** (don't change anything yet)

---

## Step 6: Proper Shutdown (2 minutes)

**NEVER just unplug the power!**

### Correct Shutdown Process

1. Click the **power icon** (top right corner)
2. Select **"Shutdown"**
3. Click **"Shutdown"** to confirm
4. Wait for:
   - Screen to go black
   - Green LED to stop blinking
   - Only red LED remains on
5. Now safe to disconnect power

**Why is this important?**
- Prevents file corruption
- Ensures all data is saved
- Protects the SD card
- Just like you shouldn't unplug a USB drive while copying!

---

## Troubleshooting Guide

### Problem: No display on monitor
**Solutions**:
- Check monitor is powered on
- Check HDMI cable is firmly connected
- Try the other micro-HDMI port
- Check monitor input source selection

### Problem: Keyboard/mouse not working
**Solutions**:
- Try different USB ports
- Check connections are firm
- Try different keyboard/mouse
- USB 3.0 ports (blue) work best

### Problem: Won't boot / colored squares on screen
**Solutions**:
- Check power supply is 3A minimum
- Try re-imaging the SD card
- Make sure SD card is fully inserted
- Colored squares = power issue

### Problem: WiFi not connecting
**Solutions**:
- Check password was entered correctly
- Make sure WiFi is available
- Try Ethernet temporarily
- Recheck country setting (WiFi channels vary by country)

### Problem: Very slow performance
**Solutions**:
- Wait 2-3 minutes after first boot (setup processes running)
- Check you're using good quality SD card (Class 10)
- Ensure proper cooling (add heatsink if hot)

---

## Checkpoint Quiz

Before moving on, you should be able to answer these:

1. What is the function of RAM vs storage?
2. Where is the CPU located on your Raspberry Pi?
3. How many GPIO pins does the Raspberry Pi 4 have?
4. What is the correct way to turn off the Raspberry Pi?
5. What operating system are you running?

**Answers**:
1. RAM = temporary fast memory; Storage = permanent memory
2. Under the heatsink (large square chip)
3. 40 pins
4. Use shutdown menu, wait for lights, then disconnect power
5. Raspberry Pi OS (based on Linux)

---

## Success! ✓

You have successfully:
- [ ] Installed Raspberry Pi OS on your SD card
- [ ] Identified major components on the Raspberry Pi
- [ ] Made all the connections safely
- [ ] Booted your Raspberry Pi for the first time
- [ ] Explored the desktop environment
- [ ] Performed a proper shutdown

**Next time**: We'll learn to use the Terminal and navigate with commands!

---

## Extension Challenge (Optional)

If you finish early or want to explore more:

1. **Explore pre-installed games**
   - Menu → Games → Try Minecraft Pi or Python Games

2. **Browse built-in applications**
   - Find the Calculator
   - Open the Text Editor
   - Try the Image Viewer

3. **Create a folder on the Desktop**
   - Right-click desktop
   - Select "Create New" → "Folder"
   - Name it "My RPi Projects"

4. **Take a screenshot**
   - Press the **Print Screen** key
   - Find it in the Pictures folder
