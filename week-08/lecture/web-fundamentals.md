# Lecture Notes: Web Development Fundamentals

## Part 1: Introduction to the Web (10 minutes)

### What is the World Wide Web?
The World Wide Web (WWW) is a system of interconnected documents and resources accessed via the internet. When you visit a website, you're requesting files from a computer somewhere in the world.

### Client-Server Model
```
[Your Device]  ←→  [Server (Hosting Website)]
   (Client)              (Serves Files)
   
1. Client requests webpage (types URL)
2. Server sends HTML, CSS, JavaScript files
3. Browser renders (displays) the page
4. User interacts, more requests sent
```

**Key Concepts**:
- **Client**: The device requesting information (your computer, phone, tablet)
- **Server**: The computer that stores and sends website files
- **Browser**: Software that displays webpages (Chrome, Firefox, Safari, Chromium)
- **Request**: Asking for webpage files
- **Response**: Server sending back files

### How Websites Work
When you type "www.example.com" and hit Enter:

1. **DNS Lookup**: Domain name converted to IP address
   - Like a phone book for the internet
   - example.com → 192.0.2.1

2. **HTTP Request**: Browser asks server for files
   - "Please send me the homepage"

3. **Server Response**: Server sends files back
   - HTML file (structure)
   - CSS file (styling)
   - JavaScript file (interactivity)
   - Images and other media

4. **Browser Rendering**: Files processed and displayed
   - HTML parsed first
   - CSS applied to make it pretty
   - JavaScript runs to add interactivity

### URLs Explained
```
https://www.example.com:443/page.html?id=123#section2
  ^       ^       ^      ^      ^         ^       ^
  |       |       |      |      |         |       |
Protocol  |    Domain   Port  Path    Query   Fragment
        subdomain                   Parameters
```

**Parts of a URL**:
- **Protocol**: http:// or https:// (secure)
- **Domain**: The website name (example.com)
- **Port**: Door number on server (usually :80 or :443)
- **Path**: Specific page (/about.html)
- **Query**: Extra info (?search=hello)
- **Fragment**: Jump to section (#top)

### Static vs. Dynamic Websites

**Static Website**:
- Same content for everyone
- Pre-built HTML/CSS/JS files
- Fast and simple
- Example: Personal blog, portfolio
- What we're building this week!

**Dynamic Website**:
- Content changes based on user, time, data
- Generated on-the-fly by server
- More complex, needs database
- Example: Facebook, Gmail, online stores
- We'll touch on this in Week 9!

### IP Addresses and localhost

**IP Address**: Unique number for each device on network
- Like a home address for computers
- Example: 192.168.1.100
- Find yours: `hostname -I`

**localhost**: Special address meaning "this computer"
- Always points to 127.0.0.1
- Used for testing before deploying
- You'll use this today!

**Port Numbers**: Channels for different services
- Think of them like apartment numbers
- Web usually uses :80 (HTTP) or :443 (HTTPS)
- We'll use :8000 for our server today

---

## Part 2: HTML - Structure (15 minutes)

### What is HTML?
**HTML** (HyperText Markup Language) is the skeleton of webpages. It defines WHAT content is on the page, but not HOW it looks.

**Analogy**: If a webpage is a house, HTML is the framing and walls.

### HTML Document Structure
Every HTML page has this basic structure:

```html
<!DOCTYPE html>              <!-- Tells browser: "This is HTML5" -->
<html>                       <!-- Root element, everything goes inside -->
    <head>                   <!-- Metadata (not visible on page) -->
        <title>Page Title</title>  <!-- Shows in browser tab -->
        <link rel="stylesheet" href="style.css">  <!-- Link to CSS -->
    </head>
    <body>                   <!-- Visible content (what you see) -->
        <h1>Hello, World!</h1>
        <p>This is my webpage.</p>
    </body>
</html>
```

### Tags Explained
HTML uses **tags** to mark up content:

```html
<tagname>Content goes here</tagname>
  ^                              ^
  |                              |
Opening tag                 Closing tag
```

**Important Rules**:
1. Most tags need opening AND closing (some self-close)
2. Tags are case-insensitive (`<P>` = `<p>`) but lowercase is standard
3. Tags can be nested (inside each other)
4. Proper nesting matters!

**Good Nesting**:
```html
<div>
    <p>This is <strong>correct</strong>.</p>
</div>
```

**Bad Nesting**:
```html
<div>
    <p>This is <strong>wrong</p></strong>  <!-- WRONG! -->
</div>
```

### Essential HTML Tags

#### Headings (Hierarchy)
```html
<h1>Most Important (Page Title)</h1>
<h2>Major Sections</h2>
<h3>Subsections</h3>
<h4>Sub-subsections</h4>
<h5>Rarely used</h5>
<h6>Rarely used</h6>
```

Only one `<h1>` per page (usually page title)!

#### Text Content
```html
<p>Regular paragraph text. Browsers add spacing.</p>

<strong>Bold text (important)</strong>
<em>Italic text (emphasis)</em>

<br>  <!-- Line break (self-closing) -->
<hr>  <!-- Horizontal rule/line (self-closing) -->
```

#### Links
```html
<!-- External link -->
<a href="https://www.google.com">Visit Google</a>

<!-- Internal link (same site) -->
<a href="about.html">About Me</a>

<!-- Link to email -->
<a href="mailto:example@email.com">Email Me</a>

<!-- Open in new tab -->
<a href="https://example.com" target="_blank">New Tab</a>
```

**Parts of a link**:
- `<a>` = anchor tag
- `href` = hypertext reference (URL)
- Text between tags = clickable text

#### Images
```html
<img src="photo.jpg" alt="Description of photo">
     ^                ^
     |                |
   Location    Alternative text (for accessibility)
```

**Important**:
- `src` can be filename, path, or full URL
- `alt` describes image for screen readers and if image fails to load
- Images are self-closing (no `</img>` needed)

#### Lists

**Unordered (bullets)**:
```html
<ul>
    <li>First item</li>
    <li>Second item</li>
    <li>Third item</li>
</ul>
```

**Ordered (numbers)**:
```html
<ol>
    <li>Step one</li>
    <li>Step two</li>
    <li>Step three</li>
</ol>
```

#### Containers (Organizing Content)
```html
<div>
    A block container. Takes full width.
    Used to group content.
</div>

<span>Inline container (flows with text)</span>

<!-- Semantic containers (tell what content is) -->
<header>Top of page</header>
<nav>Navigation menu</nav>
<main>Main content</main>
<footer>Bottom of page</footer>
```

#### Forms and Inputs
```html
<button>Click Me</button>
<button onclick="doSomething()">Click for Action</button>

<input type="text" placeholder="Enter your name">
<input type="password" placeholder="Password">
<input type="checkbox"> Check me
<input type="radio" name="choice"> Option A
<input type="radio" name="choice"> Option B
```

### Attributes
Tags can have **attributes** that modify behavior:

```html
<tag attribute="value">Content</tag>

<img src="photo.jpg" width="300" height="200">
<a href="page.html" target="_blank">Link</a>
<p id="intro" class="highlight">Text</p>
```

**Common attributes**:
- `id` = Unique identifier (only one per page)
- `class` = Category/group (many elements can share)
- `style` = Inline CSS (not recommended)
- `src` = Source file location
- `href` = Link destination
- `alt` = Alternative text

### Comments in HTML
```html
<!-- This is a comment. Browser ignores it. -->
<!-- Use comments to explain your code -->
<!-- Or to temporarily disable code -->
```

### Special Characters
Some characters need special codes:

```html
&lt;    <!-- < (less than) -->
&gt;    <!-- > (greater than) -->
&amp;   <!-- & (ampersand) -->
&quot;  <!-- " (quote) -->
&copy;  <!-- © (copyright) -->
&nbsp;  <!-- Non-breaking space -->
```

---

## Part 3: CSS - Styling (15 minutes)

### What is CSS?
**CSS** (Cascading Style Sheets) controls HOW HTML elements look. It's the paint, furniture, and decorations of your house.

**Separation of Concerns**:
- HTML = Structure (what is it?)
- CSS = Presentation (how does it look?)
- JavaScript = Behavior (what does it do?)

### CSS Syntax
```css
selector {
    property: value;
    property: value;
}
```

**Example**:
```css
p {
    color: blue;
    font-size: 18px;
}
```

This says: "Make ALL paragraphs blue with 18px font size"

### Three Ways to Add CSS

#### 1. External CSS (BEST!)
Separate file (style.css):
```css
body {
    background-color: lightblue;
}
```

Link in HTML:
```html
<head>
    <link rel="stylesheet" href="style.css">
</head>
```

**Advantages**:
- Keep styles separate from content
- Easy to maintain
- Can reuse across pages
- Browser caches file (faster loading)

#### 2. Internal CSS (OK for small projects)
In HTML `<head>`:
```html
<head>
    <style>
        body {
            background-color: lightblue;
        }
    </style>
</head>
```

#### 3. Inline CSS (AVOID if possible)
Directly in HTML:
```html
<p style="color: red; font-size: 20px;">Red text</p>
```

**Problems with inline**:
- Hard to maintain
- Mixes structure and presentation
- Can't reuse styles
- Difficult to override

### CSS Selectors

#### Element Selector
Targets ALL elements of that type:
```css
p {
    color: blue;
}
/* Makes ALL paragraphs blue */
```

#### Class Selector
Targets elements with specific class:
```css
.highlight {
    background-color: yellow;
}
/* Use in HTML: <p class="highlight">Text</p> */
```

Can apply to multiple elements:
```html
<p class="highlight">Paragraph 1</p>
<p class="highlight">Paragraph 2</p>
<span class="highlight">Span</span>
```

#### ID Selector
Targets ONE specific element:
```css
#header {
    font-size: 36px;
}
/* Use in HTML: <h1 id="header">Title</h1> */
```

**Important**: IDs must be unique! Only ONE element per ID.

#### Multiple Selectors
Apply same styles to multiple elements:
```css
h1, h2, h3 {
    color: navy;
    font-family: Arial;
}
```

#### Descendant Selector
Target elements inside others:
```css
div p {
    color: green;
}
/* Only paragraphs INSIDE divs */
```

### Color in CSS

#### Color Names
```css
color: red;
color: blue;
color: green;
```
140+ named colors available!

#### Hex Codes
```css
color: #FF0000;    /* Red */
color: #00FF00;    /* Green */
color: #0000FF;    /* Blue */
color: #000000;    /* Black */
color: #FFFFFF;    /* White */
```

Format: `#RRGGBB` (Red, Green, Blue in hexadecimal)

#### RGB
```css
color: rgb(255, 0, 0);     /* Red */
color: rgb(0, 255, 0);     /* Green */
color: rgb(0, 0, 255);     /* Blue */
```

#### RGBA (with transparency)
```css
color: rgba(255, 0, 0, 0.5);  /* 50% transparent red */
/*              ^
                |
           Alpha (0=invisible, 1=solid)
```

### Text Styling
```css
color: blue;                    /* Text color */
font-size: 20px;                /* Text size */
font-family: Arial, sans-serif; /* Font type */
font-weight: bold;              /* Thickness (normal/bold) */
text-align: center;             /* left/right/center/justify */
text-decoration: underline;     /* none/underline/line-through */
text-transform: uppercase;      /* lowercase/uppercase/capitalize */
line-height: 1.6;               /* Space between lines */
letter-spacing: 2px;            /* Space between letters */
```

### The Box Model
Every HTML element is a box with layers:

```
┌─────────────────────────────────┐
│         MARGIN (outside)        │  ← Transparent, pushes other elements away
│  ┌───────────────────────────┐  │
│  │     BORDER                │  │  ← Can be colored, styled
│  │  ┌─────────────────────┐  │  │
│  │  │   PADDING (inside)  │  │  │  ← Transparent, space inside border
│  │  │  ┌───────────────┐  │  │  │
│  │  │  │   CONTENT     │  │  │  │  ← Actual content (text, images)
│  │  │  └───────────────┘  │  │  │
│  │  └─────────────────────┘  │  │
│  └───────────────────────────┘  │
└─────────────────────────────────┘
```

#### Box Model Properties
```css
/* Content size */
width: 300px;
height: 200px;

/* Padding (inside) */
padding: 20px;              /* All sides */
padding: 10px 20px;         /* Top/bottom, left/right */
padding: 10px 15px 20px 25px;  /* Top, right, bottom, left (clockwise) */

/* Border */
border: 2px solid black;
border-width: 3px;
border-style: solid;        /* solid/dashed/dotted */
border-color: red;
border-radius: 10px;        /* Rounded corners */

/* Margin (outside) */
margin: 20px;               /* All sides */
margin: 10px 20px;          /* Top/bottom, left/right */
margin: 0 auto;             /* Center horizontally */
```

### Background
```css
background-color: lightblue;
background-image: url('photo.jpg');
background-size: cover;         /* Fill entire element */
background-repeat: no-repeat;   /* Don't tile */
background-position: center;

/* Shorthand */
background: lightblue url('photo.jpg') no-repeat center cover;
```

### Display Property
Controls how elements behave:

```css
display: block;      /* Takes full width, stacks vertically */
display: inline;     /* Flows with text, only as wide as content */
display: inline-block;  /* Hybrid: flows but can have width/height */
display: none;       /* Completely hidden */
```

**Block elements**: `<div>`, `<p>`, `<h1>`-`<h6>`, `<ul>`, `<ol>`
**Inline elements**: `<span>`, `<a>`, `<strong>`, `<em>`, `<img>`

### Pseudo-classes (Special States)
```css
/* When hovering over element */
button:hover {
    background-color: red;
}

/* When clicking/activating */
button:active {
    background-color: darkred;
}

/* First child of parent */
p:first-child {
    font-weight: bold;
}

/* Links that have been visited */
a:visited {
    color: purple;
}
```

---

## Part 4: JavaScript - Interactivity (15 minutes)

### What is JavaScript?
**JavaScript** makes webpages DO things. It's the electrical wiring, appliances, and smart home features of your house.

**Not Java!**: Despite similar names, JavaScript and Java are completely different languages.

### Where JavaScript Runs
- In the browser (client-side)
- On servers (Node.js - server-side)
- In mobile apps (React Native)
- Desktop apps (Electron)
- IoT devices (Johnny-Five)

Today: Focus on browser JavaScript!

### Adding JavaScript to HTML

#### External JavaScript (BEST!)
```html
<script src="script.js"></script>
```

Usually placed before `</body>`:
```html
<body>
    <!-- HTML content -->
    
    <script src="script.js"></script>
</body>
```

#### Internal JavaScript
```html
<script>
    function sayHello() {
        alert("Hello!");
    }
</script>
```

#### Inline JavaScript (Event handlers)
```html
<button onclick="sayHello()">Click Me</button>
```

### Variables
Store information for later use:

```javascript
// Modern way (preferred)
let age = 12;           // Can be changed
const name = "Alex";    // Cannot be changed

// Old way (avoid)
var old = "outdated";   // Can cause issues
```

**Naming Rules**:
- Can contain letters, numbers, $, _
- Cannot start with number
- Case-sensitive (age ≠ Age)
- Cannot use reserved words (let, function, if, etc.)
- Use camelCase for multi-word names (myVariableName)

### Data Types
```javascript
// String (text)
let name = "Alex";
let greeting = 'Hello';

// Number (integers and decimals)
let age = 12;
let price = 19.99;

// Boolean (true/false)
let isStudent = true;
let hasPermission = false;

// Array (list of values)
let colors = ["red", "blue", "green"];
let numbers = [1, 2, 3, 4, 5];

// Object (collection of properties)
let person = {
    name: "Alex",
    age: 12,
    hobbies: ["coding", "gaming"]
};
```

### Functions
Reusable blocks of code:

```javascript
// Function declaration
function greet() {
    alert("Hello, World!");
}

// Call/invoke the function
greet();

// Function with parameters
function greetPerson(name) {
    alert("Hello, " + name + "!");
}

greetPerson("Alex");     // Output: Hello, Alex!
greetPerson("Jordan");   // Output: Hello, Jordan!

// Function with return value
function add(a, b) {
    return a + b;
}

let sum = add(5, 3);    // sum = 8
```

### Operators

#### Arithmetic
```javascript
let x = 10 + 5;     // 15 (addition)
let y = 10 - 5;     // 5  (subtraction)
let z = 10 * 5;     // 50 (multiplication)
let w = 10 / 5;     // 2  (division)
let r = 10 % 3;     // 1  (remainder/modulo)

// Increment/decrement
let count = 0;
count++;            // count = 1
count--;            // count = 0
```

#### Comparison
```javascript
10 == 10    // true  (equal value)
10 === 10   // true  (equal value AND type)
10 != 5     // true  (not equal)
10 > 5      // true  (greater than)
10 < 5      // false (less than)
10 >= 10    // true  (greater than or equal)
10 <= 5     // false (less than or equal)
```

**Use `===` (strict equals) instead of `==`** - it's safer!

### String Concatenation
```javascript
let first = "Hello";
let last = "World";

// Old way
let message = first + " " + last;  // "Hello World"

// Modern way (template literals)
let greeting = `${first} ${last}`;  // "Hello World"
let info = `I am ${age} years old`;  // "I am 12 years old"
```

### Conditionals (if/else)
```javascript
let age = 12;

if (age >= 13) {
    console.log("Teenager");
} else if (age >= 5) {
    console.log("Child");
} else {
    console.log("Young child");
}

// Ternary operator (shorthand)
let status = (age >= 18) ? "Adult" : "Minor";
```

### DOM Manipulation
**DOM** (Document Object Model) = JavaScript's view of HTML

#### Getting Elements
```javascript
// By ID (most common)
let element = document.getElementById("myDiv");

// By class name
let elements = document.getElementsByClassName("highlight");

// By tag name
let paragraphs = document.getElementsByTagName("p");

// Modern query selectors
let elem = document.querySelector("#myDiv");      // First match
let elems = document.querySelectorAll(".highlight");  // All matches
```

#### Changing Content
```javascript
// Change text
element.innerHTML = "New content";
element.textContent = "Plain text only";

// Change attributes
element.setAttribute("class", "highlight");
element.src = "newimage.jpg";
```

#### Changing Styles
```javascript
element.style.color = "red";
element.style.fontSize = "20px";
element.style.backgroundColor = "yellow";

// Note: CSS properties become camelCase in JavaScript
// background-color → backgroundColor
// font-size → fontSize
```

### Events
Respond to user actions:

```javascript
// In HTML
<button onclick="handleClick()">Click Me</button>

function handleClick() {
    alert("Button clicked!");
}

// Or in JavaScript (better!)
document.getElementById("myButton").addEventListener("click", function() {
    alert("Button clicked!");
});
```

**Common Events**:
- `click` - User clicks element
- `mouseover` - Mouse moves over element
- `mouseout` - Mouse leaves element
- `keypress` - Key is pressed
- `load` - Page finishes loading
- `submit` - Form is submitted

### Console Logging (Debugging)
```javascript
console.log("Hello, console!");
console.log("Value:", myVariable);
console.error("This is an error");
console.warn("This is a warning");

// Check values while debugging
let x = 5;
console.log("x =", x);  // x = 5
```

Open console: F12 → Console tab

---

## Part 5: Bringing It All Together

### Example: Interactive Page

**HTML**:
```html
<!DOCTYPE html>
<html>
<head>
    <title>Interactive Page</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1 id="title">Welcome!</h1>
    <button onclick="changeColor()">Change Color</button>
    <button onclick="changeText()">Change Text</button>
    <p id="counter">Clicks: 0</p>
    
    <script src="script.js"></script>
</body>
</html>
```

**CSS (style.css)**:
```css
body {
    font-family: Arial, sans-serif;
    text-align: center;
    padding: 50px;
    background-color: #ecf0f1;
}

button {
    background-color: #3498db;
    color: white;
    padding: 15px 30px;
    border: none;
    border-radius: 5px;
    margin: 10px;
    cursor: pointer;
    font-size: 16px;
}

button:hover {
    background-color: #2980b9;
}

#title {
    color: #2c3e50;
}
```

**JavaScript (script.js)**:
```javascript
let clicks = 0;

function changeColor() {
    let colors = ["#e74c3c", "#3498db", "#2ecc71", "#f39c12"];
    let randomColor = colors[Math.floor(Math.random() * colors.length)];
    document.body.style.backgroundColor = randomColor;
    
    clicks++;
    document.getElementById("counter").innerHTML = "Clicks: " + clicks;
}

function changeText() {
    let texts = ["Hello!", "Welcome!", "Hi there!", "Greetings!"];
    let randomText = texts[Math.floor(Math.random() * texts.length)];
    document.getElementById("title").innerHTML = randomText;
    
    clicks++;
    document.getElementById("counter").innerHTML = "Clicks: " + clicks;
}

console.log("JavaScript loaded successfully!");
```

This demonstrates:
- HTML structure
- CSS styling and hover effects
- JavaScript variables, functions, and DOM manipulation
- Event handling (button clicks)
- Random selections from arrays
- All three technologies working together!

---

## Key Takeaways

1. **HTML** = Structure (skeleton)
2. **CSS** = Presentation (skin and clothes)
3. **JavaScript** = Behavior (brain and muscles)

4. **Separation of Concerns**: Keep them in separate files

5. **Testing**: Save, refresh browser, check console

6. **Debugging**: Use developer tools (F12) constantly

7. **Learning**: Practice, experiment, break things, fix them!

---

## Additional Resources

- Mozilla Developer Network (MDN): Comprehensive documentation
- W3Schools: Beginner-friendly tutorials with examples
- CodePen: Online playground to test code
- Stack Overflow: Q&A community (read, don't post yet!)

---

**Remember**: Every website you've ever visited uses these three technologies. Master the basics, and you can build anything!
