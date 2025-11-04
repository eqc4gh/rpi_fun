# Week 2 Instructor Guide

Quick reference for teaching Week 2: Linux Basics & Command Line

---

## Pre-Class Preparation

### Materials Check
- [ ] All students have working Raspberry Pi from Week 1
- [ ] Students can successfully log in
- [ ] Terminal accessible (test opening it)
- [ ] Projector/screen for demonstrations
- [ ] Backup keyboard if students' fail
- [ ] Printed command reference sheets (optional but helpful)

### Instructor Preparation
- [ ] Review all lecture notes thoroughly
- [ ] Practice demonstration scripts
- [ ] Test all commands on your Raspberry Pi
- [ ] Prepare common error scenarios
- [ ] Have troubleshooting guide ready
- [ ] Review Week 1 concepts (quick refresh)

### Room Setup
- [ ] Students can see instructor screen
- [ ] Adequate space between students for individual work
- [ ] Power strips accessible
- [ ] Good lighting for typing

---

## Class Timeline (90-100 minutes)

### 0:00-0:05 - Welcome & Week 1 Review (5 min)

**Quick Review Questions**:
- "Who can tell me what the CPU does?"
- "What's the difference between RAM and storage?"
- "Show me how to properly shutdown your Pi"

**Preview Today**:
- "Today we're learning to control the computer with text commands"
- "This might seem old-fashioned, but it's incredibly powerful"
- "By the end, you'll be able to do things faster than with the mouse!"

---

### 0:05-0:50 - Lecture (45 min)

Follow: `lecture/week-02-lecture-notes.md`

**Key Timing**:
- Part 1: Why command line (8 min)
- Part 2: Terminal introduction (10 min)
- Part 3: File system structure (12 min)
- Part 4: Essential commands (8 min)
- Part 5: File operations (10 min)
- Parts 6-9: Remaining topics (flexible)

**Teaching Tips**:

**Demonstrate live**:
- Open Terminal on projector
- Type commands as you teach
- Show mistakes and how to fix them
- Let students see your typing process

**Use analogies**:
- File system = tree (root, branches)
- Directories = folders (physical folders in filing cabinet)
- Commands = sentences (verb + object)
- Home directory = your room in a house

**Engage students**:
- Ask for predictions before running commands
- "What do you think will happen?"
- Have students suggest commands to try
- Encourage questions throughout

**Common Student Concerns**:

"What if I break something?"
- Hard to break things in Terminal from home directory
- We'll work safely in ~/Documents
- System areas are protected

"Why not just use the desktop?"
- Sometimes Terminal is only option (servers, SSH)
- Much faster for repetitive tasks
- Professional skill

"I'm not good at typing"
- Tab completion helps
- Practice makes perfect
- OK to go slowly at first

---

### 0:50-0:55 - Break (5 min)

- Students stretch
- Instructor prepares for hands-on
- Check all students ready to proceed

---

### 0:55-1:30 - Guided Practice (35 min)

Follow: `activities/guided-practice.md`

**Teaching Approach**:

**Show, then do**:
1. Demonstrate command on projector
2. Explain what it does
3. Students type same command
4. Check results

**Circulate constantly**:
- Watch for struggling students
- Catch errors early
- Provide encouragement
- Note common mistakes

**Pace control**:
- Watch the room - if 25% are lost, slow down
- Fast students can help neighbors (carefully supervised)
- Have extension challenges ready for fast finishers

**Exercise Priorities** (if short on time):
1. Exercise 1: Navigation (MUST DO)
2. Exercise 3: Creating files/folders (MUST DO)
3. Exercise 6: Nano (MUST DO)
4. Exercise 4: Copying/moving (IMPORTANT)
5. Exercise 5: Viewing files (IMPORTANT)
6. Exercise 7: Deletion (IMPORTANT - with safety emphasis!)
7. Challenges (IF TIME)

**Common Issues**:

**Typos**:
- Emphasize Tab completion
- Show how to use up arrow for history
- Demonstrate fixing typos with arrow keys

**Case sensitivity**:
- Linux cares about capital/lowercase
- "Documents" ≠ "documents"
- Use Tab completion to avoid this

**Lost in file system**:
- Teach `pwd` early and use often
- Always have students confirm location
- "Everyone, type `pwd` and tell me where you are"

**Mistakes with rm**:
- Start with test folder
- Use `-i` flag
- Emphasize NO UNDO
- Create dummy files for practice deletion

---

### 1:30-1:50 - Exploration (20 min)

**Option A: Structured Challenges**
Follow: `activities/exploration-challenges.md`

**Suggested challenges**:
- Challenge 1: Scavenger Hunt (fun, reinforces learning)
- Challenge 2: Directory Master (practical skill)
- Challenge 10: Shell Script Introduction (exciting preview)

**Option B: Free Exploration**
Give students freedom to:
- Create their own file structures
- Practice commands they found interesting
- Help each other
- Start homework

**Instructor Role**:
- Available for questions
- Observe student confidence levels
- Identify students needing extra help
- Prepare for wrap-up

---

### 1:50-2:00 - Wrap-Up (10 min)

**Quick Assessment**:
- "Everyone create a file called 'week2-complete.txt' in your Documents folder"
- Verifies basic competence

**Review Key Concepts**:
- File system hierarchy (show diagram again)
- Essential commands (pwd, ls, cd, mkdir, cp, mv, rm)
- Tab completion
- Getting help (man, --help)

**Preview Homework**:
- Daily command practice
- Command reference sheet
- Directory organization project
- Reflection essay

**Preview Week 3**:
- "Next week: Python programming!"
- "You'll use these Terminal skills to run Python programs"
- "Make sure you're comfortable with creating and editing files"

**Questions & Concerns**:
- Address any confusion
- Remind students to practice daily
- Office hours availability

---

## Differentiation Strategies

### For Struggling Students

**Simplify**:
- Focus on core commands only (pwd, ls, cd, mkdir, touch)
- Provide command cards they can follow
- Partner with stronger student
- One-on-one check-ins
- Written step-by-step guides

**Support**:
- Extra encouragement - "This takes practice!"
- Celebrate small successes
- Don't move on until they have basics
- Homework modifications (fewer requirements)

### For Advanced Students

**Challenge**:
- Shell script challenges
- Research new commands
- Command combinations (pipes, redirection)
- Help design teaching aids
- Create tutorial for other students

**Extensions**:
- Teach them `grep`, `find`, `awk`
- Introduction to bash scripting variables
- System administration tasks
- Network commands

---

## Common Misconceptions

### Address These Explicitly:

❌ **"Terminal is for hackers/experts only"**
✓ It's a tool - anyone can learn it

❌ **"I'll break my computer if I type wrong command"**
✓ Very hard to damage system from user account

❌ **"Commands are too hard to remember"**
✓ You'll remember the ones you use; others, you look up

❌ **"The desktop is always better"**
✓ Each has strengths - Terminal is faster for many tasks

❌ **"rm permanently deletes with no recovery"**
✓ Actually TRUE - use this to teach digital responsibility

---

## Assessment Opportunities

### Formative (During Class)

**Observation checklist**:
- [ ] Can navigate to specific directory
- [ ] Uses Tab completion
- [ ] Creates files and folders
- [ ] Understands relative vs absolute paths
- [ ] Can copy/move/delete safely
- [ ] Uses help commands when stuck
- [ ] Fixes own mistakes

**Quick checks**:
- "Everyone `pwd` and raise hand when you see '/home/pi'"
- "Create a file called 'test.txt' - thumbs up when done"
- "Navigate to your Desktop using the Terminal"

### Summative (Homework)

- Daily practice logs
- Command reference sheet
- Directory organization project
- Reflection essay quality
- Participation in class

---

## Troubleshooting During Class

### Quick Fixes

**Terminal won't open**:
```bash
# Try keyboard shortcut
Ctrl + Alt + T

# Or from menu
Menu → Accessories → Terminal
```

**Student completely lost**:
```bash
# Reset to known location
cd ~
pwd
ls
# Now try again
```

**Deleted important file**:
- First time: Use as learning moment about backups
- Provide backup if available
- Emphasize `-i` flag in future

**Permission denied errors**:
- Check if in system directory
- `cd ~` to get to safe zone
- Explain user vs system files

**Command not found**:
- Check for typos
- Demonstrate Tab completion
- Show `which` command

---

## Safety Protocols

### Emphasize Throughout:

**Safe Practices**:
- ✓ Work in home directory (~/)
- ✓ Use Tab completion
- ✓ Check with `ls` before `rm`
- ✓ Use `-i` flag when learning
- ✓ Test in scratch folder first

**Dangerous Commands** (don't demonstrate!):
- `rm -rf /` - Deletes everything
- `rm -rf ~` - Deletes all user files
- `sudo rm -rf` - Dangerous deletion with admin rights
- `:(){ :|:& };:` - Fork bomb (crashes system)

**If student runs dangerous command**:
- Stop immediately (Ctrl + C)
- Assess damage
- Restore from backup if needed
- Use as teaching moment (without shame)

---

## Demo Scripts Usage

### file-system-demo.sh

**When to use**: After explaining file system hierarchy

**Purpose**: Shows different views of directories

**How to use**:
```bash
cd ~/week-02/demonstrations
chmod +x file-system-demo.sh
./file-system-demo.sh
```

### file-operations-demo.sh

**When to use**: Before guided practice on file operations

**Purpose**: Shows complete workflow

**How to use**: Run as demonstration, have students observe

### text-viewing-demo.sh

**When to use**: When teaching text viewing commands

**Purpose**: Creates sample file and shows different viewing methods

---

## Time Management

### If Running Short on Time

**Priority 1** (Must cover):
- Basic navigation (pwd, ls, cd)
- Creating files/folders (touch, mkdir)
- Nano basics

**Priority 2** (Important):
- Copying and moving
- Viewing files
- Safe deletion

**Priority 3** (Can be homework):
- Advanced commands
- Scripts
- Detailed file permissions

**Cut from lecture if needed**:
- Detailed history of Unix/Linux
- Advanced wildcards
- System administration topics

### If Time Permits

**Additional Topics**:
- Introduction to bash scripting
- Command chaining with pipes
- Text processing with grep
- System monitoring commands
- Customizing bash with aliases

---

## Parent/Guardian Communication

### Email Template

Subject: Week 2 - Command Line Learning

Dear Parents/Guardians,

This week in Raspberry Pi class, students are learning to use the Linux command line (Terminal). This might look like "old computer stuff," but it's actually a crucial modern skill!

**What students are learning**:
- Navigate file systems with text commands
- Create, edit, and organize files
- Professional computing skills used in tech careers

**How to support at home**:
- Let students practice 10 minutes daily
- Don't worry if it looks complicated - it's supposed to be new!
- Ask them to show you one command they learned
- Encourage persistence - this takes practice

**Homework this week**:
- Daily command practice (5 days)
- Create a command reference
- Organize course files
- Reflection essay

This foundation will support all future programming and hardware projects!

[Your name]

---

## Notes Section (Update After Class)

### What Went Well:


### What to Improve:


### Student Challenges:


### Timing Adjustments:


### Effective Explanations:


### Questions to Address Next Week:


---

## Week 3 Preparation

### After Week 2:
- [ ] Grade homework assignments
- [ ] Identify students needing extra help
- [ ] Note common misunderstandings
- [ ] Prepare remedial materials if needed
- [ ] Review Python basics for Week 3
- [ ] Install any needed Python packages
- [ ] Test Python in Terminal on Pi

### Students Should Be Able To:
- Open Terminal confidently
- Navigate file system
- Create and edit text files
- Run commands without fear
- Use help when stuck

**If students can't do these, spend time in Week 3 reviewing before starting Python!**

---

## Additional Resources for Instructors

### Command Line Teaching
- **Explainshell.com**: Visual command breakdown
- **LinuxCommand.org**: Comprehensive tutorial
- **CommandLineFu.com**: Clever command examples

### Videos to Share
- "Linux File System Explained" (various YouTube)
- "Command Line Crash Course" tutorials
- Raspberry Pi Foundation official videos

### Practice Sites
- **OverTheWire Bandit**: Command-line challenges
- **Linux Journey**: Interactive tutorial
- **Terminus**: Command-line game

---

## Success Metrics

Students are succeeding when they:
- Open Terminal without hesitation
- Use Tab completion automatically
- Navigate directories confidently
- Read and understand error messages
- Help peers with simple problems
- Complete tasks faster each day
- Express less frustration over time
- Show curiosity about new commands

---

## Emergency Lesson Plan

### If Technology Fails

**No projector**:
- Write commands on whiteboard
- Students read from printed guides
- Peer demonstrations

**Multiple Pis not working**:
- Pair programming
- Demonstrate on working Pis
- Theory/discussion heavy lesson
- Paper exercises on command syntax

**Complete failure**:
- File system diagram activity
- Command syntax practice on paper
- Watch educational videos
- Plan catch-up session

---

## Final Tips for Week 2

1. **Be patient** - This is very different from desktop computing
2. **Celebrate mistakes** - They're learning opportunities
3. **Live demonstrate everything** - Don't just show slides
4. **Type deliberately** - Students need to see the process
5. **Encourage daily practice** - Skill comes from repetition
6. **Make it relevant** - Connect to real-world uses
7. **Have fun** - Show enthusiasm for the power of command line!

**Remember**: Many students will find this challenging. That's normal! Your encouragement and patience make all the difference.

**Good luck teaching Week 2!** 🚀
