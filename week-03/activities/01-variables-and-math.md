# Activity 1: Variables and Math

**Time**: 15 minutes  
**Group Size**: 2-3 students  
**Difficulty**: Beginner

## Objective
Practice creating variables, performing calculations, and using input/output in Python.

## Setup
1. Open Terminal on your Raspberry Pi
2. Create a new Python file: `nano activity1.py`
3. Work together with your group - one person types, others help!

## Part 1: About Me Program (5 minutes)

Create a program that stores information about you and displays it nicely.

### Your Task
Write a program that:
1. Stores your name in a variable
2. Stores your age in a variable
3. Stores your favorite color in a variable
4. Prints all this information in complete sentences

### Example Output
```
My name is Alex
I am 15 years old
My favorite color is blue
```

### Starter Code
```python
# About Me Program

# Create your variables here
name = 
age = 
favorite_color = 

# Print your information

```

### Tips
- Remember to use quotes for text (strings)
- You can use commas in print() to separate items
- Try using f-strings: `print(f"My name is {name}")`

## Part 2: Birthday Calculator (5 minutes)

Create a program that calculates how old you'll be in different future years.

### Your Task
Write a program that:
1. Stores your current age
2. Calculates your age in 5 years
3. Calculates your age in 10 years
4. Calculates your age in 20 years
5. Prints all the results

### Example Output
```
I am currently 15 years old
In 5 years, I'll be 20
In 10 years, I'll be 25
In 20 years, I'll be 35
```

### Starter Code
```python
# Birthday Calculator

current_age = 

# Calculate future ages
age_in_5_years = 
age_in_10_years = 
age_in_20_years = 

# Print the results

```

## Part 3: Interactive Calculator (5 minutes)

Create a simple calculator that asks the user for two numbers and shows multiple calculations.

### Your Task
Write a program that:
1. Asks the user for the first number
2. Asks the user for the second number
3. Calculates and displays:
   - Sum (addition)
   - Difference (subtraction)
   - Product (multiplication)
   - Quotient (division)

### Example Output
```
Enter first number: 10
Enter second number: 3
10 + 3 = 13
10 - 3 = 7
10 * 3 = 30
10 / 3 = 3.3333333333333335
```

### Starter Code
```python
# Interactive Calculator

# Get input from user
num1 = float(input("Enter first number: "))
num2 = 

# Perform calculations



# Display results



```

### Tips
- Use `float(input())` to convert input to a number
- You can store calculation results in variables
- Remember: * for multiplication, / for division

## Challenges (If you finish early)

### Challenge 1: Add More Operations
Add these calculations to your calculator:
- Integer division (`//`)
- Remainder/Modulo (`%`)
- Exponent (`**`)

### Challenge 2: Circle Calculator
Create a program that:
1. Asks for the radius of a circle
2. Calculates the circumference (2 × π × radius)
3. Calculates the area (π × radius²)
4. Use `3.14159` for π

**Hint**: Use `**2` for squaring

### Challenge 3: Temperature Converter
Create a program that:
1. Asks for a temperature in Celsius
2. Converts it to Fahrenheit using: F = (C × 9/5) + 32
3. Converts it to Kelvin using: K = C + 273.15
4. Displays all three temperatures

### Challenge 4: Recipe Scaler
Create a program that:
1. Stores ingredient amounts for a recipe (e.g., 2 cups flour, 1 cup sugar)
2. Asks the user how many times to scale the recipe
3. Calculates and displays the new amounts

## Debugging Practice

If your program doesn't work, check:
- [ ] Did you spell variable names exactly the same each time?
- [ ] Did you use quotes around text?
- [ ] Did you convert input to the right type (int or float)?
- [ ] Are you using the right operators (+, -, *, /)?

## Common Errors

### NameError: name 'age' is not defined
**Problem**: Using a variable before creating it  
**Fix**: Make sure you create the variable first
```python
# Wrong
print(age)
age = 15

# Right
age = 15
print(age)
```

### TypeError: unsupported operand type(s)
**Problem**: Trying to do math with text  
**Fix**: Convert input to numbers
```python
# Wrong
age = input("Age: ")
next_year = age + 1

# Right
age = int(input("Age: "))
next_year = age + 1
```

### SyntaxError: invalid syntax
**Problem**: Typo or missing quotes/parentheses  
**Fix**: Check your code carefully
```python
# Wrong
print("Hello)
age = 15

# Right
print("Hello")
age = 15
```

## Testing Your Program

Before calling the instructor:
1. Run your program: `python3 activity1.py`
2. Try different inputs
3. Make sure all outputs are correct
4. Check that variable names make sense

## Group Discussion Questions

1. Why do we use descriptive variable names?
2. What happens if you forget `float()` when getting a number from input?
3. What's the difference between `/` and `//`?
4. Can you add a number and text together? Why or why not?

## Reflection

After completing this activity, you should be able to:
- [ ] Create variables with appropriate names
- [ ] Store different types of data (numbers, text)
- [ ] Perform basic math operations
- [ ] Get input from users
- [ ] Display results using print()
- [ ] Convert between data types

## Show Your Work!

When you finish, show your instructor:
- Your working calculator program
- At least one challenge you attempted
- Any creative additions you made!

---

**Remember**: Making mistakes is part of learning! If something doesn't work, read the error message and try to understand what went wrong.
