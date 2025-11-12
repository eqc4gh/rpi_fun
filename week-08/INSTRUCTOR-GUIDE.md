# Week 8: Instructor Guide - Web Development Basics

## Class Overview
This week transitions from hardware to software with web development fundamentals. Students learn HTML, CSS, and JavaScript by building an "About Me" webpage they can access from any device. This foundation prepares them for Week 9's hardware-web integration.

**Difficulty Level**: Medium (new concepts but very visual/immediate feedback)
**Key Challenge**: Syntax precision (closing tags, quotes, semicolons)
**Student Engagement**: HIGH - they love seeing their designs come to life!

---

## Pre-Class Setup (15-20 minutes before)

### For Each Raspberry Pi:
1. **Boot and update** (if needed):
```bash
sudo apt update
```

2. **Verify Python 3** (for web server):
```bash
python3 --version
```

3. **Test Chromium browser** - make sure it opens

4. **Create demo folder** on instructor Pi:
```bash
mkdir -p /home/pi/demo-website
```

5. **Prepare example files** - have working HTML/CSS/JS ready to show

### Instructor Preparation:
- [ ] Have your own example website ready on your Pi
- [ ] Know your Pi's IP address (`hostname -I`)
- [ ] Test accessing your demo site from phone/tablet
- [ ] Prepare "About Me" content ideas list on board
- [ ] Have developer tools (F12) ready to demonstrate
- [ ] Print color code reference sheets (optional but helpful)
- [ ] Have backup examples on USB drive (in case of issues)

### Room Setup:
- [ ] All Pis booted and logged in
- [ ] Monitors at comfortable brightness
- [ ] Clear desk space for notes/planning
- [ ] Instructor monitor visible to all students
- [ ] Network/WiFi stable (test with a device)

---

## Lesson Timeline (120 minutes)

### Opening (10 minutes)
**Goal**: Context and excitement!

**Script**: "Today we're switching from hardware to software! Everything you've done with Python so far has been running on the Pi. But what if you want to share your projects with others? What if you want to control your robot from your phone? That's where web development comes in! Every website you visit - YouTube, Google, your favorite games - they all use the three technologies we're learning today: HTML, CSS, and JavaScript. By the end of class, you'll have your own website running on your Pi!"

**Activity**:
1. Show your example website on your Pi
2. Access it from your phone (pass around to show)
3. "This is what you'll build today!"
4. Quick review: "What websites do you visit every day?"

### HTML Basics Demo (15 minutes)
**Goal**: Understand structure before style

**Key Points**:
- HTML = skeleton/structure of a webpage
- Tags = building blocks (like LEGO pieces)
- Opening and closing tags (most important concept!)
- Proper nesting (tags inside tags)

**Demonstration**:
```html
<!DOCTYPE html>
<html>
<head>
    <title>Demo</title>
</head>
<body>
    <h1>My Title</h1>
    <p>My paragraph.</p>
</body>
</html>
```

**Live Coding** (type WITH them watching):
1. Open terminal: `cd /home/pi && mkdir demo-website && cd demo-website`
2. Create file: `nano index.html`
3. Type HTML structure line by line
4. Save: Ctrl+O, Enter, Ctrl+X
5. Open browser: `file:///home/pi/demo-website/index.html`
6. "Look! We made a webpage!"

**Common Student Questions**:
- Q: "Why index.html?" A: "Web servers automatically look for index.html as the main page"
- Q: "Do I need DOCTYPE?" A: "Yes, it tells the browser this is HTML5"
- Q: "Case sensitive?" A: "Tags aren't, but filenames are!"

### Hands-On Activity 1: Build HTML Page (20 minutes)
**Goal**: Students create their own basic HTML structure

**Instructions**:
"Create your own index.html with:
- A heading with your name
- 3 paragraphs about yourself
- A list of hobbies
- At least one image (we'll add it next week if you don't have one)"

**Walk Around and Help With**:
- Closing tags (most common issue!)
- Proper indentation (helps readability)
- File saving and refreshing browser
- Spelling of tags

**Quick Wins to Point Out**:
- "Great job closing all your tags!"
- "Nice use of different heading levels!"
- "I love your content - very creative!"

**If Students Finish Early**:
- Add more sections (favorite foods, books, movies)
- Try different heading levels (h1-h6)
- Add links to favorite websites
- Experiment with ordered/unordered lists

### Break (5 minutes)
Remind students to save their work!

### CSS Styling Demo (10 minutes)
**Goal**: Transform boring HTML into beautiful pages

**Key Points**:
- CSS = makeup/clothing for your webpage
- Three ways to add CSS (show external file method)
- Selectors target elements
- Properties change appearance

**Demonstration**:
```css
body {
    background-color: lightblue;
    font-family: Arial;
    margin: 20px;
}

h1 {
    color: darkblue;
    text-align: center;
}

p {
    font-size: 18px;
    line-height: 1.6;
}
```

**Live Coding**:
1. Create: `nano style.css`
2. Add basic styles above
3. Link in HTML: `<link rel="stylesheet" href="style.css">`
4. Refresh browser: "WOW! Look at the difference!"
5. Change a color live: "See how easy it is?"

**Show Before/After** - this is powerful for engagement!

### Hands-On Activity 2: Add CSS (15 minutes)
**Goal**: Students make their pages look great

**Instructions**:
"Create style.css and make your page look awesome:
- Choose a background color
- Style your headings (color, size, alignment)
- Make paragraphs readable (size, spacing)
- Try adding borders or shadows
- Be creative - make it YOUR style!"

**Encourage Experimentation**:
- "There's no wrong answer in design!"
- "Try different colors and see what you like!"
- "Copy styles you like from the examples folder"

**Common CSS Issues**:
- Forgetting semicolons (show console errors)
- Misspelling property names
- CSS file not linked correctly
- Selector doesn't match HTML element

**Gallery Walk** (last 3 minutes):
- Students walk around and see others' designs
- Vote on most creative, most colorful, etc.

### JavaScript Basics & Interactivity (10 minutes)
**Goal**: Add behavior to make page interactive

**Key Points**:
- JavaScript = brain of your webpage
- Makes things DO stuff (respond to clicks)
- Console.log is your debugging friend
- Start simple, build up

**Demonstration**:
```javascript
function changeColor() {
    document.body.style.backgroundColor = "yellow";
}

function showMessage() {
    alert("Hello from JavaScript!");
}
```

**Live Coding**:
1. Create: `nano script.js`
2. Add simple function
3. Add button in HTML: `<button onclick="changeColor()">Change Color</button>`
4. Link script: `<script src="script.js"></script>`
5. Test: Click button - color changes!
6. Open console (F12): Show console.log output

**Emphasize**: JavaScript is powerful but needs exact syntax!

### Hands-On Activity 3: Add JavaScript (20 minutes)
**Goal**: Make pages interactive

**Instructions**:
"Add JavaScript to your page:
- Button that changes background color
- Button that shows alert message
- Click counter (advanced)
- Hidden text that appears on click (advanced)
- Anything creative you can think of!"

**Starter Functions** (write on board):
```javascript
function changeColor() {
    document.body.style.backgroundColor = "pink";
}

function greet() {
    alert("Welcome to my page!");
}

function changeText() {
    document.getElementById("demo").innerHTML = "Changed!";
}
```

**Debugging Help**:
- "F12 → Console shows all errors"
- "Red text = error, click to see line number"
- "Check spelling of function names"
- "Make sure IDs match between HTML and JavaScript"

**Advanced Challenge** (for fast finishers):
```javascript
let clickCount = 0;

function countClicks() {
    clickCount++;
    document.getElementById("counter").innerHTML = "Clicks: " + clickCount;
}
```

### Deploy & Share Websites (10 minutes)
**Goal**: Access websites from other devices

**Demonstration**:
1. Start web server on your Pi:
```bash
cd /home/pi/demo-website
python3 -m http.server 8000
```

2. Find IP address: `hostname -I`

3. Access from phone: `http://[IP]:8000`

4. Pass your phone around - students see it works!

**Student Activity**:
1. Each student starts their web server
2. Find their IP address
3. Write IP on paper/sticky note
4. Students visit each other's websites from their Pi browsers
5. "You're now web developers with live websites!"

**Troubleshooting**:
- Server won't start: Check if port 8000 already in use
- Can't access from other device: Verify same WiFi network
- Firewall issues: Shouldn't be a problem on local network
- Typo in IP address: Double-check with `hostname -I`

### Gallery Walk & Wrap-up (5 minutes)
**Goal**: Celebrate success, preview next week

**Activity**:
- Students visit 2-3 other students' websites
- Share what they liked about each other's pages
- Vote on categories (most colorful, most creative, etc.)

**Wrap-Up**:
- "You all built real websites today!"
- "Next week: Control LEDs from your webpage!"
- "Homework: Improve your page, add more content"
- "Save your work - we'll build on this!"

---

## Common Issues & Solutions

### Setup Issues

**Issue**: Can't create files
**Solution**: Check permissions, use `cd /home/pi` first

**Issue**: nano not found
**Solution**: Try `gedit` or install: `sudo apt install nano`

**Issue**: Browser won't open file
**Solution**: Use file:// URL or start web server

### HTML Issues

**Issue**: Tags showing on page
**Solution**: Missing `<` or `>`, tags not closed properly

**Issue**: Content not appearing
**Solution**: Content must be in `<body>`, check for typos

**Issue**: Image not showing
**Solution**: Check file path, make sure image exists

### CSS Issues

**Issue**: Styles not applying
**Solution**: 
1. Check link tag spelling
2. Verify CSS file name matches
3. Check selector matches HTML
4. Look for missing semicolons
5. Refresh browser (Ctrl+R or Ctrl+Shift+R)

**Issue**: Only some styles work
**Solution**: Look for syntax error (breaks everything after it)

**Issue**: Colors not showing
**Solution**: Check color names/codes, use quotes if needed

### JavaScript Issues

**Issue**: Nothing happens when button clicked
**Solution**:
1. Check function name spelling (in HTML and JS)
2. Verify script is linked
3. Check browser console for errors
4. Make sure onclick has quotes around function call

**Issue**: "Uncaught ReferenceError"
**Solution**: Function not defined, check spelling and script loading

**Issue**: Can't find element
**Solution**: Check ID matches exactly (case-sensitive!)

### Server Issues

**Issue**: "Address already in use"
**Solution**: 
```bash
# Kill process on port 8000
sudo fuser -k 8000/tcp
# Or use different port
python3 -m http.server 8001
```

**Issue**: Can't access from other device
**Solution**:
1. Check both on same WiFi
2. Verify IP address correct
3. Include port :8000
4. Try from Pi browser first
5. Check Pi firewall (shouldn't be issue)

---

## Differentiation Strategies

### For Struggling Students:
- Pair with stronger student
- Provide template with blanks to fill
- Focus on HTML only first
- Use very simple examples
- Check in frequently
- Celebrate small wins

### For Advanced Students:
- Multiple pages with navigation
- CSS animations
- More complex JavaScript (loops, arrays)
- Responsive design (mobile-friendly)
- JavaScript games
- Form validation

### For Visual Learners:
- Show lots of examples
- Use browser developer tools live
- Draw diagrams of HTML structure
- Use color-coded syntax highlighting

### For Kinesthetic Learners:
- More hands-on time, less lecture
- Let them experiment and break things
- Physical props (nested boxes for HTML structure)
- Get up and view others' work often

---

## Assessment Opportunities

### Formative (During Class):
- Can student create valid HTML structure?
- Do they understand tag closing?
- Can they change colors/fonts with CSS?
- Can they create working button with JavaScript?
- Do they use developer tools to debug?

### Summative (End of Class):
- Working webpage with HTML, CSS, and JavaScript
- Page accessible from other devices
- Clean, properly formatted code
- Creative, personal content
- At least one interactive element

### Homework Assessment:
- Added at least 3 improvements
- Code is organized and readable
- Demonstrated creativity
- Tried something new/challenging

---

## Extension Activities

### If Extra Time:

**CSS Challenges**:
- Hover effects: `button:hover { background-color: red; }`
- Text shadows: `text-shadow: 2px 2px 4px gray;`
- Rounded corners: `border-radius: 10px;`
- Gradient backgrounds

**JavaScript Challenges**:
- Random color generator
- Simple calculator
- Quiz game
- Typing effect
- Image carousel

**Multi-Page Sites**:
- Create about.html, projects.html
- Add navigation menu
- Link pages together

---

## Materials Checklist

### Digital Materials:
- [ ] Example websites (3-4 different styles)
- [ ] HTML template
- [ ] CSS template  
- [ ] JavaScript examples
- [ ] Color code reference
- [ ] Common errors examples

### Physical Materials:
- [ ] Printed color codes (optional)
- [ ] Printed cheat sheets (optional)
- [ ] Sticky notes (for IP addresses)
- [ ] Whiteboard for code examples

---

## Parent/Guardian Communication

**Email Template**:

"This week in Raspberry Pi class, students learned web development basics! They built their own 'About Me' website using HTML (structure), CSS (styling), and JavaScript (interactivity). 

Their homework is to improve their webpage by adding more content and trying new features. They can work on this at home if they have access to their Raspberry Pi, or we'll provide time next class.

Next week, we'll connect their webpages to hardware - controlling LEDs from a browser! This brings together everything they've learned so far.

The skills learned this week are valuable - web development is one of the most in-demand tech careers!"

---

## Troubleshooting Quick Reference

| Problem | Quick Fix |
|---------|-----------|
| Page blank | Check DOCTYPE, body tags |
| CSS not working | Verify link tag, refresh browser |
| Button does nothing | Check onclick spelling, console errors |
| Can't start server | Port in use, try different port |
| Can't access remotely | Check WiFi, verify IP |
| File not found | Check spelling, case-sensitive! |
| Syntax error | Look for unclosed tags/quotes |
| Nothing saves | Use Ctrl+O in nano |

---

## Next Week Preview

**Week 9**: We'll use Flask (Python web framework) to:
- Control GPIO pins from webpage
- Read sensor data in browser
- Build real hardware interface
- Turn their Pi into IoT device!

**Preparation for Next Week**:
- Make sure students save their Week 8 website
- They'll modify it to add hardware controls
- Review Python GPIO basics
- Install Flask: `pip3 install flask`

---

## Teaching Tips

**Do**:
- ✓ Show working examples first
- ✓ Live code with students
- ✓ Use browser developer tools
- ✓ Encourage creativity
- ✓ Celebrate mistakes as learning
- ✓ Let students help each other
- ✓ Save working versions before big changes

**Don't**:
- ✗ Rush through syntax explanation
- ✗ Fix student code without explaining
- ✗ Use overly complex examples
- ✗ Skip testing after each change
- ✗ Forget to save before refreshing
- ✗ Discourage experimentation
- ✗ Compare students' work negatively

**Pacing**:
- If ahead: Add more JavaScript challenges
- If behind: Skip some CSS styling, focus on basics
- Key milestone: Everyone has HTML, CSS, and one working button

**Engagement Boosters**:
- "What color should we try next?"
- "Who can guess what this CSS will do?"
- "Let's see your page!" (show on big screen)
- Mini competitions (most buttons, most colors, etc.)

---

**Remember**: This is a FUN week! Web development is immediately visual and rewarding. Students love seeing their designs come to life. Keep energy high, encourage creativity, and celebrate every working feature!
