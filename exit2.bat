@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    

@ECHO OFF
title Exit programs bro
Taskkill /IM Cortana* /T /F 
Taskkill /IM dropbox* /T /F
Taskkill /IM anydesk* /T /F
Taskkill /IM DbxSvc* /T /F
Taskkill /IM DbxSvc.exe /T /F
Taskkill /IM DbxSvc /T /F
ping 127.0.0.1 -n 8 > nul
Taskkill /IM DbxSvc* /T /F
Taskkill /IM DbxSvc.exe /T /F
Taskkill /IM DbxSvc /T /F
Taskkill /IM Agent.exe* /T /F
