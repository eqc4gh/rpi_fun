# Activity 1: Building Your First HTML Page

**Time**: 20 minutes  
**Difficulty**: Beginner  
**Goal**: Create a basic "About Me" HTML page with proper structure

---

## Setup (2 minutes)

1. Open Terminal on your Raspberry Pi

2. Create your project folder:
```bash
cd /home/pi
mkdir website
cd website
```

3. Open text editor:
```bash
nano index.html
```

---

## Step 1: Basic HTML Structure (5 minutes)

Type this EXACTLY as shown (pay attention to opening/closing tags!):

```html
<!DOCTYPE html>
<html>
<head>
    <title>About Me</title>
</head>
<body>
    <h1>All About [Your Name]</h1>
</body>
</html>
```

**Save**: Press `Ctrl+O`, then `Enter`, then `Ctrl+X`

**Test**: Open Chromium browser, go to:
```
file:///home/pi/website/index.html
```

You should see your heading! 🎉

---

## Step 2: Add Introduction (3 minutes)

Open file again:
```bash
nano index.html
```

Add paragraphs inside `<body>` (after the `<h1>`):

```html
<p>Hi! My name is [Your Name] and I'm [age] years old.</p>

<p>I'm learning about Raspberry Pi and web development. This is my first website!</p>

<p>I go to [school name] and I'm in [grade] grade.</p>
```

Replace the [brackets] with your real information!

**Save and refresh browser** (Ctrl+R)

---

## Step 3: Add a Hobbies Section (4 minutes)

Add a new heading and list:

```html
<h2>My Hobbies</h2>

<ul>
    <li>Playing video games</li>
    <li>Reading books</li>
    <li>Playing sports</li>
</ul>
```

Change the hobbies to YOUR actual hobbies! Add more `<li>` items if you want.

**Save and refresh**

---

## Step 4: Add Favorite Things (4 minutes)

Add another section:

```html
<h2>My Favorite Things</h2>

<p><strong>Favorite Food:</strong> Pizza</p>
<p><strong>Favorite Movie:</strong> Spider-Man</p>
<p><strong>Favorite Game:</strong> Minecraft</p>
<p><strong>Favorite Color:</strong> Blue</p>
```

Change these to your actual favorites!

**Notice**: `<strong>` makes text bold

**Save and refresh**

---

## Step 5: Add a Goals Section (Optional - 2 minutes)

Add an ordered list (with numbers):

```html
<h2>My Goals</h2>

<ol>
    <li>Learn more about programming</li>
    <li>Build a robot</li>
    <li>Create my own video game</li>
</ol>
```

**Save and refresh**

---

## Challenges (If You Finish Early)

### Challenge 1: Add More Sections
Try adding:
- Favorite Books
- Favorite Sports Teams
- Places You Want To Visit
- Fun Facts About Me

### Challenge 2: Add Links
Add links to your favorite websites:

```html
<h2>Cool Websites</h2>
<ul>
    <li><a href="https://www.google.com">Google</a></li>
    <li><a href="https://www.wikipedia.org">Wikipedia</a></li>
    <li><a href="https://www.raspberrypi.org">Raspberry Pi</a></li>
</ul>
```

### Challenge 3: Try Different Headings
Use h1, h2, h3, h4 to create hierarchy:

```html
<h1>Main Title</h1>
<h2>Major Section</h2>
<h3>Subsection</h3>
<h4>Sub-subsection</h4>
```

### Challenge 4: Add an Image
If you have an image file:

```html
<h2>My Photo</h2>
<img src="photo.jpg" alt="Picture of me">
```

(We'll work with images more next week!)

---

## Complete Example

Your final HTML should look something like this:

```html
<!DOCTYPE html>
<html>
<head>
    <title>About Me</title>
</head>
<body>
    <h1>All About Alex</h1>
    
    <p>Hi! My name is Alex and I'm 12 years old.</p>
    
    <p>I'm learning about Raspberry Pi and web development. This is my first website!</p>
    
    <p>I go to Lincoln Middle School and I'm in 7th grade.</p>
    
    <h2>My Hobbies</h2>
    <ul>
        <li>Playing video games</li>
        <li>Reading sci-fi books</li>
        <li>Playing soccer</li>
        <li>Building with LEGO</li>
    </ul>
    
    <h2>My Favorite Things</h2>
    <p><strong>Favorite Food:</strong> Pizza</p>
    <p><strong>Favorite Movie:</strong> Spider-Man: Into the Spider-Verse</p>
    <p><strong>Favorite Game:</strong> Minecraft</p>
    <p><strong>Favorite Color:</strong> Blue</p>
    
    <h2>My Goals</h2>
    <ol>
        <li>Learn Python programming</li>
        <li>Build a robot that follows lines</li>
        <li>Create my own video game</li>
        <li>Get better at soccer</li>
    </ol>
    
    <h2>Fun Facts</h2>
    <ul>
        <li>I can solve a Rubik's cube in under 2 minutes</li>
        <li>I have a pet dog named Max</li>
        <li>My favorite subject is science</li>
    </ul>
</body>
</html>
```

---

## Troubleshooting

### Problem: Page is blank
**Solution**: 
- Check that you have `<!DOCTYPE html>` at the very top
- Make sure all content is between `<body>` and `</body>`
- Check for typos in tag names

### Problem: Text shows on one line
**Solution**: 
- HTML ignores line breaks in code
- Use `<p>` tags for paragraphs
- Use `<br>` for single line breaks

### Problem: Tags showing on page
**Solution**: 
- You forgot the closing `>` 
- Example: `<p` should be `<p>`

### Problem: List not showing as bullets
**Solution**: 
- Make sure you're using `<ul>` (not `<ol>`)
- Each item needs `<li>` tags
- Check that `<ul>` is closed with `</ul>`

### Problem: Bold not working
**Solution**: 
- Make sure you use `<strong>` AND `</strong>`
- Example: `<strong>Bold text</strong>`

---

## Checklist

Before moving on, make sure you have:

- [ ] Valid HTML structure (DOCTYPE, html, head, body)
- [ ] Page title in `<title>` tag
- [ ] Main heading with your name
- [ ] At least 3 paragraphs about yourself
- [ ] At least one list (ul or ol)
- [ ] Proper tag closing (every `<tag>` has `</tag>`)
- [ ] Content displays correctly in browser
- [ ] File saved as `index.html`

---

## Next Steps

Great job! You've created your first webpage! 

**Next**: We'll add CSS to make it look beautiful!

**Save your work** - we'll build on this in Activity 2!

---

## Tips

- **Indentation helps**: Indent nested tags so code is readable
- **Comments**: Add `<!-- notes -->` to explain your code
- **Test often**: Save and refresh after each change
- **View source**: Right-click on webpage → "View Page Source" to see HTML
- **No spaces in filenames**: Use `my-page.html` not `my page.html`

---

## Bonus: HTML Validation

Want to check if your HTML is perfect?

1. Copy all your HTML code
2. Visit: https://validator.w3.org/#validate_by_input
3. Paste your code
4. Click "Check"
5. Fix any errors it finds!

Good HTML = Happy browsers = Happy users! 🎉
