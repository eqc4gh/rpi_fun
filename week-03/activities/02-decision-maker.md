# Activity 2: Decision Maker

**Time**: 15 minutes  
**Group Size**: 2-3 students  
**Difficulty**: Beginner

## Objective
Practice using if statements, comparison operators, and logical operators to make programs that can make decisions.

## Setup
1. Open Terminal on your Raspberry Pi
2. Create a new Python file: `nano activity2.py`
3. Collaborate with your group!

## Part 1: Age Checker (5 minutes)

Create a program that determines what someone can do based on their age.

### Your Task
Write a program that:
1. Asks the user for their age
2. Tells them what they can do:
   - Under 13: "You can use kids' apps"
   - 13-17: "You can use social media with parent permission"
   - 18 or over: "You can vote and drive"

### Example Output
```
How old are you? 15
You can use social media with parent permission
```

### Starter Code
```python
# Age Checker

age = int(input("How old are you? "))

if age < 13:
    print("You can use kids' apps")
elif age < 18:
    print("You can use social media with parent permission")
else:
    print("You can vote and drive")
```

### Extension
Add more age categories:
- Under 5: "You're a preschooler"
- 5-12: "You're in elementary school"
- Add your own categories!

## Part 2: Password Checker (4 minutes)

Create a simple password system.

### Your Task
Write a program that:
1. Stores a secret password in a variable
2. Asks the user to enter the password
3. Tells them if it's correct or incorrect

### Example Output
```
Enter the password: raspberry
Correct! Access granted.
```

or

```
Enter the password: banana
Incorrect password. Access denied.
```

### Starter Code
```python
# Password Checker

secret_password = "raspberry"
user_input = input("Enter the password: ")

if user_input == secret_password:
    print("Correct! Access granted.")
else:
    print("Incorrect password. Access denied.")
```

### Extension
Add a hint if the password is wrong:
```python
else:
    print("Incorrect password. Access denied.")
    print("Hint: It's a type of Pi!")
```

## Part 3: Grade Calculator (6 minutes)

Create a program that converts number grades to letter grades.

### Your Task
Write a program that:
1. Asks the user for their test score (0-100)
2. Displays their letter grade:
   - 90-100: A
   - 80-89: B
   - 70-79: C
   - 60-69: D
   - Below 60: F

### Example Output
```
Enter your test score: 85
Your grade is: B
```

### Starter Code
```python
# Grade Calculator

score = int(input("Enter your test score: "))

if score >= 90:
    print("Your grade is: A")
elif score >= 80:
    
elif score >= 70:
    
elif score >= 60:
    
else:
    
```

### Tips
- Order matters! Check highest grades first
- Use `>=` (greater than or equal to)
- Python checks conditions from top to bottom

### Extension
Add messages for each grade:
```python
if score >= 90:
    print("Your grade is: A")
    print("Excellent work!")
```

## Challenges (If you finish early)

### Challenge 1: Enhanced Age Checker
Create a program that:
1. Asks for age
2. Asks if they have parent permission (yes/no)
3. Uses `and` or `or` to check multiple conditions
4. Example: Age 14 AND has permission → "You can watch PG-13 movies"

**Hint**: 
```python
has_permission = input("Do you have parent permission? (yes/no) ")
if age >= 13 and has_permission == "yes":
    # code here
```

### Challenge 2: Number Classifier
Create a program that tells you about a number:
1. Ask user for a number
2. Tell them if it's:
   - Positive, negative, or zero
   - Even or odd (use `%` operator)
   - Divisible by 5

**Hints**:
- Use `if number > 0:` for positive
- Use `if number % 2 == 0:` for even
- Use `if number % 5 == 0:` for divisible by 5

### Challenge 3: Weather Advisor
Create a program that:
1. Asks for the temperature
2. Asks if it's raining (yes/no)
3. Gives advice:
   - Cold and raining → "Wear a coat and bring an umbrella"
   - Cold and not raining → "Wear a coat"
   - Warm and raining → "Bring an umbrella"
   - Warm and not raining → "Enjoy the nice weather!"

**Hint**: You'll need nested if statements!
```python
if temperature < 60:
    if is_raining == "yes":
        print("Wear a coat and bring an umbrella")
    else:
        print("Wear a coat")
```

### Challenge 4: Simple Login System
Create a program that checks both username AND password:
1. Store correct username and password
2. Ask user for both
3. Only grant access if BOTH are correct
4. Give specific error messages:
   - Wrong username: "Username not found"
   - Right username, wrong password: "Incorrect password"
   - Both correct: "Welcome!"

**Hint**: Use nested if statements or the `and` operator

### Challenge 5: Rock, Paper, Scissors Judge
Create a program where:
1. Computer chooses rock, paper, or scissors (you pick for now)
2. User enters their choice
3. Program determines the winner

**Rules**:
- Rock beats Scissors
- Scissors beats Paper
- Paper beats Rock
- Same choice = Tie

## Debugging Practice

If your program doesn't work, check:
- [ ] Did you include the colon (`:`) after each if/elif/else?
- [ ] Is all your code properly indented (4 spaces or 1 Tab)?
- [ ] Are you using `==` for comparison (not `=`)?
- [ ] Did you capitalize `True` and `False`?

## Common Errors

### SyntaxError: invalid syntax
**Problem**: Missing colon after if statement  
**Fix**: Add colon
```python
# Wrong
if age > 18
    print("Adult")

# Right
if age > 18:
    print("Adult")
```

### IndentationError
**Problem**: Code not indented properly  
**Fix**: Use Tab or 4 spaces consistently
```python
# Wrong
if age > 18:
print("Adult")

# Right
if age > 18:
    print("Adult")
```

### Conditions Not Working
**Problem**: Using = instead of ==  
**Fix**: Use == for comparisons
```python
# Wrong
if age = 18:  # This is assigning, not comparing!

# Right
if age == 18:
```

## Testing Your Program

1. Test with different values
2. Test edge cases (exactly 13, exactly 18, etc.)
3. Test with unexpected input
4. Make sure all paths work (try to trigger each if/elif/else)

## Group Discussion Questions

1. Why does the order of if-elif statements matter?
2. What's the difference between multiple if statements and if-elif?
3. When would you use `and` vs `or`?
4. What happens if you forget to indent code after an if statement?

## Real-World Applications

Where do you see if statements in real life?
- Apps checking if you're old enough
- Websites checking if you entered the right password
- Games determining if you won or lost
- Thermostats deciding to turn on heating or cooling

## Reflection

After completing this activity, you should be able to:
- [ ] Write if statements with proper syntax
- [ ] Use elif and else appropriately
- [ ] Compare values using ==, !=, <, >, <=, >=
- [ ] Use proper indentation
- [ ] Make programs that respond differently based on input

## Show Your Work!

When you finish, demonstrate:
- Your grade calculator working with different scores
- At least one challenge program
- Something creative you added!

## Take It Further at Home

Try creating:
1. A quiz program with multiple questions
2. A BMI calculator that categorizes the result
3. A tip calculator that suggests amounts based on service quality
4. A game where the computer picks a secret number and you guess

---

**Remember**: The best way to learn is by experimenting! Try changing the conditions and see what happens. Don't be afraid to make mistakes!
