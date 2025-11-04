# Week 3 Lecture Notes: Introduction to Python Programming

## Part 1: Introduction to Python (10-15 minutes)

### What is Python?
Python is a **programming language** - a way for humans to give instructions to computers. It was created in 1991 by Guido van Rossum and named after the comedy group "Monty Python."

**Why Python?**
- Easy to read and write (looks almost like English!)
- Very popular (used by YouTube, Instagram, NASA, and more)
- Perfect for beginners
- Great for Raspberry Pi projects
- Huge community with lots of help available

**Why Python for Raspberry Pi?**
The Raspberry Pi Foundation specifically designed the Raspberry Pi with Python in mind. In fact, "Pi" in Raspberry Pi stands for "Python"!

### Running Python on Your Raspberry Pi

Python is already installed! There are two ways to use it:

#### Method 1: Interactive Mode (Python Shell)
Open terminal and type:
```bash
python3
```

You'll see:
```
Python 3.x.x ...
>>> 
```

The `>>>` means Python is ready for your commands. Try:
```python
>>> print("Hello, World!")
Hello, World!
>>> 2 + 2
4
>>> exit()
```

**When to use**: Testing quick commands, experimenting, calculator

#### Method 2: Python Files (.py files)
Create a file with your code, then run it.

Create a file:
```bash
nano hello.py
```

Write your code:
```python
print("Hello, World!")
print("My name is Alex")
```

Save: `Ctrl+X`, then `Y`, then `Enter`

Run it:
```bash
python3 hello.py
```

**When to use**: Writing programs you want to save and run multiple times

### Your First Python Program

**Demo: Hello World**
```python
print("Hello, World!")
```

**What's happening?**
- `print()` is a **function** - a built-in command
- The text inside quotes is what gets displayed
- Parentheses `()` are required
- Quotes can be single `'` or double `"`

**Try these variations:**
```python
print("Hello, World!")
print('Hello, World!')
print("Hello,", "World!")
print("Hello", "World", "!")
```

---

## Part 2: Variables and Data Types (20-25 minutes)

### What is a Variable?

A **variable** is like a labeled box where you can store information.

**Real-world analogy**: 
- You have a box
- You write "age" on the label
- You put the number 15 inside
- Later, you can look in the "age" box to see what's inside

### Creating Variables

**Syntax**: `variable_name = value`

```python
age = 15
name = "Alex"
temperature = 98.6
is_sunny = True
```

**Rules for Variable Names:**
1. Must start with a letter or underscore: `name`, `_temp`
2. Can contain letters, numbers, underscores: `age2`, `first_name`
3. Cannot contain spaces: use `first_name` not `first name`
4. Cannot be a Python keyword: avoid `print`, `if`, `for`, etc.
5. Case sensitive: `age` and `Age` are different!

**Conventions:**
- Use lowercase with underscores: `my_variable`
- Use descriptive names: `student_age` not just `a`
- Avoid single letters except for very simple cases

### Data Types

Python has several types of data. Here are the main ones:

#### 1. Integers (int) - Whole Numbers
```python
age = 15
year = 2025
temperature = -5
score = 0
```

#### 2. Floats (float) - Decimal Numbers
```python
temperature = 98.6
price = 19.99
pi = 3.14159
height = 5.5
```

#### 3. Strings (str) - Text
```python
name = "Alex"
message = 'Hello, World!'
address = "123 Main Street"
favorite_color = "blue"
```

**String Tips:**
- Use quotes (single or double, but be consistent)
- Can include spaces: `"Hello World"`
- Can be empty: `""`

#### 4. Booleans (bool) - True or False
```python
is_raining = True
has_homework = False
is_logged_in = True
```

**Important**: Must be capitalized: `True` and `False`

### Checking Types

Use the `type()` function:
```python
>>> age = 15
>>> type(age)
<class 'int'>

>>> name = "Alex"
>>> type(name)
<class 'str'>

>>> temperature = 98.6
>>> type(temperature)
<class 'float'>

>>> is_sunny = True
>>> type(is_sunny)
<class 'bool'>
```

### Changing Variable Values

Variables can change!
```python
age = 15
print(age)  # Shows: 15

age = 16
print(age)  # Shows: 16
```

### Using Variables

```python
name = "Alex"
age = 15

print(name)
print("My name is", name)
print("I am", age, "years old")
```

---

## Part 3: Basic Operators (20 minutes)

### Arithmetic Operators

#### Addition (+)
```python
result = 5 + 3  # result is 8
x = 10
y = 5
sum = x + y  # sum is 15
```

#### Subtraction (-)
```python
result = 10 - 4  # result is 6
remaining = 20 - 7  # remaining is 13
```

#### Multiplication (*)
```python
result = 6 * 7  # result is 42
total = 5 * 10  # total is 50
```

#### Division (/)
```python
result = 20 / 4  # result is 5.0 (always gives float!)
result = 15 / 4  # result is 3.75
```

#### Integer Division (//)
Divides and removes the decimal part:
```python
result = 15 // 4  # result is 3 (not 3.75)
result = 20 // 3  # result is 6 (not 6.666...)
```

#### Modulo (%) - Remainder
Gives the remainder after division:
```python
result = 17 % 5  # result is 2 (17 ÷ 5 = 3 remainder 2)
result = 20 % 4  # result is 0 (20 ÷ 4 = 5 remainder 0)
```

**Use case**: Check if number is even or odd
```python
number = 7
remainder = number % 2
# If remainder is 0, number is even
# If remainder is 1, number is odd
```

#### Exponent (**) - Power
```python
result = 2 ** 3  # 2 to the power of 3 = 8
result = 5 ** 2  # 5 to the power of 2 = 25
```

### Order of Operations

Python follows PEMDAS:
- **P**arentheses
- **E**xponents
- **M**ultiplication and **D**ivision (left to right)
- **A**ddition and **S**ubtraction (left to right)

```python
result = 2 + 3 * 4  # result is 14 (not 20!)
# Multiplication happens first: 3 * 4 = 12, then 2 + 12 = 14

result = (2 + 3) * 4  # result is 20
# Parentheses first: 2 + 3 = 5, then 5 * 4 = 20
```

### Comparison Operators

These compare values and give True or False:

```python
5 == 5   # Equal to (True)
5 != 3   # Not equal to (True)
5 > 3    # Greater than (True)
5 < 3    # Less than (False)
5 >= 5   # Greater than or equal to (True)
5 <= 3   # Less than or equal to (False)
```

**Common mistake**: Using `=` instead of `==`
- `=` assigns a value: `age = 15`
- `==` checks if equal: `age == 15`

### Examples with Variables

```python
age = 15
next_year = age + 1  # next_year is 16

price = 10
quantity = 3
total = price * quantity  # total is 30

celsius = 25
fahrenheit = (celsius * 9/5) + 32  # fahrenheit is 77.0
```

---

## Part 4: Input and Output (15-20 minutes)

### Output with print()

#### Basic Printing
```python
print("Hello, World!")
print(42)
print(3.14)
```

#### Printing Multiple Items
```python
name = "Alex"
age = 15

print("Name:", name)
print("Age:", age)
print("I am", age, "years old")
```

Python automatically adds spaces between items!

#### Print Without Newline
```python
print("Hello, ", end="")
print("World!")
# Output: Hello, World! (on same line)
```

#### F-Strings (Formatted Strings)
Modern Python way to include variables in text:

```python
name = "Alex"
age = 15
print(f"My name is {name} and I am {age} years old")
# Output: My name is Alex and I am 15 years old

price = 19.99
print(f"The price is ${price}")
# Output: The price is $19.99
```

### Input with input()

The `input()` function asks the user to type something:

#### Basic Input
```python
name = input("What is your name? ")
print("Hello,", name)
```

**What happens:**
1. Python displays: "What is your name? "
2. Program waits for user to type
3. User types and presses Enter
4. What they typed is stored in `name`

#### Important: input() Returns Strings!

```python
age = input("How old are you? ")
# Even if user types 15, age is the string "15", not the number 15!

print(type(age))  # <class 'str'>
```

### Converting Types

To use input as a number, convert it:

```python
# Get age as a number
age = int(input("How old are you? "))
next_year = age + 1
print("Next year you'll be", next_year)

# Get price as a decimal
price = float(input("Enter price: "))
tax = price * 0.08
total = price + tax
print(f"Total with tax: ${total}")
```

**Conversion Functions:**
- `int()` - Convert to integer
- `float()` - Convert to decimal number  
- `str()` - Convert to string
- `bool()` - Convert to True/False

#### Examples
```python
# String to number
age = int("15")  # age is 15 (number)
price = float("19.99")  # price is 19.99 (number)

# Number to string
age_text = str(25)  # age_text is "25" (text)

# What you CANNOT do:
age = int("fifteen")  # ERROR! "fifteen" isn't a valid number
```

---

## Part 5: Basic Control Flow (15-20 minutes)

### Making Decisions with If Statements

Programs can make choices based on conditions.

#### Simple If Statement

**Syntax:**
```python
if condition:
    code to run if True
```

**Example:**
```python
temperature = 80

if temperature > 75:
    print("It's warm outside!")
```

**Key Points:**
1. Condition must give True or False
2. **Colon (:) is required** after condition
3. **Indentation matters** - use 4 spaces or Tab
4. Code inside only runs if condition is True

#### If-Else Statement

**Syntax:**
```python
if condition:
    code if True
else:
    code if False
```

**Example:**
```python
age = 15

if age >= 18:
    print("You can vote")
else:
    print("You cannot vote yet")
```

#### If-Elif-Else Statement

For multiple conditions:

**Syntax:**
```python
if condition1:
    code if condition1 is True
elif condition2:
    code if condition2 is True
elif condition3:
    code if condition3 is True
else:
    code if all conditions are False
```

**Example:**
```python
score = 85

if score >= 90:
    print("Grade: A")
elif score >= 80:
    print("Grade: B")
elif score >= 70:
    print("Grade: C")
elif score >= 60:
    print("Grade: D")
else:
    print("Grade: F")
```

**How it works:**
1. Checks first condition
2. If True, runs that code and STOPS
3. If False, checks next condition
4. Continues until one is True or reaches else
5. Only ONE block of code runs

### Comparison Operators in If Statements

```python
age = 15

if age == 15:
    print("Exactly 15")

if age != 20:
    print("Not 20")

if age > 10:
    print("Older than 10")

if age < 20:
    print("Younger than 20")

if age >= 15:
    print("15 or older")

if age <= 15:
    print("15 or younger")
```

### Logical Operators

Combine multiple conditions:

#### and - Both must be True
```python
age = 15
has_permission = True

if age >= 13 and has_permission:
    print("You can join")
```

#### or - At least one must be True
```python
day = "Saturday"

if day == "Saturday" or day == "Sunday":
    print("It's the weekend!")
```

#### not - Reverses True/False
```python
is_raining = False

if not is_raining:
    print("No umbrella needed")
```

### Indentation - CRITICAL!

Python uses indentation to group code:

**Correct:**
```python
if temperature > 75:
    print("It's warm")
    print("Drink water!")
print("Have a nice day")
```

**Wrong:**
```python
if temperature > 75:
print("It's warm")  # ERROR! Not indented
    print("Drink water!")
```

**Rule**: All code that belongs to the if statement must be indented the same amount (4 spaces or 1 Tab).

### Nested If Statements

You can put if statements inside other if statements:

```python
age = 15
has_ticket = True

if age >= 13:
    print("Old enough to enter")
    if has_ticket:
        print("Enjoy the movie!")
    else:
        print("Please buy a ticket")
else:
    print("Sorry, must be 13 or older")
```

---

## Part 6: Putting It All Together (Examples)

### Example 1: Simple Calculator
```python
print("Simple Calculator")
num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))

sum = num1 + num2
difference = num1 - num2
product = num1 * num2
quotient = num1 / num2

print(f"{num1} + {num2} = {sum}")
print(f"{num1} - {num2} = {difference}")
print(f"{num1} * {num2} = {product}")
print(f"{num1} / {num2} = {quotient}")
```

### Example 2: Age Classifier
```python
name = input("What is your name? ")
age = int(input("How old are you? "))

print(f"Hello, {name}!")

if age < 13:
    print("You are a child")
elif age < 20:
    print("You are a teenager")
elif age < 65:
    print("You are an adult")
else:
    print("You are a senior")
```

### Example 3: Temperature Converter
```python
print("Temperature Converter")
celsius = float(input("Enter temperature in Celsius: "))

fahrenheit = (celsius * 9/5) + 32

print(f"{celsius}°C is {fahrenheit}°F")

if fahrenheit > 90:
    print("It's very hot!")
elif fahrenheit > 70:
    print("It's warm")
elif fahrenheit > 50:
    print("It's cool")
else:
    print("It's cold!")
```

### Example 4: Number Guesser
```python
secret_number = 7
guess = int(input("Guess a number between 1 and 10: "))

if guess == secret_number:
    print("Correct! You win!")
elif guess < secret_number:
    print("Too low!")
else:
    print("Too high!")
```

---

## Key Takeaways

1. **Python** is a beginner-friendly language perfect for Raspberry Pi
2. **Variables** store information with descriptive names
3. **Data types** include int, float, str, and bool
4. **Operators** let us do math and compare values
5. **input()** gets information from the user (always returns a string!)
6. **print()** displays information
7. **If statements** let programs make decisions
8. **Indentation** is how Python groups code - it matters!

## Common Mistakes to Avoid

1. Forgetting the colon (`:`) after if statements
2. Incorrect indentation
3. Using `=` when you mean `==`
4. Forgetting to convert input() to int or float
5. Mixing up quote types within one string
6. Not capitalizing True and False

## Practice Makes Perfect!

The best way to learn programming is to:
- Type code yourself (don't just copy-paste)
- Make mistakes and learn from them
- Experiment by changing values
- Try to predict what code will do before running it
- Ask questions when confused!

---

**Next Steps**: Practice with the activities and homework. Next week we'll use Python to control real hardware on your Raspberry Pi!
