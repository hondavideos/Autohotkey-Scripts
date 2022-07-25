#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_class MediaPlayerClassicW
Delete::
    WinGetTitle, filePath, A
    WinClose, A
    WinWaitClose
    FileRecycle %filePath%
    Return
#IfWinActive