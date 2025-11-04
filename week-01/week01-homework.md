# Week 1 Homework & Extension Activities

Complete these activities on your own time to reinforce what you learned!

---

## Required Homework

### Assignment 1: Practice Power Cycles (Required)
**Time**: 15 minutes over the week

Practice proper startup and shutdown procedures to build good habits.

**Instructions**:
1. Power on your Raspberry Pi properly
2. Log in to the desktop
3. Do something simple (open an application, create a file)
4. Shutdown properly using the menu
5. Wait for green LED to stop
6. Disconnect power

**Repeat this 3 times throughout the week**

**Track your practice**:
- Date 1: ___/___/___ ✓
- Date 2: ___/___/___ ✓
- Date 3: ___/___/___ ✓

---

### Assignment 2: Reflection Essay (Required)
**Time**: 15-20 minutes

Write a short reflection (150-250 words) answering these questions:

1. **What surprised you most about the Raspberry Pi?**
   - Something unexpected about its size, capabilities, or design

2. **How is it different from computers you've used before?**
   - Think about size, operating system, capabilities, GPIO pins

3. **What are you most excited to learn?**
   - What projects interest you?
   - What skills do you want to develop?

**Format**:
- Use LibreOffice Writer or Text Editor
- Save as: "Week-01-Reflection.txt" or "Week-01-Reflection.odt"
- Location: Documents/RPi-Course/Week-01/

**Grading Criteria**:
- Complete sentences ✓
- Answers all 3 questions ✓
- 150-250 words ✓
- Proper spelling and grammar ✓

---

### Assignment 3: Component Identification (Required)
**Time**: 10 minutes

Create a labeled diagram of the Raspberry Pi.

**Instructions**:
1. Take a photo of your Raspberry Pi OR draw it
2. Label these 10 components:
   - CPU (processor chip)
   - RAM chip
   - GPIO pins (40-pin header)
   - USB 3.0 ports
   - USB 2.0 ports
   - Micro-HDMI ports
   - Ethernet port
   - USB-C power port
   - MicroSD card slot
   - CSI camera connector

**Options**:
- Draw on paper and photograph
- Use a drawing program
- Print a photo and label by hand
- Use LibreOffice Draw

**Save as**: "RPi-Diagram.jpg" or "RPi-Diagram.odt"
**Location**: Documents/RPi-Course/Week-01/

---

## Extension Activities (Optional)

These are optional challenges for students who want to explore more!

---

### Extension 1: Research a Raspberry Pi Project
**Time**: 20-30 minutes

Find an interesting project made with Raspberry Pi online.

**Instructions**:
1. Visit https://projects.raspberrypi.org or search online
2. Find a project that interests you
3. Write a brief summary (100-150 words) including:
   - Project name
   - What does it do?
   - What hardware does it use?
   - Why is it interesting to you?
   - Project URL

**Save as**: "Interesting-Project.txt"
**Location**: Documents/RPi-Course/Week-01/

**Some categories to explore**:
- Robotics
- Games
- Weather stations
- Smart home devices
- Cameras and photography
- Music and sound
- Art installations

---

### Extension 2: Desktop Customization
**Time**: 15-20 minutes

Make your Raspberry Pi desktop uniquely yours!

**Tasks** (complete at least 3):
- [ ] Create a custom wallpaper collage
- [ ] Set up desktop shortcuts for your favorite apps
- [ ] Organize File Manager bookmarks
- [ ] Customize panel appearance (colors, size, location)
- [ ] Create a organized folder structure for the course
- [ ] Add frequently-used folders to Quick Access
- [ ] Change icon theme (Preferences → Appearance Settings)

**Document your changes**:
- Take screenshots (Print Screen key)
- Save in Pictures/Week-01-Desktop/
- Write short descriptions of what you changed

---

### Extension 3: Explore Pre-installed Software
**Time**: 30 minutes

Try out applications you didn't get to during class.

**Applications to explore**:

#### Programming
- [ ] **Scratch 3**: Visual programming (Menu → Programming → Scratch 3)
  - Create a simple animation or game
  - Save your project

- [ ] **Greenfoot**: Java programming environment
  - Explore the scenarios
  - Look at sample code

#### Productivity
- [ ] **LibreOffice Calc**: Spreadsheet application
  - Create a simple grade tracker or budget
  - Use at least 2 formulas

- [ ] **LibreOffice Impress**: Presentation software
  - Create a 3-slide presentation about yourself
  - Include images and text

#### Media
- [ ] **VLC Media Player**: Play video files
  - Test with sample videos
  - Explore the controls

- [ ] **Image Viewer**: View photos
  - Browse sample images
  - Try basic features

**Write a brief review** (2-3 sentences) for each app you try:
- What is it used for?
- Did you find it easy to use?
- Would you use it for projects?

---

### Extension 4: Terminal Introduction
**Time**: 15-20 minutes

Get a head start on next week's topic!

**Try these safe commands** (type each and press Enter):

```bash
# Show your current location in the file system
pwd

# List files and folders
ls

# List with details
ls -l

# Change to Desktop directory
cd Desktop

# Go back to home directory
cd ~

# Create a new directory
mkdir test-folder

# Show a text file's contents (try with any .txt file)
cat filename.txt

# Show the first few lines of a file
head filename.txt

# Display calendar
cal

# Show date and time
date

# Display a colorful message
echo "I'm learning Linux!"

# See your username
whoami

# Clear the screen
clear
```

**Challenge**: Create a text file explaining what each command does.

**Save as**: "Terminal-Commands.txt"
**Location**: Documents/RPi-Course/Week-01/

---

### Extension 5: System Monitoring
**Time**: 15 minutes

Learn about your Raspberry Pi's performance.

**Activity 1: Task Manager**
1. Menu → Accessories → Task Manager
2. Observe:
   - Which processes are running?
   - How much RAM is being used?
   - How much CPU is being used?
3. Open several applications
4. Watch the usage change

**Activity 2: System Information**
1. Open Terminal
2. Run: `cat /proc/cpuinfo` (shows CPU info)
3. Run: `free -h` (shows memory usage)
4. Run: `df -h` (shows disk space)

**Questions to answer**:
1. How many CPU cores do you have?
2. How much total RAM is available?
3. How much disk space is used/available?
4. What happens to RAM usage when you open many apps?

**Document your findings** in a text file.

---

### Extension 6: Learn Keyboard Shortcuts
**Time**: 10 minutes

Keyboard shortcuts make you more efficient!

**Practice these shortcuts**:

| Shortcut | Action |
|----------|--------|
| `Ctrl + C` | Copy |
| `Ctrl + V` | Paste |
| `Ctrl + X` | Cut |
| `Ctrl + Z` | Undo |
| `Ctrl + S` | Save |
| `Ctrl + A` | Select All |
| `Ctrl + F` | Find |
| `Ctrl + Alt + T` | Open Terminal |
| `Print Screen` | Take Screenshot |
| `Alt + F4` | Close Window |
| `Ctrl + Alt + Delete` | Task Manager |

**Test yourself**:
1. Open Text Editor
2. Type a paragraph
3. Use shortcuts to:
   - Select all text
   - Copy it
   - Paste it below
   - Save the file
   - Take a screenshot

---

### Extension 7: Network Exploration
**Time**: 15 minutes

Learn about your network connection.

**Activities**:

1. **Check Network Status**
   - Click WiFi icon in taskbar
   - What's your IP address?
   - What's your signal strength?

2. **Use Chromium Browser**
   - Visit: https://www.raspberrypi.org
   - Browse the Learning section
   - Find one tutorial that interests you

3. **Speed Test (if allowed)**
   - Search for "internet speed test"
   - Run a speed test
   - What are your download/upload speeds?

4. **Learn Your Router**
   - Open Terminal
   - Run: `ip route` (shows your network gateway)
   - Write down the gateway IP address

**Safety Note**: Only visit trusted websites and never share personal information online!

---

### Extension 8: Create a Startup Guide
**Time**: 30 minutes

Help future students by creating a guide!

**Project**: Create a 1-page "Quick Start Guide" for Week 1

**Include**:
1. Pictures or diagrams of the Raspberry Pi
2. Step-by-step startup instructions
3. Important safety reminders
4. Your top 3 tips for beginners
5. Common problems and solutions

**Format options**:
- LibreOffice Writer document
- Hand-drawn poster (photograph it)
- Digital infographic
- Presentation slides

**Save as**: "Student-Quick-Start-Guide"

This could be used to help other students in the future!

---

## Homework Submission Checklist

### Required Assignments (Due next week):
- [ ] Completed 3 power cycle practices
- [ ] Written reflection essay (150-250 words)
- [ ] Created labeled Raspberry Pi diagram
- [ ] All files saved in correct location
- [ ] Files properly named

### Optional Extensions (Turn in any you complete):
- [ ] Research project summary
- [ ] Desktop customization documentation
- [ ] Application reviews
- [ ] Terminal command reference
- [ ] System monitoring report
- [ ] Keyboard shortcuts practice
- [ ] Network exploration notes
- [ ] Quick Start Guide creation

---

## Tips for Success

### Organization
- Keep all files in Documents/RPi-Course/Week-01/
- Use clear, descriptive filenames
- Save frequently while working

### Quality Work
- Take your time
- Check spelling and grammar
- Make diagrams neat and legible
- Test everything before submitting

### Ask for Help
- Don't struggle alone
- Ask questions in class
- Use online resources (Raspberry Pi forums)
- Work with classmates (but do your own work!)

### Going Beyond
- Extension activities aren't required but are valuable
- They help you learn more and practice skills
- Can be portfolio pieces for future projects

---

## Parent/Guardian Note

Students should spend approximately **30-45 minutes** on required homework. Extension activities are optional and for students who want additional challenges.

**Support needed**:
- Quiet workspace
- Access to Raspberry Pi and monitor
- Internet connection (for research activities)
- Encouragement and interest in their learning!

If your student is struggling or spending excessive time, please contact the instructor.

---

## Next Week Preview

**Week 2: Linux Basics & Command Line**

We'll learn to:
- Navigate the file system using Terminal
- Create, move, and delete files with commands
- Understand Linux file permissions
- Write simple shell scripts

**To prepare**: Make sure you're comfortable with basic desktop operations!
