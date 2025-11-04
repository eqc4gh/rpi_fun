# Python Errors Reference Guide

A quick guide to understanding and fixing common Python errors for beginners.

## How to Read Error Messages

Python error messages have three parts:
1. **Traceback**: Shows where the error happened (file and line number)
2. **Error Type**: The kind of error (e.g., SyntaxError, NameError)
3. **Description**: What went wrong

Example:
```
Traceback (most recent call last):
  File "myprogram.py", line 5, in <module>
    print(age)
NameError: name 'age' is not defined
```

This tells us:
- Error is in `myprogram.py` on line 5
- It's a `NameError`
- The variable `age` doesn't exist

---

## Common Errors and Solutions

### 1. SyntaxError: invalid syntax

**What it means**: You have a typo or missing punctuation in your code.

**Common Causes**:

#### Missing Colon
```python
# Wrong
if age > 18
    print("Adult")

# Right
if age > 18:
    print("Adult")
```

#### Missing Quotes
```python
# Wrong
name = Alex

# Right
name = "Alex"
```

#### Missing Closing Parenthesis
```python
# Wrong
print("Hello"

# Right
print("Hello")
```

#### Missing Closing Quote
```python
# Wrong
name = "Alex

# Right
name = "Alex"
```

**How to Fix**:
1. Check the line mentioned in the error
2. Look for missing: `:`, `()`, `""`, `''`
3. Check the line BEFORE the error (sometimes that's where the problem is)

---

### 2. IndentationError

**What it means**: Your code spacing/indentation is wrong.

**Common Causes**:

#### No Indentation After If/Else
```python
# Wrong
if True:
print("Hello")

# Right
if True:
    print("Hello")
```

#### Mixing Tabs and Spaces
```python
# Wrong (hard to see, but first line uses Tab, second uses spaces)
if True:
	print("Hello")
    print("World")

# Right (use either tabs OR spaces consistently)
if True:
    print("Hello")
    print("World")
```

#### Unexpected Indent
```python
# Wrong
name = "Alex"
    print(name)  # Why is this indented?

# Right
name = "Alex"
print(name)
```

**How to Fix**:
1. Use 4 spaces (or 1 Tab) for each level of indentation
2. Be consistent - don't mix tabs and spaces
3. Only indent after `:` (if, else, elif, while, for, def)
4. Un-indent when you're done with that block

---

### 3. NameError: name 'x' is not defined

**What it means**: You're using a variable that doesn't exist.

**Common Causes**:

#### Using Variable Before Creating It
```python
# Wrong
print(name)
name = "Alex"

# Right
name = "Alex"
print(name)
```

#### Typo in Variable Name
```python
# Wrong
my_name = "Alex"
print(myname)  # Missing underscore!

# Right
my_name = "Alex"
print(my_name)
```

#### Forgetting Quotes
```python
# Wrong
name = Alex  # Python thinks Alex is a variable

# Right
name = "Alex"  # Now it's text
```

**How to Fix**:
1. Make sure you created the variable first
2. Check spelling (capital letters matter!)
3. If it's text, use quotes

---

### 4. TypeError: unsupported operand type(s) for +: 'int' and 'str'

**What it means**: You're trying to combine incompatible types (like adding a number and text).

**Common Causes**:

#### Adding String and Number
```python
# Wrong
age = "15"
next_year = age + 1  # Can't add string and number

# Right - Convert string to number
age = int("15")
next_year = age + 1

# Or Right - Convert number to string
age = "15"
next_year = age + "1"  # But this gives "151" not 16!
```

#### Forgetting to Convert Input
```python
# Wrong
age = input("Age: ")  # input returns string!
next_year = age + 1

# Right
age = int(input("Age: "))
next_year = age + 1
```

**How to Fix**:
1. Convert types using `int()`, `float()`, or `str()`
2. Remember: `input()` always returns a string
3. Use `type()` to check what type something is

---

### 5. ValueError: invalid literal for int() with base 10

**What it means**: You tried to convert something to a number, but it's not a valid number.

**Common Causes**:

#### Converting Non-Number Text
```python
# Wrong
age = int("fifteen")  # "fifteen" isn't a valid number

# Right
age = int("15")
```

#### Converting Empty Input
```python
# Wrong
number = int("")  # Empty string isn't a number

# Right - check first
user_input = input("Enter number: ")
if user_input != "":
    number = int(user_input)
```

**How to Fix**:
1. Make sure the string contains only digits
2. Remove any spaces or special characters
3. Check if input is empty before converting

---

### 6. ZeroDivisionError: division by zero

**What it means**: You tried to divide by zero.

**Common Causes**:

```python
# Wrong
result = 10 / 0  # Can't divide by zero!

# Right - check first
divisor = 0
if divisor != 0:
    result = 10 / divisor
else:
    print("Cannot divide by zero")
```

**How to Fix**:
1. Check if divisor is zero before dividing
2. Use if statements to prevent this

---

### 7. AttributeError: 'int' object has no attribute 'x'

**What it means**: You're trying to use a method/function that doesn't exist for that type.

**Common Causes**:

```python
# Wrong
number = 42
result = number.upper()  # Numbers don't have upper()

# Right
text = "hello"
result = text.upper()  # Strings have upper()
```

**How to Fix**:
1. Check that you're using the right type
2. Make sure the method exists for that type
3. Common string methods: `.upper()`, `.lower()`, `.strip()`
4. Numbers don't have these methods!

---

### 8. IndexError: string index out of range

**What it means**: You tried to access a position in a string that doesn't exist.

**Common Causes**:

```python
# Wrong
name = "Alex"
print(name[10])  # "Alex" only has 4 characters (0-3)

# Right
name = "Alex"
print(name[0])  # First character
print(name[3])  # Last character
```

**How to Fix**:
1. Remember: indexes start at 0
2. Last index is `len(text) - 1`
3. Check length before accessing

---

## Debugging Strategy

When you get an error:

### Step 1: Don't Panic!
Errors are normal and helpful - they tell you what's wrong.

### Step 2: Read the Error Message
- What type of error?
- What line number?
- What does the description say?

### Step 3: Look at That Line (and the Line Before)
- Check for common mistakes
- Look at the line mentioned
- Sometimes the real problem is on the line before

### Step 4: Common Quick Fixes
- [ ] Missing colon after if/else?
- [ ] Missing quotes around text?
- [ ] Missing closing parenthesis?
- [ ] Wrong indentation?
- [ ] Typo in variable name?
- [ ] Forgot to convert input()?

### Step 5: Use Print Statements
Add print statements to see what's happening:
```python
name = input("Name: ")
print("Debug: name =", name)
print("Debug: type =", type(name))
age = int(name)  # This will show us what went wrong!
```

### Step 6: Test in Python Shell
Try the problematic code line by line in the Python shell:
```bash
python3
>>> age = "15"
>>> next_year = age + 1
# You'll see the error and can experiment with fixes
```

### Step 7: Comment Out Code
Comment out code to isolate the problem:
```python
# name = input("Name: ")
# age = int(input("Age: "))
print("Hello")  # Test if this works alone
```

### Step 8: Start Fresh
Sometimes it's easier to rewrite a small section than to debug it.

---

## Prevention Tips

### 1. Write Code Carefully
- Type slowly and carefully
- Check each line after writing it
- Use consistent indentation

### 2. Test As You Go
Don't write the whole program then test it. Test small pieces:
```python
# Write this
name = input("Name: ")
# Test it!
print(name)

# Then add more
age = int(input("Age: "))
# Test it!
print(age)
```

### 3. Use Descriptive Variable Names
```python
# Hard to debug
x = int(input())
y = x + 1

# Easy to debug
age = int(input("Age: "))
next_year_age = age + 1
```

### 4. Add Comments
```python
# Get user's age and convert to number
age = int(input("How old are you? "))

# Calculate age next year
next_year = age + 1
```

### 5. Use the Quick Start Guide
Keep it handy! It has correct syntax examples.

---

## Getting Help

If you're still stuck:

1. **Copy the error message** exactly
2. **Note the line number**
3. **Show your code** to someone
4. **Explain what you're trying to do**
5. **Describe what's happening** vs. what you expect

---

## Remember!

- **Every programmer gets errors** - even experts!
- **Errors are learning opportunities** - they teach you
- **Read error messages carefully** - they're trying to help
- **Google is your friend** - search for the error message
- **Take breaks** - sometimes stepping away helps
- **Ask for help** - don't struggle alone for too long

---

## Quick Reference: Error Types

| Error Type | What It Means | Most Common Cause |
|------------|---------------|-------------------|
| SyntaxError | Code isn't valid Python | Missing `:`, `()`, or quotes |
| IndentationError | Wrong spacing | Not indenting after `:` |
| NameError | Variable doesn't exist | Typo or not created yet |
| TypeError | Wrong data type | Mixing strings and numbers |
| ValueError | Value is wrong type | Converting non-number to int |
| ZeroDivisionError | Divided by zero | Need to check divisor |
| AttributeError | Method doesn't exist | Using string method on number |

---

**Keep this guide handy while programming! It will save you lots of time!**
