# Week 3 Homework: Python Programming Practice

**Due**: Before Week 4 class  
**Submission**: Bring your .py files on a USB drive or be ready to demonstrate on your Raspberry Pi  
**Estimated Time**: 45-60 minutes

## Instructions

Complete the following programs on your Raspberry Pi. Save each program as a separate `.py` file with the name indicated. Test each program thoroughly to make sure it works correctly!

## Required Programs (Complete All 3)

### Program 1: Personal Information Card (Easy)

**Filename**: `info_card.py`

Create a program that displays your personal information in a nicely formatted way.

**Requirements**:
1. Store the following information in variables:
   - Your name
   - Your age
   - Your favorite subject
   - Your favorite hobby
   - Your hometown
2. Display all information with labels
3. Calculate and display how old you'll be in 10 years

**Example Output**:
```
====== Personal Information Card ======
Name: Alex Johnson
Age: 15 years old
Favorite Subject: Science
Favorite Hobby: Gaming
Hometown: Charlotte, NC
In 10 years, I'll be 25 years old
========================================
```

**Tips**:
- Use clear variable names
- You can use `print("=" * 40)` to print a line of equal signs
- Remember to use `str()` if you need to combine numbers with text

---

### Program 2: Simple Shopping Calculator (Medium)

**Filename**: `shopping_calc.py`

Create a program that helps calculate the total cost of shopping items including tax.

**Requirements**:
1. Ask the user for three pieces of information:
   - Price of item 1
   - Price of item 2
   - Price of item 3
2. Calculate the subtotal (sum of all items)
3. Calculate tax (8% of subtotal)
4. Calculate and display the total (subtotal + tax)
5. Display all values clearly labeled

**Example Output**:
```
=== Shopping Calculator ===
Enter price of item 1: 10.50
Enter price of item 2: 5.25
Enter price of item 3: 15.00

Subtotal: $30.75
Tax (8%): $2.46
Total: $33.21
```

**Tips**:
- Use `float(input())` to get decimal numbers
- Tax calculation: `tax = subtotal * 0.08`
- Use f-strings for nice formatting: `print(f"Total: ${total:.2f}")`
- The `:.2f` formats numbers to 2 decimal places

---

### Program 3: Student Grade Analyzer (Medium)

**Filename**: `grade_analyzer.py`

Create a program that analyzes a student's test scores.

**Requirements**:
1. Ask the user for the student's name
2. Ask for three test scores (0-100)
3. Calculate and display:
   - The average score
   - The letter grade (A, B, C, D, or F)
   - A message based on performance
4. Use if-elif-else to determine the letter grade:
   - 90-100: A (Message: "Excellent work!")
   - 80-89: B (Message: "Good job!")
   - 70-79: C (Message: "Satisfactory")
   - 60-69: D (Message: "Needs improvement")
   - Below 60: F (Message: "Please see teacher")

**Example Output**:
```
=== Grade Analyzer ===
Enter student name: Alex
Enter test score 1: 85
Enter test score 2: 92
Enter test score 3: 88

Student: Alex
Test 1: 85
Test 2: 92
Test 3: 88
Average: 88.33
Grade: B
Good job!
```

**Tips**:
- Average calculation: `average = (score1 + score2 + score3) / 3`
- Use if-elif-else chain for letter grades
- Remember proper indentation!

---

## Challenge Programs (Optional - Choose 1 or More)

### Challenge 1: Temperature Advisor

**Filename**: `temp_advisor.py`

Create a program that:
1. Asks for the current temperature in Fahrenheit
2. Converts it to Celsius using: C = (F - 32) × 5/9
3. Displays both temperatures
4. Gives appropriate advice:
   - Above 85°F: "It's hot! Stay hydrated"
   - 70-85°F: "Perfect weather!"
   - 50-69°F: "A bit cool, wear a light jacket"
   - 32-49°F: "It's cold! Wear a coat"
   - Below 32°F: "Freezing! Bundle up!"

---

### Challenge 2: Movie Ticket Pricer

**Filename**: `movie_ticket.py`

Create a program that calculates movie ticket prices:

1. Ask for the customer's age
2. Ask if it's a matinee showing (yes/no)
3. Ask if they're a student (yes/no)
4. Calculate the price:
   - Base price: $15
   - Child (under 13): $10
   - Senior (65+): $10
   - Student discount: -$2
   - Matinee discount: -$3
5. Display the final price and amount saved

**Example**: 
- Age 16, Student, Matinee: $15 - $2 - $3 = $10

---

### Challenge 3: Number Guesser Game

**Filename**: `number_game.py`

Create a simple number guessing game:

1. Set a secret number (you choose, between 1-20)
2. Ask the user to guess
3. Tell them if they're:
   - Correct: "You win!"
   - Too high: "Too high! The number is lower"
   - Too low: "Too low! The number is higher"
4. After they guess, tell them how far off they were

**Example**:
```
Guess a number between 1 and 20: 15
Too high! The number is lower.
You were 8 away from the answer.
The secret number was 7.
```

---

### Challenge 4: Pizza Party Calculator

**Filename**: `pizza_party.py`

Create a program for planning a pizza party:

1. Ask how many people are coming
2. Ask how many slices each person typically eats
3. Each pizza has 8 slices
4. Calculate and display:
   - Total slices needed
   - Number of pizzas to order (round up!)
   - Cost (pizzas are $12 each)
   - Cost per person

**Hints**:
- To round up, add 7 to total slices before dividing by 8: `(total_slices + 7) // 8`
- Or use: `import math` and `math.ceil(total_slices / 8)`

---

### Challenge 5: BMI Calculator

**Filename**: `bmi_calculator.py`

Create a BMI (Body Mass Index) calculator:

1. Ask for the person's name
2. Ask for weight in pounds
3. Ask for height in inches
4. Calculate BMI using: BMI = (weight × 703) / (height²)
5. Display the BMI
6. Categorize the result:
   - Below 18.5: Underweight
   - 18.5-24.9: Normal weight
   - 25-29.9: Overweight
   - 30 or above: Obese
7. Note: This is for educational purposes only!

---

## Submission Checklist

Before submitting, make sure:
- [ ] All three required programs are completed
- [ ] Each program is saved with the correct filename
- [ ] You've tested each program with different inputs
- [ ] Your code has clear variable names
- [ ] You've added comments explaining what your code does
- [ ] Programs have no syntax errors
- [ ] Output is clearly formatted and easy to read

## Testing Your Programs

For each program:
1. Run it at least 3 times with different inputs
2. Try edge cases (very large numbers, very small numbers, zero)
3. Make sure error messages make sense
4. Check that calculations are correct

## Common Mistakes to Avoid

1. **Forgetting to convert input**:
   ```python
   # Wrong
   age = input("Age: ")
   
   # Right
   age = int(input("Age: "))
   ```

2. **Missing colons in if statements**:
   ```python
   # Wrong
   if age > 18
   
   # Right
   if age > 18:
   ```

3. **Wrong indentation**:
   ```python
   # Wrong
   if temperature > 75:
   print("Hot")
   
   # Right
   if temperature > 75:
       print("Hot")
   ```

4. **Using = instead of ==**:
   ```python
   # Wrong - this assigns!
   if score = 100:
   
   # Right - this compares!
   if score == 100:
   ```

## Getting Help

If you're stuck:
1. Read the error message carefully
2. Check your syntax (colons, indentation, quotes)
3. Review the Quick Start guide
4. Try the code in small pieces
5. Ask for help (parents, friends, instructor)

## Grading Criteria

Your homework will be evaluated on:
- **Completeness** (40%): All required programs completed
- **Correctness** (30%): Programs work as specified
- **Code Quality** (20%): Clear variable names, good formatting
- **Creativity** (10%): Challenge programs or creative additions

## Extensions for Advanced Students

Want to go further? Try:
1. Add input validation (check if user entered valid numbers)
2. Add color to your output using ANSI escape codes
3. Create a menu system that runs all your programs
4. Combine multiple programs into one big program
5. Add ASCII art to make programs more interesting

## Reflection Questions

Answer these in comments at the top of your `info_card.py`:
1. What was the most challenging part of this homework?
2. What did you learn that you didn't know before?
3. What would you like to learn next in Python?

```python
# Reflection:
# 1. The most challenging part was...
# 2. I learned that...
# 3. I would like to learn...

# Your code starts here
```

---

## Need Help?

If you have questions or problems:
- Review the Week 3 lecture notes
- Check the Quick Start guide
- Try your code in the Python shell first
- Email your instructor
- Come to office hours or tutoring

## Remember!

- Start early! Don't wait until the last minute
- Test your programs thoroughly
- Make mistakes - that's how we learn!
- Have fun experimenting with Python!
- Be proud of your work - you're becoming a programmer!

---

**Good luck! See you in Week 4 when we start controlling real hardware with Python!**
