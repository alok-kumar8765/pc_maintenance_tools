# Ultimate PC Maintenance & Repair Tool

A lightweight, interactive Windows Batch utility designed to automate common PC maintenance, cleanup, and system file repair tasks.

---

## 📌 Overview

This tool provides a command-line interface (CLI) menu allowing users to easily run core Windows maintenance routines without having to remember individual system commands.

### Key Features

* **Privilege Check**: Automatically verifies if the script is running with **Administrator privileges** and prompts the user if elevated permissions are missing.
* **Flush DNS Cache**: Resolves network connectivity issues by clearing the resolver cache using `ipconfig /flushdns`.
* **System File Checker (`sfc /scannow`)**: Scans for corrupted or missing Windows system files and repairs them.
* **DISM Image Repair**: Scans and restores system image health using `DISM /Online /Cleanup-Image /RestoreHealth` (requires an active internet connection).
* **Temp File Cleanup**: Deletes temporary files from `%temp%` and `C:\Windows\Temp` to reclaim storage space.
* **Disk Cleanup Wizard**: Opens the built-in Windows Disk Cleanup tool (`cleanmgr`).
* **Automated Run All Option**: Sequentially runs tasks 1 through 4 in one click.

---

## 🛠️ System Requirements

* **Operating System**: Windows 7 / 8 / 10 / 11 / Windows Server
* **Permissions**: Administrator rights (required for SFC, DISM, and temp file removal).
* **Internet Connection**: Recommended for DISM image repair tasks.

---

## 🚀 How to Run

1. Download or create the batch script (e.g., `maintenance.bat`).
2. **Right-click** on the `.bat` file.
3. Select **"Run as administrator"**.
4. Follow the on-screen menu prompts by entering a choice from `1` to `7`.

---

## 📄 Options Breakdown

| Menu Option | Function | System Command Used |
| :--- | :--- | :--- |
| **[1] Flush DNS Cache** | Clears cached domain name lookups. | `ipconfig /flushdns` |
| **[2] Run SFC Scan** | Verifies and repairs system file integrity. | `sfc /scannow` |
| **[3] Run DISM Image Repair** | Repairs corrupted Windows component stores. | `DISM /Online /Cleanup-Image /RestoreHealth` |
| **[4] Clear Temporary Files** | Force-deletes temporary files for current user and system temp folders. | `del /s /f /q %temp%\*` & `C:\Windows\Temp\*` |
| **[5] Open Disk Cleanup** | Launches the official Windows Disk Cleanup UI. | `cleanmgr` |
| **[6] Run All Tasks** | Executes Options 1, 2, 3, and 4 automatically. | *Sequential Execution* |
| **[7] Exit** | Closes the tool. | `exit` |

---

## 🔍 Script Variants & Technical Differences

Both provided scripts perform the exact same maintenance functions. The key difference lies in character escaping in batch syntax:

* **Script 1**: Uses raw text in `echo` statements: `PC MAINTENANCE & REPAIR TOOL`.
* **Script 2**: Escapes the ampersand character using a caret (`^`): `PC MAINTENANCE ^& REPAIR TOOL`.

> **Note**: Escaping special characters like `&` with `^&` prevents potential parser issues in certain Windows Batch environments, making **Script 2** slightly more compliant with legacy Command Prompt parsing rules.

---

## ⚠️ Disclaimer

* Cleaning system temp files while applications are actively running may fail for locked files (these errors are suppressed via `2>nul`).
* DISM and SFC operations may take several minutes to complete depending on system performance and corruption level. Do not close the window while these tools are running.