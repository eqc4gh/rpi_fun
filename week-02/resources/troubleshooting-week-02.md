# Week 2 Troubleshooting Guide

Common command-line issues and their solutions.

---

## Command Not Found Errors

### Problem: "command not found"

```bash
$ pwdd
bash: pwdd: command not found
```

**Causes**:
1. Typo in command name
2. Command doesn't exist
3. Command not in PATH
4. Package not installed

**Solutions**:

**Check spelling**:
```bash
# Wrong
pwdd

# Correct
pwd
```

**Use Tab completion** to avoid typos:
```bash
pw[TAB]  # Completes to pwd
```

**Check if command exists**:
```bash
which pwd     # Shows path to command
type pwd      # Shows command type
```

**Install missing command**:
```bash
sudo apt update
sudo apt install [package-name]
```

---

## File and Directory Errors

### Problem: "No such file or directory"

```bash
$ cd Documments
bash: cd: Documments: No such file or directory
```

**Causes**:
1. Typo in name
2. File/directory doesn't exist
3. Wrong location
4. Case sensitivity (Linux is case-sensitive!)

**Solutions**:

**List what's available**:
```bash
ls          # See what's in current directory
ls ~        # See what's in home
```

**Use Tab completion**:
```bash
cd Doc[TAB]  # Autocompletes to Documents
```

**Check exact spelling and case**:
```bash
# Wrong
cd documents

# Correct (capital D)
cd Documents
```

**Use pwd to confirm location**:
```bash
pwd         # Where am I?
```

---

### Problem: "Is a directory"

```bash
$ cat Documents
cat: Documents: Is a directory
```

**Cause**: Trying to use file command on directory

**Solutions**:

**Use ls for directories**:
```bash
ls Documents        # List directory contents
```

**Use cd to enter directories**:
```bash
cd Documents        # Change into directory
```

**To see directory info**:
```bash
ls -ld Documents    # Directory details
```

---

### Problem: "Not a directory"

```bash
$ cd file.txt
bash: cd: file.txt: Not a directory
```

**Cause**: Trying to cd into a file

**Solutions**:

**Check if it's a file**:
```bash
ls -l file.txt      # Shows it's a file, not directory
```

**Open file instead**:
```bash
cat file.txt        # View file
nano file.txt       # Edit file
```

---

## Permission Errors

### Problem: "Permission denied"

```bash
$ rm /etc/somefile
rm: cannot remove '/etc/somefile': Permission denied
```

**Causes**:
1. File owned by another user
2. File in system directory
3. No write permissions
4. Protected file

**Solutions**:

**Use sudo for system files** (be careful!):
```bash
sudo rm /etc/somefile
```

**Check permissions**:
```bash
ls -l filename
```

Output: `-rw-r--r--`
- First character: file type (- = file, d = directory)
- Next 3: owner permissions (read, write, execute)
- Next 3: group permissions
- Last 3: others permissions

**Change permissions**:
```bash
chmod 644 filename    # Read/write for owner, read for others
chmod 755 script.sh   # Make script executable
```

**Work in your home directory** where you have full permissions:
```bash
cd ~                  # Go to home directory
# Work here instead
```

---

### Problem: Cannot execute script

```bash
$ ./myscript.sh
bash: ./myscript.sh: Permission denied
```

**Cause**: Script not marked as executable

**Solution**:

**Make script executable**:
```bash
chmod +x myscript.sh
./myscript.sh         # Now it runs
```

---

## Deletion Problems

### Problem: "cannot remove: Is a directory"

```bash
$ rm folder
rm: cannot remove 'folder': Is a directory
```

**Cause**: Need -r flag for directories

**Solution**:

**Use -r flag**:
```bash
rm -r folder          # Remove directory and contents
```

**Use -i for safety**:
```bash
rm -ri folder         # Asks for confirmation
```

---

### Problem: Accidentally deleted important file

**Cause**: Used rm without thinking

**Reality**: **No undo in Terminal!**

**Prevention**:

**Always check first**:
```bash
ls                    # See what you're deleting
rm -i file.txt        # Ask for confirmation
```

**Use trash instead**:
```bash
# Install trash-cli
sudo apt install trash-cli

# Use trash instead of rm
trash file.txt        # Can recover from ~/.local/share/Trash
```

**Backup important files**:
```bash
cp important.txt important.txt.backup
```

---

## Navigation Issues

### Problem: Can't find my files

**Symptoms**: Lost in the file system

**Solutions**:

**Find current location**:
```bash
pwd                   # Where am I?
```

**Go home**:
```bash
cd ~                  # Go to home directory
cd                    # Also goes home
```

**Search for file**:
```bash
find ~ -name "filename.txt"
```

**List recent files**:
```bash
ls -lt ~              # List by modification time
```

---

### Problem: Too many .. parent directories

```bash
$ cd ../../../../../
# Am I at root? Where am I?
```

**Solution**:

**Use absolute paths**:
```bash
cd ~/Documents        # Go directly to Documents
cd /                  # Go to root
```

**Use - to go back**:
```bash
cd -                  # Return to previous directory
```

---

## Text Editing Issues

### Problem: Stuck in Nano

**Symptoms**: Can't exit nano editor

**Solution**:

**Exit nano**:
```bash
Ctrl + X              # Exit
# If unsaved changes:
#   Y to save
#   N to discard
#   Ctrl+C to cancel
```

---

### Problem: Stuck in less/man

**Symptoms**: Can't get back to command prompt

**Solution**:

**Exit less or man**:
```bash
q                     # Quit
```

---

### Problem: Stuck in vim

**Symptoms**: Accidentally opened vim and can't exit

**Solution**:

**Exit vim (emergency escape!)**:
```bash
:q              # Quit
:q!             # Quit without saving
:wq             # Write and quit
```

**Escape insert mode first**:
```bash
ESC             # Exit insert mode
:q              # Then quit
```

**Prefer nano for beginners**:
```bash
nano filename   # Use nano instead of vim
```

---

## Copy/Move Issues

### Problem: Overwrite without warning

```bash
$ cp file.txt backup.txt
# backup.txt already existed and got replaced!
```

**Prevention**:

**Use -i flag**:
```bash
cp -i file.txt backup.txt    # Asks before overwriting
mv -i old.txt new.txt        # Asks before overwriting
```

**Use -n flag**:
```bash
cp -n file.txt backup.txt    # Never overwrite
```

**Check if file exists first**:
```bash
ls backup.txt           # See if it exists
# If it exists, choose different name
```

---

### Problem: Copied directory but empty

```bash
$ cp folder folder-copy
cp: omitting directory 'folder'
```

**Cause**: Forgot -r flag

**Solution**:

**Use -r for directories**:
```bash
cp -r folder folder-copy     # Recursive copy
```

---

## Output Issues

### Problem: Output fills entire screen

```bash
$ cat large-file.txt
# Screen fills with text!
```

**Solutions**:

**Use less instead**:
```bash
less large-file.txt      # Scroll with Space/b, quit with q
```

**View only part**:
```bash
head large-file.txt      # First 10 lines
tail large-file.txt      # Last 10 lines
head -n 50 large-file.txt   # First 50 lines
```

**Clear screen**:
```bash
clear                    # Clear terminal
# or Ctrl+L
```

---

### Problem: Command output too fast to read

**Solution**:

**Pipe to less**:
```bash
ls -la /usr/bin | less   # Browse output
```

**Save to file**:
```bash
ls -la > output.txt      # Save output
less output.txt          # Read at your pace
```

---

## Typing and Input Issues

### Problem: Terminal not responding

**Symptoms**: Typing but nothing happens

**Possible Causes**:

**Frozen command**:
```bash
Ctrl + C                 # Cancel current command
```

**Background process paused**:
```bash
Ctrl + Z                 # Pauses process
fg                       # Resume in foreground
```

**Accidentally locked terminal**:
```bash
Ctrl + S                 # Locks scrolling (accident!)
Ctrl + Q                 # Unlocks (press this!)
```

---

### Problem: Can't see password when typing

**Symptoms**: Using sudo but nothing appears

**This is normal!**

```bash
$ sudo apt update
[sudo] password for pi:  [you type here but see nothing]
```

**Why**: Security feature - prevents shoulder surfing

**Solution**: Just type password and press Enter, even though you don't see it

---

## Path and Variable Issues

### Problem: ~ doesn't work

```bash
$ cd "~/Documents"
bash: cd: ~/Documents: No such file or directory
```

**Cause**: Quotes prevent ~ expansion

**Solution**:

**Don't quote paths with ~**:
```bash
cd ~/Documents        # Correct
cd "Documents"        # If in home, this works
cd "$HOME/Documents"  # Also correct
```

---

### Problem: Space in filename causes issues

```bash
$ cd my folder
bash: cd: my: No such file or directory
```

**Cause**: Space interpreted as two arguments

**Solutions**:

**Use quotes**:
```bash
cd "my folder"
```

**Escape space**:
```bash
cd my\ folder
```

**Use Tab completion** (auto-escapes):
```bash
cd my[TAB]            # Completes to: cd my\ folder
```

**Best practice**: Avoid spaces in filenames!
```bash
# Good names:
my_folder
my-folder
myFolder

# Avoid:
my folder
```

---

## Command History Issues

### Problem: Want to repeat command but forgot it

**Solutions**:

**View history**:
```bash
history              # See all commands
history | tail -20   # Last 20 commands
```

**Search history**:
```bash
Ctrl + R             # Reverse search
# Start typing command
# Press Ctrl+R again for older matches
```

**Repeat last command**:
```bash
!!                   # Run last command
sudo !!              # Run last command with sudo
```

**Repeat specific command**:
```bash
history              # Find command number
!523                 # Run command #523
```

---

## Wildcard Issues

### Problem: Wildcard deleted wrong files

```bash
$ rm *.txt
# Deleted more than intended!
```

**Prevention**:

**Always check first**:
```bash
ls *.txt             # See what matches
rm *.txt             # Then delete
```

**Use -i flag**:
```bash
rm -i *.txt          # Confirm each file
```

**Be specific**:
```bash
rm test*.txt         # Only files starting with "test"
rm *-backup.txt      # Only files ending with "-backup"
```

---

## Script Issues

### Problem: Script runs different in terminal

```bash
# Script works when typing commands
# Doesn't work when run as script
```

**Solutions**:

**Add shebang line**:
```bash
#!/bin/bash
# Rest of script
```

**Check line endings** (if edited on Windows):
```bash
dos2unix script.sh   # Convert Windows to Unix format
```

**Make executable**:
```bash
chmod +x script.sh
```

**Run with bash explicitly**:
```bash
bash script.sh       # Force bash interpreter
```

---

## Tab Completion Not Working

### Problem: Tab doesn't complete

**Causes**:
1. Ambiguous - multiple matches
2. No matches
3. Bash completion not installed

**Solutions**:

**Press Tab twice** to see options:
```bash
cd Do[TAB][TAB]      # Shows Documents, Downloads, etc.
```

**Type more characters**:
```bash
cd Doc[TAB]          # Completes to Documents
```

**Install bash-completion**:
```bash
sudo apt install bash-completion
```

---

## Getting More Help

### When Stuck:

1. **Read error message carefully**
   - Often tells you exactly what's wrong

2. **Check command syntax**:
   ```bash
   man command          # Full manual
   command --help       # Quick help
   ```

3. **Search online**:
   - Copy exact error message
   - Add "raspberry pi" or "linux"
   - Check Stack Overflow

4. **Ask for help**:
   - Describe what you tried
   - Show exact command used
   - Copy exact error message

---

## Prevention Tips

### Best Practices:

1. **Always check before deleting**
   ```bash
   ls files*           # Check what matches
   rm files*           # Then delete
   ```

2. **Use -i flag when learning**
   ```bash
   rm -i               # Interactive mode
   ```

3. **Work in home directory**
   - Avoid system directories (/etc, /bin, etc.)
   - Stay in ~/ where you have permissions

4. **Use Tab completion**
   - Prevents typos
   - Shows available options

5. **Check with ls first**
   - See before you act

6. **Read error messages**
   - They usually tell you the problem

7. **Test in scratch directory**
   ```bash
   mkdir ~/test
   cd ~/test
   # Experiment here
   ```

8. **Keep backups**
   ```bash
   cp important.txt important.txt.backup
   ```

---

## Emergency Commands

### If Things Go Wrong:

**Cancel current command**:
```bash
Ctrl + C
```

**Clear screen**:
```bash
clear
# or Ctrl + L
```

**Go back home**:
```bash
cd ~
```

**See where you are**:
```bash
pwd
```

**List files to orient yourself**:
```bash
ls
```

**Get back to familiar ground**:
```bash
cd ~/Desktop
```

---

## Common Error Messages Decoded

| Error | Meaning | Solution |
|-------|---------|----------|
| `command not found` | Typo or command doesn't exist | Check spelling, use Tab |
| `Permission denied` | No permission for that action | Use sudo or work in ~/ |
| `No such file or directory` | Path wrong or file doesn't exist | Check with ls, use Tab |
| `Is a directory` | Using file command on directory | Use appropriate directory command |
| `Not a directory` | Using directory command on file | Use appropriate file command |
| `File exists` | Trying to create existing file | Choose different name or remove old one |
| `Cannot remove directory` | Directory not empty or need -r | Use rm -r |
| `Read-only file system` | Trying to write to read-only location | Mount with write permission or work elsewhere |

---

## Quick Recovery Checklist

When something goes wrong:

- [ ] Don't panic!
- [ ] Read the error message
- [ ] Check with `pwd` - where am I?
- [ ] Check with `ls` - what's here?
- [ ] Try going home: `cd ~`
- [ ] Clear screen if messy: `clear`
- [ ] Check command history: `history | tail`
- [ ] Try command help: `command --help`
- [ ] Google the exact error message
- [ ] Ask instructor or classmate

**Remember**: Almost everything is fixable! The Terminal is forgiving when you're learning.
