# Week 3 Instructor Guide

## Pre-Class Preparation

### Technical Setup
- [ ] Test that Python 3 is installed on all Raspberry Pis (`python3 --version`)
- [ ] Ensure students can access the terminal
- [ ] Have the Quick Start guide printed or available digitally
- [ ] Test all code examples on a Raspberry Pi beforehand
- [ ] Prepare a shared folder or USB drive for code distribution (optional)

### Materials to Prepare
- [ ] Print Quick Start guides (1 per student recommended)
- [ ] Prepare error examples for debugging practice
- [ ] Have extra USB keyboards handy (typing practice is key)
- [ ] Create a "cheat sheet" poster for the classroom

### Room Setup
- [ ] Arrange students in pairs or small groups for activities
- [ ] Ensure all stations have power and are ready
- [ ] Have projector/screen ready for live coding demos
- [ ] Consider having a "code along" station visible to all

## Lesson Timing (90 minutes total)

### Introduction (5 minutes)
- Welcome and recap of Weeks 1-2
- Overview of today's programming focus
- Set expectations: "Making mistakes is how we learn!"

### Lecture/Demo Segment 1: Python Basics (15 minutes)
- What is Python and why we use it
- Open Python interactive mode together
- Demo: "Hello, World!" in multiple ways
- Quick practice: Everyone types `print("Hello!")` together

### Lecture/Demo Segment 2: Variables and Data Types (15 minutes)
- Explain variables as "labeled boxes"
- Demo creating different types of variables
- Show the `type()` function
- Common mistake: Forgetting quotes around strings

### Break (5 minutes)
- Students stretch, troubleshoot any setup issues

### Lecture/Demo Segment 3: Input/Output and Operators (15 minutes)
- Using `input()` function
- **Critical concept**: Input returns strings
- Show type conversion: `int()`, `float()`, `str()`
- Demo basic math operators
- Quick practice: Simple calculator together

### Group Activity 1 (15 minutes)
- See `activities/01-variables-and-math.md`
- Walk around, help groups debug
- Watch for common errors (see below)

### Lecture/Demo Segment 4: Basic If Statements (10 minutes)
- Introduce decision-making concept
- **Critical**: Emphasize indentation
- Demo if, if-else, if-elif-else
- Show comparison operators

### Group Activity 2 (15 minutes)
- See `activities/02-decision-maker.md`
- Encourage experimentation
- Have groups share their programs

### Wrap-up and Preview (10 minutes)
- Review key concepts
- Answer questions
- Assign homework
- Preview Week 4: "Next week we connect Python to real hardware!"

## Teaching Tips

### Explaining Variables
**Effective Analogy**: "A variable is like a labeled box. You write a name on the box (the variable name), and you put something inside (the value). Later, you can open the box and see what's inside, or replace it with something new."

**Demo Tip**: Use the Python shell interactively:
```python
>>> age = 15
>>> print(age)
15
>>> age = 16
>>> print(age)
16
```

### Common Student Mistakes

#### 1. Forgetting Colons in If Statements
```python
# Wrong - Missing colon
if age > 18
    print("Adult")

# Right
if age > 18:
    print("Adult")
```
**Prevention**: Say out loud "if [condition], then colon!"

#### 2. Incorrect Indentation
```python
# Wrong
if True:
print("Hello")

# Right
if True:
    print("Hello")
```
**Prevention**: Have students press Tab key or 4 spaces consistently. Show visual example of indentation on board.

#### 3. Mixing Types Without Converting
```python
# Wrong
age = input("Age: ")
next_year = age + 1  # Error!

# Right
age = int(input("Age: "))
next_year = age + 1
```
**Prevention**: Always remind students that `input()` returns a string.

#### 4. Using Assignment (=) Instead of Comparison (==)
```python
# Wrong - This assigns, doesn't compare
if age = 18:
    print("Exactly 18")

# Right
if age == 18:
    print("Exactly 18")
```
**Prevention**: "One equal sign is for giving a value. Two equal signs is for checking if equal."

### Debugging Practice
When students encounter errors, teach this process:
1. **Read the error message** - It tells you what's wrong!
2. **Check the line number** - Look at that line and lines above
3. **Common culprits**: Missing colons, wrong indentation, quotes, parentheses
4. **Use print()** - Add print statements to see what's happening

### Differentiation Strategies

**For Struggling Students:**
- Pair with stronger partners
- Provide more scaffolded examples
- Use physical manipulatives (write variables on cards)
- Break problems into smaller steps
- Encourage using the Quick Start guide frequently

**For Advanced Students:**
- Challenge them to solve problems in different ways
- Introduce string methods (`.upper()`, `.lower()`, `.strip()`)
- Have them help struggling peers (teaching reinforces learning)
- Suggest exploring additional operators (`//`, `%`, `**`)
- Ask "What if..." questions to extend activities

### Live Coding Tips
1. **Type, don't copy-paste** - Students learn by watching the process
2. **Make intentional mistakes** - Show how to read and fix errors
3. **Think out loud** - Narrate your thought process
4. **Go slowly** - Pause for students to catch up
5. **Save examples** - Students can reference them later

### Managing the Class

**If Students Finish Early:**
- Have extension challenges ready
- Encourage them to modify their code creatively
- Ask them to help nearby students
- Suggest they start the homework

**If Running Behind:**
- Skip or shorten Activity 2
- Reduce if-elif-else to just if-else
- Assign remaining material as homework reading
- Schedule catch-up time before Week 4

**Handling Questions:**
- Encourage peer helping first
- Write common questions on board
- Address as a group if 3+ students have same issue
- Use "parking lot" for off-topic but interesting questions

## Assessment Checkpoints

### Mid-Lesson Check (after Activity 1)
Can students:
- [ ] Create variables with appropriate names?
- [ ] Use print() to display values?
- [ ] Perform basic arithmetic operations?
- [ ] Use input() to get user data?

### End of Lesson Check (after Activity 2)
Can students:
- [ ] Write simple if-else statements?
- [ ] Use comparison operators correctly?
- [ ] Apply proper indentation?
- [ ] Debug basic syntax errors?

### Homework Assessment
When reviewing homework:
- Check for understanding, not just correctness
- Look for creative solutions
- Note common struggles for next week's review
- Provide encouraging, specific feedback

## Troubleshooting Technical Issues

### Python Won't Start
```bash
# Try these commands
python3 --version
which python3

# If not installed (unlikely on Raspberry Pi OS)
sudo apt-get update
sudo apt-get install python3
```

### File Won't Run
- Check file extension is `.py`
- Check file is saved (Ctrl+X, Y, Enter in nano)
- Check running from correct directory: `ls` to see files
- Check for syntax errors: `python3 -m py_compile filename.py`

### Strange Characters in Terminal
- Check keyboard layout settings
- Try a different keyboard
- Restart terminal: `exit` then open new terminal

## Extension Ideas

### Mini-Challenges During Class
1. "Make the computer tell a joke using variables"
2. "Create a program that converts your age to months"
3. "Build a 'Magic 8-Ball' that gives random answers" (use if-elif chain)

### Real-World Connections
- Talk about where Python is used: YouTube, Instagram, NASA
- Mention that Raspberry Pi was designed specifically for learning Python
- Show that Python powers robots, websites, and even scientific research

### Encourage Exploration
Point students to:
- Python's official tutorial (age-appropriate sections)
- Simple Python games they can try
- The Raspberry Pi Foundation website for project ideas

## Next Week Preparation

Before Week 4, ensure:
- Students are comfortable with basic Python syntax
- Everyone has completed (or attempted) homework
- Any students who struggled get extra support
- GPIO components are ready for next week's lessons

## Additional Resources for Instructors

- **Python Documentation**: https://docs.python.org/3/
- **Real Python**: https://realpython.com/ (beginner tutorials)
- **Raspberry Pi Python Resources**: https://www.raspberrypi.org/documentation/usage/python/
- **Common Error Messages Guide**: See resources/python-errors-reference.md

## Reflection Questions

After teaching this week, consider:
1. What concepts did students grasp quickly?
2. What areas need more time next week?
3. Were activities at the right difficulty level?
4. What questions came up that you didn't expect?
5. How can you adjust pacing for next time?

---

**Remember**: The goal isn't to make students experts in Python in one week. It's to make them comfortable with basic syntax so they can control hardware in Week 4. Emphasize exploration and debugging skills over memorization!
