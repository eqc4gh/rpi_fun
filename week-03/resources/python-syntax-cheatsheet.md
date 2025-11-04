# Python Syntax Cheat Sheet

Quick reference for Python basics - print this and keep it handy!

---

## Comments

```python
# This is a single-line comment

# You can use comments to explain your code
age = 15  # This creates a variable

# Comments are ignored by Python
# Use them to leave notes for yourself
```

---

## Variables

### Creating Variables
```python
name = "Alex"           # String (text)
age = 15               # Integer (whole number)
height = 5.5           # Float (decimal number)
is_student = True      # Boolean (True/False)
```

### Variable Naming Rules
✅ **Good Names**:
```python
student_name = "Alex"
my_age = 15
first_score = 95
total_count = 0
```

❌ **Bad Names**:
```python
2nd_name = "Alex"      # Can't start with number
my age = 15            # No spaces allowed
class = "Math"         # Can't use Python keywords
```

### Variable Naming Conventions
- Use lowercase with underscores: `my_variable`
- Start with letter or underscore: `_temp`, `name`
- Be descriptive: `student_age` not `sa`
- Case sensitive: `Age` ≠ `age`

---

## Data Types

| Type | Description | Example |
|------|-------------|---------|
| `int` | Whole numbers | `42`, `-5`, `0` |
| `float` | Decimal numbers | `3.14`, `0.5`, `-2.7` |
| `str` | Text | `"hello"`, `'world'` |
| `bool` | True or False | `True`, `False` |

### Checking Types
```python
type(42)        # <class 'int'>
type(3.14)      # <class 'float'>
type("hello")   # <class 'str'>
type(True)      # <class 'bool'>
```

### Converting Types
```python
int("15")       # String → Integer: 15
float("3.14")   # String → Float: 3.14
str(42)         # Integer → String: "42"
int(3.7)        # Float → Integer: 3 (removes decimal)
float(5)        # Integer → Float: 5.0
```

---

## Output with print()

### Basic Printing
```python
print("Hello, World!")
print(42)
print(3.14)
```

### Printing Multiple Items
```python
name = "Alex"
age = 15
print("Name:", name)                    # Name: Alex
print("I am", age, "years old")         # I am 15 years old
print(name, age, "student", sep="-")    # Alex-15-student
```

### F-Strings (Formatted Strings)
```python
name = "Alex"
age = 15
print(f"My name is {name}")             # My name is Alex
print(f"I am {age} years old")          # I am 15 years old
print(f"{name} is {age} years old")     # Alex is 15 years old

# With calculations
print(f"Next year: {age + 1}")          # Next year: 16

# With formatting
price = 19.99
print(f"Price: ${price:.2f}")           # Price: $19.99 (2 decimals)
```

### Print Options
```python
print("Hello", end="")      # No newline at end
print("World")              # Prints on same line: HelloWorld

print("Name", "Age", sep=" | ")  # Custom separator: Name | Age
```

---

## Input with input()

### Basic Input
```python
name = input("What is your name? ")
# Program pauses, user types, presses Enter
# What they typed is stored as a STRING
```

### ⚠️ Important: input() Returns Strings!
```python
age = input("How old are you? ")
# Even if user types 15, age is "15" (text, not number)
```

### Getting Numbers from Input
```python
# Integer (whole number)
age = int(input("How old are you? "))

# Float (decimal number)
price = float(input("Enter price: "))

# Now you can do math!
next_year = age + 1
total = price * 2
```

---

## Arithmetic Operators

| Operator | Operation | Example | Result |
|----------|-----------|---------|--------|
| `+` | Addition | `5 + 3` | `8` |
| `-` | Subtraction | `10 - 4` | `6` |
| `*` | Multiplication | `6 * 7` | `42` |
| `/` | Division | `20 / 4` | `5.0` |
| `//` | Integer Division | `20 // 3` | `6` |
| `%` | Modulo (Remainder) | `17 % 5` | `2` |
| `**` | Exponent (Power) | `2 ** 3` | `8` |

### Examples
```python
x = 10
y = 3

print(x + y)    # 13
print(x - y)    # 7
print(x * y)    # 30
print(x / y)    # 3.333...
print(x // y)   # 3 (integer division)
print(x % y)    # 1 (remainder)
print(x ** y)   # 1000 (10 to the power of 3)
```

### Order of Operations (PEMDAS)
```python
result = 2 + 3 * 4      # 14 (not 20!)
result = (2 + 3) * 4    # 20 (parentheses first)
result = 2 ** 3 + 1     # 9 (exponent first)
```

---

## Comparison Operators

| Operator | Meaning | Example | Result |
|----------|---------|---------|--------|
| `==` | Equal to | `5 == 5` | `True` |
| `!=` | Not equal to | `5 != 3` | `True` |
| `>` | Greater than | `5 > 3` | `True` |
| `<` | Less than | `5 < 3` | `False` |
| `>=` | Greater or equal | `5 >= 5` | `True` |
| `<=` | Less or equal | `5 <= 3` | `False` |

### Examples
```python
age = 15

age == 15       # True
age != 20       # True
age > 10        # True
age < 20        # True
age >= 15       # True
age <= 10       # False
```

### ⚠️ Common Mistake
```python
# Wrong - This assigns, doesn't compare!
if age = 15:

# Right - This compares!
if age == 15:
```

---

## Logical Operators

### and - Both conditions must be True
```python
age = 15
has_permission = True

if age >= 13 and has_permission:
    print("Allowed")

# Both must be True:
True and True    # True
True and False   # False
False and False  # False
```

### or - At least one condition must be True
```python
day = "Saturday"

if day == "Saturday" or day == "Sunday":
    print("Weekend!")

# At least one must be True:
True or True     # True
True or False    # True
False or False   # False
```

### not - Reverses True/False
```python
is_raining = False

if not is_raining:
    print("No umbrella needed")

# Reverses the value:
not True         # False
not False        # True
```

---

## If Statements

### Simple If
```python
if condition:
    code to run if True
```

**Example**:
```python
age = 15

if age >= 13:
    print("Teenager")
```

### If-Else
```python
if condition:
    code if True
else:
    code if False
```

**Example**:
```python
age = 15

if age >= 18:
    print("Adult")
else:
    print("Minor")
```

### If-Elif-Else
```python
if condition1:
    code if condition1 is True
elif condition2:
    code if condition2 is True
elif condition3:
    code if condition3 is True
else:
    code if all are False
```

**Example**:
```python
score = 85

if score >= 90:
    print("A")
elif score >= 80:
    print("B")
elif score >= 70:
    print("C")
elif score >= 60:
    print("D")
else:
    print("F")
```

### ⚠️ Critical Rules for If Statements

1. **Colon is required**:
```python
if age > 18:    # ← Colon here!
    print("Adult")
```

2. **Indentation matters**:
```python
# Right
if True:
    print("This is indented")
    print("This too")

# Wrong
if True:
print("Not indented - ERROR!")
```

3. **Use 4 spaces or 1 Tab** consistently

---

## String Basics

### Creating Strings
```python
name = "Alex"           # Double quotes
message = 'Hello'       # Single quotes
both = "It's okay"      # Mix when needed
empty = ""              # Empty string
```

### String Operations
```python
# Concatenation (joining)
first = "Hello"
last = "World"
full = first + " " + last    # "Hello World"

# Repetition
laugh = "ha" * 3             # "hahaha"

# Length
name = "Alex"
length = len(name)           # 4
```

### Useful String Methods
```python
text = "Hello World"

text.upper()        # "HELLO WORLD"
text.lower()        # "hello world"
text.strip()        # Removes spaces from ends
text.replace("H", "Y")  # "Yello World"
```

---

## Running Python Programs

### Interactive Mode (Python Shell)
```bash
python3
```
- Type commands one at a time
- See results immediately
- Good for testing
- Exit with `exit()` or Ctrl+D

### Running Python Files
```bash
# Create file
nano myprogram.py

# Run file
python3 myprogram.py
```

---

## Complete Example Programs

### Example 1: Greeting Program
```python
# Get user's name
name = input("What is your name? ")

# Get user's age
age = int(input("How old are you? "))

# Calculate age next year
next_age = age + 1

# Display greeting
print(f"Hello, {name}!")
print(f"Next year you'll be {next_age} years old")
```

### Example 2: Temperature Checker
```python
# Get temperature
temp = float(input("Enter temperature (F): "))

# Check temperature and give advice
if temp > 85:
    print("It's hot! Stay hydrated")
elif temp > 60:
    print("Nice weather!")
else:
    print("It's cold! Wear a coat")
```

### Example 3: Calculator
```python
# Get two numbers
num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))

# Perform calculations
sum_result = num1 + num2
diff_result = num1 - num2
prod_result = num1 * num2
quot_result = num1 / num2

# Display results
print(f"{num1} + {num2} = {sum_result}")
print(f"{num1} - {num2} = {diff_result}")
print(f"{num1} * {num2} = {prod_result}")
print(f"{num1} / {num2} = {quot_result}")
```

---

## Common Patterns

### Get number input
```python
number = int(input("Enter a number: "))
```

### Get decimal input
```python
price = float(input("Enter price: "))
```

### Check if even or odd
```python
number = int(input("Enter number: "))
if number % 2 == 0:
    print("Even")
else:
    print("Odd")
```

### Calculate average
```python
num1 = float(input("Score 1: "))
num2 = float(input("Score 2: "))
num3 = float(input("Score 3: "))
average = (num1 + num2 + num3) / 3
print(f"Average: {average}")
```

---

## Tips for Success

✅ **Do**:
- Use descriptive variable names
- Test your code frequently
- Use comments to explain complex parts
- Indent with 4 spaces consistently
- Read error messages carefully

❌ **Don't**:
- Use Python keywords as variable names
- Mix tabs and spaces
- Forget to convert input() when you need numbers
- Use `=` when you mean `==`
- Give up when you see an error!

---

## Getting Help

### In Python Shell
```python
help(print)     # Get help on print function
type(variable)  # Check variable type
dir(str)        # See all string methods
```

### Error Strategy
1. Read the error message
2. Check the line number
3. Look for common mistakes
4. Test in small pieces
5. Ask for help!

---

**Print this cheat sheet and keep it nearby while programming!**
