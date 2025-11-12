# Week 8: Web Development Basics

## Overview
This week shifts gears from physical hardware to software! Students will learn the fundamentals of web development - HTML, CSS, and basic JavaScript. By the end of class, they'll build a simple website running on their Raspberry Pi that they can access from any device on their network. This sets the foundation for Week 9, where we'll control hardware through a web interface. Students will create an "About Me" webpage with styling, images, and interactive elements!

## Learning Objectives
By the end of this week, students will be able to:
- Understand what HTML, CSS, and JavaScript are and how they work together
- Write basic HTML to structure a webpage
- Use CSS to style and beautify web content
- Add interactivity with simple JavaScript
- Set up a web server on their Raspberry Pi
- Access their website from other devices on the network
- Understand the client-server model
- View and edit web pages using browser developer tools
- Debug web pages by inspecting elements

## Topics Covered
1. **Introduction to the Web**
   - How websites work (client-server model)
   - What is a web browser?
   - URLs, IP addresses, and localhost
   - What happens when you visit a website?
   - Static vs. dynamic websites

2. **HTML (HyperText Markup Language)**
   - What is HTML? (Structure of webpages)
   - Basic HTML document structure
   - Common tags: headings, paragraphs, links, images, lists
   - Semantic HTML elements
   - Creating forms and buttons
   - Organizing content with divs

3. **CSS (Cascading Style Sheets)**
   - What is CSS? (Styling webpages)
   - Inline, internal, and external CSS
   - Selectors: elements, classes, IDs
   - Colors, fonts, and text styling
   - Box model: margins, padding, borders
   - Basic layout techniques
   - Making pages look professional

4. **JavaScript Basics**
   - What is JavaScript? (Making pages interactive)
   - Variables and data types
   - Functions and events
   - Responding to button clicks
   - Changing webpage content dynamically
   - Simple alert boxes and prompts
   - Console logging for debugging

5. **Running a Web Server**
   - Installing a simple web server (Python's http.server)
   - Serving files from Raspberry Pi
   - Accessing website from other devices
   - Understanding ports (default :8000)
   - File organization for web projects

## Materials Needed
From your kit:
- Raspberry Pi (fully set up from previous weeks)
- Monitor, keyboard, mouse
- Network connection (WiFi or Ethernet)
- Another device to test with (phone, tablet, laptop)

**Software (We'll Install Together)**:
- Text editor (already have: Thonny or nano)
- Web browser (Chromium - already installed)
- Python 3 (already installed - for simple web server)

**Optional Materials**:
- Your own images to add to webpage (can transfer via USB drive)
- Ideas for "About Me" content (hobbies, interests, fun facts)

## ⚠️ SAFETY & BEST PRACTICES

**WEB DEVELOPMENT SAFETY:**
1. **Local network only** - We're NOT putting this on the internet
2. **Keep it school-appropriate** - No personal information, addresses, etc.
3. **Safe images only** - Use your own photos or free stock images
4. **Test before sharing** - Make sure content is appropriate before showing others
5. **Respectful content** - Be kind and inclusive in all website content

**CODING BEST PRACTICES:**
- Save your work frequently (Ctrl+S)
- Use clear, descriptive file names (no spaces, use-dashes)
- Indent your code properly for readability
- Comment your code to explain what it does
- Test after every small change
- Keep backup copies of working versions

**FILE ORGANIZATION:**
```
/home/pi/website/
├── index.html        (main page)
├── style.css         (styling)
├── script.js         (JavaScript)
└── images/           (folder for pictures)
    └── photo.jpg
```

**BROWSER SAFETY:**
- Only visit trusted websites during class
- Don't download random files
- Ask instructor before installing browser extensions
- Keep personal information private

## Class Structure
- **Week 7 Review & Web Intro**: 10 minutes
- **HTML Basics Demonstration**: 15 minutes
- **Hands-on Activity 1 (Build HTML Page)**: 20 minutes
- **Break**: 5 minutes
- **CSS Styling Demo**: 10 minutes
- **Hands-on Activity 2 (Add CSS)**: 15 minutes
- **JavaScript Basics & Interactivity**: 10 minutes
- **Hands-on Activity 3 (Add JavaScript)**: 20 minutes
- **Deploy & Share Websites**: 10 minutes
- **Gallery Walk & Wrap-up**: 5 minutes

## Files in This Week's Folder
- `README.md` - This file, overview of the week
- `QUICK-START.md` - Quick reference for HTML, CSS, and JavaScript
- `INSTRUCTOR-GUIDE.md` - Teaching notes and troubleshooting
- `lecture/` - Detailed notes on web technologies
- `activities/` - Step-by-step webpage building exercises
- `examples/` - Complete example websites to reference
- `resources/` - Cheat sheets, color references, debugging tips
- `week08-homework.md` - Take-home webpage improvements

## Getting Started

### Before You Begin
1. **Boot up your Raspberry Pi** and log in
2. **Open a file manager** - We'll create a project folder
3. **Open Chromium browser** - For testing our webpage
4. **Have ideas ready** - What do you want your "About Me" page to include?

### First Steps (Do These IN ORDER!)
1. Create a new folder: `/home/pi/website/`
2. Create your first HTML file: `index.html`
3. Write basic HTML structure
4. Open in browser to test
5. Add CSS styling
6. Add JavaScript interactivity
7. Start web server to share with others

### Your First Webpage
We'll start with this simple HTML:
```html
<!DOCTYPE html>
<html>
<head>
    <title>My First Webpage</title>
</head>
<body>
    <h1>Hello, World!</h1>
    <p>This is my first webpage!</p>
</body>
</html>
```

Save it as `index.html` and open in browser!

## Key Concepts to Remember

### HTML Structure
```html
<!DOCTYPE html>           <!-- Tells browser this is HTML5 -->
<html>                    <!-- Root element, contains everything -->
<head>                    <!-- Metadata, not visible on page -->
    <title>Page Title</title>  <!-- Shows in browser tab -->
</head>
<body>                    <!-- Visible content goes here -->
    <h1>Main Heading</h1>     <!-- Largest heading -->
    <p>Paragraph text.</p>    <!-- Regular text -->
</body>
</html>
```

### Common HTML Tags
```html
<!-- Headings (h1 is biggest, h6 is smallest) -->
<h1>Main Title</h1>
<h2>Subtitle</h2>
<h3>Section Title</h3>

<!-- Text -->
<p>This is a paragraph.</p>
<strong>Bold text</strong>
<em>Italic text</em>

<!-- Links -->
<a href="https://www.example.com">Click here</a>

<!-- Images -->
<img src="photo.jpg" alt="Description of image">

<!-- Lists -->
<ul>  <!-- Unordered list (bullets) -->
    <li>First item</li>
    <li>Second item</li>
</ul>

<ol>  <!-- Ordered list (numbers) -->
    <li>Step one</li>
    <li>Step two</li>
</ol>

<!-- Buttons -->
<button>Click Me</button>

<!-- Containers -->
<div>Groups content together</div>
```

### CSS Basics
```css
/* Select all paragraphs */
p {
    color: blue;           /* Text color */
    font-size: 18px;       /* Text size */
    font-family: Arial;    /* Font type */
}

/* Select element with specific class */
.highlight {
    background-color: yellow;
    padding: 10px;
}

/* Select element with specific ID */
#main-title {
    text-align: center;
    font-size: 36px;
}

/* Make things colorful! */
body {
    background-color: lightblue;
}

h1 {
    color: darkblue;
    text-shadow: 2px 2px 4px gray;
}
```

### Adding CSS to HTML
```html
<!-- Method 1: Inline (not recommended) -->
<p style="color: red;">Red text</p>

<!-- Method 2: Internal (in <head> section) -->
<head>
    <style>
        p { color: blue; }
    </style>
</head>

<!-- Method 3: External (separate file - BEST!) -->
<head>
    <link rel="stylesheet" href="style.css">
</head>
```

### JavaScript Basics
```javascript
// Variables
let name = "Alex";
let age = 12;

// Function
function sayHello() {
    alert("Hello, " + name + "!");
}

// Respond to button click
function changeText() {
    document.getElementById("demo").innerHTML = "Text changed!";
}

// Log to console (for debugging)
console.log("This appears in browser console");
```

### Connecting JavaScript to HTML
```html
<!-- Add JavaScript in <head> or before </body> -->
<script>
    function greet() {
        alert("Hello from JavaScript!");
    }
</script>

<!-- Call function when button clicked -->
<button onclick="greet()">Click Me</button>

<!-- Give element an ID so JavaScript can find it -->
<p id="demo">Original text</p>

<!-- Or use external JavaScript file -->
<script src="script.js"></script>
```

### The Box Model (How CSS Spacing Works)
```
┌─────────────────────────────────┐
│         MARGIN (outside)        │
│  ┌───────────────────────────┐  │
│  │     BORDER                │  │
│  │  ┌─────────────────────┐  │  │
│  │  │   PADDING (inside)  │  │  │
│  │  │  ┌───────────────┐  │  │  │
│  │  │  │   CONTENT     │  │  │  │
│  │  │  └───────────────┘  │  │  │
│  │  └─────────────────────┘  │  │
│  └───────────────────────────┘  │
└─────────────────────────────────┘
```

## Tips for Success
- **Start simple** - Get something working, then improve it
- **Test frequently** - Refresh browser after each change
- **Use browser tools** - Right-click → "Inspect Element" shows code
- **Proper syntax** - Close all tags: `<p>text</p>` not `<p>text`
- **Watch your quotes** - Use `"` or `'` but be consistent
- **Indentation matters** - Makes code readable (use Tab key)
- **Colors** - Use names (red, blue) or hex codes (#FF0000)
- **Save before testing** - Browser shows last saved version
- **Ask for help** - Web development has lots of syntax to remember
- **Be creative** - Make it your own! Add personality!

## Common Beginner Mistakes (And How to Avoid Them)

1. **Forgetting to close tags** → Every `<tag>` needs `</tag>` (except self-closing)
2. **Misspelling tag names** → `<p>` not `<P>`, `<div>` not `<dvi>`
3. **Forgetting quotes in attributes** → `href="link"` not `href=link`
4. **CSS not loading** → Check filename and path in `<link>` tag
5. **JavaScript not running** → Check browser console (F12) for errors
6. **Changes not showing** → Save file, then refresh browser (Ctrl+R)
7. **Wrong file extension** → Must be `.html` not `.txt` or `.html.txt`
8. **Missing DOCTYPE** → Add `<!DOCTYPE html>` at very top
9. **CSS in wrong place** → Put `<style>` in `<head>` or use external file
10. **Case sensitivity** → Filenames must match exactly (index.html vs Index.html)

## Troubleshooting Guide

### Page Shows Code Instead of Rendering
- [ ] File saved with .html extension? (not .txt)
- [ ] Using correct text editor? (not word processor)
- [ ] Opened in browser? (not text editor)
- [ ] <!DOCTYPE html> at top?

### CSS Not Working
- [ ] CSS in `<head>` section? (if internal)
- [ ] Correct filename in `<link>`? (if external)
- [ ] Spelling correct in selectors?
- [ ] Semicolons after each property?
- [ ] Curly braces closed properly?
- [ ] CSS file in same folder?

### JavaScript Not Running
- [ ] Script tags in correct place?
- [ ] No syntax errors? (check console with F12)
- [ ] Function name spelled correctly?
- [ ] Parentheses and quotes matched?
- [ ] Using correct element ID?
- [ ] Script loading before it's used?

### Can't Access Website from Other Device
- [ ] Web server running?
- [ ] Both devices on same network?
- [ ] Using Pi's IP address (not localhost)?
- [ ] Correct port number (:8000)?
- [ ] Firewall not blocking?
- [ ] Typed URL correctly?

### Images Not Showing
- [ ] Image file in correct folder?
- [ ] Filename spelled exactly right? (case-sensitive!)
- [ ] File extension correct? (.jpg, .png, etc.)
- [ ] Path in src attribute correct?
- [ ] Image file actually uploaded to Pi?
- [ ] Try: right-click broken image → "Inspect" to see error

## Looking Ahead

**This Week**: Build basic static webpages
**Week 9**: Connect webpage to Raspberry Pi GPIO - control LEDs from browser!
**Week 10**: More advanced web features and hardware control
**Future**: Create full dashboard for monitoring and controlling projects

## Why This Matters

Web development is one of the most valuable tech skills:
- **Career opportunities** - High demand for web developers
- **Create anything** - Apps, games, portfolios, businesses
- **Works everywhere** - Any device with a browser
- **Foundation for more** - React, Vue, Node.js, etc. build on these basics
- **Express yourself** - Build your own corner of the internet
- **Control hardware** - Next week, control LEDs from your phone!

Every website you've ever visited uses these three technologies:
- **HTML** - Structure (what's on the page)
- **CSS** - Style (how it looks)
- **JavaScript** - Behavior (what it does)

Master these basics and you can build almost anything!

## Real-World Applications

Students will see how this week's skills relate to:
- **Social media** - Facebook, Instagram, TikTok (all websites)
- **Online shopping** - Amazon, eBay (web applications)
- **Streaming services** - Netflix, YouTube (web interfaces)
- **School tools** - Google Classroom, Khan Academy
- **Games** - Many games are now web-based
- **Smart home apps** - Control devices through web interface
- **Professional portfolios** - Showcase your work
- **Small businesses** - Every business needs a website

## Project Ideas for "About Me" Page

Get creative! Include:
- **Introduction** - Name, age, grade, school
- **Hobbies & Interests** - What you love to do
- **Favorite Things** - Movies, books, foods, sports teams
- **Fun Facts** - Unique things about you
- **Goals & Dreams** - What you want to do/be
- **Photo Gallery** - Pictures of you, family, pets, hobbies
- **Skills** - Things you're good at or learning
- **Interactive Quiz** - "Guess my favorite..." with JavaScript button reveals
- **Themed Design** - Match colors/style to your interests

### Make It Interactive!
- Button that changes colors
- Click to reveal hidden fun facts
- Counter showing page views (fake, just for practice)
- Random quote generator
- Simple calculator
- "Click me" game

---

**Important Reminder**: Web development is creative! There's no single "right way" to design a webpage. Experiment, try new things, and make something that represents YOU. If something doesn't work, use browser developer tools (F12) to debug. Every web developer started exactly where you are now!

**Let's build the web!** 🌐💻✨
