# Activity 3: Add JavaScript Interactivity

**Time**: 20 minutes  
**Difficulty**: Intermediate  
**Goal**: Make your webpage DO things with JavaScript!

---

## Setup (1 minute)

Make sure you're in your website folder:
```bash
cd /home/pi/website
```

---

## Step 1: Create JavaScript File (2 minutes)

Create a new file for your code:
```bash
nano script.js
```

Add this test code:

```javascript
// Test that JavaScript is working
console.log("JavaScript loaded successfully!");

// Simple function to test
function sayHello() {
    alert("Hello from JavaScript!");
}
```

**Save**: `Ctrl+O`, `Enter`, `Ctrl+X`

---

## Step 2: Link JavaScript to HTML (2 minutes)

Open your HTML file:
```bash
nano index.html
```

Just before the closing `</body>` tag, add:

```html
    <script src="script.js"></script>
</body>
</html>
```

**Save!**

---

## Step 3: Add a Test Button (2 minutes)

In your HTML, add a button somewhere in the `<body>`:

```html
<h2>Interactive Stuff</h2>
<button onclick="sayHello()">Click Me!</button>
```

**Save and refresh your browser!**

Click the button - you should see an alert!

**Check the console**: Press F12 → Console tab
You should see: "JavaScript loaded successfully!"

---

## Step 4: Color Changer Button (4 minutes)

Let's make a button that changes colors!

**In script.js**, add this function:

```javascript
function changeColor() {
    // Array of colors to choose from
    let colors = ["#e74c3c", "#3498db", "#2ecc71", "#f39c12", "#9b59b6"];
    
    // Pick a random color
    let randomColor = colors[Math.floor(Math.random() * colors.length)];
    
    // Change the background color
    document.body.style.backgroundColor = randomColor;
}
```

**In index.html**, add this button:

```html
<button onclick="changeColor()">Change Background Color</button>
```

**Save both files and refresh!**

Click the button - the background should change to random colors!

---

## Step 5: Text Changer (3 minutes)

Let's make text that changes when you click a button!

**In HTML**, add:

```html
<p id="changeable-text">Click the button to change this text!</p>
<button onclick="changeText()">Change Text</button>
```

**In script.js**, add:

```javascript
function changeText() {
    let texts = [
        "JavaScript is awesome!",
        "I'm learning to code!",
        "This is so cool!",
        "Web development is fun!",
        "Click again for more!"
    ];
    
    // Pick random text
    let randomText = texts[Math.floor(Math.random() * texts.length)];
    
    // Change the paragraph
    document.getElementById("changeable-text").innerHTML = randomText;
}
```

**Save and test!**

---

## Step 6: Click Counter (4 minutes)

Let's count how many times a button is clicked!

**In script.js**, add this at the TOP of the file:

```javascript
// Global variable to track clicks
let clickCount = 0;
```

Then add this function:

```javascript
function countClicks() {
    // Increase count
    clickCount++;
    
    // Update the display
    document.getElementById("counter").innerHTML = "Clicks: " + clickCount;
    
    // Special messages at certain numbers
    if (clickCount === 10) {
        alert("Wow! 10 clicks! 🎉");
    } else if (clickCount === 50) {
        alert("Amazing! 50 clicks! Keep going! 🚀");
    }
}
```

**In HTML**, add:

```html
<h3>Click Counter Game</h3>
<p id="counter">Clicks: 0</p>
<button onclick="countClicks()">Click Me!</button>
```

**Save and test!**

Can you reach 10 clicks? 50?

---

## Step 7: Show/Hide Secret Message (Optional - 2 minutes)

**In HTML**, add:

```html
<button onclick="toggleSecret()">Reveal Secret</button>
<p id="secret" style="display: none;">The secret is: JavaScript is FUN! 🎉</p>
```

**In script.js**, add:

```javascript
function toggleSecret() {
    let secret = document.getElementById("secret");
    
    if (secret.style.display === "none") {
        secret.style.display = "block";
    } else {
        secret.style.display = "none";
    }
}
```

**Test it!** The secret message should appear and disappear!

---

## Challenges (If You Finish Early)

### Challenge 1: Random Fact Generator

**HTML**:
```html
<h3>Random Facts About Me</h3>
<p id="fact">Click the button for a random fact!</p>
<button onclick="showRandomFact()">Show Random Fact</button>
```

**JavaScript**:
```javascript
function showRandomFact() {
    let facts = [
        "I love pizza!",
        "My favorite color is blue.",
        "I can solve a Rubik's cube.",
        "I have a pet dog named Max.",
        "I want to be a programmer when I grow up."
    ];
    
    let randomFact = facts[Math.floor(Math.random() * facts.length)];
    document.getElementById("fact").innerHTML = randomFact;
}
```

### Challenge 2: Greeting Based on Time

```javascript
function greetUser() {
    let hour = new Date().getHours();
    let greeting;
    
    if (hour < 12) {
        greeting = "Good morning! ☀️";
    } else if (hour < 18) {
        greeting = "Good afternoon! 🌤️";
    } else {
        greeting = "Good evening! 🌙";
    }
    
    document.getElementById("greeting").innerHTML = greeting;
}
```

**HTML**:
```html
<p id="greeting">Click for greeting</p>
<button onclick="greetUser()">Greet Me</button>
```

### Challenge 3: Simple Calculator

**HTML**:
```html
<h3>Simple Calculator</h3>
<input type="number" id="num1" placeholder="First number">
<input type="number" id="num2" placeholder="Second number">
<button onclick="calculate()">Add Them</button>
<p id="result">Result: </p>
```

**JavaScript**:
```javascript
function calculate() {
    let num1 = parseFloat(document.getElementById("num1").value);
    let num2 = parseFloat(document.getElementById("num2").value);
    let sum = num1 + num2;
    
    document.getElementById("result").innerHTML = "Result: " + sum;
}
```

### Challenge 4: Mood Selector

**HTML**:
```html
<h3>How are you feeling?</h3>
<button onclick="setMood('happy')">😊 Happy</button>
<button onclick="setMood('sad')">😢 Sad</button>
<button onclick="setMood('excited')">🎉 Excited</button>
<p id="mood-display">Click a button!</p>
```

**JavaScript**:
```javascript
function setMood(mood) {
    let message = "";
    
    if (mood === "happy") {
        message = "That's great! Keep smiling! 😊";
        document.body.style.backgroundColor = "#f1c40f";
    } else if (mood === "sad") {
        message = "Hope you feel better soon! 💙";
        document.body.style.backgroundColor = "#3498db";
    } else if (mood === "excited") {
        message = "Awesome! What's the occasion? 🎉";
        document.body.style.backgroundColor = "#e74c3c";
    }
    
    document.getElementById("mood-display").innerHTML = message;
}
```

### Challenge 5: Guess the Number Game

```javascript
let secretNumber = Math.floor(Math.random() * 10) + 1;
let guesses = 0;

function guessNumber() {
    let guess = parseInt(document.getElementById("guess-input").value);
    guesses++;
    let message = "";
    
    if (guess === secretNumber) {
        message = "🎉 Correct! You got it in " + guesses + " guesses!";
        secretNumber = Math.floor(Math.random() * 10) + 1;
        guesses = 0;
    } else if (guess < secretNumber) {
        message = "📈 Too low! Try again.";
    } else {
        message = "📉 Too high! Try again.";
    }
    
    document.getElementById("guess-result").innerHTML = message;
}
```

**HTML**:
```html
<h3>Guess the Number (1-10)</h3>
<input type="number" id="guess-input" placeholder="Enter guess">
<button onclick="guessNumber()">Guess</button>
<p id="guess-result">Make a guess!</p>
```

---

## Advanced: Multiple Functions Together

Combine everything into a fun interactive experience!

```javascript
// Track user stats
let stats = {
    clicks: 0,
    colors: 0,
    texts: 0
};

function updateStats() {
    document.getElementById("stats").innerHTML = 
        `Buttons clicked: ${stats.clicks} | ` +
        `Colors changed: ${stats.colors} | ` +
        `Texts changed: ${stats.texts}`;
}

function coolClick() {
    stats.clicks++;
    updateStats();
    
    // Random action
    let action = Math.floor(Math.random() * 3);
    
    if (action === 0) {
        changeColor();
        stats.colors++;
    } else if (action === 1) {
        changeText();
        stats.texts++;
    } else {
        alert("🎲 Lucky click! Nothing changed!");
    }
    
    updateStats();
}
```

---

## Complete JavaScript Example

Here's a full `script.js` file with everything:

```javascript
// ===== VARIABLES =====
let clickCount = 0;
let secretNumber = Math.floor(Math.random() * 10) + 1;
let guesses = 0;

// ===== STARTUP =====
console.log("JavaScript loaded successfully!");
console.log("Secret number (shh!):", secretNumber);

// ===== BASIC FUNCTIONS =====
function sayHello() {
    alert("Hello! Welcome to my website! 👋");
}

function changeColor() {
    let colors = ["#e74c3c", "#3498db", "#2ecc71", "#f39c12", "#9b59b6", "#e67e22"];
    let randomColor = colors[Math.floor(Math.random() * colors.length)];
    document.body.style.backgroundColor = randomColor;
    console.log("Changed color to:", randomColor);
}

function changeText() {
    let texts = [
        "JavaScript is awesome! 💻",
        "I'm learning to code! 🚀",
        "This is so cool! ❄️",
        "Web development is fun! 🎉",
        "Click again for more! 🔄"
    ];
    let randomText = texts[Math.floor(Math.random() * texts.length)];
    document.getElementById("changeable-text").innerHTML = randomText;
}

// ===== CLICK COUNTER =====
function countClicks() {
    clickCount++;
    document.getElementById("counter").innerHTML = "Clicks: " + clickCount;
    
    if (clickCount === 10) {
        alert("Wow! 10 clicks! 🎉");
    } else if (clickCount === 25) {
        alert("25 clicks! You're on fire! 🔥");
    } else if (clickCount === 50) {
        alert("AMAZING! 50 clicks! You're a clicking champion! 🏆");
    }
}

// ===== SHOW/HIDE =====
function toggleSecret() {
    let secret = document.getElementById("secret");
    if (secret.style.display === "none") {
        secret.style.display = "block";
    } else {
        secret.style.display = "none";
    }
}

// ===== RANDOM FACTS =====
function showRandomFact() {
    let facts = [
        "I love learning new things! 📚",
        "My favorite subject is science! 🔬",
        "I can solve a Rubik's cube! 🎲",
        "I built this website myself! 💻",
        "I want to be a programmer! 👨‍💻"
    ];
    let randomFact = facts[Math.floor(Math.random() * facts.length)];
    document.getElementById("fact").innerHTML = randomFact;
}

// ===== TIME GREETING =====
function greetUser() {
    let hour = new Date().getHours();
    let greeting;
    
    if (hour < 12) {
        greeting = "Good morning! ☀️ Thanks for visiting!";
    } else if (hour < 18) {
        greeting = "Good afternoon! 🌤️ Hope you're having a great day!";
    } else {
        greeting = "Good evening! 🌙 Thanks for stopping by!";
    }
    
    alert(greeting);
}

// ===== NUMBER GAME =====
function guessNumber() {
    let guess = parseInt(document.getElementById("guess-input").value);
    
    if (isNaN(guess)) {
        alert("Please enter a number!");
        return;
    }
    
    guesses++;
    let message = "";
    
    if (guess === secretNumber) {
        message = `🎉 Correct! You got it in ${guesses} guesses! Starting new game...`;
        alert(message);
        secretNumber = Math.floor(Math.random() * 10) + 1;
        guesses = 0;
        document.getElementById("guess-input").value = "";
    } else if (guess < secretNumber) {
        message = `📈 Too low! Try again. (${guesses} guesses so far)`;
    } else {
        message = `📉 Too high! Try again. (${guesses} guesses so far)`;
    }
    
    document.getElementById("guess-result").innerHTML = message;
    console.log(`Guess ${guesses}: ${guess}, Secret: ${secretNumber}`);
}

// ===== PAGE LOAD =====
window.onload = function() {
    console.log("Page fully loaded!");
    console.log("All JavaScript functions ready to use!");
};
```

---

## Troubleshooting

### Problem: Button does nothing
**Solutions**:
1. Check console (F12) for errors
2. Verify function name matches: `onclick="myFunction()"` → `function myFunction()`
3. Make sure script.js is linked in HTML
4. Check for typos in function names
5. Make sure JavaScript is before `</body>`

### Problem: "Uncaught ReferenceError"
**Solution**: Function doesn't exist
1. Check spelling
2. Make sure function is defined in script.js
3. Make sure script.js is loaded

### Problem: "Cannot read property 'innerHTML'"
**Solution**: Element not found
1. Check ID matches exactly (case-sensitive!)
2. HTML: `id="myElement"` → JS: `getElementById("myElement")`
3. Make sure element exists in HTML

### Problem: Alert/prompt doesn't show
**Solution**: Pop-ups might be blocked
1. Check browser settings
2. Allow pop-ups for localhost
3. Use console.log for debugging instead

### Problem: Random not working
**Solution**: Check the random code
```javascript
// Correct:
Math.floor(Math.random() * array.length)

// Common mistake:
Math.random(array.length)  // WRONG!
```

---

## Checklist

Before finishing, make sure:

- [ ] script.js created and linked to HTML
- [ ] At least 3 working buttons
- [ ] Console shows no errors (F12)
- [ ] Functions have unique, descriptive names
- [ ] Code is commented (explain what it does)
- [ ] Tested all interactive features
- [ ] Everything works as expected

---

## Console Debugging Tips

Use `console.log()` to debug:

```javascript
function myFunction() {
    console.log("Function started!");
    
    let value = 5;
    console.log("Value is:", value);
    
    // Do something
    value = value * 2;
    console.log("After doubling:", value);
    
    console.log("Function finished!");
}
```

Press F12 → Console to see all logs!

---

## Next Steps

Amazing! You've created a fully interactive webpage!

**Coming up**: Deploy your website so others can access it!

---

## Pro Tips

1. **Test Often**: Save, refresh, test after EVERY change

2. **Console is Your Friend**: Use F12 constantly
   - See errors
   - Test code
   - Debug problems

3. **Start Simple**: Get one thing working, then add more

4. **Copy-Paste Carefully**: Understand what code does before using it

5. **Comment Your Code**:
```javascript
// This function changes the background color
function changeColor() {
    // ... code ...
}
```

6. **Name Things Well**:
   - Good: `countClicks()`, `changeBackgroundColor()`
   - Bad: `doStuff()`, `function1()`

7. **Keep Functions Small**: One function = one job

8. **Variables at Top**: Define variables at start of file

**You're a web developer now! 🎉** Keep experimenting and building cool stuff!
