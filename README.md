# OSS Audit — Python
**Student Name:** [Your Name]  
**Roll Number:** [Your Roll Number]  
**Course:** Open Source Software  
**Chosen Software:** Python (PSF License)

---

## About this project
This repository contains the five shell scripts submitted as part of
The Open Source Audit capstone project. The audit examines Python —
its origin, license, Linux footprint, ecosystem, and comparison
with proprietary alternatives.

---

## Scripts

| Script | File | Purpose |
|--------|------|---------|
| 1 | `script1_system_identity.sh` | Displays Linux system info and OSS context |
| 2 | `script2_package_inspector.sh` | Checks if Python is installed and prints philosophy note |
| 3 | `script3_disk_auditor.sh` | Audits key directories and Python install paths |
| 4 | `script4_log_analyzer.sh` | Counts keyword occurrences in a log file |
| 5 | `script5_manifesto.sh` | Generates a personalised open source manifesto |

---

## How to run

### Requirements
- Linux system (Ubuntu/Debian recommended) or WSL
- Bash (pre-installed on all Linux systems)
- Python 3 installed: `sudo apt install python3`

### Steps
```bash
# Clone the repo
git clone https://github.com/yourusername/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]

# Make all scripts executable
chmod +x *.sh

# Run Script 1
./script1_system_identity.sh

# Run Script 2
./script2_package_inspector.sh

# Run Script 3
./script3_disk_auditor.sh

# Run Script 4 (needs a log file path and optional keyword)
./script4_log_analyzer.sh /var/log/syslog python

# Run Script 5 (interactive)
./script5_manifesto.sh
```

---

## Dependencies
- `lsb_release` — for distro name (install with `sudo apt install lsb-release`)
- `dpkg` — pre-installed on Debian/Ubuntu systems
- All other commands (`awk`, `grep`, `du`, `df`, `date`) are standard Linux utilities