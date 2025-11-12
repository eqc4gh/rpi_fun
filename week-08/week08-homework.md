# Week 8 Homework: Improve Your Website

## Overview
Great job building your first website! For homework, you'll improve your "About Me" page by adding more features, content, and polish. The goal is to make your website even more impressive and practice the HTML, CSS, and JavaScript skills you learned in class.

**Due**: Next class session
**Time Estimate**: 30-60 minutes
**Difficulty**: Medium

---

## Required Tasks (Complete ALL of These)

### 1. Add More Content (HTML)
Add at least TWO of the following sections to your webpage:

- [ ] **Favorites Section**: Favorite foods, movies, books, games, or sports teams
- [ ] **Goals & Dreams**: What you want to be when you grow up or things you want to learn
- [ ] **Skills**: Things you're good at or learning (can include this Raspberry Pi class!)
- [ ] **Fun Facts**: 3-5 interesting or unique things about you
- [ ] **Photo Gallery**: Multiple images (family, pets, hobbies) - create an images folder!

**Example HTML**:
```html
<h2>My Favorite Things</h2>
<ul>
    <li>Favorite Food: Pizza</li>
    <li>Favorite Movie: Spider-Man</li>
    <li>Favorite Game: Minecraft</li>
</ul>

<h2>Fun Facts About Me</h2>
<ol>
    <li>I can solve a Rubik's cube</li>
    <li>I have two pet dogs</li>
    <li>I've visited 5 different states</li>
</ol>
```

### 2. Improve Your Styling (CSS)
Make at least THREE styling improvements:

- [ ] Add a nice background color or gradient
- [ ] Style your buttons with colors and hover effects
- [ ] Add borders or shadows to sections
- [ ] Use different fonts for headings vs. paragraphs
- [ ] Center or align text nicely
- [ ] Add spacing (margins/padding) for better layout
- [ ] Style your lists to look nice

**Example CSS**:
```css
/* Nice gradient background */
body {
    background: linear-gradient(to bottom, #3498db, #2ecc71);
    color: white;
}

/* Cool button hover effect */
button {
    background-color: #e74c3c;
    color: white;
    padding: 15px 30px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    font-size: 18px;
}

button:hover {
    background-color: #c0392b;
    transform: scale(1.1);
}

/* Nice section styling */
.section {
    background-color: rgba(255, 255, 255, 0.2);
    padding: 20px;
    margin: 20px;
    border-radius: 15px;
}
```

### 3. Add JavaScript Interactivity
Add at least ONE new interactive feature:

- [ ] Button that changes multiple things (color, text, size)
- [ ] Click counter that tracks clicks
- [ ] Hide/show content button
- [ ] Random fact generator (picks from array)
- [ ] Color picker (multiple buttons for different colors)
- [ ] Simple calculator
- [ ] Text that changes when you hover over it

**Example JavaScript**:
```javascript
// Click counter
let clicks = 0;

function countClicks() {
    clicks++;
    document.getElementById("counter").innerHTML = "Clicks: " + clicks;
}

// Show/hide secret message
function toggleSecret() {
    let secret = document.getElementById("secret");
    if (secret.style.display === "none") {
        secret.style.display = "block";
    } else {
        secret.style.display = "none";
    }
}

// Random fact generator
let facts = [
    "I love coding!",
    "Raspberry Pi is awesome!",
    "Web development is fun!",
    "I built this website myself!"
];

function showRandomFact() {
    let randomIndex = Math.floor(Math.random() * facts.length);
    document.getElementById("fact").innerHTML = facts[randomIndex];
}
```

---

## Challenge Tasks (Optional - For Extra Credit!)

### Challenge 1: Multiple Pages
Create a second HTML page (like "projects.html" or "hobbies.html") and link it from your main page.

**In index.html**:
```html
<nav>
    <a href="index.html">Home</a> | 
    <a href="projects.html">My Projects</a>
</nav>
```

**Create projects.html** with similar structure!

### Challenge 2: Image Gallery
Create a proper image gallery with multiple photos that look good.

```html
<div class="gallery">
    <img src="images/photo1.jpg" alt="Photo 1">
    <img src="images/photo2.jpg" alt="Photo 2">
    <img src="images/photo3.jpg" alt="Photo 3">
</div>
```

```css
.gallery {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}

.gallery img {
    width: 200px;
    height: 200px;
    object-fit: cover;
    border-radius: 10px;
    border: 3px solid white;
}
```

### Challenge 3: Advanced JavaScript
Create one of these:

**Simple Quiz**:
```javascript
function checkAnswer() {
    let answer = document.getElementById("answer").value;
    if (answer.toLowerCase() === "paris") {
        alert("Correct! Paris is the capital of France!");
    } else {
        alert("Try again!");
    }
}
```

**Color Theme Switcher**:
```javascript
function darkMode() {
    document.body.style.backgroundColor = "#2c3e50";
    document.body.style.color = "white";
}

function lightMode() {
    document.body.style.backgroundColor = "#ecf0f1";
    document.body.style.color = "black";
}
```

**Mini Game - Number Guessing**:
```javascript
let secretNumber = Math.floor(Math.random() * 10) + 1;
let guesses = 0;

function guessNumber() {
    let guess = parseInt(document.getElementById("guess").value);
    guesses++;
    
    if (guess === secretNumber) {
        alert("You got it in " + guesses + " guesses!");
        secretNumber = Math.floor(Math.random() * 10) + 1;
        guesses = 0;
    } else if (guess < secretNumber) {
        alert("Too low! Try again.");
    } else {
        alert("Too high! Try again.");
    }
}
```

### Challenge 4: Responsive Design
Make your site look good on different screen sizes:

```css
/* Make images responsive */
img {
    max-width: 100%;
    height: auto;
}

/* Stack things vertically on small screens */
@media (max-width: 600px) {
    body {
        font-size: 14px;
    }
    
    button {
        width: 100%;
        margin: 10px 0;
    }
}
```

---

## Testing Checklist

Before submitting, make sure:

- [ ] All HTML tags are properly closed
- [ ] CSS file is linked correctly
- [ ] JavaScript file is linked correctly
- [ ] All buttons/links work
- [ ] No errors in browser console (F12)
- [ ] Page looks good (colors work, text readable)
- [ ] Images load (if you added any)
- [ ] Tested on Raspberry Pi browser
- [ ] Web server can serve your page
- [ ] Someone else has viewed your page (if possible)

---

## Submission Instructions

### Option 1: In-Class Demo (Recommended)
1. Have your website ready on your Raspberry Pi
2. Start your web server: `python3 -m http.server 8000`
3. Be ready to show and explain your improvements
4. Share your IP address so instructor can visit

### Option 2: Save and Backup
1. Make sure all files are saved in `/home/pi/website/`
2. We'll check your work next class
3. Optional: Create a backup on USB drive

---

## Grading Rubric

### Required Tasks (70 points)
- **Content**: Added 2+ new sections (20 points)
- **CSS**: Made 3+ styling improvements (25 points)
- **JavaScript**: Added 1+ interactive feature (25 points)

### Code Quality (20 points)
- HTML properly structured and indented (7 points)
- CSS organized and readable (7 points)
- JavaScript functions work correctly (6 points)

### Creativity & Presentation (10 points)
- Unique design/personal touches (5 points)
- Professional appearance (5 points)

### Extra Credit (up to 15 points)
- Multiple pages (+5 points)
- Image gallery (+3 points)
- Advanced JavaScript (+5 points)
- Responsive design (+2 points)

**Total**: 100 points (+ up to 15 extra credit)

---

## Need Help?

### Debugging Tips:
1. **Open browser console (F12)** - Read error messages!
2. **Check spelling** - Most common issue
3. **Verify file names** - Must match exactly
4. **Test after each change** - Don't add too much at once
5. **Look at working examples** - Check the `/examples/` folder
6. **Ask classmates** - Collaborate and learn together!

### Resources:
- Week 8 QUICK-START.md (HTML, CSS, JS reference)
- Examples folder (working code to reference)
- W3Schools.com (huge library of examples)
- Mozilla Developer Network (MDN) - detailed documentation

### Common Issues:

**CSS not working?**
```html
<!-- Make sure link tag is in <head> -->
<link rel="stylesheet" href="style.css">
```

**JavaScript not working?**
```html
<!-- Make sure script tag is before </body> -->
<script src="script.js"></script>
```

**Button not responding?**
```javascript
// Check function name matches onclick
<button onclick="myFunction()">Click</button>

function myFunction() {
    // code here
}
```

---

## Inspiration Ideas

### Theme Ideas:
- **Sports fan**: Team colors, stats, favorite players
- **Gamer**: Favorite games, gaming setup, achievements
- **Artist**: Show your artwork, creative process
- **Musician**: Favorite songs, instruments you play
- **Scientist**: Cool experiments, science facts
- **Adventurer**: Places you've been, want to go
- **Bookworm**: Reading list, favorite authors
- **Tech enthusiast**: Projects you've built (like this!)

### Interactive Ideas:
- Quiz about yourself (friends can test their knowledge!)
- "Click me" buttons that do silly things
- Random joke/quote generator
- Visit counter (fake but fun!)
- Secret messages that appear on click
- Color theme switcher
- Mini calculator or converter
- Simple text-based game

---

## Reflection Questions (Optional)

Think about these - we'll discuss in next class:

1. What was the hardest part of web development for you?
2. What's your favorite thing about your website?
3. What would you like to learn next about web dev?
4. How could you use these skills in the future?
5. What was the most satisfying moment while building your site?

---

## Examples of Great Improvements

### Student Example 1: "All About Alex"
**Improvements Made**:
- Added photo gallery with 4 pictures
- Created fun facts section with interesting details
- Made buttons change between 5 different background colors
- Added click counter game
- Styled everything with blue theme (favorite color)

### Student Example 2: "Jordan's World"
**Improvements Made**:
- Created two pages (Home and Projects)
- Added navigation menu
- Made random quote generator
- Used gradients and shadows
- Added hover effects on all links

### Student Example 3: "Sam's Space"
**Improvements Made**:
- Added favorites section (food, movies, games)
- Created quiz about themselves
- Used dark mode theme
- Added fun animations to buttons
- Included emojis in headings

---

## Time Management Tips

**If you have 30 minutes**:
- Focus on required tasks only
- Add 2 content sections
- Make 3 quick CSS improvements
- Add 1 simple JavaScript button

**If you have 45 minutes**:
- Complete all required tasks
- Polish your design
- Try one challenge task
- Test thoroughly

**If you have 60+ minutes**:
- Complete required tasks
- Try 2-3 challenge tasks
- Add extra polish and details
- Make it really impressive!

---

## Parent/Guardian Note

This homework helps students practice the web development fundamentals they learned in class. They're building real skills used by professional web developers! 

**What they need**:
- Access to their Raspberry Pi
- About 30-60 minutes
- Creativity and patience!

**You can help by**:
- Providing a quiet space to work
- Asking them to show you what they're building
- Celebrating their creativity
- NOT doing the work for them (debugging is learning!)

If they get stuck, encourage them to:
1. Check the browser console for errors
2. Look at the examples provided
3. Try something simpler first
4. Save questions for next class

---

## Final Reminders

- **Save frequently** (Ctrl+O in nano)
- **Test after each change** (refresh browser)
- **Have fun and be creative!** This is YOUR website
- **Don't stress about perfection** - learning is the goal
- **Try new things** - break stuff and fix it, that's how you learn!
- **Be ready to show off your work** next class!

**Good luck and have fun! We can't wait to see your improved websites!** 🌐✨

---

## Bonus: Share Your Work!

If you're proud of your website and want to share:
1. Take a screenshot
2. Write down 3 things you're proud of
3. Be ready to give a 30-second demo next class
4. Help classmates who are stuck!

Remember: Every professional web developer started exactly where you are now. Keep learning, keep building, and keep having fun! 🚀
