# JavaScript Cheat Sheet

## Adding JavaScript to HTML

### 1. Internal JavaScript (In HTML file)
```html
<!DOCTYPE html>
<html>
<head>
    <title>My Page</title>
</head>
<body>
    <h1>Hello</h1>
    
    <script>
        // JavaScript code goes here
        console.log("Hello, World!");
    </script>
</body>
</html>
```

### 2. External JavaScript (Separate File - BEST)
```html
<!-- At end of body, before </body> -->
<script src="script.js"></script>
```

## Console (For Testing/Debugging)
```javascript
// Print to browser console (press F12 to see)
console.log("Hello!");
console.log(42);
console.log("The answer is:", 42);
```

## Variables

### Declaring Variables
```javascript
// Use 'let' for variables that can change
let name = "Alex";
let age = 12;
let score = 0;

// Use 'const' for variables that won't change
const pi = 3.14159;
const schoolName = "My School";
```

### Variable Types
```javascript
// String (text)
let message = "Hello, World!";
let name = 'Alex';  // Single or double quotes

// Number
let age = 12;
let price = 9.99;

// Boolean (true/false)
let isStudent = true;
let isDone = false;

// Array (list)
let colors = ["red", "blue", "green"];
let numbers = [1, 2, 3, 4, 5];

// Object
let person = {
    name: "Alex",
    age: 12,
    grade: 7
};
```

## Math Operations
```javascript
let x = 10;
let y = 3;

let sum = x + y;        // 13
let diff = x - y;       // 7
let product = x * y;    // 30
let quotient = x / y;   // 3.333...
let remainder = x % y;  // 1 (modulo)

// Increment/decrement
x++;  // x = x + 1
x--;  // x = x - 1

// Compound operators
x += 5;  // x = x + 5
x -= 3;  // x = x - 3
x *= 2;  // x = x * 2
```

## Strings

### String Operations
```javascript
let firstName = "John";
let lastName = "Doe";

// Concatenation (joining)
let fullName = firstName + " " + lastName;  // "John Doe"

// Template literals (easier!)
let greeting = `Hello, ${firstName}!`;  // "Hello, John!"

// String properties and methods
let text = "Hello, World!";
text.length;           // 13
text.toLowerCase();    // "hello, world!"
text.toUpperCase();    // "HELLO, WORLD!"
text.includes("World"); // true
text.replace("World", "Alex"); // "Hello, Alex!"
```

## Arrays

### Working with Arrays
```javascript
let fruits = ["apple", "banana", "orange"];

// Access items (index starts at 0)
fruits[0];  // "apple"
fruits[1];  // "banana"
fruits[2];  // "orange"

// Add items
fruits.push("grape");       // Add to end
fruits.unshift("mango");    // Add to start

// Remove items
fruits.pop();               // Remove from end
fruits.shift();             // Remove from start

// Array properties
fruits.length;              // Number of items

// Loop through array
for (let i = 0; i < fruits.length; i++) {
    console.log(fruits[i]);
}
```

## Functions

### Declaring Functions
```javascript
// Basic function
function sayHello() {
    console.log("Hello!");
}

// Call the function
sayHello();

// Function with parameters
function greet(name) {
    console.log("Hello, " + name + "!");
}

greet("Alex");  // "Hello, Alex!"

// Function that returns a value
function add(a, b) {
    return a + b;
}

let result = add(5, 3);  // 8

// Function with multiple parameters
function introduce(name, age, grade) {
    return `Hi! I'm ${name}, I'm ${age} years old, and I'm in grade ${grade}.`;
}

console.log(introduce("Alex", 12, 7));
```

## If Statements (Conditionals)
```javascript
let age = 12;

// Simple if
if (age >= 13) {
    console.log("You're a teenager!");
}

// If-else
if (age >= 18) {
    console.log("You're an adult!");
} else {
    console.log("You're not an adult yet.");
}

// If-else if-else
if (age < 13) {
    console.log("You're a kid!");
} else if (age < 20) {
    console.log("You're a teenager!");
} else {
    console.log("You're an adult!");
}

// Comparison operators
let x = 10;
x == 10   // Equal to (true)
x === 10  // Exactly equal to (true)
x != 5    // Not equal to (true)
x > 5     // Greater than (true)
x < 20    // Less than (true)
x >= 10   // Greater than or equal (true)
x <= 10   // Less than or equal (true)

// Logical operators
let a = true;
let b = false;
a && b    // AND (false)
a || b    // OR (true)
!a        // NOT (false)
```

## Loops

### For Loop
```javascript
// Count from 0 to 4
for (let i = 0; i < 5; i++) {
    console.log(i);
}

// Count from 1 to 10
for (let i = 1; i <= 10; i++) {
    console.log(i);
}

// Loop through array
let colors = ["red", "blue", "green"];
for (let i = 0; i < colors.length; i++) {
    console.log(colors[i]);
}
```

### While Loop
```javascript
let count = 0;

while (count < 5) {
    console.log(count);
    count++;
}
```

## DOM Manipulation (Changing Webpage)

### Get Elements
```javascript
// Get element by ID
let element = document.getElementById("my-id");

// Get elements by class name
let elements = document.getElementsByClassName("my-class");

// Get element by tag name
let paragraphs = document.getElementsByTagName("p");

// Get element by CSS selector (modern, easiest)
let element = document.querySelector("#my-id");
let elements = document.querySelectorAll(".my-class");
```

### Change Content
```javascript
// Change text
document.getElementById("demo").innerHTML = "New text!";
document.getElementById("demo").textContent = "New text!";

// Change HTML
document.getElementById("demo").innerHTML = "<strong>Bold text!</strong>";
```

### Change Styles
```javascript
// Change CSS properties
document.getElementById("demo").style.color = "red";
document.getElementById("demo").style.fontSize = "24px";
document.getElementById("demo").style.backgroundColor = "yellow";
document.getElementById("demo").style.display = "none";  // Hide
document.getElementById("demo").style.display = "block"; // Show
```

### Change Attributes
```javascript
// Change image source
document.getElementById("my-img").src = "new-image.jpg";

// Change link
document.getElementById("my-link").href = "https://example.com";

// Add/remove classes
document.getElementById("demo").classList.add("highlight");
document.getElementById("demo").classList.remove("highlight");
document.getElementById("demo").classList.toggle("highlight");
```

### Create/Remove Elements
```javascript
// Create new element
let newDiv = document.createElement("div");
newDiv.innerHTML = "This is a new div!";
document.body.appendChild(newDiv);

// Remove element
let element = document.getElementById("demo");
element.remove();
```

## Events

### Click Events
```html
<!-- Method 1: Inline (in HTML) -->
<button onclick="handleClick()">Click Me</button>

<script>
function handleClick() {
    alert("Button clicked!");
}
</script>
```

```javascript
// Method 2: addEventListener (in JavaScript - BETTER)
document.getElementById("my-button").addEventListener("click", function() {
    alert("Button clicked!");
});

// Or with named function
function handleClick() {
    alert("Button clicked!");
}
document.getElementById("my-button").addEventListener("click", handleClick);
```

### Common Events
```javascript
// Click
element.addEventListener("click", function() { });

// Mouse over
element.addEventListener("mouseover", function() { });

// Mouse out
element.addEventListener("mouseout", function() { });

// Key press
document.addEventListener("keypress", function(event) {
    console.log("Key pressed:", event.key);
});

// Form submit
form.addEventListener("submit", function(event) {
    event.preventDefault();  // Stop form from submitting
    // Your code here
});

// Input change
input.addEventListener("change", function() { });

// Page loaded
window.addEventListener("load", function() {
    console.log("Page loaded!");
});
```

## Alerts, Prompts, and Confirms
```javascript
// Alert (popup message)
alert("Hello!");

// Prompt (ask for input)
let name = prompt("What's your name?");
console.log("Hello, " + name);

// Confirm (yes/no question)
let answer = confirm("Are you sure?");
if (answer) {
    console.log("User clicked OK");
} else {
    console.log("User clicked Cancel");
}
```

## Random Numbers
```javascript
// Random number between 0 and 1 (not including 1)
let random = Math.random();

// Random number between 1 and 10
let random = Math.floor(Math.random() * 10) + 1;

// Random number between min and max
function getRandomNumber(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

let roll = getRandomNumber(1, 6);  // Dice roll
```

## setTimeout and setInterval
```javascript
// Run once after delay (milliseconds)
setTimeout(function() {
    console.log("This runs after 3 seconds");
}, 3000);

// Run repeatedly at interval
let intervalId = setInterval(function() {
    console.log("This runs every 2 seconds");
}, 2000);

// Stop interval
clearInterval(intervalId);
```

## Common Patterns

### Toggle Visibility
```javascript
function toggleElement() {
    let element = document.getElementById("demo");
    if (element.style.display === "none") {
        element.style.display = "block";
    } else {
        element.style.display = "none";
    }
}
```

### Change Text on Click
```javascript
function changeText() {
    document.getElementById("demo").innerHTML = "Text changed!";
}
```

### Counter
```javascript
let count = 0;

function increment() {
    count++;
    document.getElementById("counter").innerHTML = count;
}

function decrement() {
    count--;
    document.getElementById("counter").innerHTML = count;
}
```

### Random Quote Generator
```javascript
let quotes = [
    "Be yourself.",
    "Stay curious.",
    "Never give up.",
    "Learn something new every day."
];

function showRandomQuote() {
    let randomIndex = Math.floor(Math.random() * quotes.length);
    let quote = quotes[randomIndex];
    document.getElementById("quote").innerHTML = quote;
}
```

### Color Changer
```javascript
function changeColor() {
    let colors = ["red", "blue", "green", "yellow", "purple", "orange"];
    let randomColor = colors[Math.floor(Math.random() * colors.length)];
    document.body.style.backgroundColor = randomColor;
}
```

### Simple Form Validation
```javascript
function validateForm() {
    let name = document.getElementById("name").value;
    
    if (name === "") {
        alert("Please enter your name!");
        return false;
    }
    
    alert("Form submitted! Hello, " + name);
    return true;
}
```

## Complete Interactive Example

### HTML
```html
<!DOCTYPE html>
<html>
<head>
    <title>Interactive Page</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Fun Counter</h1>
    
    <div id="counter-display">0</div>
    
    <button onclick="increment()">Add 1</button>
    <button onclick="decrement()">Subtract 1</button>
    <button onclick="reset()">Reset</button>
    
    <div id="message"></div>
    
    <script src="script.js"></script>
</body>
</html>
```

### JavaScript (script.js)
```javascript
let count = 0;

function increment() {
    count++;
    updateDisplay();
    checkCount();
}

function decrement() {
    count--;
    updateDisplay();
    checkCount();
}

function reset() {
    count = 0;
    updateDisplay();
    document.getElementById("message").innerHTML = "Counter reset!";
}

function updateDisplay() {
    document.getElementById("counter-display").innerHTML = count;
}

function checkCount() {
    let message = "";
    
    if (count > 10) {
        message = "Wow, that's a big number!";
    } else if (count < 0) {
        message = "Uh oh, negative numbers!";
    } else {
        message = "";
    }
    
    document.getElementById("message").innerHTML = message;
}
```

## Debugging Tips
1. **Use console.log()** - Print values to see what's happening
2. **Check browser console** - Press F12, look for errors
3. **Check spelling** - JavaScript is case-sensitive
4. **Check syntax** - Missing brackets, quotes, semicolons?
5. **Test small pieces** - Don't write everything at once
6. **Read error messages** - They tell you what's wrong
7. **Use descriptive names** - `userName` not `x`
8. **Comment out code** - Use `//` to temporarily disable lines
9. **Test in browser** - Save file, refresh page
10. **Ask for help** - Don't struggle alone!

## Common Mistakes
1. **Missing parentheses** - `function myFunc()` not `function myFunc`
2. **Missing brackets** - All `{` need matching `}`
3. **Case sensitivity** - `getElementById` not `getElementByID`
4. **Undefined variables** - Declare with `let` before using
5. **Wrong quotes** - Use `"` or `'`, not smart quotes from Word
6. **Missing semicolons** - End statements with `;`
7. **== vs ===** - Use `===` for exact comparison
8. **Comparing strings** - `"5" != 5` (string vs number)
9. **Array indices** - Start at 0, not 1
10. **Not saving files** - Save before testing in browser!

## JavaScript Tips
- Start simple, add complexity gradually
- Test after every change
- Use meaningful variable names
- Comment your code to explain what it does
- Learn from errors - they teach you!
- Practice, practice, practice!
