# Week 2: Linux Basics & Command Line

## Overview
Students will learn to navigate and control their Raspberry Pi using the command line interface (Terminal). This week introduces fundamental Linux concepts and basic shell commands that form the foundation for all future programming and hardware projects.

## Learning Objectives
By the end of this week, students will be able to:
1. Understand the Linux file system hierarchy
2. Navigate directories using command-line commands
3. Create, move, copy, and delete files and folders
4. View and edit text files using the Terminal
5. Understand file permissions basics
6. Use command-line shortcuts and tab completion
7. Write and execute simple shell scripts

## Prerequisites
- Completed Week 1: Raspberry Pi setup and basic desktop navigation
- Comfortable with keyboard and mouse
- Understanding of files and folders concept

## Materials Needed
- Raspberry Pi setup from Week 1
- All peripherals (monitor, keyboard, mouse)
- Internet connection (for downloading examples)
- USB flash drive (optional, for file backup practice)

## Session Structure

### Part 1: Lecture (45-50 minutes)
- Why use the command line?
- Introduction to the Terminal
- File system structure in Linux
- Essential commands overview
- Command syntax and structure

**Location**: `lecture/week-02-lecture-notes.md`

### Part 2: Guided Practice (30-40 minutes)
- Opening Terminal
- Basic navigation commands (pwd, ls, cd)
- File operations (touch, mkdir, cp, mv, rm)
- Viewing files (cat, less, head, tail)
- Text editing with nano

**Location**: `activities/guided-practice.md`

### Part 3: Independent Exploration (15-20 minutes)
- Command challenges
- File system scavenger hunt
- Creating directory structures
- Text file creation and editing

**Location**: `activities/exploration-challenges.md`

## Key Vocabulary
- **Terminal**: Text-based interface for controlling the computer
- **Shell**: Program that interprets commands (bash on Raspberry Pi)
- **Command**: Instruction given to the computer
- **Directory**: Folder in the file system
- **Path**: Location of a file or directory
- **Absolute Path**: Complete path from root (starts with /)
- **Relative Path**: Path from current location
- **Root**: Top level of file system (/)
- **Home Directory**: User's personal folder (~)
- **Arguments**: Options or inputs given to commands
- **Flag/Option**: Modifier for command behavior (starts with -)
- **sudo**: "Super User Do" - run commands with admin privileges
- **Wildcard**: Special character (* or ?) for pattern matching

## Command Reference (Quick List)
```bash
pwd           # Print working directory
ls            # List files
cd            # Change directory
mkdir         # Make directory
touch         # Create empty file
cp            # Copy
mv            # Move/rename
rm            # Remove
cat           # Display file contents
less          # View file with scrolling
head          # Show first lines
tail          # Show last lines
nano          # Text editor
clear         # Clear screen
man           # Manual pages
history       # Command history
```

## Assessment
- **Formative**: Command challenges completed during class
- **Checklist**: Can navigate to specific directories independently
- **Practical**: Create a directory structure and files using only Terminal
- **Quiz**: Identify what various commands do

## Homework/Extension
- Create a personal file organization system
- Write a simple shell script
- Practice commands with online challenges
- Create a command reference cheat sheet

## Resources
- Linux Command Line cheat sheet
- Video: "Terminal Basics for Beginners"
- Interactive Terminal tutorial links
- Common error messages guide

## Troubleshooting Common Issues
See `resources/troubleshooting-week-02.md` for solutions to common command-line problems.

## Next Week Preview
Week 3 will introduce Python programming fundamentals. Students should be comfortable with creating and editing text files in the Terminal before moving forward.

## Connection to Future Weeks
- **Week 3**: Write Python programs using command line
- **Week 4**: Control GPIO pins with terminal commands
- **Week 6**: SSH into Raspberry Pi for robot control
- **Week 11**: Set up computing cluster using terminal commands

The command line is the gateway to everything else in this course!
