#!/bin/bash
# Script 4: Log File Analyzer
# Reads a log file line by line, counts occurrences of a keyword,
# and prints a summary. Accepts filename and keyword as arguments.
# Usage: ./log_analyzer.sh /var/log/syslog error

LOGFILE=$1               # First argument: path to the log file
KEYWORD=${2:-"error"}    # Second argument: keyword to search (default: "error")
COUNT=0                  # Counter variable, initialised to zero

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    exit 1
fi

# --- Validate that the file exists and is not empty ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

if [ ! -s "$LOGFILE" ]; then
    echo "Warning: File '$LOGFILE' is empty. Nothing to analyze."
    exit 0
fi

echo "Analyzing: $LOGFILE"
echo "Searching for keyword: '$KEYWORD'"
echo "--------------------------------------"

# --- while-read loop: read file line by line ---
while IFS= read -r LINE; do
    # if-then: check if the line contains the keyword (case-insensitive via -i)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # increment counter
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""
echo "--- Last 5 matching lines ---"
# Use grep with tail to show the last 5 matching lines
grep -i "$KEYWORD" "$LOGFILE" | tail -5