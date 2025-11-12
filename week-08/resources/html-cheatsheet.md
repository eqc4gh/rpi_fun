# HTML Cheat Sheet

## Basic Document Structure
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Title Here</title>
</head>
<body>
    <!-- Your content goes here -->
</body>
</html>
```

## Headings
```html
<h1>Main Heading (Largest)</h1>
<h2>Sub Heading</h2>
<h3>Section Heading</h3>
<h4>Smaller Heading</h4>
<h5>Even Smaller</h5>
<h6>Smallest Heading</h6>
```

## Text Elements
```html
<p>This is a paragraph of text.</p>
<strong>Bold text</strong>
<em>Italic text</em>
<u>Underlined text</u>
<br>  <!-- Line break -->
<hr>  <!-- Horizontal line -->
<span>Inline container for text</span>
```

## Links
```html
<!-- Link to another website -->
<a href="https://www.example.com">Click here</a>

<!-- Link to another page in your site -->
<a href="about.html">About Page</a>

<!-- Link that opens in new tab -->
<a href="https://www.example.com" target="_blank">Opens in new tab</a>

<!-- Link to email -->
<a href="mailto:email@example.com">Email me</a>
```

## Images
```html
<!-- Basic image -->
<img src="photo.jpg" alt="Description of image">

<!-- Image with size -->
<img src="photo.jpg" alt="Description" width="300" height="200">

<!-- Image from URL -->
<img src="https://example.com/image.jpg" alt="Description">
```

## Lists

### Unordered List (Bullets)
```html
<ul>
    <li>First item</li>
    <li>Second item</li>
    <li>Third item</li>
</ul>
```

### Ordered List (Numbers)
```html
<ol>
    <li>First step</li>
    <li>Second step</li>
    <li>Third step</li>
</ol>
```

## Containers

### Div (Block Container)
```html
<div>
    <h2>Section Title</h2>
    <p>Section content goes here.</p>
</div>
```

### Span (Inline Container)
```html
<p>This is <span style="color: red;">red text</span> in a paragraph.</p>
```

## Buttons
```html
<!-- Basic button -->
<button>Click Me</button>

<!-- Button with JavaScript -->
<button onclick="myFunction()">Click Me</button>

<!-- Button with ID (for styling or JavaScript) -->
<button id="my-button">Click Me</button>
```

## Forms (Advanced - Optional)
```html
<form>
    <!-- Text input -->
    <label for="name">Name:</label>
    <input type="text" id="name" name="name">
    
    <!-- Email input -->
    <label for="email">Email:</label>
    <input type="email" id="email" name="email">
    
    <!-- Password input -->
    <label for="password">Password:</label>
    <input type="password" id="password" name="password">
    
    <!-- Checkbox -->
    <input type="checkbox" id="subscribe" name="subscribe">
    <label for="subscribe">Subscribe to newsletter</label>
    
    <!-- Radio buttons -->
    <input type="radio" id="option1" name="choice" value="1">
    <label for="option1">Option 1</label>
    <input type="radio" id="option2" name="choice" value="2">
    <label for="option2">Option 2</label>
    
    <!-- Dropdown -->
    <select name="color">
        <option value="red">Red</option>
        <option value="blue">Blue</option>
        <option value="green">Green</option>
    </select>
    
    <!-- Text area (multi-line) -->
    <textarea name="message" rows="4" cols="50"></textarea>
    
    <!-- Submit button -->
    <input type="submit" value="Submit">
</form>
```

## Semantic HTML (Better Structure)
```html
<header>
    <!-- Top of page, logo, navigation -->
</header>

<nav>
    <!-- Navigation links -->
    <ul>
        <li><a href="index.html">Home</a></li>
        <li><a href="about.html">About</a></li>
    </ul>
</nav>

<main>
    <!-- Main content of page -->
    
    <article>
        <!-- Self-contained content (blog post, article) -->
    </article>
    
    <section>
        <!-- Thematic grouping of content -->
    </section>
    
    <aside>
        <!-- Sidebar, related content -->
    </aside>
</main>

<footer>
    <!-- Bottom of page, copyright, contact info -->
</footer>
```

## Tables
```html
<table>
    <thead>
        <tr>
            <th>Header 1</th>
            <th>Header 2</th>
            <th>Header 3</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Row 1, Cell 1</td>
            <td>Row 1, Cell 2</td>
            <td>Row 1, Cell 3</td>
        </tr>
        <tr>
            <td>Row 2, Cell 1</td>
            <td>Row 2, Cell 2</td>
            <td>Row 2, Cell 3</td>
        </tr>
    </tbody>
</table>
```

## Comments
```html
<!-- This is a comment. It won't show on the page. -->
<!-- Use comments to explain your code or temporarily disable code -->
```

## Special Characters
```html
&lt;    <!-- Less than: < -->
&gt;    <!-- Greater than: > -->
&amp;   <!-- Ampersand: & -->
&quot;  <!-- Quote: " -->
&copy;  <!-- Copyright: © -->
&nbsp;  <!-- Non-breaking space -->
```

## Common Attributes
```html
<!-- ID (unique, only one per page) -->
<div id="unique-name"></div>

<!-- Class (can be used multiple times) -->
<div class="my-class"></div>
<div class="my-class another-class"></div>

<!-- Style (inline CSS) -->
<p style="color: blue; font-size: 20px;">Styled text</p>

<!-- Title (tooltip on hover) -->
<p title="This shows on hover">Hover over me</p>
```

## Tips for Good HTML
1. **Always close your tags** - `<p>text</p>` not `<p>text`
2. **Use lowercase** - `<div>` not `<DIV>`
3. **Quote attributes** - `href="link"` not `href=link`
4. **Indent nested elements** - Makes code readable
5. **One `<h1>` per page** - Your main title
6. **Use semantic tags** - `<header>`, `<nav>`, etc. instead of just `<div>`
7. **Alt text for images** - Helps accessibility and SEO
8. **Meaningful IDs and classes** - `id="main-nav"` not `id="thing1"`

## Quick Template for "About Me" Page
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Me - [Your Name]</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Welcome to My Page!</h1>
    </header>
    
    <main>
        <section id="intro">
            <h2>About Me</h2>
            <img src="photo.jpg" alt="My photo" width="200">
            <p>Hi! My name is [Name] and I'm [age] years old.</p>
        </section>
        
        <section id="hobbies">
            <h2>My Hobbies</h2>
            <ul>
                <li>Playing video games</li>
                <li>Reading</li>
                <li>Coding</li>
            </ul>
        </section>
        
        <section id="favorites">
            <h2>My Favorites</h2>
            <p><strong>Favorite Color:</strong> Blue</p>
            <p><strong>Favorite Food:</strong> Pizza</p>
            <p><strong>Favorite Movie:</strong> [Movie Name]</p>
        </section>
        
        <section id="fun-facts">
            <h2>Fun Facts</h2>
            <button onclick="showFact()">Show Random Fact</button>
            <p id="fact-display"></p>
        </section>
    </main>
    
    <footer>
        <p>Created by [Your Name] - Week 8 Project</p>
    </footer>
    
    <script src="script.js"></script>
</body>
</html>
```
