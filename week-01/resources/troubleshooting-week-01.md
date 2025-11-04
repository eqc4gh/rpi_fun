# Week 1 Troubleshooting Guide

Common issues and their solutions for first-time Raspberry Pi setup.

---

## Boot & Display Issues

### Problem: No display on monitor (black screen)
**Symptoms**: Monitor shows "No Signal" or remains black

**Solutions to try in order**:
1. **Check power**
   - Is the red LED on the Raspberry Pi lit?
   - If not, check power supply connection
   - Try a different power outlet

2. **Check HDMI connection**
   - Ensure micro-HDMI cable is firmly inserted
   - Try the other micro-HDMI port (use port 0, closest to USB-C)
   - Try a different HDMI cable
   - Check monitor input source (use remote to select correct HDMI)

3. **Check monitor**
   - Is monitor powered on?
   - Try connecting monitor to another device to verify it works
   - Check monitor brightness settings

4. **Try safe mode boot**
   - Power off completely
   - Hold SHIFT while powering on
   - This forces HDMI safe mode

5. **Re-image SD card**
   - SD card may be corrupted
   - Use Raspberry Pi Imager to write fresh OS

**Still not working?** 
- Try a different monitor if available
- Ensure you're using a quality micro-HDMI cable (not all cables are equal)

---

### Problem: Colored square/rainbow screen only
**Symptoms**: See rainbow splash screen but nothing else

**Likely causes**:
- **Insufficient power** (most common)
- Corrupted SD card
- Improperly imaged SD card

**Solutions**:
1. **Verify power supply**
   - Must be 5V, 3A minimum for Raspberry Pi 4
   - Official Raspberry Pi power supply recommended
   - Phone chargers often insufficient
   - Look for lightning bolt icon in corner (indicates low voltage)

2. **Check SD card image**
   - Re-download Raspberry Pi OS
   - Re-image using Raspberry Pi Imager
   - Try a different SD card if available

3. **Check for firmware updates**
   - If you have another working Pi, update bootloader
   - Visit raspberrypi.com/software for instructions

---

### Problem: Boot loops or crashes during startup
**Symptoms**: Starts booting, shows text, then restarts or freezes

**Solutions**:
1. **Check SD card**
   - Remove and re-insert firmly
   - Try different SD card
   - Use high-quality card (SanDisk, Samsung recommended)
   - Must be Class 10 or better

2. **Verify image integrity**
   - Re-download Raspberry Pi OS
   - Verify download hash
   - Re-image with Raspberry Pi Imager

3. **Test power supply**
   - Low power can cause random crashes
   - Try official Raspberry Pi power supply

4. **Remove peripherals**
   - Disconnect all USB devices except keyboard
   - Boot with minimal configuration
   - Add peripherals one at a time

---

## Input Device Issues

### Problem: Keyboard not working
**Symptoms**: Can see desktop but keyboard doesn't type

**Solutions**:
1. **Check connections**
   - Is keyboard plugged in firmly?
   - Try different USB port
   - Blue USB 3.0 ports work better

2. **Test keyboard**
   - Try keyboard on another computer
   - Some wireless keyboards need paired dongles

3. **Check keyboard compatibility**
   - Some keyboards need more power
   - Try powered USB hub
   - Wired keyboards more reliable than wireless

4. **Verify layout**
   - Wrong keyboard layout set?
   - Menu → Preferences → Keyboard and Mouse
   - Select correct layout

---

### Problem: Mouse not working
**Symptoms**: Mouse cursor doesn't appear or doesn't move

**Solutions**:
1. **Check connections**
   - Firmly insert USB connector
   - Try different USB port
   - Use USB 3.0 (blue) ports

2. **Test mouse**
   - Try on another computer
   - Check batteries if wireless
   - Try wired mouse if using wireless

3. **Use keyboard temporarily**
   - Tab key moves between items
   - Enter selects
   - Alt+F4 closes windows
   - Can navigate to fix mouse settings

---

## Network Issues

### Problem: WiFi not connecting
**Symptoms**: "Failed to connect" message or no networks shown

**Solutions**:
1. **Verify password**
   - WiFi passwords are case-sensitive
   - Watch for typos
   - Try typing in text editor first, then copy/paste

2. **Check country setting**
   - Menu → Preferences → Raspberry Pi Configuration
   - System tab → Set WiFi Country
   - Must match your actual location (WiFi channels vary)
   - Reboot after changing

3. **Check 2.4GHz vs 5GHz**
   - Raspberry Pi 4 supports both
   - Some networks are 5GHz only
   - Try 2.4GHz network if available

4. **Router issues**
   - Is WiFi actually working? (test with phone)
   - Router may block new devices
   - Check router's device limit
   - Disable MAC address filtering temporarily

5. **Use Ethernet temporarily**
   - Connect via cable to troubleshoot
   - Update system: `sudo apt update && sudo apt upgrade`
   - Then retry WiFi

---

### Problem: Ethernet not connecting
**Symptoms**: Cable connected but no internet

**Solutions**:
1. **Check cable**
   - Is it firmly inserted?
   - Try different cable
   - Check cable isn't damaged

2. **Check router**
   - Is router port working?
   - Try different router port
   - Check router lights

3. **Check IP address**
   - Open Terminal
   - Type: `ip addr`
   - Should see IP address like 192.168.x.x
   - If shows 169.254.x.x, DHCP failed

4. **Manual IP (advanced)**
   - May need to set static IP
   - Ask network administrator for help

---

## SD Card Issues

### Problem: "SD card not detected" error
**Symptoms**: Error message about SD card

**Solutions**:
1. **Check insertion**
   - Push card firmly until clicks
   - Should be mostly hidden under board
   - Contacts facing up toward board

2. **Try different card**
   - Some cards incompatible
   - Use SanDisk, Samsung, or official RPi cards
   - Must be Class 10 or UHS-I

3. **Check card size**
   - Minimum 8GB (32GB recommended)
   - Maximum 2TB
   - SDXC cards 64GB+ may need special formatting

4. **Re-format and re-image**
   - Use SD Card Formatter tool
   - Then re-image with Raspberry Pi Imager

---

### Problem: "Not enough space" errors
**Symptoms**: Can't save files or install software

**Solutions**:
1. **Check actual space**
   - File Manager shows free space at bottom
   - Or Terminal: `df -h`

2. **Expand filesystem**
   - Menu → Preferences → Raspberry Pi Configuration
   - System tab → Expand Filesystem
   - Reboot

3. **Clean up space**
   - Delete unnecessary files
   - Empty Trash
   - Terminal: `sudo apt clean`

---

## Software/OS Issues

### Problem: System very slow
**Symptoms**: Programs take long time to open, mouse lags

**Solutions**:
1. **Wait after first boot**
   - First boot does setup tasks
   - Wait 5 minutes for processes to complete

2. **Check processes**
   - Open Task Manager
   - Look for high CPU usage
   - Close unnecessary programs

3. **Verify SD card speed**
   - Slow SD card = slow system
   - Use Class 10 or UHS-I minimum
   - Replace with faster card if needed

4. **Reduce desktop effects**
   - Menu → Preferences → Appearance Settings
   - Reduce animations and effects

5. **Check temperature**
   - CPU may throttle if too hot
   - Add heatsink or fan
   - Ensure good air circulation

---

### Problem: Desktop looks different than expected
**Symptoms**: Missing icons, wrong layout, unfamiliar appearance

**Solutions**:
1. **Restore defaults**
   - Menu → Preferences → Appearance Settings
   - Select default theme
   - Reset panel settings

2. **Check desktop icons**
   - Right-click desktop
   - Desktop Preferences
   - Verify icon settings

3. **Re-image if major issues**
   - Starting fresh sometimes easiest
   - Backup any files first

---

### Problem: Can't shutdown/reboot
**Symptoms**: Shutdown menu doesn't work or hangs

**Solutions**:
1. **Wait patiently**
   - Shutdown can take 30-60 seconds
   - Don't force power off unless truly frozen

2. **Use keyboard shortcut**
   - Ctrl+Alt+Delete for task manager
   - Can force quit hung programs

3. **Force reboot (last resort)**
   - Hold power button 5 seconds
   - Only if completely frozen
   - May corrupt SD card

4. **Terminal shutdown**
   - Ctrl+Alt+T to open Terminal
   - Type: `sudo shutdown now`
   - Or: `sudo reboot`

---

## Power Issues

### Problem: Lightning bolt icon appears
**Symptoms**: Small lightning bolt in top-right corner

**Meaning**: Under-voltage warning (insufficient power)

**Solutions**:
1. **Use official power supply**
   - Raspberry Pi 4 needs 5V, 3A
   - Phone chargers usually insufficient
   - Official supply highly recommended

2. **Check cable quality**
   - Poor USB-C cable can drop voltage
   - Use short, quality cable

3. **Reduce USB device usage**
   - USB devices draw power from Pi
   - Use powered USB hub for multiple devices
   - Disconnect unnecessary peripherals

---

### Problem: Raspberry Pi feels very hot
**Symptoms**: Case hot to touch, system slow

**Solutions**:
1. **Add cooling**
   - Attach heatsink to CPU
   - Add small fan
   - Use case with ventilation

2. **Improve airflow**
   - Don't cover vents
   - Keep in open space
   - Elevate off surface

3. **Check CPU temperature**
   - Terminal: `vcgencmd measure_temp`
   - Should be under 80°C
   - Over 80°C will throttle

4. **Reduce workload**
   - Close unnecessary programs
   - Avoid running heavy tasks continuously

---

## Audio/Video Issues

### Problem: No sound from HDMI
**Symptoms**: Video works but no audio through monitor

**Solutions**:
1. **Check audio output**
   - Right-click volume icon
   - Select correct output (HDMI)

2. **Verify monitor audio**
   - Does monitor have speakers?
   - Is monitor volume up?

3. **Test with headphones**
   - Plug into audio jack
   - Confirms Raspberry Pi audio works

---

## When All Else Fails

### Complete Reset Process
1. Backup any important files
2. Download fresh Raspberry Pi OS
3. Re-format SD card with SD Card Formatter
4. Image using Raspberry Pi Imager
5. Start setup from beginning

### Getting Help
1. **Check official documentation**
   - https://www.raspberrypi.org/documentation

2. **Search forums**
   - https://forums.raspberrypi.com
   - Many common issues already solved

3. **Ask your instructor**
   - Document what you've tried
   - Describe exact symptoms
   - Note any error messages

4. **Community support**
   - Reddit: r/raspberry_pi
   - Stack Exchange: Raspberry Pi section

---

## Prevention Tips

**Avoid these common mistakes**:
- ✗ Unplugging power without shutting down
- ✗ Touching GPIO pins while powered on
- ✗ Using cheap/insufficient power supplies
- ✗ Using low-quality SD cards
- ✗ Forgetting to secure SD card fully
- ✗ Blocking ventilation/cooling
- ✗ Connecting/disconnecting while powered

**Good habits**:
- ✓ Always use proper shutdown procedure
- ✓ Keep Raspberry Pi in well-ventilated space
- ✓ Use quality power supply and cables
- ✓ Handle board by edges
- ✓ Regularly backup important files
- ✓ Keep firmware/software updated
- ✓ Save work frequently

---

## Quick Reference: LED Indicators

### Power LED (Red)
- **Solid red**: Good power
- **Dim/off**: Insufficient power (under-voltage)

### Activity LED (Green)
- **Blinking**: Reading/writing SD card
- **Off**: No activity or SD card problem
- **Constant**: System error

### Network LED (if using Ethernet)
- **Blinking**: Network activity
- **Off**: No network connection

---

## Emergency Contact Info

**Instructor Contact**: ___________________

**Office Hours**: ___________________

**Class Website**: ___________________

**Emergency Tech Support**: ___________________
