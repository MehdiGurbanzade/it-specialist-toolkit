@echo off
chcp 65001 >nul
title Script for IT Specialist
mode con: cols=140 lines=40
color 02

:menu
cls
echo --------------------------------------------------------
echo  Frequently Used Commands - Mehdi Gurbanzade
echo --------------------------------------------------------

echo 1. Check disk free space                      14. Active connection list (Netstat)            27. Update Group Policy                                     40. Enter BIOS/UEFI		     
echo 2. Disk Cleanup                               15. Ping test                                   28. About User Accounts                                     41. Download Google Chrome		                 
echo 3. Delete unnecessary files (TEMP)            16. Assign Static IP and DNS addresses          29. Disable Firewall                                        42. Download Zoom Workplace                                        
echo 4. Close Bad Sectors                          17. Obtain IP and DNS from DHCP Server          30. Enable Firewall                                         43. Download Brave
echo 5. Remove malicious program from system       18. System information                          31. Reset Password                                          44. Download Anydesk
echo 6. Saved WI-FI names and passwords            19. CPU (Processor information)                 32. Check for program updates                               45. Download 7-ZIP
echo 7. Network parameters                         20. Check RAM usage                             33. Download all program updates                            46. Download WinRAR
echo 8. Clear DNS Cache                            21. Computer serial number, brand and model     34. List of installed programs                              47. Download Everything
echo 9. Renew IP                                   22. Windows license status                      35. (DISM) Scan for corrupted system files                  48. Download Spotify
echo 10. Nslookup (DNS query)                      23. Information about Windows version           36. (DISM) Repair corrupted system files                    49. Download Telegram Desktop
echo 11. Show ARP Table                            24. Check last system format date               37. ToolBox                                                 50. Download Microsoft Teams	
echo 12. Tracert (Trace route)                     25. Information about display                   38. Windows/Office activation                               51. Download Discord
echo                                                                                                                                                           52. List drivers (export CSV)
echo 13. Show Route Table                          26. Show Printer Drivers                        39. DirectX Diagnostic Tool                                 x. Exit
																								    
                    
 


echo -----------------------------
set "choice="
set /p choice="Choose Number (1-52, x = Exit):"


if /i "%choice%"=="1" goto check_disk_free_space
if /i "%choice%"=="2" goto check_disk_cleanup
if /i "%choice%"=="3" goto check_del_temp
if /i "%choice%"=="4" goto check_bad_sector
if /i "%choice%"=="5" goto check_malware
if /i "%choice%"=="6" goto check_saved_wifi
if /i "%choice%"=="7" goto check_network_info
if /i "%choice%"=="8" goto check_dns_cache_cleanup
if /i "%choice%"=="9" goto check_ip_restart
if /i "%choice%"=="10" goto check_nslookup_test
if /i "%choice%"=="11" goto check_arp_table
if /i "%choice%"=="12" goto check_tracert_test
if /i "%choice%"=="13" goto check_route_table
if /i "%choice%"=="14" goto check_netstat_test
if /i "%choice%"=="15" goto check_ping
if /i "%choice%"=="16" goto static_ip_dns
if /i "%choice%"=="17" goto dhcp_ip_dns
if /i "%choice%"=="18" goto check_system_info
if /i "%choice%"=="19" goto check_cpu
if /i "%choice%"=="20" goto check_ram
if /i "%choice%"=="21" goto check_seria_number
if /i "%choice%"=="22" goto check_windows_license
if /i "%choice%"=="23" goto check_windows_version
if /i "%choice%"=="24" goto check_system_format_date
if /i "%choice%"=="25" goto check_display_card
if /i "%choice%"=="26" goto show_printer_driver
if /i "%choice%"=="27" goto check_group_refresh
if /i "%choice%"=="28" goto check_user_account
if /i "%choice%"=="29" goto check_firewall_off
if /i "%choice%"=="30" goto check_firewall_on
if /i "%choice%"=="31" goto check_reset_pass
if /i "%choice%"=="32" goto check_upgrade
if /i "%choice%"=="33" goto check_upgrade_all
if /i "%choice%"=="34" goto apps_folder
if /i "%choice%"=="35" goto check_dism_scan
if /i "%choice%"=="36" goto check_dism_restore
if /i "%choice%"=="37" goto chris_toolbox
if /i "%choice%"=="38" goto activation_office
if /i "%choice%"=="39" goto check_Directx
if /i "%choice%"=="40" goto Bios_Uefi
if /i "%choice%"=="41" goto download_chrome
if /i "%choice%"=="42" goto download_zoom
if /i "%choice%"=="43" goto download_brave
if /i "%choice%"=="44" goto download_anydesk
if /i "%choice%"=="45" goto download_7-zip
if /i "%choice%"=="46" goto download_winrar
if /i "%choice%"=="47" goto download_everything
if /i "%choice%"=="48" goto download_spotify
if /i "%choice%"=="49" goto download_telegram
if /i "%choice%"=="50" goto download_teams
if /i "%choice%"=="51" goto download_discord
if "%choice%"=="52" goto list_drivers
if /i "%choice%"=="x" goto exit
goto menu

:download_discord
echo.
echo Installing Discord...
winget install Discord.Discord
echo Discord installed...
pause
goto menu

:download_teams
echo.
echo Installing Microsoft Teams...
winget install Microsoft.Teams
echo Microsoft Teams installed...
pause
goto menu

:download_telegram
echo.
echo Installing Telegram...
winget install Telegram.TelegramDesktop
echo Telegram installed...
pause
goto menu

:download_spotify
echo.
echo Installing Spotify...
winget install Spotify.Spotify
echo Spotify installed...
pause
goto menu

:download_everything
echo.
echo Installing Everything...
winget install voidtools.Everything
echo Everything installed...
pause
goto menu

:download_winrar
echo.
echo Installing WinRAR...
winget install RARLab.WinRAR
echo WinRAR installed...
pause
goto menu

:download_7-zip
echo.
echo Installing 7-ZIP...
winget install 7zip.7zip
echo 7-ZIP installed...
pause
goto menu

:download_anydesk
echo.
echo Installing AnyDesk...
winget install Anydesk.Anydesk
echo AnyDesk installed...
pause
goto menu

:download_brave
echo.
echo Installing Brave...
winget install Brave.Brave
echo Brave installed...
pause
goto menu

:download_zoom
echo.
echo Installing Zoom...
winget install Zoom.Zoom
echo Zoom installed...
pause
goto menu

:download_chrome
echo.
echo Installing Google Chrome...
winget install google.chrome
echo Google Chrome installed...
pause
goto menu

:Bios_Uefi
echo.
echo The system will enter BIOS/UEFI settings in 45 seconds
shutdown /r /fw /t 45
pause
goto menu

:check_DirectX
echo.
echo Opening DirectX Diagnostic Tool...
dxdiag
pause
goto menu

:check_disk_free_space
echo.
echo Displaying disk free space...
powershell -Command "Get-WmiObject Win32_LogicalDisk | Select-Object DeviceID, VolumeName, @{Name='FreeSpace(GB)';Expression={[math]::Round($_.FreeSpace/1GB,2)}}, @{Name='TotalSize(GB)';Expression={[math]::Round($_.Size/1GB,2)}}, @{Name='UsedSpace(GB)';Expression={[math]::Round(($_.Size - $_.FreeSpace)/1GB,2)}}, FileSystem, DriveType"
pause
goto menu

:check_saved_wifi
echo.
echo Showing saved Wi-Fi profiles and passwords...
powershell -Command "$profiles = netsh wlan show profiles; $profiles = $profiles | Select-String 'All User Profile' | ForEach-Object { $_.Line.Split(':')[1].Trim() }; foreach ($profile in $profiles) { $profileInfo = netsh wlan show profile name=$profile key=clear; $password = ($profileInfo | Select-String 'Key Content').Line.Split(':')[1].Trim(); if ($password) { Write-Host 'Profile: ' $profile; Write-Host '    Key Content: ' $password } else { Write-Host 'Profile: ' $profile; Write-Host '    Key Content: Not Set' }; Write-Host '' }"
echo ✅ Saved Wi-Fi profiles displayed.
pause
goto menu

:check_malware
echo.
echo Removing malicious programs from the system...
sfc /scannow
echo ✅ Malicious programs removal (SFC run) completed.
pause
goto menu

:check_disk_cleanup
echo.
echo Running Disk Cleanup...
cleanmgr
echo ✅ Disk Cleanup finished.
pause
goto menu

:check_system_info
echo.
echo Displaying system information...
systeminfo
echo ✅ System information displayed.
pause
goto menu

:check_network_info
echo.
echo Displaying network information...
ipconfig /all
echo ✅ Network information displayed.
pause
goto menu

:check_dns_cache_cleanup
echo.
echo Flushing DNS cache...
ipconfig /flushdns
echo ✅ DNS cache flushed.
pause
goto menu

:check_ip_restart
echo.
echo Renewing IP address...
ipconfig /release && ipconfig /renew
echo ✅ IP address renewed.
pause
goto menu 

:check_dism_scan
echo.
echo Scanning for corrupted system files (DISM)...
dism /online /cleanup-image /scanhealth
pause
goto menu

:check_dism_restore
echo.
echo Restoring corrupted system files (DISM)...
dism /online /cleanup-image /restorehealth
echo ✅ Corrupted system files restored.
pause
goto menu

:check_seria_number
echo.
echo Getting computer serial number, manufacturer, and model...
powershell -command "Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object @{Name='Manufacturer';Expression={$_.Manufacturer}}, @{Name='Model';Expression={$_.Model}}, @{Name='SerialNumber';Expression={(Get-CimInstance -ClassName Win32_BIOS).SerialNumber}}"
pause
goto menu

:check_windows_license
echo.
echo Showing Windows license status...
slmgr /xpr
pause
goto menu

:check_windows_version
echo.
echo Showing Windows version information...
winver
pause
goto menu

:check_system_format_date
echo.
echo Showing system install/format date...
systeminfo | find "Install Date"
pause
goto menu

:check_cpu
echo.
echo Gathering CPU information...
powershell -command "Get-CimInstance -ClassName Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed"
pause
goto menu

:check_ram
echo.
echo Showing RAM usage information...
powershell -command "Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object @{Name='FreePhysicalMemory (GB)';Expression={[math]::round($_.FreePhysicalMemory / 1KB / 1024, 2)}}, @{Name='TotalVisibleMemorySize (GB)';Expression={[math]::round($_.TotalVisibleMemorySize / 1KB / 1024, 2)}}"
pause
goto menu

:check_group_refresh
echo.
echo Updating Group Policy...
gpupdate /force
echo ✅ Group Policy updated.
pause
goto menu

:check_user_account
echo.
echo Retrieving user accounts information...
net user
pause
goto menu

:check_firewall_off
echo.
echo Disabling Firewall...
netsh advfirewall set allprofiles state off
echo ✅ Firewall disabled.
pause
goto menu

:check_firewall_on
echo.
echo Enabling Firewall...
netsh advfirewall set allprofiles state on
echo ✅ Firewall enabled.
pause
goto menu

:check_upgrade
echo.
echo Showing upgrade list...
winget upgrade
pause
goto menu

:check_upgrade_all
echo.
echo Installing all upgrades...
winget upgrade --all
echo ✅ All programs upgraded.
pause
goto menu

:check_ping
echo.
echo Starting ping test...
set /p ip=Enter the IP address to ping:
ping %ip%
pause
goto menu


:check_del_temp
echo.
echo Deleting unnecessary files...
del /q /f /s %TEMP%\*
del /q /f /s %WINDIR%\Temp\*
cleanmgr /sagerun:1
echo ✅ Unnecessary files deleted.
pause
goto menu

:list_drivers
echo.
echo Listing drivers...
driverquery /v
echo Exporting to Drivers.csv...
driverquery /v /fo csv > "%~dp0Drivers.csv"
echo ✅ %~dp0Drivers.csv has been created.
pause & goto menu


:check_nslookup_test
echo.
echo Starting DNS query...
set /p domain=Enter the domain for DNS query:
nslookup %domain%
pause
goto menu

:check_arp_table
echo.
echo Showing ARP table...
arp -a
pause
goto menu

:check_tracert_test
echo.
echo Starting trace route...
set /p ip=Enter the IP address for trace route:
tracert %ip%
pause
goto menu

:check_route_table
echo.
echo Showing route table...
route print
pause
goto menu

:check_netstat_test
echo.
echo Showing active connections (netstat)...
netstat -an
pause
goto menu

:check_display_card
echo.
echo Showing display adapter information...
powershell -Command "Get-WmiObject -Class Win32_VideoController | Select-Object Name, DriverVersion, @{Name='AdapterRAM(GB)';Expression={[math]::round($_.AdapterRAM / 1GB, 2)}}, VideoModeDescription"
pause
goto menu

:show_printer_driver
echo.
echo Showing installed printer drivers...
powershell -command "Get-PrinterDriver"
pause
goto menu

:check_bad_sector
echo.
echo Checking and fixing bad sectors on disk...
chkdsk C: /f /r
echo ✅ Bad sectors handled.
pause
goto menu

:check_reset_pass
echo.
echo User accounts:
net user
echo Enter the username:
set /p UserName= 
echo Enter the new password:
set /p NewPassword= 

net user %UserName% %NewPassword%

echo ✅ Password changed successfully!
pause
goto menu

:static_ip_dns
echo.
:: Determining Wi-Fi adapter name
echo Searching for Wi-Fi adapter name...
netsh interface show interface

:: Ask user to input Wi-Fi adapter name
set /p INTERFACE_NAME=Please enter the Wi-Fi adapter name (e.g., Wi-Fi): 

:: After adapter name, request IP, subnet, gateway and DNS
set /p IP=Please enter the static IP address: 
set /p SUBNET=Please enter the subnet mask: 
set /p GATEWAY=Please enter the gateway address: 
set /p DNS1=Please enter the primary DNS server: 
set /p DNS2=Please enter the secondary DNS server: 

:: Apply IP, subnet, gateway and DNS settings
echo Setting static IP...
netsh interface ip set address "%INTERFACE_NAME%" static %IP% %SUBNET% %GATEWAY%

echo Setting DNS...
netsh interface ip set dns name="%INTERFACE_NAME%" static %DNS1% validate=no
netsh interface ip add dns name="%INTERFACE_NAME%" %DNS2% index=2 validate=no

echo ✅ IP and DNS addresses changed successfully.
pause
goto menu

:dhcp_ip_dns
echo.
:: Determining network adapter name
echo Searching for network adapter name...
netsh interface show interface

:: Prompt for network adapter name
set /p INTERFACE_NAME=Please enter the network adapter name (e.g., Wi-Fi): 

:: Obtain IP address from DHCP server...
netsh interface ip set address name=%INTERFACE_NAME% source=dhcp

:: Obtain DNS from DHCP server...
netsh interface ip set dns name=%INTERFACE_NAME% source=dhcp

echo ✅ IP and DNS obtained from DHCP server.
pause
goto menu

:apps_folder
echo.
:: List of apps
echo Opening list of installed apps...
explorer shell:appsfolder
pause
goto menu

:activation_office
echo.
echo === Windows activation status ===
cscript //nologo %windir%\system32\slmgr.vbs /dli
cscript //nologo %windir%\system32\slmgr.vbs /xpr
echo.
echo === Office activation status ===
set "ospp="
if exist "%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS" set "ospp=%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\OSPP.VBS" set "ospp=%ProgramFiles(x86)%\Microsoft Office\Office16\OSPP.VBS"
if defined ospp (cscript //nologo "%ospp%" /dstatus) else (echo Office license tool not found. Microsoft 365 activates via account sign-in.)
echo.
set "key="
set /p key=Enter Windows product key to activate (leave empty to skip): 
if not "%key%"=="" (
  cscript //nologo %windir%\system32\slmgr.vbs /ipk %key%
  cscript //nologo %windir%\system32\slmgr.vbs /ato
)
start ms-settings:activation
pause
goto menu

:chris_toolbox
echo.
echo Opening ToolBox...
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm -useb christitus.com/win | iex"
pause
goto menu


:exit
exit /b 0
