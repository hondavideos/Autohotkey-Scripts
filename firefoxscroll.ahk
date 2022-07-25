#IfWinActive ahk_class MozillaWindowClass

~WheelDown::
MouseGetPos X, Y
if (Y < 41)
    SendInput ^{PgDn}
Return

~WheelUp::
MouseGetPos X, Y
if (Y < 41)
    SendInput ^{PgUp}
Return




#IfWinActive ahk_class Chrome_WidgetWin_1

~WheelDown::
MouseGetPos X, Y
if ( Y < 90)
    SendInput ^{Tab}
Return

~WheelUp::
MouseGetPos X, Y
if ( Y < 90)
    SendInput ^+{Tab}
Return