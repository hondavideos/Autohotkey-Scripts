/* ahk script
+ source: <http://thegeekdaily.com/how-to-create-hotkey-to-showhide-desktop-icons-using-ahk-script/>
Do you have too many icons on your Desktop?
You always think of cleaning it up but they’re just TOO many filled all over your desktop.
So what would you do? Clean them by sorting out the most used 
or just press a simple shortcut key (or Hotkey technically) to hide them when not needed 
and again press the same hotkey to show them up. 
Obviously, the second one (the lazy man’s hack). Right?
Here, in this guide I’ll show how you can toggle desktop icons on or off, means hide and show on pressing a hotkey. 
*/

;Hotkey: WIN + F11
#F11::

ControlGet, HWND, Hwnd,, SysListView321, ahk_class Progman
 If HWND =
 ControlGet, HWND, Hwnd,, SysListView321, ahk_class WorkerW
 If DllCall("IsWindowVisible", UInt, HWND)
 WinHide, ahk_id %HWND%
 Else
 WinShow, ahk_id %HWND%

Return