#!/bin/bash
# Script 2: FOSS Package Inspector
# Checks if Python is installed, shows version and license info,
# then prints a philosophy note about the package using a case statement.

PACKAGE="python3"   # The package we are auditing

# --- Check if the package is installed using dpkg (Debian/Ubuntu) ---
if dpkg -l "$PACKAGE" &>/dev/null; then
    echo "$PACKAGE is installed on this system."
    echo ""
    echo "--- Package Details ---"
    # Use dpkg -s and grep to extract key fields
    dpkg -s "$PACKAGE" | grep -E 'Version|Maintainer|Homepage'
else
    echo "$PACKAGE is NOT installed."
    echo "Install it with: sudo apt install python3"
    exit 1
fi

echo ""
echo "--- Open Source Philosophy Note ---"

# --- Case statement: print a philosophy note based on the package name ---
case $PACKAGE in
    python3)
        echo "Python: born from a desire to make programming readable and free."
        echo "Guido van Rossum chose openness so the community could make it better." ;;
    python3-pip)
        echo "pip: the package manager that makes Python's ecosystem universally accessible." ;;
    httpd|apache2)
        echo "Apache: the web server that built the open internet." ;;
    mysql|mariadb)
        echo "MySQL/MariaDB: open source at the heart of millions of applications." ;;
    *)
        echo "$PACKAGE: an open-source tool — study its license to understand your freedoms." ;;
esac