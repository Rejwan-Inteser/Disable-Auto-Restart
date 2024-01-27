# Disable AutoRestart Script

This script automates the process of disabling automatic restarts on your Windows system, particularly during system failures and Windows Updates. It requests administrative privileges, modifies registry settings related to Windows Update and automatic restarts, updates Group Policy, and restarts the Windows Update service.

## Usage

1. **Download Script:**
   - Download the script: [Disable_Auto_Restart.cmd](Disable_Auto_Restart.cmd).

2. **Run as Administrator:**
   - Click on the downloaded script (`Disable_Auto_Restart.cmd`) and run it.
   - When prompted, grant administrative privileges.

3. **Follow Instructions:**
   - The script will display instructions and a countdown.
   - After the countdown, it will update Group Policy, disable automatic updates, and restart the Windows Update service.

4. **Configuration Completed:**
   - Once the script completes, your Windows system should have auto-restart disabled successfully.

## Important Notes

- **Security Considerations:**
  - Disabling automatic updates can expose your system to security risks. Use this script with caution and consider enabling updates periodically for security purposes.

- **Administrative Privileges:**
  - Ensure that you run the script with administrative privileges for it to make the necessary changes.

- **Windows Update Service:**
  - The script stops and restarts the Windows Update service as part of the configuration.

- **Group Policy Update:**
  - The script forces an update of Group Policy to apply the changes.

- **Use at Your Own Risk:**
  - Understand the impact of disabling auto-restart and automatic updates on your system. Use the script at your own risk.

## License

This script is provided under the [MIT License](LICENSE). See the [LICENSE](LICENSE) file for more details.
