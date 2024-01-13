# Disable Auto Restart for Windows

## Overview

This repository contains a CMD script that disables automatic restarts on Windows. The script requests administrative privileges, modifies system settings, adds registry entries, and updates group policies to ensure that Windows does not automatically restart after system failure or Windows updates.

## Usage

1. Download the CMD file: [DisableAutoRestart.cmd](DisableAutoRestart.cmd).
2. Click on the downloaded file and run it.
3. Follow the prompts to grant administrative privileges or in case of error right-click on the downloaded file and choose "Run as administrator".

## What It Does

- **Disables Windows Update service:**
  The script configures the Windows Update service to start as "disabled." By doing so, the Windows Update service won't start automatically when the system boots up. This action prevents the system from automatically downloading and installing updates. Please note that disabling the Windows Update service can impact the security and performance of your system, as it prevents timely installation of critical updates.

- **Disables automatic restart on system failure:**
  The script adds a registry entry to disable automatic system restarts on system failure. This modification prevents the system from automatically restarting after a crash or system failure. The specific registry key modified is `HKLM\SYSTEM\CurrentControlSet\Control\CrashControl`, and the `AutoReboot` value is set to `0`, indicating that the system should not automatically restart.

- **Disables automatic restart with logged-on users for Windows Update installations:**
  The script adds a registry entry to disable automatic restarts for Windows Update installations when users are logged on. This modification prevents the system from automatically restarting if users are logged on during a Windows Update installation. The specific registry key modified is `HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU`, and the `NoAutoRebootWithLoggedOnUsers` value is set to `1`, indicating that the system should not automatically restart when users are logged on.

- **Displays a countdown message and updates Group Policy:**
  The script provides a countdown message, allowing users to see when the system will be updated. After the countdown, the script updates Group Policy settings, ensuring that the changes take effect.

## Important Note

After running the CMD file, your Windows system should no longer auto restart while signed in. However, it's crucial to understand the changes made by the script and their potential impact on system security and performance. Please use this script at your own risk, as it modifies system settings and registry entries.

**Use at your own risk. The script modifies system settings and registry entries, and it's important to understand its impact.**

## License

This script is provided under the [MIT License](LICENSE). See the [LICENSE](LICENSE) file for more details.
