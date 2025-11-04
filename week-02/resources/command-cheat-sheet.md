# Command Line Cheat Sheet

Quick reference for essential Linux commands.

---

## Navigation Commands

| Command | Purpose | Examples |
|---------|---------|----------|
| `pwd` | Print working directory | `pwd` |
| `ls` | List files | `ls`, `ls -la`, `ls -lh` |
| `cd` | Change directory | `cd Documents`, `cd ..`, `cd ~` |

### ls Options
- `-l` : Long format (detailed)
- `-a` : Show all files (including hidden)
- `-h` : Human-readable sizes (KB, MB)
- `-t` : Sort by modification time
- `-r` : Reverse order
- `-R` : Recursive (show subdirectories)

### cd Shortcuts
- `cd` or `cd ~` : Go to home directory
- `cd ..` : Go up one directory
- `cd -` : Go to previous directory
- `cd /` : Go to root directory

---

## File Operations

| Command | Purpose | Examples |
|---------|---------|----------|
| `touch` | Create empty file | `touch file.txt` |
| `mkdir` | Make directory | `mkdir folder`, `mkdir -p path/to/folder` |
| `cp` | Copy | `cp file.txt backup.txt`, `cp -r folder/ backup/` |
| `mv` | Move/rename | `mv old.txt new.txt`, `mv file.txt folder/` |
| `rm` | Remove | `rm file.txt`, `rm -r folder/`, `rm -i file.txt` |

### Important Flags
- `cp -r` : Copy directory recursively
- `rm -r` : Remove directory and contents
- `rm -i` : Interactive (ask before deleting)
- `rm -f` : Force (no confirmation) ⚠️ Dangerous!
- `mkdir -p` : Create parent directories if needed

---

## Viewing Files

| Command | Purpose | Examples |
|---------|---------|----------|
| `cat` | Display entire file | `cat file.txt` |
| `less` | View file with scrolling | `less file.txt` (q to quit) |
| `head` | Show first lines | `head file.txt`, `head -n 20 file.txt` |
| `tail` | Show last lines | `tail file.txt`, `tail -f logfile.txt` |
| `wc` | Count lines/words/chars | `wc file.txt`, `wc -l file.txt` |

### less Navigation
- `Space` : Next page
- `b` : Previous page
- `/word` : Search for "word"
- `n` : Next search result
- `q` : Quit

---

## Text Editing

| Command | Purpose | Key Shortcuts |
|---------|---------|---------------|
| `nano` | Simple text editor | See below |

### Nano Shortcuts
- `Ctrl + O` : Save (WriteOut)
- `Ctrl + X` : Exit
- `Ctrl + K` : Cut line
- `Ctrl + U` : Paste
- `Ctrl + W` : Search
- `Ctrl + \` : Replace
- `Ctrl + G` : Help

---

## File Information

| Command | Purpose | Examples |
|---------|---------|----------|
| `file` | Determine file type | `file document.pdf` |
| `stat` | Detailed file info | `stat file.txt` |
| `du` | Disk usage | `du -h file.txt`, `du -sh folder/` |
| `df` | Disk space free | `df -h` |

---

## Search Commands

| Command | Purpose | Examples |
|---------|---------|----------|
| `find` | Search for files | `find ~ -name "*.txt"` |
| `grep` | Search in files | `grep "word" file.txt` |
| `which` | Find command location | `which python` |
| `locate` | Fast file search | `locate filename` |

### find Examples
```bash
find ~ -name "*.txt"              # Find all .txt files in home
find . -type f                    # Find all files in current dir
find . -type d                    # Find all directories
find ~ -mtime -7                  # Files modified in last 7 days
find ~ -size +1M                  # Files larger than 1 MB
```

### grep Examples
```bash
grep "error" logfile.txt          # Find "error" in file
grep -i "error" logfile.txt       # Case-insensitive
grep -r "TODO" ~/Documents        # Recursive search
grep -v "error" logfile.txt       # Show lines NOT containing "error"
```

---

## System Information

| Command | Purpose | Examples |
|---------|---------|----------|
| `whoami` | Current username | `whoami` |
| `hostname` | Computer name | `hostname` |
| `uname` | System information | `uname -a` |
| `date` | Current date/time | `date` |
| `cal` | Calendar | `cal`, `cal 2025` |
| `uptime` | System uptime | `uptime` |

---

## Process Management

| Command | Purpose | Examples |
|---------|---------|----------|
| `ps` | Show processes | `ps`, `ps aux` |
| `top` | Process monitor | `top` (q to quit) |
| `kill` | Stop process | `kill PID`, `kill -9 PID` |
| `jobs` | Background jobs | `jobs` |
| `bg` | Resume in background | `bg` |
| `fg` | Resume in foreground | `fg` |

---

## Permissions

| Command | Purpose | Examples |
|---------|---------|----------|
| `chmod` | Change permissions | `chmod 755 file.txt`, `chmod +x script.sh` |
| `chown` | Change owner | `sudo chown user file.txt` |

### Permission Numbers
- `7` = read + write + execute (rwx)
- `6` = read + write (rw-)
- `5` = read + execute (r-x)
- `4` = read only (r--)

### Common Patterns
- `644` : Files (rw-r--r--)
- `755` : Executable files and directories (rwxr-xr-x)
- `600` : Private files (rw-------)
- `777` : Everything allowed (not recommended!)

---

## Help Commands

| Command | Purpose | Examples |
|---------|---------|----------|
| `man` | Manual pages | `man ls`, `man cp` |
| `--help` | Quick help | `ls --help`, `cp --help` |
| `info` | Detailed info | `info ls` |
| `whatis` | Brief description | `whatis ls` |
| `apropos` | Search manual | `apropos search_term` |

---

## History and Shortcuts

| Command/Shortcut | Purpose |
|------------------|---------|
| `history` | Show command history |
| `!!` | Repeat last command |
| `!n` | Repeat command number n |
| `!string` | Repeat last command starting with "string" |
| `Ctrl + R` | Search command history |
| `Ctrl + C` | Cancel current command |
| `Ctrl + D` | Exit/logout |
| `Ctrl + L` | Clear screen |
| `Ctrl + A` | Move to beginning of line |
| `Ctrl + E` | Move to end of line |
| `Ctrl + U` | Clear line before cursor |
| `Ctrl + K` | Clear line after cursor |
| `Ctrl + W` | Delete word before cursor |
| `Tab` | Auto-complete |
| `Tab Tab` | Show all options |

---

## Redirection and Pipes

| Operator | Purpose | Examples |
|----------|---------|----------|
| `>` | Redirect output (overwrite) | `echo "text" > file.txt` |
| `>>` | Append output | `echo "more" >> file.txt` |
| `<` | Input from file | `wc -l < file.txt` |
| `|` | Pipe to another command | `ls | grep "txt"` |
| `2>` | Redirect errors | `command 2> errors.txt` |
| `&>` | Redirect all output | `command &> all-output.txt` |

### Pipe Examples
```bash
ls | wc -l                        # Count files
cat file.txt | grep "word"        # Search in file
ps aux | grep python              # Find Python processes
history | tail -20                # Last 20 commands
ls -l | sort -k5 -n              # Sort by file size
```

---

## Wildcards

| Wildcard | Meaning | Examples |
|----------|---------|----------|
| `*` | Any characters | `*.txt`, `file*`, `*backup*` |
| `?` | Single character | `file?.txt`, `test?.py` |
| `[]` | Character range | `[abc]*`, `file[0-9].txt` |
| `{}` | Brace expansion | `file{1,2,3}.txt`, `{jpg,png}` |

### Wildcard Examples
```bash
ls *.txt                          # All .txt files
rm test*.txt                      # All files starting with "test"
cp *.jpg ~/Pictures/              # Copy all JPG files
mv file?.txt backup/              # file1.txt, file2.txt, etc.
touch file{1..10}.txt             # Create file1.txt through file10.txt
```

---

## Network Commands

| Command | Purpose | Examples |
|---------|---------|----------|
| `ping` | Test connectivity | `ping google.com`, `ping -c 4 google.com` |
| `ifconfig` | Network config | `ifconfig` |
| `ip` | IP address info | `ip addr`, `ip route` |
| `wget` | Download file | `wget https://example.com/file.zip` |
| `curl` | Transfer data | `curl https://api.example.com` |
| `ssh` | Secure shell | `ssh user@hostname` |

---

## Compression

| Command | Purpose | Examples |
|---------|---------|----------|
| `tar` | Archive files | `tar -czf archive.tar.gz folder/` |
|  | Extract archive | `tar -xzf archive.tar.gz` |
| `zip` | Create zip | `zip archive.zip file.txt` |
| `unzip` | Extract zip | `unzip archive.zip` |
| `gzip` | Compress file | `gzip file.txt` |
| `gunzip` | Decompress | `gunzip file.txt.gz` |

### tar Options
- `-c` : Create archive
- `-x` : Extract archive
- `-z` : Use gzip compression
- `-f` : File name
- `-v` : Verbose (show progress)

---

## Package Management (Raspberry Pi OS)

| Command | Purpose | Examples |
|---------|---------|----------|
| `sudo apt update` | Update package list | `sudo apt update` |
| `sudo apt upgrade` | Upgrade packages | `sudo apt upgrade` |
| `sudo apt install` | Install package | `sudo apt install package-name` |
| `sudo apt remove` | Remove package | `sudo apt remove package-name` |
| `apt search` | Search packages | `apt search keyword` |

---

## Raspberry Pi Specific

| Command | Purpose | Examples |
|---------|---------|----------|
| `sudo raspi-config` | Configuration tool | `sudo raspi-config` |
| `vcgencmd measure_temp` | Check temperature | `vcgencmd measure_temp` |
| `vcgencmd get_throttled` | Check throttling | `vcgencmd get_throttled` |
| `pinout` | GPIO pin reference | `pinout` |

---

## Special Characters

| Character | Meaning | Usage |
|-----------|---------|-------|
| `/` | Root directory | `/home/pi` |
| `~` | Home directory | `~/Documents` |
| `.` | Current directory | `./script.sh` |
| `..` | Parent directory | `cd ..` |
| `-` | Previous directory | `cd -` |
| `$` | Variable | `$HOME`, `$PATH` |
| `#` | Comment | `# This is a comment` |
| `\` | Escape character | `\ ` (space), `\"` |
| `*` | Wildcard | `*.txt` |
| `?` | Single character wildcard | `file?.txt` |
| `|` | Pipe | `ls | grep txt` |
| `>` | Redirect output | `echo "hi" > file.txt` |
| `>>` | Append output | `echo "more" >> file.txt` |
| `&` | Background process | `command &` |
| `;` | Command separator | `cd ~; ls` |
| `&&` | Run if previous succeeds | `mkdir test && cd test` |
| `||` | Run if previous fails | `cd test || mkdir test` |

---

## Quick Reference: File Paths

### Absolute Paths (from root)
```bash
/home/pi/Documents/file.txt
/usr/bin/python3
/etc/hostname
```

### Relative Paths (from current location)
```bash
Documents/file.txt              # Subfolder
../Desktop/file.txt            # Go up then to Desktop
../../etc/                      # Go up two levels then to etc
```

### Special Path Shortcuts
```bash
~                              # Home directory
~/Documents                    # Documents in home
.                              # Current directory
./script.sh                    # Run script in current dir
..                             # Parent directory
../..                          # Two levels up
-                              # Previous directory
```

---

## Common Command Combinations

### File Management
```bash
mkdir -p project/src && cd project/src    # Create and enter directory
cp *.txt backup/                          # Copy all txt files
find . -name "*.tmp" -delete             # Find and delete temp files
ls -lt | head                            # 10 most recently modified files
```

### Text Processing
```bash
cat file.txt | grep "error" | wc -l      # Count error lines
head -n 100 file.txt | tail -n 50        # Lines 50-100
cat file1.txt file2.txt > combined.txt   # Combine files
```

### System Monitoring
```bash
du -sh * | sort -h                       # Directory sizes, sorted
ps aux | grep python                     # Find Python processes
df -h | grep /dev/root                   # Check root filesystem space
```

---

## Tips for Efficiency

### Use Tab Completion
- Press Tab once to complete
- Press Tab twice to see options
- Works for commands, files, directories

### Use Command History
- Up/Down arrows to browse history
- `Ctrl + R` to search history
- `history | grep keyword` to find commands

### Create Aliases (add to ~/.bashrc)
```bash
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias h='history'
alias update='sudo apt update && sudo apt upgrade'
```

### Use Shortcuts
- `Ctrl + A` : Beginning of line
- `Ctrl + E` : End of line
- `Ctrl + U` : Clear to beginning
- `Ctrl + K` : Clear to end
- `Ctrl + W` : Delete word
- `Ctrl + L` : Clear screen

---

## Print This!

Save this file or print it for quick reference while learning. Keep it handy during Week 2 activities!

---

## Remember

- Read error messages - they usually tell you what's wrong
- Use `--help` or `man` when unsure
- Tab completion prevents typos
- Always check with `ls` before using `rm`
- Practice makes perfect - use these commands daily!
