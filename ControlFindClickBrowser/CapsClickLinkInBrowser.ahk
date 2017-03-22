#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SetTitleMatchMode, 2
SendMode Input

$^f::
WinGetPos, x1, y1, w, h, A
Send ^f
Return

$Capslock::
IfWinActive, Google Chrome
{
  Px = 0
  Py = 0
  PixelSearch, Px, Py, x1, y1, w, h, 0x3296FF, 0, Fast
  If ErrorLevel
  {
    SetCapsLockState, % GetKeyState("Capslock","t") ? "Off" : "On" ; toggle capslock -- by None
  }
  Else
  {
    Px += 1
    Py += 1
    Click %Px%,%Py%
  }
}

IfWinActive, Firefox
{
  Px = 0
  Py = 0
  PixelSearch, Px, Py, x1, y1, w, h, 0x78D838, 0, Fast
  If ErrorLevel
  {
    SetCapsLockState, % GetKeyState("Capslock","t") ? "Off" : "On" ; toggle capslock -- by None
  }
  Else
  {
    Px += 1
    Py += 1
    Click %Px%,%Py%
  }
}

If WinActive("ahk_class IEFrame") or WinActive("ahk_class ApplicationFrameWindow")
{
  Px = 0
  Py = 0
  PixelSearch, Px, Py, x1, y1, w, h, 0xFF9933, 0, Fast
  If ErrorLevel
  {
    SetCapsLockState, % GetKeyState("Capslock","t") ? "Off" : "On" ; toggle capslock -- by None
  }
  Else
  {
    Px += 1
    Py += 1
    Click %Px%,%Py%
  }
}

Else
  SetCapsLockState, % GetKeyState("Capslock","t") ? "Off" : "On" ; toggle capslock -- by None
Return

Return
