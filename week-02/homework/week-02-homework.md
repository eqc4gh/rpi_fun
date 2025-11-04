# Week 2 Homework & Extension Activities

Complete these activities to reinforce command-line skills!

---

## Required Homework

### Assignment 1: Daily Command Practice (Required)
**Time**: 10 minutes per day × 5 days = 50 minutes total

Practice commands every day this week. Each day, complete a different set:

#### Day 1: Navigation Practice
```bash
# Do these 5 times:
cd ~
pwd
cd Documents
ls -lah
cd ..
```

**Log your practice**:
- Day 1 completed: ☐

#### Day 2: File Creation
```bash
# Create this structure:
mkdir -p practice/day2/{folder1,folder2,folder3}
touch practice/day2/folder1/file{1..5}.txt
ls -R practice/day2
```

**Log your practice**:
- Day 2 completed: ☐

#### Day 3: File Operations
```bash
# Practice copying and moving:
cd ~/Documents
mkdir practice/day3
touch practice/day3/original.txt
cp practice/day3/original.txt practice/day3/copy.txt
mv practice/day3/copy.txt practice/day3/renamed.txt
ls -l practice/day3
```

**Log your practice**:
- Day 3 completed: ☐

#### Day 4: Viewing Files
```bash
# Create and view files:
echo "Line 1" > practice/day4/test.txt
echo "Line 2" >> practice/day4/test.txt
echo "Line 3" >> practice/day4/test.txt
cat practice/day4/test.txt
head -n 2 practice/day4/test.txt
tail -n 1 practice/day4/test.txt
```

**Log your practice**:
- Day 4 completed: ☐

#### Day 5: Review
```bash
# Combine everything:
cd ~/Documents
mkdir -p review/complete
touch review/complete/file.txt
echo "Practice makes perfect" > review/complete/file.txt
cat review/complete/file.txt
cp review/complete/file.txt review/backup.txt
ls -l review/
```

**Log your practice**:
- Day 5 completed: ☐

---

### Assignment 2: Command Reference Sheet (Required)
**Time**: 30 minutes

Create your own command reference cheat sheet!

#### Requirements

Create a file called `command-reference.txt` using nano with these sections:

1. **Navigation Commands** (at least 5)
2. **File Operations** (at least 6)
3. **Viewing Commands** (at least 4)
4. **Help Commands** (at least 3)
5. **Shortcuts** (at least 5)

For each command, include:
- Command name
- What it does
- An example
- Any important flags

#### Example Format
```
COMMAND: pwd
PURPOSE: Print working directory - shows current location
EXAMPLE: pwd
         Output: /home/pi/Documents
FLAGS: (none)

COMMAND: ls
PURPOSE: List files and directories
EXAMPLE: ls -lah
FLAGS: -l (long format), -a (all files), -h (human readable)
```

#### Submission
Save as: `~/Documents/command-reference.txt`

---

### Assignment 3: Directory Organization Project (Required)
**Time**: 20 minutes

Create an organized directory structure for this course.

#### Task

Using ONLY the Terminal, create this structure in `~/Documents/`:

```
raspberry-pi-course/
├── week-01/
│   ├── notes.txt
│   ├── homework/
│   └── projects/
├── week-02/
│   ├── notes.txt
│   ├── homework/
│   └── projects/
├── week-03/
│   ├── notes.txt
│   ├── homework/
│   └── projects/
├── resources/
│   ├── cheat-sheets/
│   ├── examples/
│   └── links.txt
└── README.txt
```

#### In README.txt, write:
- Your name
- Course name
- Purpose of this directory structure
- Date created

#### Deliverable

Save a file called `structure-verification.txt` containing:
```bash
# Commands you used to create structure:
[paste your commands here]

# Verification (output of ls -R):
[paste ls -R raspberry-pi-course/ output here]
```

---

### Assignment 4: Reflection Essay (Required)
**Time**: 15-20 minutes

Write a reflection on learning the command line.

#### Questions to Answer

Write at least 150 words total addressing these questions:

1. **What surprised you about the command line?**
   - Was it easier or harder than expected?
   - What was different from using the desktop?

2. **Which commands did you find most useful?**
   - Which do you think you'll use most?
   - Which were confusing at first?

3. **How do you think the command line will help with future projects?**
   - Think about Week 4 (GPIO), Week 6 (Robotics), etc.

#### Format
- Use nano or a text editor
- Save as: `~/Documents/week-02-reflection.txt`
- Write in complete sentences
- Check spelling and grammar

---

## Extension Activities (Optional)

Choose any that interest you!

---

### Extension 1: Advanced Navigation Challenge
**Time**: 20 minutes

Master complex navigation patterns.

#### Task 1: Speed Navigation

Time yourself completing this sequence 3 times:

```bash
cd ~
cd Documents
cd ../Downloads
cd ~/Desktop
cd /usr/bin
cd -
cd ~
```

- **Attempt 1**: _____ seconds
- **Attempt 2**: _____ seconds
- **Attempt 3**: _____ seconds

**Goal**: Under 30 seconds!

#### Task 2: Navigation Patterns

Write commands to go from → to:

1. `/home/pi/Documents` → `/home/pi/Pictures/Vacation`
2. `/usr/bin` → `/home/pi`
3. `/home/pi/Desktop/project/src` → `/home/pi/Desktop/project/docs`
4. Any location → home (3 different ways)

---

### Extension 2: Shell Script Portfolio
**Time**: 30-40 minutes

Create a collection of useful scripts!

#### Script 1: System Info Display

Create `system-info.sh`:
```bash
#!/bin/bash
echo "=== System Information ==="
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "Username: $(whoami)"
echo "Current Directory: $(pwd)"
echo "Disk Space:"
df -h | head -2
```

#### Script 2: Daily Backup

Create `daily-backup.sh`:
```bash
#!/bin/bash
BACKUP_DIR=~/backups/$(date +%Y-%m-%d)
mkdir -p $BACKUP_DIR
cp -r ~/Documents $BACKUP_DIR/
echo "Backup completed to $BACKUP_DIR"
```

#### Script 3: Project Creator

Create `new-project.sh`:
```bash
#!/bin/bash
# Creates a new project structure
echo "Enter project name:"
read PROJECT_NAME
mkdir -p ~/$PROJECT_NAME/{src,docs,data,tests}
touch ~/$PROJECT_NAME/README.txt
echo "Project $PROJECT_NAME created!"
```

#### Test Each Script

Make executable and run:
```bash
chmod +x system-info.sh
./system-info.sh
```

---

### Extension 3: Command Line Research
**Time**: 30 minutes

Research and document 5 commands you haven't used yet.

#### Format

For each command, create a file named `command-[name].txt`:

```
COMMAND: [name]
CATEGORY: [file operations/text processing/system/network/etc]
DESCRIPTION: [what it does]

BASIC USAGE:
[syntax]

COMMON FLAGS:
- [flag]: [description]
- [flag]: [description]

EXAMPLES:
1. [example command]
   [what it does]
2. [example command]
   [what it does]

USEFUL FOR:
[when you might use this command]

SOURCE:
[where you learned about it]
```

#### Suggested Commands to Research
- `grep` - search text
- `find` - search for files
- `wc` - word count
- `sort` - sort lines
- `diff` - compare files
- `tar` - archive files
- `wget` - download files
- `curl` - transfer data
- `ps` - process status
- `top` - system monitor

---

### Extension 4: File Management Challenge
**Time**: 25 minutes

Create an automated file organizer.

#### Scenario

You have a messy download folder. Create a script that:

1. Creates organized subdirectories
2. Moves files based on extension
3. Logs what it did

#### Create `organize-files.sh`:

```bash
#!/bin/bash

# Create organization folders
mkdir -p ~/organized/{documents,images,archives,code,other}

# Move to test directory
cd ~/Downloads

# Organize by file type
mv *.pdf ~/organized/documents/ 2>/dev/null
mv *.doc* ~/organized/documents/ 2>/dev/null
mv *.txt ~/organized/documents/ 2>/dev/null

mv *.jpg ~/organized/images/ 2>/dev/null
mv *.png ~/organized/images/ 2>/dev/null
mv *.gif ~/organized/images/ 2>/dev/null

mv *.zip ~/organized/archives/ 2>/dev/null
mv *.tar.gz ~/organized/archives/ 2>/dev/null

mv *.py ~/organized/code/ 2>/dev/null
mv *.sh ~/organized/code/ 2>/dev/null

echo "Files organized! Check ~/organized/"
```

#### Test It

1. Create test files in ~/Downloads
2. Run your script
3. Verify files moved correctly

---

### Extension 5: Command Line Games
**Time**: 15-20 minutes

Learn commands while having fun!

#### Game 1: Command Line Golf

Complete tasks with the **fewest possible characters**:

1. Go to home directory (best: 3 chars)
2. List all files including hidden (best: 5 chars)
3. Create directory and cd into it (hint: use &&)
4. Create 5 files at once

Your solutions:
```bash
1. 
2. 
3. 
4. 
```

#### Game 2: Terminal Treasure Hunt

Create a treasure hunt script:

```bash
#!/bin/bash
# treasure-hunt.sh

mkdir -p ~/treasure-hunt/{cave,forest,mountain,beach}
echo "Find the hidden treasure!" > ~/treasure-hunt/cave/clue1.txt
echo "The treasure is in the mountain!" > ~/treasure-hunt/forest/clue2.txt
echo "Congratulations! You found it!" > ~/treasure-hunt/mountain/treasure.txt
echo "This is empty." > ~/treasure-hunt/beach/nothing.txt
```

Then trade treasure hunts with a classmate!

---

### Extension 6: Advanced Text Manipulation
**Time**: 30 minutes

Learn powerful text processing commands.

#### Task 1: Create a Contact List

Create `contacts.txt`:
```
John Doe,555-1234,john@email.com
Jane Smith,555-5678,jane@email.com
Bob Johnson,555-9012,bob@email.com
```

#### Task 2: Process the Contact List

Extract just names:
```bash
cut -d',' -f1 contacts.txt
```

Extract just emails:
```bash
cut -d',' -f3 contacts.txt
```

Sort alphabetically:
```bash
sort contacts.txt
```

Count contacts:
```bash
wc -l contacts.txt
```

#### Task 3: Advanced Processing

Research and use:
- `grep` - find contacts with specific domain
- `sed` - replace phone numbers
- `awk` - reformat the list

---

### Extension 7: Log File Analysis
**Time**: 20 minutes

Practice analyzing system logs.

#### View System Logs

```bash
# See recent system messages
dmesg | tail -20

# View authentication log
tail -20 /var/log/auth.log

# Check kernel messages
tail -20 /var/log/kern.log
```

#### Create Your Own Log

Create `activity-log.txt` that records:
- Date/time of actions
- What you did
- Results

Example script:
```bash
#!/bin/bash
# log-activity.sh
LOG=~/activity-log.txt
echo "$(date): Ran activity log script" >> $LOG
echo "$(date): Current directory: $(pwd)" >> $LOG
echo "$(date): Files in directory: $(ls | wc -l)" >> $LOG
```

Run it several times, then analyze your log!

---

### Extension 8: Create a Personal Command Library
**Time**: 40 minutes

Build a collection of useful one-liners.

#### Create `my-commands.txt`:

Document useful command combinations:

```
# System Information
uptime                          # How long system has been running
df -h                           # Disk space usage
free -h                         # Memory usage
cat /proc/cpuinfo | grep processor | wc -l  # CPU cores

# File Finding
find ~ -name "*.txt" -type f    # Find all text files
find ~ -mtime -7                # Files modified in last 7 days
find ~ -size +1M                # Files larger than 1MB

# Text Processing
grep "error" logfile.txt        # Find errors in log
grep -r "TODO" ~/Documents      # Find TODO comments
wc -l *.txt                     # Count lines in all text files

# Network
ping -c 4 google.com            # Test internet connection
ifconfig                        # Network configuration
hostname -I                     # Show IP address

# System Monitoring
top                             # Process monitor
ps aux                          # All running processes
uptime                          # System load

# Disk Usage
du -sh ~/Documents              # Size of Documents folder
du -h --max-depth=1 ~           # Size of each folder in home

# Useful Aliases (add to ~/.bashrc)
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias h='history'
```

Test each command and add notes about when it's useful!

---

### Extension 9: Raspberry Pi Specific Commands
**Time**: 20 minutes

Learn commands specific to Raspberry Pi.

#### Configuration Commands

```bash
# Raspberry Pi configuration tool
sudo raspi-config

# Check temperature
vcgencmd measure_temp

# Check voltage
vcgencmd measure_volts

# GPU memory split
vcgencmd get_mem gpu
vcgencmd get_mem arm

# Check throttling status
vcgencmd get_throttled
```

#### Document Your Findings

Create `rpi-system-info.txt` with output from each command.

---

### Extension 10: Automation Project
**Time**: 1 hour

Create a complete automation solution.

#### Project: Automated Morning Routine

Create a script that runs every morning:

```bash
#!/bin/bash
# morning-routine.sh

echo "=== Good Morning System Check ==="
echo ""

echo "Date: $(date)"
echo ""

echo "System Uptime:"
uptime
echo ""

echo "Temperature:"
vcgencmd measure_temp
echo ""

echo "Disk Space:"
df -h / | tail -1
echo ""

echo "Memory:"
free -h | grep Mem
echo ""

echo "Today's Agenda:"
cat ~/Documents/agenda.txt 2>/dev/null || echo "No agenda file found"
echo ""

echo "=== Have a great day! ==="
```

#### Make It Automatic

Research how to use `crontab` to run this script automatically each morning!

---

## Homework Submission Checklist

### Required Assignments:
- [ ] Daily command practice (all 5 days)
- [ ] Command reference sheet created
- [ ] Directory organization project completed
- [ ] Reflection essay written (150+ words)
- [ ] All files saved in correct locations
- [ ] Files properly named

### Optional Extensions (turn in any you complete):
- [ ] Advanced Navigation Challenge
- [ ] Shell Script Portfolio
- [ ] Command Line Research
- [ ] File Management Challenge
- [ ] Command Line Games
- [ ] Advanced Text Manipulation
- [ ] Log File Analysis
- [ ] Personal Command Library
- [ ] Raspberry Pi Specific Commands
- [ ] Automation Project

---

## Grading Rubric

### Required Homework (100 points total)

**Daily Practice (20 points)**
- Completed all 5 days
- Logged completion dates
- Evidence of practice

**Command Reference (30 points)**
- All sections included
- Clear descriptions
- Useful examples
- Proper formatting

**Directory Organization (30 points)**
- Correct structure created
- README.txt complete
- Verification file included
- Used only Terminal commands

**Reflection Essay (20 points)**
- 150+ words
- Answers all questions
- Complete sentences
- Good spelling/grammar

### Extension Activities (Bonus points)
- Each completed extension: +5 bonus points
- Maximum bonus: +25 points

---

## Tips for Success

### Organization
- Keep all homework in `~/Documents/week-02-homework/`
- Use clear, descriptive filenames
- Document your commands as you go

### Quality Work
- Test all commands before submitting
- Proofread text files
- Verify directory structures
- Check that scripts work

### Ask for Help
- Command not working? Check spelling
- Error message? Read it carefully
- Still stuck? Ask instructor or classmate
- Use `man` command for help

### Going Beyond
- Extensions are optional but valuable
- They help you learn more
- Great for portfolios
- Show initiative and curiosity

---

## Next Week Preview

**Week 3: Python Programming Basics**

We'll learn:
- Variables and data types
- Input and output
- Conditional statements
- Loops and functions
- Writing Python programs in Terminal

**To prepare**: Make sure you're comfortable with:
- Creating and editing text files
- Navigating directories
- Running commands from Terminal

---

## Resources

### Online Practice
- **OverTheWire Bandit**: Linux command-line game
- **Codecademy**: Learn the Command Line
- **Linux Journey**: Free tutorials

### Reference Sites
- **ExplainShell.com**: Explains command syntax
- **TLDR Pages**: Simplified man pages
- **SS64 Bash**: Command reference

### Communities
- Raspberry Pi Forums
- Reddit: r/linux4noobs
- Stack Overflow: linux tag

---

**Good luck with Week 2 homework!**

Remember: The command line is a skill that improves with practice. Don't expect to memorize everything - focus on understanding concepts and knowing where to find help!
