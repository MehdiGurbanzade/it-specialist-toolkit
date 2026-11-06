# IT Specialist Toolkit (Windows)

A menu-driven Windows batch script that bundles 52 everyday IT support and network diagnostic tasks into one console tool. Built from day-to-day work as a network/IT specialist to speed up troubleshooting and PC setup.

## Usage

1. Download `run.cmd`.
2. Right-click → **Run as administrator** (needed for network, firewall, DISM and disk tasks).
3. Enter an option number, or `x` to exit.

**Requirements:** Windows 10/11, PowerShell, `winget` (App Installer) for software installs and updates.

## All features

### Disk & maintenance

| # | Option | Command used |
|---|---|---|
| 1 | Check disk free space (free/used/total GB per drive) | PowerShell `Win32_LogicalDisk` |
| 2 | Disk Cleanup | `cleanmgr` |
| 3 | Delete temporary files (user and Windows TEMP) | `del %TEMP%`, `cleanmgr /sagerun` |
| 4 | Check and repair bad sectors on C: | `chkdsk C: /f /r` |
| 5 | Scan and repair system files | `sfc /scannow` |
| 35 | Scan Windows image for corruption | `DISM /ScanHealth` |
| 36 | Repair corrupted Windows image | `DISM /RestoreHealth` |

### Network diagnostics

| # | Option | Command used |
|---|---|---|
| 6 | Show saved Wi-Fi networks and passwords | `netsh wlan show profile key=clear` |
| 7 | Network parameters (IP, MAC, gateway, DNS) | `ipconfig /all` |
| 8 | Clear DNS cache | `ipconfig /flushdns` |
| 9 | Renew IP address | `ipconfig /release` + `/renew` |
| 10 | DNS lookup for a domain | `nslookup` |
| 11 | Show ARP table | `arp -a` |
| 12 | Trace route to a host | `tracert` |
| 13 | Show routing table | `route print` |
| 14 | Active connections | `netstat -an` |
| 15 | Ping test | `ping` |

### Network configuration & security

| # | Option | Command used |
|---|---|---|
| 16 | Assign static IP and DNS to an adapter | `netsh interface ip set` |
| 17 | Get IP and DNS from DHCP | `netsh interface ip set ... source=dhcp` |
| 29 | Disable Windows Firewall | `netsh advfirewall set allprofiles state off` |
| 30 | Enable Windows Firewall | `netsh advfirewall set allprofiles state on` |

### System information

| # | Option | Command used |
|---|---|---|
| 18 | Full system information | `systeminfo` |
| 19 | CPU details (cores, threads, clock speed) | PowerShell `Win32_Processor` |
| 20 | RAM usage (free/total GB) | PowerShell `Win32_OperatingSystem` |
| 21 | Serial number, manufacturer and model | PowerShell `Win32_BIOS` |
| 22 | Windows license expiry status | `slmgr /xpr` |
| 23 | Windows version | `winver` |
| 24 | Last Windows install (format) date | `systeminfo` |
| 25 | Graphics card and display info | PowerShell `Win32_VideoController` |
| 26 | Installed printer drivers | `Get-PrinterDriver` |
| 39 | DirectX Diagnostic Tool | `dxdiag` |
| 52 | List all drivers and export to `Drivers.csv` | `driverquery /v` |

### Users & policy

| # | Option | Command used |
|---|---|---|
| 27 | Force Group Policy update | `gpupdate /force` |
| 28 | List user accounts | `net user` |
| 31 | Reset a local user's password | `net user <name> <password>` |

### Licensing

| # | Option | Command used |
|---|---|---|
| 38 | Windows/Office activation status, activate Windows with a product key, open Activation settings | `slmgr /dli /xpr /ipk /ato`, `OSPP.VBS /dstatus` |

### Software management

| # | Option | Command used |
|---|---|---|
| 32 | Check for available program updates | `winget upgrade` |
| 33 | Update all programs | `winget upgrade --all` |
| 34 | Open list of installed apps | `shell:appsfolder` |
| 37 | Chris Titus Tech WinUtil toolbox | [WinUtil](https://github.com/ChrisTitusTech/winutil) |
| 40 | Restart into BIOS/UEFI (45 s delay) | `shutdown /r /fw` |

### One-click installs (winget)

| # | App | # | App |
|---|---|---|---|
| 41 | Google Chrome | 47 | Everything |
| 42 | Zoom Workplace | 48 | Spotify |
| 43 | Brave | 49 | Telegram Desktop |
| 44 | AnyDesk | 50 | Microsoft Teams |
| 45 | 7-Zip | 51 | Discord |
| 46 | WinRAR | | |

## Safety notes

- Option 6 shows saved Wi-Fi passwords in plain text. Use it only on devices you administer.
- Options 16, 29 and 31 change system settings. Revert them when you are done.
- Option 37 downloads and runs the WinUtil script from the internet. Review it before use.

## License

MIT

## Author

Mehdi Gurbanzade · [LinkedIn](https://www.linkedin.com/in/mehdi-gurbanzade-21b463334/)
