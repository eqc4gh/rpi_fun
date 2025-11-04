#!/bin/bash
# File Operations Demo
# Demonstrates creating, copying, moving, and deleting files

echo "=== File Operations Demo ==="
echo ""

# Setup
DEMO_DIR=~/demo-files
echo "Creating demo directory: $DEMO_DIR"
mkdir -p $DEMO_DIR
cd $DEMO_DIR

echo "1. Creating files..."
touch file1.txt file2.txt file3.txt
echo "Created: file1.txt, file2.txt, file3.txt"
ls
echo ""

echo "2. Adding content to a file..."
echo "This is file 1" > file1.txt
echo "Content added to file1.txt"
cat file1.txt
echo ""

echo "3. Copying a file..."
cp file1.txt file1-copy.txt
echo "Created copy: file1-copy.txt"
ls
echo ""

echo "4. Moving (renaming) a file..."
mv file2.txt renamed-file.txt
echo "Renamed file2.txt to renamed-file.txt"
ls
echo ""

echo "5. Creating a directory..."
mkdir subfolder
echo "Created: subfolder"
ls
echo ""

echo "6. Moving a file to the directory..."
mv file3.txt subfolder/
echo "Moved file3.txt into subfolder"
ls
echo "Contents of subfolder:"
ls subfolder/
echo ""

echo "7. Copying a directory..."
cp -r subfolder subfolder-copy
echo "Created copy of directory"
ls
echo ""

echo "8. Viewing directory tree..."
ls -R
echo ""

echo "Demo complete!"
echo ""
echo "To clean up, run: rm -rf $DEMO_DIR"
