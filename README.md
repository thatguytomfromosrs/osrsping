# osrsping
Bash script that pings Old School Runescape Worlds 1-99 and creates a file (bestservers.txt) of the lowest latency worlds.

Guide for Windows 10
====================
1. Run Windows PowerShell as administrator
2. Run this command to enable Linux subsystem on Windows 10 (may need to reboot computer): 

        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

3. Go to Microsoft Store
4. Download Ubuntu: https://i.imgur.com/8JS2UsU.png
5. Launch Ubuntu and wait for install to complete then close
6. Download OSRSWorldPingTool.sh
7. Put file on your Desktop
8. Open PowerShell again and type in this command:

        cd ~; cd Desktop

9. Now type in this command:

        bash OSRSWorldPingTool.sh

10. Done!

Guide for Linux
================
1. Download OSRSWorldPingTool.sh to ~
2. Open terminal
3. Type in terminal to enable execution permissions:

        chmod +x OSRSWorldPingTool.sh

4. Execute script:

        OSRSWorldPingTool.sh

5. Done!
