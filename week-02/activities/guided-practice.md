# Week 2 Guided Practice: Mastering the Command Line

## Duration: 30-40 minutes

---

## Setup (2 minutes)

### Opening Terminal

1. Click the **Terminal icon** in the menu bar (black square icon)
   - OR press `Ctrl + Alt + T`
2. Terminal window opens with a prompt
3. Maximize the window for better visibility

### Understanding Your Prompt

Look at your prompt:
```bash
pi@raspberrypi:~ $
```

- **pi** = your username
- **raspberrypi** = computer name
- **~** = you're in your home directory
- **$** = ready for commands

---

## Exercise 1: Basic Navigation (8 minutes)

### Step 1: Where Am I?

Type this command and press Enter:
```bash
pwd
```

**Expected output**: `/home/pi`

**What it means**: "Print Working Directory" - shows your current location

### Step 2: What's Here?

```bash
ls
```

**You should see**:
- Desktop
- Documents
- Downloads
- Pictures
- Videos
- (and possibly more)

### Step 3: Detailed List

```bash
ls -l
```

**New information shown**:
- Permissions (like `drwxr-xr-x`)
- Owner
- Size
- Date modified
- Name

### Step 4: Show Hidden Files

```bash
ls -a
```

**Notice**: Files starting with `.` appear (these are hidden)
- `.bashrc` - configuration file
- `.profile` - login settings
- `.` - current directory
- `..` - parent directory

### Step 5: Combine Options

```bash
ls -lah
```

**This combines**:
- `-l` = long format
- `-a` = all files (including hidden)
- `-h` = human-readable sizes (KB, MB instead of bytes)

**Challenge**: What do the file sizes look like now compared to `ls -l`?

---

## Exercise 2: Moving Around (8 minutes)

### Step 1: Go to Documents

```bash
cd Documents
```

**Check where you are**:
```bash
pwd
```

Output: `/home/pi/Documents`

**Notice**: Your prompt changed to show `~/Documents`

### Step 2: List What's in Documents

```bash
ls
```

**Practice**: If there are folders, use Tab completion:
```bash
cd [Press TAB to see options]
```

### Step 3: Go Up One Level

```bash
cd ..
```

**Check location**:
```bash
pwd
```

Output: `/home/pi` (back to home)

### Step 4: Go Directly to Desktop

```bash
cd ~/Desktop
```

**Confirm**:
```bash
pwd
```

### Step 5: Jump to Root

```bash
cd /
```

**Look around**:
```bash
ls
```

You'll see system directories: `bin`, `boot`, `etc`, `home`, etc.

### Step 6: Return Home (3 ways)

Try each:
```bash
cd ~
# OR
cd
# OR
cd /home/pi
```

All three take you home!

### Quick Navigation Challenge

Starting from home (`~`), complete this sequence:

1. Go to Documents: `cd Documents`
2. Go back to home: `cd ~`
3. Go to Desktop: `cd Desktop`
4. Go up to home: `cd ..`
5. Go to root: `cd /`
6. Go back home: `cd`

**Tip**: Use `pwd` after each command to confirm your location!

---

## Exercise 3: Creating Files and Folders (8 minutes)

### Step 1: Go to Documents

```bash
cd ~/Documents
```

### Step 2: Create a Folder

```bash
mkdir linux-practice
```

**Verify it was created**:
```bash
ls
```

You should see `linux-practice` in the list!

### Step 3: Create Multiple Folders

```bash
mkdir folder1 folder2 folder3
```

**Check**:
```bash
ls
```

Three new folders appear!

### Step 4: Create Nested Folders

```bash
mkdir -p projects/week1/files
```

**Verify the structure**:
```bash
ls -R projects
```

The `-R` flag shows **recursive** (everything inside)

### Step 5: Enter Your Practice Folder

```bash
cd linux-practice
```

### Step 6: Create Empty Files

```bash
touch notes.txt
```

**Check it exists**:
```bash
ls -l
```

### Step 7: Create Multiple Files

```bash
touch file1.txt file2.txt file3.txt
```

**Verify**:
```bash
ls
```

---

## Exercise 4: Copying and Moving (6 minutes)

### Step 1: Copy a File

```bash
cp notes.txt notes-backup.txt
```

**Verify**:
```bash
ls
```

You should see both `notes.txt` and `notes-backup.txt`

### Step 2: Copy to Another Location

```bash
cp notes.txt ~/Desktop/
```

**Check Desktop**:
```bash
ls ~/Desktop/
```

The file is now on your Desktop!

### Step 3: Move (Rename) a File

```bash
mv file1.txt renamed-file.txt
```

**Check**:
```bash
ls
```

`file1.txt` is gone, `renamed-file.txt` exists

### Step 4: Move File to Different Location

```bash
mv file2.txt ../folder1/
```

**Verify it moved**:
```bash
ls
ls ../folder1/
```

### Step 5: Copy a Directory

```bash
cd ~/Documents
cp -r linux-practice linux-practice-backup
```

**The `-r` flag**: Required for directories (means "recursive" - copy everything inside)

**Check**:
```bash
ls
```

---

## Exercise 5: Viewing File Contents (5 minutes)

### Step 1: Create a File with Content

```bash
cd ~/Documents/linux-practice
echo "This is my first Terminal file!" > test.txt
```

**The `>` symbol**: Redirects output to a file

### Step 2: View the File

```bash
cat test.txt
```

Output: `This is my first Terminal file!`

### Step 3: Add More Content

```bash
echo "This is line 2" >> test.txt
echo "This is line 3" >> test.txt
echo "This is line 4" >> test.txt
```

**The `>>` symbol**: Appends to file (doesn't replace)

### Step 4: View Entire File

```bash
cat test.txt
```

All four lines appear!

### Step 5: View First Lines

```bash
head -n 2 test.txt
```

Shows only first 2 lines

### Step 6: View Last Lines

```bash
tail -n 2 test.txt
```

Shows only last 2 lines

### Step 7: Create a Long File

```bash
for i in {1..50}; do echo "This is line $i" >> longfile.txt; done
```

Don't worry about understanding this yet - it creates 50 lines!

### Step 8: View with less

```bash
less longfile.txt
```

**Controls**:
- `Space` = next page
- `b` = previous page
- `q` = quit

---

## Exercise 6: Text Editing with Nano (5 minutes)

### Step 1: Open Nano

```bash
nano myfile.txt
```

A text editor opens!

### Step 2: Type Some Text

Type whatever you want:
```
Hello from the Terminal!
This is my practice file.
I am learning Linux commands.
```

### Step 3: Save the File

1. Press `Ctrl + O` (WriteOut)
2. You'll see: `File Name to Write: myfile.txt`
3. Press `Enter` to confirm

**Bottom of screen shows**: `[ Wrote 3 lines ]`

### Step 4: Exit Nano

Press `Ctrl + X`

### Step 5: Verify the File

```bash
cat myfile.txt
```

Your text appears!

### Step 6: Edit Existing File

```bash
nano myfile.txt
```

**Practice**:
1. Add a new line at the bottom
2. Save with `Ctrl + O`, press Enter
3. Exit with `Ctrl + X`

### Step 7: Confirm Changes

```bash
cat myfile.txt
```

Your new line is there!

---

## Exercise 7: Safe Deletion Practice (3 minutes)

### Step 1: Create Test Files

```bash
cd ~/Documents/linux-practice
touch delete-me-1.txt delete-me-2.txt delete-me-3.txt
```

**Verify**:
```bash
ls
```

### Step 2: Delete with Confirmation

```bash
rm -i delete-me-1.txt
```

**Prompt appears**: `remove delete-me-1.txt?`

Type `y` and press Enter

### Step 3: Delete Multiple Files

```bash
rm delete-me-2.txt delete-me-3.txt
```

**Check they're gone**:
```bash
ls
```

### Step 4: Create and Delete a Directory

```bash
mkdir temp-folder
touch temp-folder/file.txt
```

**Try to delete**:
```bash
rm temp-folder
```

**ERROR**: `rm: cannot remove 'temp-folder': Is a directory`

**Correct way**:
```bash
rm -r temp-folder
```

The `-r` flag means "recursive" - delete directory and everything inside

---

## Challenge Exercises (Optional - If Time Permits)

### Challenge 1: File System Scavenger Hunt

Use commands to find these answers:

1. How many files are in your home directory (including hidden)?
   ```bash
   ls -a ~ | wc -l
   ```

2. What's the full path to your Desktop?
   ```bash
   cd ~/Desktop && pwd
   ```

3. How many files are on your Desktop?
   ```bash
   ls ~/Desktop | wc -l
   ```

### Challenge 2: Create This Structure

Create this folder structure using only Terminal:

```
~/Documents/
└── my-project/
    ├── code/
    │   ├── main.py
    │   └── helper.py
    ├── data/
    │   └── input.txt
    └── docs/
        └── readme.txt
```

**Solution**:
```bash
cd ~/Documents
mkdir -p my-project/code my-project/data my-project/docs
touch my-project/code/main.py
touch my-project/code/helper.py
touch my-project/data/input.txt
touch my-project/docs/readme.txt
```

**Verify**:
```bash
ls -R my-project
```

### Challenge 3: Command Combination

Create a file, add content, copy it, move the copy, and verify:

```bash
cd ~/Documents
echo "Practice makes perfect" > practice.txt
cp practice.txt practice-copy.txt
mkdir practice-folder
mv practice-copy.txt practice-folder/
ls practice-folder/
cat practice-folder/practice-copy.txt
```

---

## Common Mistakes and Fixes

### Mistake 1: "Command not found"

**Problem**: Typo in command name

```bash
$ pwdd
bash: pwdd: command not found
```

**Fix**: Check spelling, use Tab completion

### Mistake 2: "No such file or directory"

**Problem**: File/folder doesn't exist or typo

```bash
$ cd Documments
bash: cd: Documments: No such file or directory
```

**Fix**: Use `ls` to see what's available, use Tab completion

### Mistake 3: Deleted wrong file

**Problem**: Used `rm` without checking

**Prevention**:
- Always `ls` first
- Use `rm -i` for confirmation
- Be extra careful with `rm -r`

### Mistake 4: "Permission denied"

**Problem**: Trying to access/modify restricted files

```bash
$ rm /etc/somefile
rm: cannot remove '/etc/somefile': Permission denied
```

**Fix**: Use `sudo` (but be careful!) or work in your home directory

---

## Checkpoint: Can You Do These?

Before moving on, make sure you can:

- [ ] Open Terminal
- [ ] Use `pwd` to see where you are
- [ ] Use `ls` to see files
- [ ] Use `cd` to move between directories
- [ ] Create a folder with `mkdir`
- [ ] Create a file with `touch`
- [ ] Copy a file with `cp`
- [ ] Move/rename with `mv`
- [ ] Delete a file with `rm`
- [ ] View file contents with `cat`
- [ ] Edit a file with `nano`
- [ ] Use Tab completion
- [ ] Navigate to home directory

If you can do all of these, you're ready for independent exploration!

---

## Quick Command Reference

Keep this handy:

```bash
# NAVIGATION
pwd                     # Where am I?
ls                      # What's here?
cd [directory]          # Go somewhere
cd ..                   # Go up
cd ~                    # Go home

# CREATE
mkdir [name]            # Make folder
touch [name]            # Make file
mkdir -p path/to/dir    # Make nested folders

# COPY/MOVE/DELETE
cp [from] [to]          # Copy file
cp -r [from] [to]       # Copy folder
mv [from] [to]          # Move/rename
rm [file]               # Delete file
rm -r [folder]          # Delete folder
rm -i [file]            # Delete with confirmation

# VIEW
cat [file]              # Show file
less [file]             # Browse file
head [file]             # First 10 lines
tail [file]             # Last 10 lines

# EDIT
nano [file]             # Edit file
  Ctrl+O = Save
  Ctrl+X = Exit

# HELP
man [command]           # Manual
[command] --help        # Quick help
```

---

## Next Steps

You're now ready for:
1. Independent exploration challenges
2. Creating your own file structures
3. Writing simple shell scripts (later this week)
4. Week 3: Python programming in the Terminal!

**Great job mastering the basics!** 🎉
