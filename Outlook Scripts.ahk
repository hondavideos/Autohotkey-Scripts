#Requires AutoHotkey v2.0
#SingleInstance Force

;Script to recompile 'Outlook Scripts.ahk' script WORKING
^!c:: 
{
scriptPath := 'C:\Users\Jack\Documents\Misc\AHK Script\Outlook Scripts.ahk'
outputPath := 'C:\Users\Jack\Documents\Misc\AHK Script\Outlook Scripts2.exe'
compilerPath := "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"

Run compilerPath " /in " scriptPath " /out " outputPath
	;path := "C:\Users\Jack\Documents\Misc\AHK Script"
	;Run "explorer.exe"
	;Sleep 500
	;Send "^lC:\Users\Jack\Documents\Misc\AHK Script{Enter}" ;Go to AHK Scripts DIR
	;Run ("C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe "/in" "C:\Users\Jack\Documents\Misc\AHK Script\Outlook Scripts.ahk" "/out" "C:\Users\Jack\Documents\Misc\AHK Script\Outlook Scripts2.exe"")
	/*
	Send "#e"
	Sleep 500
	Send "^lC:\Users\Jack\Documents\Misc\AHK Script{Enter}" ;Go to AHK Scripts DIR
	Sleep 300
	Send "o" ;Shift + F10 right clicks.
	Sleep 300
	Send "+{F10}{Down}{Down}{Down}{Down}{Down}{Enter}"
	Sleep 1000 
	Send "{Tab}"
	Sleep 300
	Send "{Enter}"
	;Sleep 2000
	;Send "^w"*/
}

;Script to open explorer and search article in Citrix (NOT WORKING)
^+e::
{
	Send "^+{Esc}"
	Sleep 300
	Send "!fnExplorer"
	;Sleep 300
	;Send "{Enter}{Enter}"
	;Send "!d" ;Alt D to focus search, confilicted with !d for tech signature
	;Send "\\Dekun-fsmdt.za.ziehl-abegg.de\UK\Common\Technical Department\Tech Library\JACK{Enter}"
}

!a:: ;attach quote T&C's file in email
{
	Send "!nafb" ;Open Explorer when in Outlook
	Send "^l" ;Alt D to focus search, confilicted with !d for tech signature
	Send "\\Dekun-fsmdt.za.ziehl-abegg.de\UK\Common\Technical Department\Tech Library\JACK{Enter}"
	Sleep 3000
	Send "{Tab}{Tab}{Tab}"
	Sleep 1900
	Send "{Tab}{Tab}{Tab}{Down}{Down}{Down}{Enter}"
	;potentially type g in filename then down 1 
}

;Script to create folder with current date then enter
^+!n::
{
	;oldClip := A_Clipboard
	timeString := FormatTime(, "dd.MM.yy") ;lowercase mm is minutes so used MM 
	A_Clipboard := timeString
	Send "^+n"
	Sleep 200
	Send A_Clipboard "{Enter}"
	Sleep 200
	;A_Clipboard := oldClip
	Sleep 100
	Send "{Enter}"
	;A_Clipboard := StrReplace(A_Clipboard, "ABC", "DEF")
	;curPath := explorerGetPath() ;calls below function 
	;DirCreate(curPath '\' timeString)
	;PUT BACK OLD CLIPBOARD
}

/*
		SIGNATURE SCRIPTS
*/

^!x:: ;General Signature
{
	Send "!m{Enter}"
	Sleep 300
	Send "!has{Down}{Enter}{Up}{Up}{Up}Hi ,{Enter}{Enter}Hope you're doing well. {Up}{Up}{Left}"
}

^+x:: ;General Signature No Hi
{
	Send "!m{Enter}"
	Sleep 300
	Send "!has{Down}{Enter}"
}

!d:: ;Tech Signature No Hi
{
	;Send "!m{Enter}" ;QUOTED OUT DUE TO ADDING AN ENTER AT THE START IF NO TECH INBOX
	;Sleep 300
	Send "!has{Enter}"
}

^!d:: ;Tech Signature with Hi
{
	Send "!m{Enter}"
	Sleep 300
	Send "!has{Enter}{Up}{Up}{Up}Hi ,{Enter}{Enter}Hope you're doing well. {Up}{Up}{Left}"
}

^+z:: ;Quote Signature No Hi
{
	Send "!m{Enter}"
	Sleep 300
	Send "!has{Down}{Down}{Enter}"
}

^!z:: ;Quote Signature with Hi
{
	Send "!m{Enter}"
	Sleep 300
	Send "!has{Down}{Down}{Enter}{Up}{Up}{Up}Hi ,{Enter}{Enter}Hope you're doing well. {Up}{Up}{Left}"
}