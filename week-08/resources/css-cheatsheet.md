# CSS Cheat Sheet

## Three Ways to Add CSS

### 1. Inline CSS (Not Recommended)
```html
<p style="color: blue; font-size: 18px;">This text is blue.</p>
```

### 2. Internal CSS (In `<head>` section)
```html
<head>
    <style>
        p {
            color: blue;
            font-size: 18px;
        }
    </style>
</head>
```

### 3. External CSS (BEST - Separate File)
```html
<!-- In your HTML file -->
<head>
    <link rel="stylesheet" href="style.css">
</head>
```
```css
/* In your style.css file */
p {
    color: blue;
    font-size: 18px;
}
```

## CSS Syntax
```css
selector {
    property: value;
    another-property: value;
}
```

## Selectors

### Element Selector
```css
/* Selects ALL paragraphs */
p {
    color: blue;
}

/* Selects ALL h1 headings */
h1 {
    font-size: 36px;
}
```

### Class Selector
```css
/* Selects elements with class="highlight" */
.highlight {
    background-color: yellow;
}

/* Can use class on any element */
.big-text {
    font-size: 24px;
}
```
```html
<p class="highlight">This is highlighted</p>
<div class="highlight big-text">Large highlighted text</div>
```

### ID Selector
```css
/* Selects element with id="main-title" */
#main-title {
    color: darkblue;
    text-align: center;
}

/* IDs should be unique on page! */
#header {
    background-color: lightgray;
}
```
```html
<h1 id="main-title">My Website</h1>
```

### Multiple Selectors
```css
/* Apply same style to multiple elements */
h1, h2, h3 {
    color: navy;
    font-family: Arial;
}
```

### Descendant Selector
```css
/* Selects paragraphs inside divs */
div p {
    color: gray;
}

/* Selects links inside nav */
nav a {
    text-decoration: none;
}
```

## Colors

### Color Names
```css
color: red;
color: blue;
color: green;
color: orange;
color: purple;
color: pink;
color: brown;
color: black;
color: white;
color: gray;
```

### Hex Colors
```css
color: #FF0000;  /* Red */
color: #0000FF;  /* Blue */
color: #00FF00;  /* Green */
color: #FFFFFF;  /* White */
color: #000000;  /* Black */
color: #808080;  /* Gray */
color: #FFA500;  /* Orange */
```

### RGB Colors
```css
color: rgb(255, 0, 0);      /* Red */
color: rgb(0, 0, 255);      /* Blue */
color: rgb(0, 255, 0);      /* Green */
color: rgba(255, 0, 0, 0.5); /* Semi-transparent red */
```

## Text Styling

### Font Properties
```css
font-family: Arial, sans-serif;  /* Font type */
font-size: 18px;                  /* Size */
font-weight: bold;                /* Bold */
font-weight: normal;              /* Normal */
font-style: italic;               /* Italic */
font-style: normal;               /* Normal */
```

### Text Properties
```css
color: blue;                      /* Text color */
text-align: left;                 /* Left aligned */
text-align: center;               /* Centered */
text-align: right;                /* Right aligned */
text-decoration: underline;       /* Underlined */
text-decoration: none;            /* Remove underline (for links) */
text-transform: uppercase;        /* ALL CAPS */
text-transform: lowercase;        /* all lowercase */
text-transform: capitalize;       /* First Letter Capital */
line-height: 1.5;                 /* Space between lines */
letter-spacing: 2px;              /* Space between letters */
```

### Text Shadow
```css
text-shadow: 2px 2px 4px gray;
/* horizontal offset, vertical offset, blur, color */
```

## Box Model

### Margins (Outside spacing)
```css
margin: 20px;                /* All sides */
margin: 10px 20px;           /* Top/bottom, left/right */
margin: 10px 20px 15px 25px; /* Top, right, bottom, left */
margin-top: 10px;
margin-right: 20px;
margin-bottom: 15px;
margin-left: 25px;
margin: 0 auto;              /* Center a block element */
```

### Padding (Inside spacing)
```css
padding: 20px;               /* All sides */
padding: 10px 20px;          /* Top/bottom, left/right */
padding: 10px 20px 15px 25px; /* Top, right, bottom, left */
padding-top: 10px;
padding-right: 20px;
padding-bottom: 15px;
padding-left: 25px;
```

### Borders
```css
border: 2px solid black;     /* Width, style, color */
border-width: 3px;
border-style: solid;         /* solid, dashed, dotted, double */
border-color: blue;
border-radius: 10px;         /* Rounded corners */
border-radius: 50%;          /* Circle (if square element) */
```

### Width and Height
```css
width: 300px;
height: 200px;
max-width: 800px;            /* Maximum width */
min-height: 400px;           /* Minimum height */
```

## Backgrounds

### Background Color
```css
background-color: lightblue;
background-color: #FF5733;
background-color: rgb(255, 87, 51);
```

### Background Image
```css
background-image: url('background.jpg');
background-size: cover;           /* Cover entire element */
background-size: contain;         /* Fit inside element */
background-repeat: no-repeat;     /* Don't repeat image */
background-repeat: repeat;        /* Repeat (default) */
background-position: center;      /* Position */
```

### Multiple Background Properties
```css
background: lightblue url('bg.jpg') no-repeat center cover;
```

## Display Properties
```css
display: block;              /* Takes full width, stacks vertically */
display: inline;             /* Only takes needed width, flows with text */
display: inline-block;       /* Inline but can have width/height */
display: none;               /* Hide element completely */
visibility: hidden;          /* Hide but keep space */
```

## Layout

### Centering
```css
/* Center text inside element */
text-align: center;

/* Center block element horizontally */
margin: 0 auto;
width: 80%;

/* Center with flexbox (advanced) */
display: flex;
justify-content: center;
align-items: center;
```

### Float (Older technique)
```css
float: left;
float: right;
clear: both;                 /* Clear floats */
```

## List Styling
```css
list-style-type: none;       /* Remove bullets/numbers */
list-style-type: disc;       /* Filled circles (default) */
list-style-type: circle;     /* Hollow circles */
list-style-type: square;     /* Squares */
list-style-type: decimal;    /* Numbers (default for ol) */
```

## Links (Pseudo-classes)
```css
/* Normal link */
a {
    color: blue;
    text-decoration: none;
}

/* Visited link */
a:visited {
    color: purple;
}

/* Mouse over link */
a:hover {
    color: red;
    text-decoration: underline;
}

/* Active link (being clicked) */
a:active {
    color: yellow;
}
```

## Buttons
```css
button {
    background-color: blue;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;          /* Show hand cursor */
}

button:hover {
    background-color: darkblue;
}

button:active {
    background-color: navy;
}
```

## Images
```css
img {
    width: 100%;              /* Responsive, fills container */
    max-width: 500px;         /* But not bigger than this */
    height: auto;             /* Maintain aspect ratio */
    border-radius: 10px;      /* Rounded corners */
    border: 2px solid gray;
}

/* Circular image */
img.circle {
    border-radius: 50%;
    width: 200px;
    height: 200px;
}
```

## Common Layout Patterns

### Container/Wrapper
```css
.container {
    max-width: 1200px;
    margin: 0 auto;           /* Center on page */
    padding: 20px;
}
```

### Card Design
```css
.card {
    background-color: white;
    border-radius: 10px;
    padding: 20px;
    margin: 20px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}
```

### Header Styling
```css
header {
    background-color: #333;
    color: white;
    padding: 20px;
    text-align: center;
}
```

### Footer Styling
```css
footer {
    background-color: #333;
    color: white;
    text-align: center;
    padding: 20px;
    margin-top: 50px;
}
```

## Responsive Design Basics
```css
/* Make images responsive */
img {
    max-width: 100%;
    height: auto;
}

/* Media query for small screens */
@media (max-width: 600px) {
    body {
        font-size: 14px;
    }
    
    .container {
        padding: 10px;
    }
}
```

## Box Shadow
```css
box-shadow: 5px 5px 10px gray;
/* horizontal, vertical, blur, color */

box-shadow: 0 4px 6px rgba(0,0,0,0.1);
/* Subtle shadow */
```

## Transitions (Simple Animations)
```css
/* Smooth color change on hover */
button {
    background-color: blue;
    transition: background-color 0.3s;
}

button:hover {
    background-color: darkblue;
}

/* Smooth all changes */
transition: all 0.3s ease;
```

## Complete Example: Styled "About Me" Page
```css
/* Reset and base styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    background-color: #f4f4f4;
}

/* Header */
header {
    background-color: #3498db;
    color: white;
    text-align: center;
    padding: 30px;
}

header h1 {
    font-size: 36px;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
}

/* Main container */
main {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
}

/* Sections */
section {
    background-color: white;
    margin: 20px 0;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

section h2 {
    color: #2c3e50;
    border-bottom: 3px solid #3498db;
    padding-bottom: 10px;
    margin-bottom: 15px;
}

/* Profile image */
img.profile {
    border-radius: 50%;
    width: 200px;
    height: 200px;
    display: block;
    margin: 0 auto 20px;
    border: 5px solid #3498db;
}

/* Lists */
ul {
    list-style-type: none;
}

ul li {
    padding: 8px 0;
    padding-left: 25px;
    position: relative;
}

ul li:before {
    content: "✓";
    position: absolute;
    left: 0;
    color: #3498db;
}

/* Buttons */
button {
    background-color: #3498db;
    color: white;
    padding: 12px 25px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #2980b9;
}

/* Footer */
footer {
    background-color: #2c3e50;
    color: white;
    text-align: center;
    padding: 20px;
    margin-top: 30px;
}
```

## CSS Tips
1. **Be specific** - Use classes and IDs for targeted styling
2. **Keep organized** - Group related styles together
3. **Comment your code** - `/* This is a comment */`
4. **Test in browser** - Refresh to see changes
5. **Use consistent spacing** - Makes code readable
6. **One property per line** - Easier to read
7. **End with semicolon** - After each property
8. **Start simple** - Get basics working, then enhance
9. **Use browser tools** - Inspect Element (F12) helps debug
10. **Experiment!** - Try different values, colors, sizes
