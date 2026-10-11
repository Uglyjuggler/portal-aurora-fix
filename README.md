# Portal Aurora Store Fix (Windows)

One-click fix that grants Aurora Store the permission it needs to install apps on your Meta Portal. No commands to type.

## Download

**Easiest:** grab the ready-made folder with everything included:  
**[Download Portal-Aurora-Fix.zip](https://github.com/Uglyjuggler/portal-aurora-fix/raw/main/Portal-Aurora-Fix.zip)**

Or click the green **Code** button above → **Download ZIP** to grab every file in this repo as a zip.

## What is in here

- `DOUBLE-CLICK-ME-TO-FIX.bat` — the one-click fix script (this is the file to review)
- `READ-ME-FIRST.txt` — plain-English instructions
- `adb.exe`, `AdbWinApi.dll`, `AdbWinUsbApi.dll`, `fastboot.exe` — Android platform tools so the fix can talk to your Portal
- `Portal-Aurora-Fix.zip` — the whole folder pre-zipped for easy downloading

## How to use

1. Download and unzip the folder to your Desktop
2. Turn on USB debugging on your Portal (Settings → Developer options)
3. Plug the Portal into your PC with a USB DATA cable, tap ALLOW on the Portal screen
4. Double-click `DOUBLE-CLICK-ME-TO-FIX.bat` and follow the prompts

## Troubleshooting

- 30-second timeout: try a different USB cable (9 times out of 10 it is the cable)
- Asking for permission: tap ALLOW on your Portal screen, then retry
- Aurora Store not installed: install Aurora Store first, then run the fix again
- Anything else: take a screenshot of the black window and upload it to your favorite AI — it can read the error and tell you what to try next
