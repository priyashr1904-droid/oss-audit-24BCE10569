#!/bin/bash
# Script 3: Disk and Permission Auditor
# Loops through important system directories and reports
# permissions, owner, and disk usage using a for loop.

# Array of directories to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================"
echo "  Directory Audit Report"
echo "========================================"

# --- for loop: iterate over each directory ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # awk extracts permissions, owner user, and owner group from ls output
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # du reports disk usage; 2>/dev/null suppresses permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system."
    fi
done

echo "========================================"
echo "  Python-specific Directory Check"
echo "========================================"

# --- Check Python's standard library and config directories ---
PYTHON_DIRS=("/usr/lib/python3" "/usr/lib/python3/dist-packages" "/etc/python3")

for PDIR in "${PYTHON_DIRS[@]}"; do
    # Find the actual versioned directory if base path doesn't exist
    ACTUAL=$(ls -d ${PDIR}* 2>/dev/null | head -1)
    if [ -d "$ACTUAL" ]; then
        PERMS=$(ls -ld "$ACTUAL" | awk '{print $1, $3, $4}')
        echo "$ACTUAL => Permissions: $PERMS"
    else
        echo "$PDIR — not found (may be version-suffixed, e.g. /usr/lib/python3.11)"
    fi
done