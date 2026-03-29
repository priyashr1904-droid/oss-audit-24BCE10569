#!/bin/bash
# Script 1: System Identity Report
# Author: Priya Sharma | Reg: 24BCE10569
# Course: Open Source Software | Chosen Software: Python

# --- Variables ---
STUDENT_NAME="Priya Sharma"
SOFTWARE_CHOICE="Python"
LICENSE="PSF License (Python Software Foundation)"

# --- Gather system info via command substitution ---
KERNEL=$(uname -r)            # kernel version
DISTRO=$(lsb_release -ds 2>/dev/null || cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
USER_NAME=$(whoami)           # current logged-in user
HOME_DIR=$HOME                # home directory of current user
UPTIME=$(uptime -p)           # human-readable uptime
DATETIME=$(date '+%d %B %Y, %H:%M:%S')   # formatted date and time

# --- Display formatted system identity report ---
echo "=============================================="
echo "   Open Source Audit — $STUDENT_NAME"
echo "   Chosen Software : $SOFTWARE_CHOICE"
echo "=============================================="
echo "Distribution : $DISTRO"
echo "Kernel       : $KERNEL"
echo "User         : $USER_NAME"
echo "Home Dir     : $HOME_DIR"
echo "Uptime       : $UPTIME"
echo "Date/Time    : $DATETIME"
echo "----------------------------------------------"
echo "This system runs Linux, licensed under GPL v2."
echo "Your chosen software ($SOFTWARE_CHOICE) is"
echo "licensed under the $LICENSE."
echo "=============================================="