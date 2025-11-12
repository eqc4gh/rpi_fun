# Web Server Setup Guide

## What is a Web Server?

A web server is software that delivers web pages to browsers. When you visit a website, your browser asks a web server for the page, and the server sends it back.

For this class, we'll run a simple web server on your Raspberry Pi so others can view your webpage on the local network!

## Method 1: Python Simple HTTP Server (Recommended)

Python 3 comes with a built-in web server - perfect for learning!

### Step-by-Step Setup

#### 1. Create Your Website Folder
```bash
# Open Terminal and create a folder for your website
mkdir ~/website
cd ~/website
```

#### 2. Add Your Files
Put your website files in this folder:
- `index.html` (main page)
- `style.css` (styling)
- `script.js` (JavaScript)
- `images/` folder for pictures

#### 3. Start the Server
```bash
# Make sure you're in your website folder
cd ~/website

# Start the server
python3 -m http.server 8000
```

You should see:
```
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
```

#### 4. Test Locally
Open Chromium browser on your Pi and go to:
```
http://localhost:8000
```

You should see your website!

#### 5. Get Your Pi's IP Address
```bash
# In a NEW terminal window (leave server running)
hostname -I
```

This will show something like: `192.168.1.42`

#### 6. Access from Other Devices
On another device (phone, tablet, laptop) on the same network:
```
http://192.168.1.42:8000
```
(Replace with your Pi's actual IP address)

### Stop the Server
- Press `Ctrl+C` in the terminal where server is running
- Server stops immediately

### Restart the Server
```bash
cd ~/website
python3 -m http.server 8000
```

## Understanding the Parts

### Port Number (8000)
- A "port" is like a door number on your Pi
- 8000 is our chosen port (standard ports: 80 for HTTP, 443 for HTTPS)
- You'll always need to include `:8000` in the URL
- Can use different port: `python3 -m http.server 8080`

### IP Address
- Your Pi's unique address on the network
- Like a house address for data to find your Pi
- Changes if you move to different network
- `localhost` or `127.0.0.1` = your own device
- Other devices use your Pi's network IP

### localhost vs Network IP
```
http://localhost:8000        # Only works on the Pi itself
http://127.0.0.1:8000        # Same as localhost
http://192.168.1.42:8000     # Works from other devices
```

## File Organization

### Recommended Structure
```
/home/pi/website/
├── index.html          # Main page (loads automatically)
├── about.html          # Other pages
├── style.css           # Styling
├── script.js           # JavaScript
└── images/             # Image folder
    ├── photo1.jpg
    └── photo2.png
```

### Why "index.html"?
- Web servers look for `index.html` automatically
- When you visit `http://192.168.1.42:8000/`, it loads `index.html`
- Like the "front door" of your website

### Other Pages
- Create more pages: `about.html`, `contact.html`
- Access with full filename: `http://192.168.1.42:8000/about.html`
- Link between pages:
  ```html
  <a href="about.html">About Me</a>
  ```

## Common Issues & Solutions

### Issue: "Address already in use"
**Cause**: Port 8000 is already being used

**Solutions**:
1. Stop the other server (find it and press Ctrl+C)
2. Use a different port:
   ```bash
   python3 -m http.server 8080
   ```

### Issue: Can't Access from Other Device
**Checklist**:
- [ ] Is server running? (Check terminal)
- [ ] Both devices on same WiFi network?
- [ ] Using Pi's IP address (not localhost)?
- [ ] Including port number (`:8000`)?
- [ ] No typos in IP address?
- [ ] Pi's firewall not blocking? (Usually not an issue)

**To verify**: Can you access from Pi's own browser?
```
http://localhost:8000
```

### Issue: Getting IP Address Shows Multiple Numbers
**Example Output**:
```
192.168.1.42 172.17.0.1
```

**Solution**: Use the first one (192.168.x.x or 10.x.x.x format)

### Issue: Page Shows Directory Listing Instead of Website
**Cause**: No `index.html` file in folder

**Solution**: Make sure you have a file named exactly `index.html` (lowercase)

### Issue: Changes Not Showing
**Solutions**:
1. Did you save the file? (Ctrl+S)
2. Refresh browser (F5 or Ctrl+R)
3. Hard refresh (Ctrl+Shift+R)
4. Server doesn't need restart for file changes!

## Testing Your Website

### Test Checklist
- [ ] Works on Pi's browser (localhost:8000)
- [ ] Works on another device (IP:8000)
- [ ] All images load
- [ ] All links work
- [ ] CSS styles apply
- [ ] JavaScript runs
- [ ] Mobile phone can access it

### Browser Developer Tools
While testing, press F12 to:
- Check for errors (Console tab)
- Verify files loaded (Network tab)
- Inspect HTML/CSS (Elements tab)

## Security Notes

### Important: Local Network Only!
- This setup is for LOCAL network only
- NOT accessible from the internet
- Perfect for learning and classroom demos
- Safe to experiment!

### Don't Share
- Your website is only visible on your network
- People at school/home can see it
- People on the internet CANNOT
- This is good for learning!

### If You Want Internet Access Later
- Need proper web hosting
- Need domain name (like www.mysite.com)
- Beyond this class but good to know about!

## Advanced: Different Server Options

### Option 1: Change Port
```bash
# Use port 8080 instead
python3 -m http.server 8080
```

### Option 2: Specific IP
```bash
# Bind to specific network interface
python3 -m http.server 8000 --bind 192.168.1.42
```

### Option 3: Different Directory
```bash
# Serve files from specific folder without 'cd'
python3 -m http.server 8000 --directory /home/pi/website
```

## Running Server in Background (Advanced)

### Option 1: New Terminal Window
- Keep server terminal open
- Open new terminal for other work
- Can switch between windows

### Option 2: Background Process
```bash
# Start in background
python3 -m http.server 8000 &

# See background jobs
jobs

# Bring to foreground
fg

# Or kill it
pkill -f "python3 -m http.server"
```

## Sharing Your Website in Class

### Steps for Demo Day
1. **Start your server**:
   ```bash
   cd ~/website
   python3 -m http.server 8000
   ```

2. **Write your IP on board**:
   ```bash
   hostname -I
   ```
   Example: `192.168.1.42:8000`

3. **Others visit your site**:
   - They type your IP:8000 in browser
   - They see your webpage!

4. **After demos**:
   - Stop server with Ctrl+C
   - Or leave running to show parents!

## Troubleshooting Commands

### Check if server is running
```bash
# List processes
ps aux | grep python

# Check port 8000
netstat -tuln | grep 8000
```

### Find your IP (multiple ways)
```bash
# Method 1
hostname -I

# Method 2
ip addr show

# Method 3
ifconfig
```

### Check network connection
```bash
# Ping another device (if you know its IP)
ping 192.168.1.1

# Check your default gateway
ip route show
```

## Quick Reference Card

### Start Server
```bash
cd ~/website
python3 -m http.server 8000
```

### Stop Server
```
Press Ctrl+C
```

### Get IP Address
```bash
hostname -I
```

### Access URLs
```
On Pi:        http://localhost:8000
Other devices: http://YOUR_PI_IP:8000
```

### Common Ports
- 8000 - Common for development
- 8080 - Alternative port
- 80 - Standard HTTP (needs sudo)
- 443 - Standard HTTPS (needs sudo)

## Tips for Success

1. **Keep terminal open** - Server stops if you close it
2. **Check IP each time** - May change if Pi restarts
3. **Use lowercase** - File names are case-sensitive on Linux
4. **Test locally first** - Make sure it works on Pi before sharing
5. **Save before testing** - Changes need to be saved to file
6. **Write down IP** - For sharing with classmates
7. **Same network** - Everyone must be on same WiFi
8. **Be patient** - First time may take a moment to load

## What's Next?

Now that you can run a web server, you're ready to:
- Share your projects with classmates
- Show your family your work
- Learn about client-server architecture
- **Week 9**: Control GPIO pins from your webpage!

---

**Remember**: This is LOCAL network only, which is perfect for learning. Your website is safe and only visible to people on your network. Have fun sharing your creations! 🌐🎉
