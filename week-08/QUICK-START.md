# Week 8 Quick Start Guide

## Setting Up Your Web Project

### 1. Create Project Folder
```bash
cd /home/pi
mkdir website
cd website
```

### 2. Create Your First HTML File
```bash
nano index.html
```

### 3. Basic HTML Template
```html
<!DOCTYPE html>
<html>
<head>
    <title>My Webpage</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Hello, World!</h1>
    <p>This is my first webpage!</p>
    <button onclick="sayHello()">Click Me</button>
    
    <script src="script.js"></script>
</body>
</html>
```

### 4. Create CSS File
```bash
nano style.css
```

```css
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 20px;
}

h1 {
    color: #2c3e50;
    text-align: center;
}

p {
    color: #34495e;
    font-size: 18px;
}

button {
    background-color: #3498db;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

button:hover {
    background-color: #2980b9;
}
```

### 5. Create JavaScript File
```bash
nano script.js
```

```javascript
function sayHello() {
    alert("Hello from JavaScript!");
}

function changeColor() {
    document.body.style.backgroundColor = "#e74c3c";
}

console.log("JavaScript loaded successfully!");
```

---

## Starting the Web Server

### Method 1: Python 3 (Recommended)
```bash
cd /home/pi/website
python3 -m http.server 8000
```

### Method 2: Python 2 (If needed)
```bash
cd /home/pi/website
python -m SimpleHTTPServer 8000
```

### Accessing Your Website

**On the Raspberry Pi:**
```
http://localhost:8000
```

**From another device:**
1. Find Pi's IP address:
```bash
hostname -I
```

2. On other device, visit:
```
http://[PI_IP_ADDRESS]:8000
```
Example: `http://192.168.1.100:8000`

### Stop the Server
Press `Ctrl+C` in the terminal

---

## Essential HTML Tags Cheat Sheet

### Structure
```html
<!DOCTYPE html>              <!-- Document type -->
<html>                       <!-- Root element -->
<head>                       <!-- Metadata -->
<body>                       <!-- Visible content -->
```

### Headings
```html
<h1>Largest Heading</h1>
<h2>Second Largest</h2>
<h3>Third Largest</h3>
<h4>Fourth</h4>
<h5>Fifth</h5>
<h6>Smallest Heading</h6>
```

### Text Formatting
```html
<p>Paragraph</p>
<strong>Bold text</strong>
<em>Italic text</em>
<br>                         <!-- Line break -->
<hr>                         <!-- Horizontal rule -->
```

### Links and Images
```html
<a href="https://example.com">Link text</a>
<img src="image.jpg" alt="Description">
```

### Lists
```html
<!-- Unordered (bullets) -->
<ul>
    <li>Item 1</li>
    <li>Item 2</li>
</ul>

<!-- Ordered (numbers) -->
<ol>
    <li>First</li>
    <li>Second</li>
</ol>
```

### Containers
```html
<div>Block container</div>
<span>Inline container</span>
```

### Forms and Inputs
```html
<button>Click Me</button>
<input type="text" placeholder="Enter text">
<input type="checkbox"> Checkbox
<input type="radio" name="group"> Radio button
```

---

## Essential CSS Cheat Sheet

### Selectors
```css
/* Element selector */
p { color: blue; }

/* Class selector */
.my-class { color: red; }

/* ID selector */
#my-id { color: green; }

/* Multiple selectors */
h1, h2, h3 { font-family: Arial; }
```

### Colors
```css
/* Named colors */
color: red;
background-color: blue;

/* Hex codes */
color: #FF0000;              /* Red */
color: #00FF00;              /* Green */
color: #0000FF;              /* Blue */

/* RGB */
color: rgb(255, 0, 0);       /* Red */

/* RGBA (with transparency) */
color: rgba(255, 0, 0, 0.5); /* 50% transparent red */
```

### Text Styling
```css
color: blue;
font-size: 20px;
font-family: Arial, sans-serif;
font-weight: bold;
text-align: center;          /* left, right, center, justify */
text-decoration: underline;  /* none, underline, line-through */
text-transform: uppercase;   /* lowercase, capitalize */
```

### Box Model
```css
margin: 20px;                /* Space outside element */
padding: 10px;               /* Space inside element */
border: 2px solid black;     /* Border around element */
width: 300px;
height: 200px;
```

### Background
```css
background-color: lightblue;
background-image: url('image.jpg');
background-size: cover;
background-repeat: no-repeat;
```

### Display and Layout
```css
display: block;              /* Takes full width */
display: inline;             /* Flows with text */
display: none;               /* Hides element */
```

---

## Essential JavaScript Cheat Sheet

### Variables
```javascript
let name = "Alex";           // Can be changed
const age = 12;              // Cannot be changed
var old = "avoid";           // Old way, use let/const instead
```

### Data Types
```javascript
let text = "Hello";          // String
let number = 42;             // Number
let decimal = 3.14;          // Number (float)
let isTrue = true;           // Boolean
let array = [1, 2, 3];       // Array
```

### Functions
```javascript
// Function declaration
function greet() {
    alert("Hello!");
}

// Function with parameters
function sayName(name) {
    alert("Hello, " + name);
}

// Call the function
greet();
sayName("Alex");
```

### String Concatenation
```javascript
let firstName = "John";
let lastName = "Doe";
let fullName = firstName + " " + lastName;

// Template literals (modern way)
let greeting = `Hello, ${firstName}!`;
```

### Conditionals
```javascript
if (age >= 13) {
    console.log("Teenager");
} else if (age >= 5) {
    console.log("Child");
} else {
    console.log("Toddler");
}
```

### DOM Manipulation
```javascript
// Get element by ID
let element = document.getElementById("demo");

// Change content
element.innerHTML = "New content";

// Change style
element.style.color = "red";
element.style.fontSize = "20px";

// Change attribute
element.setAttribute("class", "highlight");
```

### Events
```javascript
// In HTML
<button onclick="myFunction()">Click</button>

// Or in JavaScript
document.getElementById("myBtn").addEventListener("click", function() {
    alert("Button clicked!");
});
```

### Console Logging (Debugging)
```javascript
console.log("Hello, console!");
console.log("Variable value:", myVariable);
console.error("This is an error");
```

---

## Common Color Codes

### Basic Colors
```css
red: #FF0000
blue: #0000FF
green: #00FF00
yellow: #FFFF00
orange: #FFA500
purple: #800080
pink: #FFC0CB
brown: #A52A2A
black: #000000
white: #FFFFFF
gray: #808080
```

### Nice Web Colors
```css
/* Blues */
light-blue: #3498db
dark-blue: #2c3e50
navy: #34495e

/* Greens */
emerald: #2ecc71
sea-green: #1abc9c

/* Reds */
alizarin: #e74c3c
pomegranate: #c0392b

/* Others */
orange: #e67e22
yellow: #f39c12
purple: #9b59b6
```

---

## File Structure Best Practice

```
/home/pi/website/
│
├── index.html          (Main page - must be named index.html)
├── style.css           (All your CSS styling)
├── script.js           (All your JavaScript)
│
├── images/             (Folder for images)
│   ├── photo1.jpg
│   ├── logo.png
│   └── background.gif
│
└── pages/              (Optional: other HTML pages)
    ├── about.html
    └── projects.html
```

---

## Opening Developer Tools

### In Chromium Browser:
- Press `F12`
- Or right-click anywhere → "Inspect"
- Or menu → More Tools → Developer Tools

### What You Can Do:
- **Elements tab**: See and edit HTML/CSS live
- **Console tab**: See JavaScript errors and logs
- **Network tab**: See what files are loading
- **Sources tab**: Debug JavaScript

---

## Quick Debugging Checklist

### HTML Not Showing Correctly
- [ ] File saved with .html extension?
- [ ] All tags closed properly?
- [ ] DOCTYPE at top?
- [ ] Refreshed browser (Ctrl+R)?

### CSS Not Working
- [ ] CSS file linked in `<head>`?
- [ ] Filename spelled correctly?
- [ ] Semicolons after each property?
- [ ] Selector names match HTML?
- [ ] Curly braces closed?

### JavaScript Not Working
- [ ] Check browser console for errors (F12)
- [ ] Function names spelled correctly?
- [ ] Script loaded (in HTML)?
- [ ] Quotes and parentheses matched?
- [ ] Using correct element IDs?

### Can't Access from Other Device
- [ ] Web server running?
- [ ] Same WiFi network?
- [ ] Using Pi's IP (not localhost)?
- [ ] Port :8000 included?

---

## Keyboard Shortcuts

### Text Editor (nano)
- `Ctrl+O` - Save file
- `Ctrl+X` - Exit
- `Ctrl+K` - Cut line
- `Ctrl+U` - Paste line

### Browser
- `Ctrl+R` - Refresh page
- `Ctrl+Shift+R` - Hard refresh (clear cache)
- `F12` - Open developer tools
- `Ctrl+U` - View page source
- `Ctrl++` - Zoom in
- `Ctrl+-` - Zoom out

### Terminal
- `Ctrl+C` - Stop current process
- `Ctrl+L` - Clear screen
- `↑` (Up arrow) - Previous command
- `Tab` - Auto-complete

---

## Testing Your Website

### Step-by-Step Testing Process:
1. **Save all files** (Ctrl+O in nano)
2. **Start web server** (if not running)
3. **Open browser** to http://localhost:8000
4. **Check page loads** - Do you see your content?
5. **Test all links** - Click every link
6. **Test all buttons** - Click all interactive elements
7. **Check console** - F12 → Console tab for errors
8. **Test on another device** - Phone/tablet
9. **Ask someone else to test** - Fresh eyes find bugs!

---

## Getting Help

### When Something Doesn't Work:
1. **Check the console** (F12 in browser)
2. **Read the error message** carefully
3. **Check your spelling** (common issue!)
4. **Inspect element** (right-click → Inspect)
5. **Look at working examples** in `/examples/` folder
6. **Ask instructor** - we're here to help!

### Useful Console Commands:
```javascript
// See what variables exist
console.log(myVariable);

// Check if function exists
console.log(typeof myFunction);

// Test selectors
console.log(document.getElementById("demo"));
```

---

**Pro Tip**: Save your work frequently! Use Ctrl+S often. Make a copy of working code before making big changes. You can always go back if something breaks!
