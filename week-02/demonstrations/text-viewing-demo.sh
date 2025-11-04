#!/bin/bash
# Text Viewing Demo
# Shows different ways to view file contents

echo "=== Text Viewing Demo ==="
echo ""

# Create demo file
DEMO_FILE=~/demo-text.txt
echo "Creating demo file with 50 lines..."

for i in {1..50}; do
    echo "This is line number $i" >> $DEMO_FILE
done

echo "File created: $DEMO_FILE"
echo ""

echo "1. Viewing entire file with cat:"
echo "Command: cat $DEMO_FILE"
echo "(Scrolls by quickly!)"
sleep 2
echo ""

echo "2. Viewing first 10 lines with head:"
head $DEMO_FILE
echo ""

echo "3. Viewing first 5 lines:"
head -n 5 $DEMO_FILE
echo ""

echo "4. Viewing last 10 lines with tail:"
tail $DEMO_FILE
echo ""

echo "5. Viewing last 3 lines:"
tail -n 3 $DEMO_FILE
echo ""

echo "6. Counting lines, words, characters:"
echo "wc command output:"
wc $DEMO_FILE
echo "Format: lines words characters filename"
echo ""

echo "7. Searching for specific content:"
echo "Lines containing 'line number 5':"
grep "line number 5" $DEMO_FILE
echo ""

echo "8. To view with scrolling, use: less $DEMO_FILE"
echo "   (Press 'q' to quit less)"
echo ""

echo "Demo complete!"
echo "Demo file located at: $DEMO_FILE"
