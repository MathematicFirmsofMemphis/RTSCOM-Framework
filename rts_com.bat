@echo off
setlocal EnableDelayedExpansion

REM Set initial balance
set balance=1000

:menu
cls
echo 1. Check Balance
echo 2. Deposit
echo 3. Withdraw
echo 4. Talk to the bot
echo 5. RTS Command Response System
echo 6. Exit
set /p choice=Enter your choice: 

if "%choice%"=="1" goto check_balance
if "%choice%"=="2" goto deposit
if "%choice%"=="3" goto withdraw
if "%choice%"=="4" goto chat_bot
if "%choice%"=="5" goto rts_command_response
if "%choice%"=="6" goto end

REM Check Balance
:check_balance
cls
echo Your balance is: %balance%
pause
goto menu

REM Deposit
:deposit
cls
set /p amount=Enter the amount to deposit: 
set /a balance+=amount
echo Amount deposited successfully.
pause
goto menu

REM Withdraw
:withdraw
cls
set /p amount=Enter the amount to withdraw: 
if %amount% gtr %balance% (
    echo Insufficient funds!
) else (
    set /a balance-=amount
    echo Amount withdrawn successfully.
)
pause
goto menu

REM Chat with bot
:chat_bot
cls
set /p input=You: 
if /I "%input%"=="hello" (
    echo Bot: Hello there!
) else if /I "%input%"=="how are you" (
    echo Bot: I'm just a humble batch script, I don't have feelings, but thank you for asking!
) else if /I "%input%"=="bye" (
    echo Bot: Goodbye!
) else (
    echo Bot: I'm sorry, I don't understand. Try asking me 'hello', 'how are you', or 'bye'.
)
pause
goto menu

REM RTS Command Response System
:rts_command_response
cls
echo Type a command and press Enter to see the response. Type 'exit' to return to the menu.
set /p rts_command=Command: 
if /I "%rts_command%"=="what is your mission" (
    echo Bot: My mission is to assist users in managing their finances efficiently.
) else if /I "%rts_command%"=="who created you" (
    echo Bot: I was created by [Your Name].
) else if /I "%rts_command%"=="what can you do" (
    echo Bot: I can perform basic banking operations like checking balance, depositing, and withdrawing funds. You can also chat with me!
) else if /I "%rts_command%"=="exit" (
    goto menu
) else (
    echo Bot: Command not recognized. Please try again or type 'exit' to return to the menu.
)
pause
goto rts_command_response

:end
exit
