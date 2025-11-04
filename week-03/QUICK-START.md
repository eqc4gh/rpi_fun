# Week 3 Quick Start Guide

## Running Python Programs

### Interactive Mode (Python Shell)
```bash
python3
```
Type commands one at a time. Exit with `exit()` or Ctrl+D.

### Running a Python File
```bash
python3 myprogram.py
```

### Creating a Python File
```bash
nano myprogram.py
```
Save with Ctrl+X, then Y, then Enter.

## Essential Python Syntax

### Variables
```python
# Numbers
age = 15
temperature = 98.6

# Text (strings)
name = "Alex"
message = 'Hello, world!'

# True/False (booleans)
is_raining = True
has_homework = False
```

### Printing Output
```python
print("Hello!")
print("I am", age, "years old")
print(f"My name is {name}")  # f-string formatting
```

### Getting Input
```python
name = input("What is your name? ")
age = input("How old are you? ")
number = int(input("Enter a number: "))  # Convert to integer
```

### Basic Math
```python
# Addition and Subtraction
result = 5 + 3
result = 10 - 4

# Multiplication and Division
result = 6 * 7
result = 20 / 4
result = 20 // 4  # Division without decimals (integer division)

# Remainder (Modulo)
remainder = 17 % 5  # Result: 2

# Exponents (Power)
result = 2 ** 3  # 2 to the power of 3 = 8
```

### Comparisons
```python
5 == 5   # Equal to (True)
5 != 3   # Not equal to (True)
5 > 3    # Greater than (True)
5 < 3    # Less than (False)
5 >= 5   # Greater than or equal to (True)
5 <= 3   # Less than or equal to (False)
```

### If Statements
```python
# Simple if
if temperature > 75:
    print("It's warm!")

# If-else
if is_raining:
    print("Bring an umbrella")
else:
    print("Enjoy the sunshine")

# If-elif-else
if score >= 90:
    print("Grade: A")
elif score >= 80:
    print("Grade: B")
elif score >= 70:
    print("Grade: C")
else:
    print("Grade: F")
```

## Common Data Types

| Type | Description | Example |
|------|-------------|---------|
| `int` | Whole numbers | `42`, `-5`, `0` |
| `float` | Decimal numbers | `3.14`, `-0.5`, `2.0` |
| `str` | Text | `"hello"`, `'world'` |
| `bool` | True or False | `True`, `False` |

## Converting Between Types
```python
# String to number
age = int("15")
price = float("19.99")

# Number to string
age_text = str(25)

# Check the type
type(42)        # <class 'int'>
type(3.14)      # <class 'float'>
type("hello")   # <class 'str'>
```

## Common Errors and Fixes

### NameError: name 'x' is not defined
**Problem**: Using a variable before creating it
**Fix**: Make sure you assign the variable first
```python
# Wrong
print(name)

# Right
name = "Alex"
print(name)
```

### SyntaxError: invalid syntax
**Problem**: Typo or missing punctuation
**Fix**: Check for missing colons, quotes, or parentheses
```python
# Wrong
if age > 18
    print("Adult")

# Right
if age > 18:
    print("Adult")
```

### IndentationError
**Problem**: Incorrect spacing before code
**Fix**: Use consistent indentation (4 spaces or 1 tab)
```python
# Wrong
if True:
print("Hello")

# Right
if True:
    print("Hello")
```

### TypeError: unsupported operand type(s)
**Problem**: Mixing incompatible types
**Fix**: Convert types when needed
```python
# Wrong
age = input("Age: ")
next_year = age + 1  # Can't add string and number

# Right
age = int(input("Age: "))
next_year = age + 1
```

## Useful Tips

1. **Comments**: Use `#` to add notes in your code
   ```python
   # This is a comment
   age = 15  # This is also a comment
   ```

2. **Indentation**: Python uses indentation (spaces) to organize code
   - Always indent 4 spaces after `if`, `else`, `elif`

3. **Variable Names**: 
   - Use lowercase with underscores: `my_variable`
   - Start with a letter, not a number
   - No spaces allowed

4. **String Quotes**: Both work the same
   ```python
   name = "Alex"
   name = 'Alex'
   ```

5. **Print Multiple Items**: Separate with commas
   ```python
   print("I am", age, "years old")
   ```

## Practice Challenge
Create a simple program that:
1. Asks for the user's name
2. Asks for their age
3. Calculates their age next year
4. Prints a personalized message

```python
name = input("What's your name? ")
age = int(input("How old are you? "))
next_age = age + 1
print(f"Hello {name}! Next year you'll be {next_age} years old.")
```

## Getting Help

- **Check variable type**: `type(variable_name)`
- **Python documentation**: Type `help(print)` in Python shell
- **Error messages**: Read them carefully - they tell you what's wrong!

---
Keep this guide handy while working on activities and homework!
