# 🚀 Ultimate Windows Space Cleaner & Optimizer

A smart, safe, and fully automated Batch Script designed to clean up Windows 10/11 with a single click. It frees up gigabytes of disk space and optimizes drive performance (SSD/HDD) using built-in system tools without needing any third-party software.

## ✨ Features & Functions

The tool executes a sequence of advanced and safe system optimization commands:
* **Disable Hibernation:** Turns off hibernation to instantly delete the `hiberfil.sys` file, freeing up GBs of space equal to your RAM size.
* **Storage Sense Activation:** Programmatically enables the Windows Storage Sense feature via the Registry for automatic future cleanups.
* **Silent Disk Cleanup:** Runs the native Windows Disk Cleanup utility (`cleanmgr`) in advanced silent mode to wipe system junk.
* **Windows Update Cache Flush:** Safely stops update services to completely clear out accumulated Windows Update download cache.
* **Force Temp & Prefetch Cleaner:** Performs a force-delete on `TEMP`, `%TEMP%`, and `Prefetch` directories, briefly restarting explorer to release locked files.
* **Network & Font Cache Clear:** Flushes the DNS cache to improve internet responsiveness and clears system font caches.
* **Drive Optimization (TRIM):** Triggers the native `defrag` command to run a TRIM operation on SSDs and optimization on HDDs for maximum speed.

---

## ⚙️ How to Use

The script is programmed to automatically request Administrator privileges upon launching. Just follow these steps:

1. Download the `SuperCleaner.bat` file.
2. Simply double-click the file to run it.
3. When the User Account Control (UAC) prompt appears, click **Yes**.
4. A welcoming pop-up window will appear; click **OK** to begin.
5. Wait for the tool to finish all operations (the drive optimization phase might take a minute or two).
6. A final completion pop-up window will notify you once everything is successfully cleared!

---

## 🔒 Safety & Disclaimer

* This tool relies **100% on official, built-in Windows commands and native binaries**. It does not delete any personal user data.
* All commands are thoroughly tested and safe to use on both Windows 10 and Windows 11 systems.
