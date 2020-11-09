::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcBeDMleeA6YX/Ofr0+iGtlgUaOEyfILe1KGdJexd713hFQ==
::fBE1pAF6MU+EWHreyHcjLQlHcBeDMleeA6YX/Ofr0+iGtlgUaMcyaJvC6aCPLuQR82ntZoJj02Jf+A==
::fBE1pAF6MU+EWHreyHcjLQlHcBeDMleeA6YX/Ofr0+iGtlgUaNE6bK749vqLOOVz
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAhVQjimM3y0Crod7PvH/O6GpkwZVeY+R7fi7YuHI+8dpEznevY=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFAhVQjjRGCuVBL8Z6/zo096Qp0wWFNU2dovUzafOIvlT2UTqUoQsxnJTm4UJFB44
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title Optimize Windows
echo.
echo.
echo.
echo  "Before using any of the options, please make a system restore point, I do not take any responsability
echo  if you break your system, lose data, or have a performance decrease, thank you for understanding"- san
echo.
echo.
echo.
pause
echo(%cd%
pushd %~dp0
echo(%cd%
color 3
goto mainscr
:mainscr
cls
echo.
echo.
echo   ********     **     ****     **     ********  *******       **     *******  **      ** **   ****** 
echo  **//////     ****   /**/**   /**    **//////**/**////**     ****   /**////**/**     /**/**  **////**
echo /**          **//**  /**//**  /**   **      // /**   /**    **//**  /**   /**/**     /**/** **    // 
echo /*********  **  //** /** //** /**  /**         /*******    **  //** /******* /**********/**/**       
echo ////////** **********/**  //**/**  /**    *****/**///**   **********/**////  /**//////**/**/**       
echo        /**/**//////**/**   //****  //**  ////**/**  //** /**//////**/**      /**     /**/**//**    **
echo  ******** /**     /**/**    //***   //******** /**   //**/**     /**/**      /**     /**/** //****** 
echo ////////  //      // //      ///     ////////  //     // //      // //       //      // //   //////  
echo.
echo.
echo - Optimize / Tweak Registry
echo - Free disk space / Recycle bin
echo - Restart Explorer / services
echo.
echo ____________________________________
echo Select:
echo.
cmdMenuSel f870 "Start Optimize" "Empty memory standbylist (clean RAM)" "Download Latest Version" "Experemental" "Exit"
if %ERRORLEVEL% == 1 goto checkadmin
if %ERRORLEVEL% == 2 goto emptyram
if %ERRORLEVEL% == 3 goto discord
if %ERRORLEVEL% == 4 goto experemental
if %ERRORLEVEL% == 5 goto exit
goto mainscr
echo.
echo.
:checkadmin call :IsAdmin
goto optimize
:Optimize 
@echo off
:spinner
set mSpinner=%mSpinner%.
if %mSpinner%'==....' (set mSpinner=.)
cls
echo.
echo Optimizing%mSpinner%
echo.
echo.
echo   ********     **     ****     **     ********  *******       **     *******  **      ** **   ****** 
echo  **//////     ****   /**/**   /**    **//////**/**////**     ****   /**////**/**     /**/**  **////**
echo /**          **//**  /**//**  /**   **      // /**   /**    **//**  /**   /**/**     /**/** **    // 
echo /*********  **  //** /** //** /**  /**         /*******    **  //** /******* /**********/**/**       
echo ////////** **********/**  //**/**  /**    *****/**///**   **********/**////  /**//////**/**/**       
echo        /**/**//////**/**   //****  //**  ////**/**  //** /**//////**/**      /**     /**/**//**    **
echo  ******** /**     /**/**    //***   //******** /**   //**/**     /**/**      /**     /**/** //****** 
echo ////////  //      // //      ///     ////////  //     // //      // //       //      // //   //////  
echo.
ping 127.0.0.1 -n 2 >nul
ping 127.0.0.1 -n 3 >nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
for /f %%n in ('wmic path win32_networkadapter get PNPDeviceID ^| findstr /L "VEN_"') do (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\%%n\Device Parameters\Interrupt Management\Affinity Policy" /v "AssignmentSetOverride" /t REG_BINARY /d "02" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\%%n\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePolicy" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\%%n\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MessageNumberLimit" /t REG_DWORD /d "256" /f
)
@echo off
:spinner
set mSpinner=%mSpinner%.
if %mSpinner%'==....' (set mSpinner=.)
cls
echo.
echo Clearing Temporary Files%mSpinner%
echo.
echo.
echo   ********     **     ****     **     ********  *******       **     *******  **      ** **   ****** 
echo  **//////     ****   /**/**   /**    **//////**/**////**     ****   /**////**/**     /**/**  **////**
echo /**          **//**  /**//**  /**   **      // /**   /**    **//**  /**   /**/**     /**/** **    // 
echo /*********  **  //** /** //** /**  /**         /*******    **  //** /******* /**********/**/**       
echo ////////** **********/**  //**/**  /**    *****/**///**   **********/**////  /**//////**/**/**       
echo        /**/**//////**/**   //****  //**  ////**/**  //** /**//////**/**      /**     /**/**//**    **
echo  ******** /**     /**/**    //***   //******** /**   //**/**     /**/**      /**     /**/** //****** 
echo ////////  //      // //      ///     ////////  //     // //      // //       //      // //   //////  
echo.
ping 127.0.0.1 -n 2 >nul
ping 127.0.0.1 -n 3 >nul
@echo off
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
del /q /s %systemdrive%\$Recycle.bin\*
for /d %%x in (%systemdrive%\$Recycle.bin\*) do @rd /s /q "%%x"
set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data

del /q /s /f "%ChromeDir%"
rd /s /q "%ChromeDir%"
set DataDir=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"

for /d %%x in (C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite

set FlashCookies=C:\Users\%USERNAME%\AppData\Roaming\Macromedia\Flashp~1

del /q /s /f "%FlashCookies%"
rd /s /q "%FlashCookies%"
cd /d %userprofile%\AppData\Local\Microsoft\Windows\Explorer attrib –h iconcache_*.db del iconcache_*.db start explorer
cls
del "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache*.db"  /a
REM *** Uninstall OneDrive ***
start /wait "" "%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL
rd C:\OneDriveTemp /Q /S >NUL 2>&1
rd "%USERPROFILE%\OneDrive" /Q /S >NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S >NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1

if exist %SystemDrive%\Windows.old\ (
	takeown /F %SystemDrive%\Windows.old\* /R /A /D Y>> "%LOGPATH%\%LOGFILE%"
	echo y| cacls %SystemDrive%\Windows.old\*.* /C /T /grant administrators:F>> "%LOGPATH%\%LOGFILE%"
	rmdir /S /Q %SystemDrive%\Windows.old\>> "%LOGPATH%\%LOGFILE%"
	)
if exist %SystemDrive%\$Windows.~BT\ (
	takeown /F %SystemDrive%\$Windows.~BT\* /R /A>> "%LOGPATH%\%LOGFILE%"
	icacls %SystemDrive%\$Windows.~BT\*.* /T /grant administrators:F>> "%LOGPATH%\%LOGFILE%"
	rmdir /S /Q %SystemDrive%\$Windows.~BT\>> "%LOGPATH%\%LOGFILE%"
	)
if exist %SystemDrive%\$Windows.~WS (
	takeown /F %SystemDrive%\$Windows.~WS\* /R /A>> "%LOGPATH%\%LOGFILE%"
	icacls %SystemDrive%\$Windows.~WS\*.* /T /grant administrators:F>> "%LOGPATH%\%LOGFILE%"
	rmdir /S /Q %SystemDrive%\$Windows.~WS\>> "%LOGPATH%\%LOGFILE%"
	)
if /i "%WIN_VER:~0,9%"=="Microsoft" (
	for /D %%x in ("%SystemDrive%\Documents and Settings\*") do (
		del /F /Q "%%x\Local Settings\Temp\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /Q "%%x\Recent\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /Q "%%x\Local Settings\Temporary Internet Files\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /Q "%%x\Local Settings\Application Data\ApplicationHistory\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /Q "%%x\My Documents\*.tmp" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /Q "%%x\Application Data\Sun\Java\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /Q "%%x\Application Data\Adobe\Flash Player\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /Q "%%x\Application Data\Macromedia\Flash Player\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
	)
) else (
	for /D %%x in ("%SystemDrive%\Users\*") do (
		del /F /S /Q "%%x\*.blf" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\*.regtrans-ms" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\LocalLow\Sun\Java\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\Cache\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\JumpListIconsOld\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\JumpListIcons\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\Local Storage\http*.*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\Media Cache\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Microsoft\Internet Explorer\Recovery\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Microsoft\Terminal Server Client\Cache\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Microsoft\Windows\Caches\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Microsoft\Windows\Explorer\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Microsoft\Windows\History\low\*" /AH 2>NUL
		del /F /S /Q "%%x\AppData\Local\Microsoft\Windows\INetCache\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Microsoft\Windows\WebCache\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Local\Temp\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Roaming\Adobe\Flash Player\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Roaming\Macromedia\Flash Player\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\AppData\Roaming\Microsoft\Windows\Recent\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /S /Q "%%x\Recent\*" >> "%LOGPATH%\%LOGFILE%" 2>NUL
		del /F /Q "%%x\Documents\*.tmp" >> "%LOGPATH%\%LOGFILE%" 2>NUL
rmdir /S /Q %SystemDrive%\Temp >> "%LOGPATH%\%LOGFILE%" 2>NUL
for %%i in (bat,txt,log,jpg,jpeg,tmp,bak,backup,exe) do (
			del /F /Q "%SystemDrive%\*.%%i
		)
for %%i in (NVIDIA,ATI,AMD,Dell,Intel,HP) do (
			rmdir /S /Q "%SystemDrive%\%%i
if exist "%ProgramFiles%\Nvidia Corporation\Installer2" rmdir /s /q "%ProgramFiles%\Nvidia Corporation\Installer2"
if exist "%ALLUSERSPROFILE%\NVIDIA Corporation\NetService" del /f /q "%ALLUSERSPROFILE%\NVIDIA Corporation\NetService\*.exe"
if exist %SystemDrive%\MSOCache rmdir /S /Q %SystemDrive%\MSOCache >> "%LOGPATH%\%LOGFILE%"
if exist %SystemDrive%\i386 rmdir /S /Q %SystemDrive%\i386 >> "%LOGPATH%\%LOGFILE%"
if exist %SystemDrive%\$Recycle.Bin rmdir /s /q %SystemDrive%\$Recycle.Bin
if exist "%USERPROFILE%\AppData\Local\Microsoft\Windows\WER\ReportArchive" rmdir /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\WER\ReportArchive"
if exist "%USERPROFILE%\AppData\Local\Microsoft\Windows\WER\ReportQueue" rmdir /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\WER\ReportQueue"
if exist "%ALLUSERSPROFILE%\Microsoft\Windows\WER\ReportArchive" rmdir /s /q "%ALLUSERSPROFILE%\Microsoft\Windows\WER\ReportArchive"
if exist "%ALLUSERSPROFILE%\Microsoft\Windows\WER\ReportQueue" rmdir /s /q "%ALLUSERSPROFILE%\Microsoft\Windows\WER\ReportQueue"
del /F /Q %WINDIR%\*.log
del /F /Q %WINDIR%\*.txt
del /F /Q %WINDIR%\*.bmp
del /F /Q %WINDIR%\*.tmp
del /F /Q %WINDIR%\Web\Wallpaper\*.*
rmdir /S /Q %WINDIR%\Web\Wallpaper\Dell
echo %WIN_VER% | findstr /v /i /c:"Microsoft" >NUL && del /F /Q %WINDIR%\Logs\CBS\* 2>NUL
RD /S /Q C:\Users\%USERNAME%\AppData\Local\FortniteGame\Saved\Logs
del /s /f /q c:\windows\temp\*.*
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
cls
:spinner
set mSpinner=%mSpinner%.
if %mSpinner%'==....' (set mSpinner=.)
cls
echo.
echo Clearing Recycle Bin%mSpinner%
echo.
echo.
echo   ********     **     ****     **     ********  *******       **     *******  **      ** **   ****** 
echo  **//////     ****   /**/**   /**    **//////**/**////**     ****   /**////**/**     /**/**  **////**
echo /**          **//**  /**//**  /**   **      // /**   /**    **//**  /**   /**/**     /**/** **    // 
echo /*********  **  //** /** //** /**  /**         /*******    **  //** /******* /**********/**/**       
echo ////////** **********/**  //**/**  /**    *****/**///**   **********/**////  /**//////**/**/**       
echo        /**/**//////**/**   //****  //**  ////**/**  //** /**//////**/**      /**     /**/**//**    **
echo  ******** /**     /**/**    //***   //******** /**   //**/**     /**/**      /**     /**/** //****** 
echo ////////  //      // //      ///     ////////  //     // //      // //       //      // //   //////  
echo.
ping 127.0.0.1 -n 2 >nul
ping 127.0.0.1 -n 3 >nul
del /q /s %systemdrive%\$Recycle.bin\*
for /d %%x in (%systemdrive%\$Recycle.bin\*) do @rd /s /q "%%x"
@echo off
:spinner
set mSpinner=%mSpinner%.
if %mSpinner%'==....' (set mSpinner=.)
cls
echo.
echo Restarting Explorer.exe / services%mSpinner%
echo.
echo.
echo   ********     **     ****     **     ********  *******       **     *******  **      ** **   ****** 
echo  **//////     ****   /**/**   /**    **//////**/**////**     ****   /**////**/**     /**/**  **////**
echo /**          **//**  /**//**  /**   **      // /**   /**    **//**  /**   /**/**     /**/** **    // 
echo /*********  **  //** /** //** /**  /**         /*******    **  //** /******* /**********/**/**       
echo ////////** **********/**  //**/**  /**    *****/**///**   **********/**////  /**//////**/**/**       
echo        /**/**//////**/**   //****  //**  ////**/**  //** /**//////**/**      /**     /**/**//**    **
echo  ******** /**     /**/**    //***   //******** /**   //**/**     /**/**      /**     /**/** //****** 
echo ////////  //      // //      ///     ////////  //     // //      // //       //      // //   //////  
echo.
ping 127.0.0.1 -n 2 >nul
ping 127.0.0.1 -n 3 >nul
del %~dp0cmdmenusel.exe
del %~dp0EmptyStandbyList.exe
cd c:\windows\System32
for /f "skip=3 tokens=1" %%i in ('TASKLIST /FI "USERNAME eq %userdomain%\%username%" /FI "STATUS eq running"') do (
if not "%%i"=="svchost.exe" (
if not "%%i"=="explorer.exe" (
if not "%%i"=="cmd.exe" (
if not "%%i"=="tasklist.exe" (
echo.
taskkill /f /im "%%i" 
)
)
)
)
)
:experemental
cls
cmdMenuSel f870 "debloat windows 10" "disbale hibernate" "disable windows updates" "back"
if %ERRORLEVEL% == 1 goto debloat
if %ERRORLEVEL% == 2 goto hibernate
if %ERRORLEVEL% == 3 goto disableupdates
if %errorlevel% == 4 goto mainscr
)
)
)
)
)
:hibernate
powercfg /H off
powercfg.exe /hibernate off
goto experemental
:disableupdates
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\ /v NoAutoUpdate /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU\ /v NoAutoUpdate /t REG_DWORD /d 1 /f
"%~dp0SetACL.exe" -on "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -ot reg -actn setowner -ownr "n:%USERNAME%"
"%~dp0SetACL.exe" -on "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -ot reg -actn ace -ace "n:%USERNAME%;p:full"
"%~dp0SetACL.exe" -on "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -ot reg -actn ace -ace "n:SYSTEM;p:read"
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\ /v NoAutoUpdate /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU\ /v NoAutoUpdate /t REG_DWORD /d 1 /f
goto experemental
:debloat
@Echo off
@rem *** Disable Some Service ***
sc stop DiagTrack
sc stop diagnosticshub.standardcollector.service
sc config DiagTrack start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config dmwappushservice start= disabled
REM schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyUpload" /Disable
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /Disable
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /Disable
schtasks /Change /TN "Microsoft\Office\Office 15 Subscription Heartbeat" /Disable
REM schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
REM schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable
REM schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
REM schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable *** Not sure if should be disabled, maybe related to S.M.A.R.T.
REM schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable
REM schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
REM schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
REM schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
REM The stubborn task Microsoft\Windows\SettingSync\BackgroundUploadTask can be Disabled using a simple bit change. I use a REG file for that (attached to this post).
REM schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disable
REM schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disable
REM schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable
REM schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disable
@rem *** Remove Telemetry & Data Collection ***
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
@REM Settings -> Privacy -> General -> Let apps use my advertising ID...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
REM - SmartScreen Filter for Store Apps: Disable
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
REM - Let websites provide locally...
reg add "HKCU\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1 /f
@REM Change Windows Updates to "Notify to schedule restart"
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v UxOption /t REG_DWORD /d 1 /f
@REM Disable P2P Update downlods outside of local network
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f
@REM *** Disable Cortana & Telemetry ***
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0
REM *** Disable MRU lists (jump lists) of XAML apps in Start Menu ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f
REM *** Set Windows Explorer to start on This PC instead of Quick Access ***
REM 1 = This PC, 2 = Quick access
REM reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
REM *** Disable Suggestions in the Start Menu ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f 
@rem Remove Apps
PowerShell -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Cortana* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsCamera* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *bing* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *people* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *photos* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *solit* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *zune* | Remove-AppxPackage"
REM PowerShell -Command "Get-AppxPackage *WindowsCalculator* | Remove-AppxPackage"
REM PowerShell -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Sway* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *CommsPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *ConnectivityStore* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *ContentDeliveryManager* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.WindowsStore* | Remove-AppxPackage"
@rem NOW JUST SOME TWEAKS
REM *** Show hidden files in Explorer ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f
REM *** Show super hidden system files in Explorer ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 1 /f
REM *** Show file extensions in Explorer ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t  REG_DWORD /d 0 /f
Import-Module -DisableNameChecking $PSScriptRoot\..\lib\New-FolderForced.psm1
Import-Module -DisableNameChecking $PSScriptRoot\..\lib\take-own.psm1
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
reg add HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener\ /v Start /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection\ /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility\ /v DiagnosticErrorText /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings\ /v DiagnosticErrorText /t REG_SZ /d "" /f
reg add HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings\ /v DiagnosticLinkText /t REG_SZ /d "" /f

Space\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
REM *** Uninstall OneDrive ***
start /wait "" "%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL
rd C:\OneDriveTemp /Q /S >NUL 2>&1
rd "%USERPROFILE%\OneDrive" /Q /S >NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S >NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
echo OneDrive has been removed. Windows Explorer needs to be restarted.
pause
start /wait TASKKILL /F /IM explorer.exe
start explorer.exe
goto experemental
)
)
)
)
)
:exit
del %~dp0cmdmenusel.exe
del %~dp0EmptyStandbyList.exe
del %~dp0SetACL.exe
exit
)
)
)
)
)
:Emptyram
pushd %~dp0
EmptyStandbyList.exe
popd
@echo off
timeout /t 2
goto mainscr
)
)
)
)
)
:discord
start "" https://discord.gg/kMpcfb7
goto mainscr
)
)
)
)
)
:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
