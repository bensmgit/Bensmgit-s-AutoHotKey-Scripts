#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SetTitleMatchMode, 2
SendMode Input

; ---------- THE CLICK SENDER FUNCTION ----------
; ---------- The below is shared across all the browsers.
ClickHighlight(Color)
{
  Global x1, y1, w, h
  PixelSearch, Px, Py, x1, y1, w, h, Color, 0, Fast
  If ErrorLevel
  {
    SetCapsLockState, % GetKeyState("Capslock","t") ? "Off" : "On" ; toggle capslock -- by None
  }
  Else
  {
    Px += 1
    Py += 1
    Click %Px%,%Py%
    Sleep, 1000
    Send ^f
  }
}

; ---------- CTRL+F HOTKEY ----------
$^f::
WinGetPos, x1, y1, w, h, A
Send ^f
Return

; ---------- CAPLSOCK HOTKEY ----------
$Capslock::

; ---------- CHECK TO SEE WHETHER A BROWSER IS ACTIVE ----------
; ---------- If a non-browser window is active, then we will toggle the capslock status (we will process the caplsock key press event normally).
; ---------- If a browser window is active, we will continue this script, and have the capslock key press event processed to "Click" the text the Ctrl+F feature of the browser has highlighted.

If WinActive("Chrome") or WinActive("Firefox") or WinActive("ahk_class IEFrame") or WinActive("ahk_class ApplicationFrameWindow")
{
  ; A browser is active; continue script.
}
Else
{
  SetCapsLockState, % GetKeyState("Capslock","t") ? "Off" : "On" ; toggle capslock -- by None
  Exit
}

; ---------- CLICK BROWSER-HIGHLIGHTED TEXT ----------
; ---------- The Ctrl+F feature of the browser shows any matches on the page by hightlighting them. Each browser highlights matches a different color. The script will click the first instance of the highlighted match.
; ---------- It will search for the first pixel (from the top-left of the window) that matches the color we have indicated (in the script)--and then send a Click event to that specific location on the screen (offset by one pixel down and to the right, as for some reason that pixel is more responsive, more stable).
; ---------- Note that after we send the click to the located pixel, we send Ctrl+F to the page again, so that the user can type text; hit capslock to click the highlighted match; and then (after 1000 millisecond delay, to allow for page loading) begin simply to type again, and restart the process, without having to press Ctrl+F multiple times.

IfWinActive, Google Chrome
{
  ClickHighlight(0x3296FF)
}

IfWinActive, Firefox
{
  ClickHighlight(0x78D838)
}

If WinActive("ahk_class IEFrame") or WinActive("ahk_class ApplicationFrameWindow")
{
  ClickHighlight(0xFF9933)
}

Return
