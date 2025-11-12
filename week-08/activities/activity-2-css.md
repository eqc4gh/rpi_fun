# Activity 2: Add CSS Styling

**Time**: 15 minutes  
**Difficulty**: Beginner-Intermediate  
**Goal**: Transform your plain HTML into a beautifully styled webpage!

---

## Setup (1 minute)

Make sure you're in your website folder:
```bash
cd /home/pi/website
```

---

## Step 1: Create CSS File (3 minutes)

Create a new file for your styles:
```bash
nano style.css
```

Add this basic styling:

```css
body {
    font-family: Arial, sans-serif;
    background-color: #ecf0f1;
    margin: 20px;
}

h1 {
    color: #2c3e50;
    text-align: center;
}

h2 {
    color: #34495e;
}

p {
    font-size: 18px;
    line-height: 1.6;
}
```

**Save**: `Ctrl+O`, `Enter`, `Ctrl+X`

---

## Step 2: Link CSS to HTML (2 minutes)

Open your HTML file:
```bash
nano index.html
```

In the `<head>` section, add this line (after `<title>`):

```html
<head>
    <title>About Me</title>
    <link rel="stylesheet" href="style.css">
</head>
```

**Save and refresh your browser!**

**WOW!** Look at the difference! Your page should now have:
- Nice background color
- Better fonts
- Styled headings
- Readable paragraphs

---

## Step 3: Style Your Sections (4 minutes)

Go back to your CSS file:
```bash
nano style.css
```

Add these styles to the END of your file:

```css
/* Make lists look nice */
ul, ol {
    font-size: 18px;
    line-height: 1.8;
}

li {
    margin-bottom: 5px;
}

/* Style the strong/bold text */
strong {
    color: #e74c3c;
}

/* Add some spacing between sections */
h2 {
    margin-top: 30px;
    border-bottom: 2px solid #3498db;
    padding-bottom: 5px;
}
```

**Save and refresh!**

Your sections now have colored underlines and better spacing!

---

## Step 4: Add Fun Colors (3 minutes)

Let's make it more colorful! Add these to your CSS:

```css
/* Change background to something fun */
body {
    background: linear-gradient(to bottom, #3498db, #2ecc71);
    color: white;
}

/* Make headings stand out */
h1 {
    background-color: rgba(255, 255, 255, 0.3);
    padding: 20px;
    border-radius: 15px;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

/* Style paragraphs */
p {
    background-color: rgba(255, 255, 255, 0.2);
    padding: 15px;
    border-radius: 10px;
    margin: 10px 0;
}
```

**Save and refresh!**

**Fancy!** Gradients and rounded corners!

---

## Step 5: Style Links (Optional - 2 minutes)

If you added links in Activity 1, style them:

```css
a {
    color: #f39c12;
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    color: #e67e22;
    text-decoration: underline;
}
```

**Save and refresh!**

Links now change color when you hover over them!

---

## Experiment Time!

Try changing these values and see what happens:

### Change Colors
```css
body {
    background-color: lightblue;  /* Try: pink, lightgreen, lavender */
}

h1 {
    color: darkblue;  /* Try: red, green, purple */
}
```

### Change Sizes
```css
h1 {
    font-size: 48px;  /* Try: 60px, 36px, 72px */
}

p {
    font-size: 20px;  /* Try: 16px, 24px, 14px */
}
```

### Change Alignment
```css
p {
    text-align: center;  /* Try: left, right, justify */
}
```

### Add Borders
```css
body {
    border: 5px solid black;
    border-radius: 20px;
}
```

### Add Shadows
```css
h1 {
    text-shadow: 3px 3px 6px black;
}

p {
    box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
}
```

---

## Challenges (If You Finish Early)

### Challenge 1: Create a Dark Theme
```css
body {
    background-color: #2c3e50;
    color: #ecf0f1;
}

h1, h2 {
    color: #3498db;
}
```

### Challenge 2: Add Hover Effects to Headings
```css
h2:hover {
    color: #e74c3c;
    cursor: pointer;
    transform: scale(1.05);
}
```

### Challenge 3: Style Lists Differently
```css
ul {
    list-style-type: square;  /* Try: circle, disc, none */
}

ol {
    list-style-type: upper-roman;  /* Try: lower-alpha, decimal */
}

li:hover {
    background-color: rgba(255, 255, 255, 0.2);
    padding-left: 10px;
}
```

### Challenge 4: Add a Container
First, wrap your HTML content in a `<div>`:

```html
<body>
    <div class="container">
        <!-- All your content here -->
    </div>
</body>
```

Then style it:

```css
.container {
    max-width: 800px;
    margin: 0 auto;
    background-color: white;
    padding: 30px;
    border-radius: 20px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
}
```

### Challenge 5: Animate Something!
```css
h1 {
    animation: slideIn 1s;
}

@keyframes slideIn {
    from {
        transform: translateY(-50px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}
```

---

## Color Inspiration

Try these color combinations:

### Ocean Theme
```css
body {
    background: linear-gradient(to bottom, #1e3c72, #2a5298);
    color: white;
}
```

### Sunset Theme
```css
body {
    background: linear-gradient(to bottom, #ee0979, #ff6a00);
    color: white;
}
```

### Forest Theme
```css
body {
    background: linear-gradient(to bottom, #134e5e, #71b280);
    color: white;
}
```

### Candy Theme
```css
body {
    background: linear-gradient(to bottom, #f857a6, #ff5858);
    color: white;
}
```

---

## Complete CSS Example

Here's a complete, polished CSS file:

```css
/* Reset and base styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 20px;
    min-height: 100vh;
}

/* Container for content */
.container {
    max-width: 900px;
    margin: 0 auto;
    background-color: rgba(255, 255, 255, 0.1);
    padding: 40px;
    border-radius: 20px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
}

/* Headings */
h1 {
    text-align: center;
    font-size: 48px;
    margin-bottom: 30px;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    animation: fadeIn 1s;
}

h2 {
    font-size: 32px;
    margin-top: 30px;
    margin-bottom: 15px;
    padding-bottom: 10px;
    border-bottom: 3px solid rgba(255, 255, 255, 0.5);
}

/* Paragraphs */
p {
    font-size: 18px;
    line-height: 1.8;
    margin-bottom: 15px;
    padding: 15px;
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 10px;
}

/* Lists */
ul, ol {
    margin-left: 20px;
    margin-bottom: 20px;
    font-size: 18px;
}

li {
    margin-bottom: 10px;
    line-height: 1.6;
}

/* Strong text */
strong {
    color: #ffd700;
    font-weight: bold;
}

/* Links */
a {
    color: #ffd700;
    text-decoration: none;
    font-weight: bold;
    transition: all 0.3s;
}

a:hover {
    color: #ffed4e;
    text-decoration: underline;
}

/* Animations */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
```

---

## Troubleshooting

### Problem: CSS not loading
**Solution**:
1. Check filename: must be `style.css` (exact spelling)
2. Check link tag in HTML `<head>`
3. Make sure both files in same folder
4. Hard refresh: `Ctrl+Shift+R`

### Problem: Colors not showing
**Solution**:
1. Check color names/codes spelling
2. Use quotes around color names if needed
3. Hex codes need # symbol: `#FF0000`

### Problem: Text unreadable
**Solution**:
1. Dark text on dark background = bad!
2. Light text needs dark background
3. Check contrast: `color: white;` with `background: darkblue;`

### Problem: Styles applying to wrong elements
**Solution**:
1. Check your selectors (p, h1, .class, #id)
2. Be specific: `h2` affects ALL h2 elements
3. Use classes for specific styling

### Problem: Layout looks broken
**Solution**:
1. Check for missing semicolons ;
2. Check for missing closing braces }
3. Open browser console (F12) for errors

---

## Checklist

Before moving to Activity 3, make sure:

- [ ] CSS file created and saved
- [ ] CSS linked in HTML `<head>`
- [ ] At least 5 different style rules
- [ ] Colors look good (readable text!)
- [ ] Spacing looks nice (margins/padding)
- [ ] Tried experimenting with values
- [ ] Page looks better than plain HTML
- [ ] No browser console errors

---

## Next Steps

Awesome work! Your page looks SO much better now!

**Next**: Activity 3 - We'll add JavaScript to make it interactive!

**Keep experimenting**: The best way to learn CSS is to try things and see what happens!

---

## Pro Tips

1. **Browser Developer Tools**: Right-click → Inspect Element
   - See all CSS rules
   - Edit live and test changes
   - Copy working styles to your file

2. **Color Picker**: 
   - Google "color picker" for easy color selection
   - Get hex codes: #FF5733

3. **Gradients**:
   - Use: https://cssgradient.io/
   - Create beautiful gradients easily

4. **Keep it Simple**:
   - Don't go crazy with colors
   - Too many fonts = messy
   - White space is your friend

5. **Responsive Thinking**:
   - Will it look good on small screens?
   - Test by making browser window smaller

**Remember**: There's no "right" design - make it YOUR style! 🎨✨
