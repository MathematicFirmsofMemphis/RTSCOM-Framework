@echo off
setlocal enabledelayedexpansion

:: Define the directory to watch for command files
set COMMAND_DIR=C:\rts_commands

:: Create the directory if it doesn't exist
if not exist "%COMMAND_DIR%" mkdir "%COMMAND_DIR%"

:main
cls
echo RTS Space Bot is running...
echo Watching Camera directory: %COMMAND_DIR%

:: Loop to check for new command files
:loop
for %%F in ("%COMMAND_DIR%\*.cmd") do (
    echo Found command file: %%~nxF
    call "%%F"
    echo Deleting command file: %%~nxF
    del "%%F"
)

:: Wait for a second before checking again
ping -n 2 127.0.0.1 > nul
goto loop

:end
endlocal
exit /b

:: Command Definitions

:adjust_tax_rate
@echo off
echo Adjusting tax rate for faction %1 to %2
:: Replace the below line with the actual game command
echo adjust_tax_rate %1 %2
exit /b

:harvest_resources
@echo off
echo Harvesting resources from settlement %1 of type %2
:: Replace the below line with the actual game command
echo harvest_resources %1 %2
exit /b

:assign_mission
@echo off
echo Assigning mission of type %2 to character %1 targeting %3
:: Replace the below line with the actual game command
echo assign_mission %1 %2 %3
exit /b

:train_unit
@echo off
echo Training %3 units of type %2 in settlement %1
:: Replace the below line with the actual game command
echo train_unit %1 %2 %3
exit /b

:create_endangered_status
@echo off
echo Creating endangered status for faction %2 by faction %1
:: Replace the below line with the actual game command
echo create_endangered_status %1 %2
exit /b

:create_alliance
@echo off
echo Creating an alliance between faction %1 and faction %2
:: Replace the below line with the actual game command
echo create_alliance %1 %2
exit /b

:recognize_faction
@echo off
echo Recognizing faction %2 as a legitimate entity by faction %1
:: Replace the below line with the actual game command
echo recognize_faction %1 %2
exit /b
