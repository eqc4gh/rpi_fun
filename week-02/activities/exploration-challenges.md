# Week 2 Exploration Challenges

Work through these challenges independently to strengthen your command-line skills!

---

## Challenge 1: Terminal Scavenger Hunt (15 minutes)

Use Terminal commands to find these answers. Write down the command you used for each!

### Basic Discoveries

1. **What is the full path to your home directory?**
   - Command: _______________
   - Answer: _______________

2. **How many items are in your Documents folder?**
   - Command: _______________
   - Answer: _______________

3. **What hidden files exist in your home directory?**
   - Command: _______________
   - List 3: _______________, _______________, _______________

4. **What is the size of your Desktop folder?**
   - Command: _______________
   - Answer: _______________

5. **Find a file that ends with `.txt` in your home directory**
   - Command: _______________
   - Answer: _______________

### Advanced Discoveries

6. **How many directories are in /usr/?**
   - Command: _______________
   - Answer: _______________

7. **What is your current username?**
   - Command: _______________
   - Answer: _______________

8. **What is your Raspberry Pi's hostname?**
   - Command: _______________
   - Answer: _______________

9. **How much disk space is available on your SD card?**
   - Command: _______________
   - Answer: _______________

10. **What is the last command you typed?**
    - Command: _______________
    - Answer: _______________

---

## Challenge 2: Directory Master (10 minutes)

Create this exact directory structure in ~/Documents using ONLY the Terminal:

```
course-files/
├── week-01/
│   ├── homework/
│   └── notes/
├── week-02/
│   ├── homework/
│   └── notes/
├── week-03/
│   ├── homework/
│   └── notes/
└── resources/
    ├── cheatsheets/
    └── examples/
```

### Your Solution

Write the commands you used:
```bash
# Command 1:

# Command 2:

# Command 3:

# etc...
```

### Verification

Use this command to verify your structure:
```bash
ls -R ~/Documents/course-files
```

**Bonus**: Can you create this in a single command? (Hint: Use curly braces and `-p`)

---

## Challenge 3: File Creation Speed Run (5 minutes)

**Goal**: Complete these tasks as quickly as possible!

### Tasks

1. Create a folder called `speed-test` in Documents
2. Go into that folder
3. Create 10 files named `file-1.txt` through `file-10.txt`
4. Create 3 folders named `folder-a`, `folder-b`, `folder-c`
5. Move files 1-3 into folder-a
6. Move files 4-6 into folder-b
7. Move files 7-9 into folder-c
8. Delete file-10.txt
9. Copy folder-a to folder-a-backup
10. Verify everything with `ls -R`

### Your Time: _____ minutes

### Challenge yourself to do it in under 3 minutes!

**Hint**: Look for patterns - can you create multiple files with one command?

---

## Challenge 4: Command Archaeology (10 minutes)

Explore your Raspberry Pi's file system to discover interesting things!

### Exploration Tasks

1. **Find 3 commands you haven't used yet**
   - Go to `/bin/` and list files
   - Pick 3 interesting names
   - Use `man` or `--help` to learn what they do
   
   Command 1: _____________ does _____________
   Command 2: _____________ does _____________
   Command 3: _____________ does _____________

2. **Explore /etc/ directory**
   - What type of files are stored here?
   - Answer: _____________

3. **Check out /tmp/ directory**
   - What's in here?
   - Why might files be here temporarily?
   - Answer: _____________

4. **Investigate your boot configuration**
   ```bash
   cat /boot/config.txt | less
   ```
   - This file configures your Raspberry Pi!
   - Find one setting and describe what you think it does:
   - Answer: _____________

---

## Challenge 5: Text File Olympics (15 minutes)

Master file content manipulation!

### Event 1: Create a Story

Create a file called `story.txt` with at least 5 lines using only Terminal commands (no nano).

**Hint**: Use `echo` with `>` and `>>`

Commands used:
```bash



```

### Event 2: Combine Files

1. Create 3 files: `part1.txt`, `part2.txt`, `part3.txt`
2. Put different content in each
3. Combine all 3 into `complete.txt` (in order)

Commands used:
```bash



```

### Event 3: Find and Count

Create a file with 20 lines, then:
1. Display only lines 5-10
2. Count the total number of lines
3. Find a specific word in the file

Commands used:
```bash



```

### Event 4: The Reverse Challenge

1. Create a file with 10 lines
2. Display it backwards (last line first)

**Hint**: Research the `tac` command (cat backwards!)

Command used:
```bash

```

---

## Challenge 6: Nano Mastery (10 minutes)

Become a Nano power user!

### Task 1: Create a Formatted Document

Use `nano` to create a file called `about-me.txt` with:
- Your name
- Your favorite subject
- Why you're interested in Raspberry Pi
- 3 things you want to learn

**Bonus**: Use proper formatting with blank lines and punctuation

### Task 2: Edit Existing File

1. Create a file with 10 lines of text
2. Open in nano
3. Practice these operations:
   - Delete a line (Ctrl+K)
   - Move to the end (Ctrl+End or Ctrl+V)
   - Search for a word (Ctrl+W)
   - Replace text (Ctrl+\)
   - Save and exit

Which shortcuts did you find most useful?
Answer: _____________

### Task 3: Configuration File Practice

Open this system file (read-only):
```bash
nano /etc/hostname
```

- What's in this file?
- Answer: _____________

**Don't save changes!** Just look and exit with Ctrl+X

---

## Challenge 7: Path Puzzler (10 minutes)

Test your understanding of paths!

### Absolute vs Relative

For each scenario, write BOTH the absolute and relative path:

**Scenario 1**: You're in `/home/pi/Documents` and want to go to `Downloads`
- Absolute: _____________
- Relative: _____________

**Scenario 2**: You're in `/home/pi/Desktop` and want to go to `/usr/bin`
- Absolute: _____________
- Relative: _____________

**Scenario 3**: You're in `/home/pi/Documents/projects/week1` and want to go to `/home/pi/Documents/projects/week2`
- Absolute: _____________
- Relative: _____________

**Scenario 4**: You're in `/etc` and want to go to your home directory
- Absolute: _____________
- Relative: _____________

### Special Symbols Quiz

What do these symbols mean?

1. `~` : _____________
2. `.` : _____________
3. `..` : _____________
4. `/` : _____________
5. `-` : _____________

---

## Challenge 8: Command Chaining (Advanced, 10 minutes)

Learn to combine commands with pipes (`|`) and operators!

### Example: Counting Files
```bash
ls | wc -l
```
This lists files, then counts the lines (number of files)

### Your Challenges

1. **Find and count `.txt` files in Documents**
   ```bash
   
   ```

2. **Display only the first 5 filenames in alphabetical order**
   ```bash
   
   ```

3. **Show your 10 most recent commands**
   ```bash
   
   ```

4. **Create a file and immediately view it**
   ```bash
   
   ```

### Operators to Explore

- `|` (pipe): Send output of one command to another
- `>` : Write output to file (overwrite)
- `>>` : Append output to file
- `&&` : Run second command if first succeeds
- `||` : Run second command if first fails

**Experiment with these!**

---

## Challenge 9: Error Detective (10 minutes)

Learn from mistakes! Each command below has an error. Find it and fix it.

### Broken Commands

1. ```bash
   pwwd
   ```
   - Error: _____________
   - Fixed: _____________

2. ```bash
   cd Documments
   ```
   - Error: _____________
   - Fixed: _____________

3. ```bash
   mkdir -p projects/week1
   rm -r projects
   cd projects/week1
   ```
   - Error: _____________
   - Fixed: _____________

4. ```bash
   touch file.txt
   cat fille.txt
   ```
   - Error: _____________
   - Fixed: _____________

5. ```bash
   cp documents backup
   ```
   - Error (if documents is a folder): _____________
   - Fixed: _____________

---

## Challenge 10: Shell Script Introduction (15 minutes)

Create your first shell script!

### Task: Create a Backup Script

1. Create a file called `backup.sh`:
   ```bash
   nano backup.sh
   ```

2. Add these lines:
   ```bash
   #!/bin/bash
   # My First Backup Script
   
   echo "Starting backup..."
   mkdir -p ~/backups
   cp -r ~/Documents ~/backups/documents-backup
   echo "Backup complete!"
   echo "Files backed up to ~/backups/"
   ```

3. Save and exit (Ctrl+O, Enter, Ctrl+X)

4. Make it executable:
   ```bash
   chmod +x backup.sh
   ```

5. Run it:
   ```bash
   ./backup.sh
   ```

### Verify It Worked

```bash
ls -l ~/backups/
```

You should see your Documents folder backed up!

### Modify the Script

Add a line that displays the date:
```bash
echo "Backup created on: $(date)"
```

### Challenge Extension

Create a script that:
- Creates a project folder structure
- Creates some template files
- Displays a success message

---

## Challenge 11: Keyboard Shortcut Master (5 minutes)

Practice these Terminal keyboard shortcuts:

### Movement Shortcuts

Try typing a long command, then practice:

1. `Ctrl + A` - Move to beginning of line
2. `Ctrl + E` - Move to end of line
3. `Ctrl + U` - Clear line before cursor
4. `Ctrl + K` - Clear line after cursor
5. `Ctrl + W` - Delete word before cursor
6. `Ctrl + L` - Clear screen (same as `clear`)
7. `Ctrl + C` - Cancel current command
8. `Ctrl + D` - Exit terminal

### Practice Exercise

1. Type: `cd /usr/bin/test`
2. Use `Ctrl + A` to go to start
3. Add `ls -l ` at the beginning
4. Press `Ctrl + E` to go to end
5. Backspace to delete `/test`
6. Press Enter

Which shortcuts will you use most?
Answer: _____________

---

## Challenge 12: Real-World Scenario (20 minutes)

**Scenario**: You're organizing files for a class project

### Requirements

1. Create a project structure in `~/Documents/science-project/`
2. Include folders for: research, data, analysis, presentation
3. Create a README.txt file with project description
4. Create a log.txt file that records when you started
5. Create sample data files in the data folder
6. Copy your project structure as a backup
7. Create a script that displays your project's structure

### Document Your Process

Write down every command you use:

```bash
# Step 1: Create main folder


# Step 2: Create subfolders


# Step 3: Create README file


# Continue documenting...
```

### Verify Your Work

Create a file called `project-verification.txt` that contains:
- Output of `ls -R science-project/`
- Contents of README.txt
- Current date and time

---

## Bonus Challenges (For Advanced Students)

### Bonus 1: Find Command

Research the `find` command and use it to:
- Find all `.txt` files in your home directory
- Find files modified in the last 7 days
- Find empty directories

### Bonus 2: Grep Command

Learn `grep` (search text) and:
- Search for a word in a file
- Search for a pattern in all `.txt` files
- Count how many times a word appears

### Bonus 3: Alias Creation

Create custom shortcuts for common commands:
```bash
alias ll='ls -lah'
alias home='cd ~'
```

Add these to `~/.bashrc` to make them permanent!

### Bonus 4: Command History Tricks

Explore history features:
- `!!` - Repeat last command
- `!n` - Repeat command number n
- `!string` - Repeat last command starting with "string"
- `Ctrl + R` - Search command history

---

## Reflection Questions

After completing these challenges, answer:

1. **Which command did you find most useful?**
   Answer: _____________

2. **What was the most challenging part?**
   Answer: _____________

3. **How does the Terminal compare to using the desktop GUI?**
   Answer: _____________

4. **What would you like to do next with the command line?**
   Answer: _____________

---

## Completion Checklist

Mark off challenges as you complete them:

- [ ] Challenge 1: Terminal Scavenger Hunt
- [ ] Challenge 2: Directory Master
- [ ] Challenge 3: File Creation Speed Run
- [ ] Challenge 4: Command Archaeology
- [ ] Challenge 5: Text File Olympics
- [ ] Challenge 6: Nano Mastery
- [ ] Challenge 7: Path Puzzler
- [ ] Challenge 8: Command Chaining
- [ ] Challenge 9: Error Detective
- [ ] Challenge 10: Shell Script Introduction
- [ ] Challenge 11: Keyboard Shortcut Master
- [ ] Challenge 12: Real-World Scenario

**Bonus Challenges**:
- [ ] Find Command
- [ ] Grep Command
- [ ] Alias Creation
- [ ] Command History Tricks

---

## Achievement Unlocked! 🏆

If you completed all main challenges, you've mastered:
- ✓ File system navigation
- ✓ File and directory operations
- ✓ Text viewing and editing
- ✓ Command-line efficiency
- ✓ Problem-solving with Terminal
- ✓ Basic shell scripting

**You're ready for Week 3: Python Programming!**

---

## Share Your Solutions

Discuss with classmates:
- Which challenges were easiest?
- Which were hardest?
- What creative solutions did you find?
- What did you learn that surprised you?

**Remember**: There are often multiple ways to solve the same problem in the Terminal. Different solutions can all be correct!
