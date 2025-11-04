#!/bin/bash
# File System Explorer Demo
# Shows different ways to navigate and view the file system

echo "=== File System Explorer Demo ==="
echo ""

echo "1. Current Location:"
pwd
echo ""

echo "2. What's in this directory?"
ls
echo ""

echo "3. Detailed listing:"
ls -lh
echo ""

echo "4. Including hidden files:"
ls -lah
echo ""

echo "5. Home directory contents:"
ls ~
echo ""

echo "6. System directories:"
ls /
echo ""

echo "7. Your user info:"
echo "Username: $(whoami)"
echo "Home directory: $HOME"
echo "Current shell: $SHELL"
echo ""

echo "Demo complete!"
