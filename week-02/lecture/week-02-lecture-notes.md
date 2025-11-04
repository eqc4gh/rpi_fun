# Week 2 Lecture: Linux Basics & Command Line

## Duration: 45-50 minutes

---

## Part 1: Why Use the Command Line? (8 minutes)

### Opening Question
**Ask students**: "Who has seen someone typing commands in a black window in movies? What were they doing?"

### The Power of Text Commands

**Show students**: Open Terminal next to File Manager
- File Manager: Click, drag, point
- Terminal: Type commands

**Question**: "Which seems faster? Easier?"

### Why Learn Terminal When We Have a Desktop?

#### 1. **Power and Precision** 🎯
- Do complex tasks with one command
- Automate repetitive actions
- More control than clicking

**Example**: 
- GUI: Right-click → New Folder → Type name → Enter (repeat 10 times)
- Terminal: `mkdir folder{1..10}` → Creates 10 folders instantly!

#### 2. **Works Everywhere** 🌍
- All Linux/Mac computers
- Servers (no desktop!)
- Remote connections (SSH)
- Embedded systems

#### 3. **Automation** 🤖
- Write scripts to do tasks automatically
- Save time on repetitive work
- Run tasks while you sleep!

#### 4. **Professional Skill** 💼
- Programmers use it daily
- System administrators live in it
- Data scientists rely on it
- Web developers need it

#### 5. **Understanding** 🧠
- See what's really happening
- Learn how computers actually work
- Debugging and troubleshooting
- Control over your system

### Real-World Uses
- **Web developers**: Deploy websites
- **Data scientists**: Process large datasets
- **System administrators**: Manage servers
- **Hackers (good ones!)**: Security testing
- **Scientists**: Run simulations
- **You**: Control your Raspberry Pi projects!

---

## Part 2: Introduction to the Terminal (10 minutes)

### What is the Terminal?

**Terminal** = Text-based interface to control your computer

**Components**:
1. **Terminal**: The window (like a frame)
2. **Shell**: The program inside (bash on Raspberry Pi)
3. **Prompt**: Where you type commands

### Opening Terminal

**Three ways**:
1. Click Terminal icon in menu bar
2. Menu → Accessories → Terminal
3. Keyboard shortcut: `Ctrl + Alt + T`

**Demonstrate**: Open Terminal

### Understanding the Prompt

```bash
pi@raspberrypi:~ $
```

Let's break it down:
- `pi` = Your username
- `@` = "at"
- `raspberrypi` = Computer name (hostname)
- `:` = Separator
- `~` = Current directory (~ means home)
- `$` = Ready for command (regular user)
  - `#` would mean root/admin user

**Read it**: "User pi at computer raspberrypi in home directory, ready for command"

### Your First Command

```bash
date
```

**Type it and press Enter**

Output: Current date and time!

**What just happened?**
1. You typed a command
2. Shell read it
3. Shell found the `date` program
4. Program ran and showed output
5. Prompt returned (ready for next command)

### More Simple Commands

Try these:
```bash
# Display calendar
cal

# Show current month's calendar
cal 2025

# Who am I? (username)
whoami

# What computer is this?
hostname

# Display a message
echo "Hello Raspberry Pi!"

# Calculate math
echo $((5 + 3))
```

**Key Learning**: Commands do specific tasks when you press Enter

---

## Part 3: File System Structure (12 minutes)

### The Linux File System Tree

Everything starts at **root** (/)

```
/                           (root - top of everything)
├── home/                   (user home directories)
│   └── pi/                (your home directory)
│       ├── Desktop/
│       ├── Documents/
│       ├── Downloads/
│       ├── Pictures/
│       └── Videos/
├── bin/                    (essential programs)
├── etc/                    (configuration files)
├── var/                    (variable data, logs)
├── tmp/                    (temporary files)
├── usr/                    (user programs)
└── boot/                   (boot files)
```

### Important Directories

#### `/home/pi/` - Your Home 🏠
- Your personal space
- Your files and folders
- Like "My Documents" in Windows
- Shortcut: `~` (tilde)

#### `/` - Root 🌳
- Top of the file system tree
- Everything branches from here
- Need admin rights to change most things

#### `/bin/` and `/usr/bin/` - Programs 📦
- Where commands/programs live
- When you type `ls`, it runs `/bin/ls`

#### `/etc/` - Configuration ⚙️
- System settings
- Usually need sudo to change

#### `/tmp/` - Temporary 🗑️
- Temporary files
- Gets cleaned out
- Safe place to experiment

### Paths: How to Describe Locations

#### Absolute Path
- Complete address from root
- Always starts with `/`
- Works from anywhere

Example: `/home/pi/Documents/school.txt`

#### Relative Path
- From where you are now
- No leading `/`
- Changes based on current location

Example: `Documents/school.txt` (if you're in /home/pi)

### Special Path Symbols

```bash
~       # Home directory (/home/pi)
.       # Current directory
..      # Parent directory (one level up)
/       # Root directory
-       # Previous directory
```

**Examples**:
- `~/Documents` = `/home/pi/Documents`
- `./file.txt` = File in current directory
- `../` = Go up one level

---

## Part 4: Essential Navigation Commands (8 minutes)

### Command #1: `pwd` - Print Working Directory

**What it does**: Shows where you are

```bash
pwd
```

Output: `/home/pi`

**Think**: "Where am I right now?"

### Command #2: `ls` - List

**What it does**: Shows files and folders

```bash
ls                  # List files
ls -l              # Long format (detailed)
ls -a              # Show hidden files (start with .)
ls -lh             # Long format, human-readable sizes
ls -lha            # All options combined!
```

**Options explained**:
- `-l` = Long format (permissions, owner, size, date)
- `-a` = All files (including hidden)
- `-h` = Human-readable sizes (KB, MB, GB)

**Try it**: `ls -lh`

### Command #3: `cd` - Change Directory

**What it does**: Move to different directory

```bash
cd Documents        # Go to Documents
cd ..              # Go up one level
cd ~               # Go to home
cd /               # Go to root
cd -               # Go to previous directory
```

**Practice sequence**:
```bash
pwd                 # Where am I?
cd Documents        # Go to Documents
pwd                 # Confirm I moved
cd ..              # Go back up
pwd                 # Back to home
```

### The Tab Completion Shortcut ⌨️

**Life-changing tip**: Press TAB to auto-complete!

```bash
cd Doc[TAB]        # Completes to "Documents"
cd D[TAB][TAB]     # Shows all directories starting with D
```

**Advantages**:
- Faster typing
- No typos
- See available options

**Try it now!** Type `cd Do` then press TAB

---

## Part 5: File and Directory Operations (10 minutes)

### Creating Things

#### `mkdir` - Make Directory

```bash
mkdir projects              # Create one folder
mkdir folder1 folder2       # Create multiple
mkdir -p path/to/folder    # Create nested folders
```

**The `-p` flag**: Creates parent directories too!

Without `-p`:
```bash
mkdir a/b/c                # ERROR if 'a' doesn't exist
```

With `-p`:
```bash
mkdir -p a/b/c             # Creates a, then b, then c
```

#### `touch` - Create Empty File

```bash
touch file.txt             # Create empty file
touch file1.txt file2.txt  # Create multiple files
```

**Note**: If file exists, updates timestamp (doesn't delete content)

### Copying Things

#### `cp` - Copy

```bash
cp file.txt backup.txt           # Copy file
cp file.txt ~/Documents/         # Copy to another directory
cp -r folder1 folder2            # Copy directory (recursive)
```

**Important**: `-r` flag needed for directories (recursive = include everything inside)

### Moving and Renaming

#### `mv` - Move (also renames!)

```bash
mv oldname.txt newname.txt       # Rename file
mv file.txt ~/Documents/         # Move file
mv folder1 folder2               # Rename/move folder
```

**Key insight**: In Linux, moving and renaming are the same operation!

### Deleting Things ⚠️

#### `rm` - Remove

```bash
rm file.txt                      # Delete file
rm file1.txt file2.txt          # Delete multiple
rm -r folder/                    # Delete directory and contents
rm -i file.txt                   # Interactive (asks first)
```

**DANGER ZONE** ☠️:
```bash
rm -rf /                         # DON'T DO THIS! Deletes EVERYTHING
```

**Safety tips**:
- Use `-i` flag when learning (interactive mode)
- Double-check before pressing Enter
- Start with `ls` to see what you're deleting
- No undo in Terminal!
- Can't get files back from Trash

**Practice with safety**:
```bash
mkdir test_delete
cd test_delete
touch dummy.txt
ls                               # Confirm file exists
rm -i dummy.txt                  # Will ask "remove dummy.txt? (y/n)"
```

---

## Part 6: Viewing File Contents (5 minutes)

### `cat` - Concatenate (show all)

```bash
cat file.txt                     # Display entire file
cat file1.txt file2.txt          # Display multiple files
```

**Best for**: Short files

### `less` - View with Scrolling

```bash
less file.txt
```

**Controls in less**:
- `Space` = Next page
- `b` = Previous page
- `/word` = Search for "word"
- `q` = Quit

**Best for**: Long files you want to browse

### `head` - First Lines

```bash
head file.txt                    # First 10 lines
head -n 5 file.txt              # First 5 lines
```

### `tail` - Last Lines

```bash
tail file.txt                    # Last 10 lines
tail -n 20 file.txt             # Last 20 lines
tail -f logfile.txt             # Follow (show new lines as added)
```

**The `-f` flag**: Useful for watching log files in real-time!

---

## Part 7: Text Editing with Nano (3 minutes)

### Why Nano?

- Built into Raspberry Pi OS
- Easy to use
- Shows keyboard shortcuts at bottom
- Great for beginners

### Opening Nano

```bash
nano filename.txt                # Edit existing or create new
```

### Basic Nano Operations

**Bottom of screen shows shortcuts**:
- `^` means "Ctrl"
- `Ctrl + O` = Save (Write Out)
- `Ctrl + X` = Exit
- `Ctrl + K` = Cut line
- `Ctrl + U` = Paste
- `Ctrl + W` = Search

**Practice**:
1. Type: `nano hello.txt`
2. Type some text
3. Press `Ctrl + O` to save
4. Press `Enter` to confirm filename
5. Press `Ctrl + X` to exit

---

## Part 8: Getting Help (2 minutes)

### The `man` Command - Manual Pages

```bash
man ls                           # Manual for ls command
man mkdir                        # Manual for mkdir
```

**Navigation in man pages**:
- `Space` = Next page
- `q` = Quit
- `/word` = Search

### Command Help Flag

```bash
ls --help                        # Quick help for ls
mkdir --help                     # Quick help for mkdir
```

### History Command

```bash
history                          # Show command history
history | grep cd               # Find all cd commands
!5                              # Run command #5 from history
!!                              # Run last command
```

---

## Part 9: Command Structure & Syntax (2 minutes)

### General Pattern

```bash
command [options] [arguments]
```

**Example**: `ls -lh /home/pi`
- `ls` = command
- `-lh` = options (flags)
- `/home/pi` = argument (what to list)

### Options (Flags)

**Short form**: `-h` (single dash, one letter)
**Long form**: `--help` (double dash, full word)
**Combined**: `-lha` = `-l -h -a`

### Arguments

- What the command acts on
- Files, directories, text, etc.
- Some commands require them, some don't

---

## Summary & Key Takeaways (2 minutes)

### What We Learned Today:

1. ✓ Terminal is a powerful text-based interface
2. ✓ File system is organized in a tree from `/` (root)
3. ✓ Navigation: `pwd`, `ls`, `cd`
4. ✓ File operations: `mkdir`, `touch`, `cp`, `mv`, `rm`
5. ✓ Viewing files: `cat`, `less`, `head`, `tail`
6. ✓ Editing: `nano`
7. ✓ Getting help: `man`, `--help`

### Why This Matters:

- Foundation for everything else in this course
- Professional skill used daily in tech careers
- More powerful than GUI for many tasks
- Essential for remote work and automation

### Tips for Success:

1. **Practice regularly** - muscle memory matters
2. **Use Tab completion** - save time and avoid typos
3. **Read error messages** - they usually tell you what's wrong
4. **Start with `ls`** - always look before you leap
5. **Use `-i` flag** - safety first when deleting
6. **Don't fear mistakes** - (almost) everything is fixable

---

## Discussion Questions

1. When might the command line be faster than using the desktop?
2. What's the difference between moving and copying a file?
3. Why is the `-r` flag needed for copying directories?
4. What could go wrong if you use `rm` without being careful?
5. How is the Linux file system like a tree?

---

## Demonstration: Real-World Scenario

**Scenario**: "I need to create a project folder structure for a school assignment with multiple chapters"

**GUI way**:
1. Open File Manager
2. Right-click → New Folder → "project"
3. Double-click to enter
4. Right-click → New Folder → "chapter1"
5. Repeat for chapter2, chapter3...
6. In each chapter, create files...
(10+ minutes of clicking)

**Terminal way**:
```bash
mkdir -p project/chapter{1..5}
touch project/chapter1/notes.txt
touch project/chapter2/notes.txt
# ... and so on
```
(30 seconds!)

**Point**: This is the power of the command line!

---

## Transition to Hands-On

"Now that we understand the basics, let's get our hands on the keyboard! We'll practice these commands step by step. Remember: making mistakes is part of learning. The Terminal won't explode if you type something wrong - it will just tell you there's an error. Let's dive in!"

---

## Quick Reference Card (for students to keep)

```
NAVIGATION          FILE OPERATIONS      VIEWING
pwd                 mkdir                cat
ls                  touch                less
cd                  cp                   head
                    mv                   tail
                    rm                   nano

GETTING HELP        SHORTCUTS
man                 Tab - auto-complete
--help              Ctrl+C - cancel
history             Ctrl+D - exit/logout
                    Ctrl+L - clear screen
```
