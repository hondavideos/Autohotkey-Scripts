@ECHO OFF
TITLE Running Steam
start C:\"Program Files (x86)"\Steam\Steam.exe
ping 192.0.2.2 -n 1 -w 5000 > nul
start C:\"Program Files"\KeePassXC\KeePassXC.exe

Rem ping 192.0.2.2 -n 1 -w 7000 > nul
call focus KeePassXC
exit /b

:focus
setlocal EnableDelayedExpansion 

    if ["%~1"] equ [""] (
        echo Please give the window's title.
        exit /b
    )

    set pr=%~1
    set pr=!pr:"=!

    echo CreateObject("wscript.shell").appactivate "!pr!" > "%tmp%\focus.vbs"
    call "%tmp%\focus.vbs"
    del "%tmp%\focus.vbs"

goto :eof 
endlocal 
