#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Asks the user three questions interactively, then generates a
# personalised open source philosophy statement and saves it to a file.
# Demonstrates: read, string concatenation, file redirection, date command.

# Note: An alias like 'alias today="date +%d-%B-%Y"' could be used here,
# but aliases don't persist in non-interactive scripts — so we use date directly.

echo "============================================"
echo "   Open Source Manifesto Generator"
echo "   Powered by Python + Linux + Freedom"
echo "============================================"
echo ""

# --- Gather user input using read ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Get current date for the manifesto header ---
DATE=$(date '+%d %B %Y')

# --- Construct the output filename using the current username ---
OUTPUT="manifesto_$(whoami).txt"

# --- Write manifesto to file using > (overwrite) and >> (append) ---
echo "Open Source Manifesto — $DATE" > "$OUTPUT"
echo "======================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- String concatenation to form a paragraph ---
MANIFESTO="I believe in the power of open source because every day I use $TOOL"
MANIFESTO="$MANIFESTO — a tool built by people who chose to share rather than sell."
MANIFESTO="$MANIFESTO To me, freedom means $FREEDOM, and that is exactly what an open license gives:"
MANIFESTO="$MANIFESTO the freedom to read, modify, and redistribute software without asking permission."
MANIFESTO="$MANIFESTO One day I will build $BUILD and release it freely,"
MANIFESTO="$MANIFESTO because the greatest gift a developer can give is a tool that others can build upon."

echo "$MANIFESTO" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Signed: $(whoami) | $DATE" >> "$OUTPUT"

echo ""
echo "Manifesto saved to: $OUTPUT"
echo "--------------------------------------"
# --- Display the saved file ---
cat "$OUTPUT"