; This script was created using Pulover's Macro Creator
; www.macrocreator.com

#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Window
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1

If !IsObject(ie)
	ie := ComObjCreate("InternetExplorer.Application")
ie.Visible := true
ie.Navigate("https://www.google.com/")
IELoad(ie)
bob := ie.LocationURL
ie.Navigate("lego.com")
IELoad(ie)
Sleep, 2000
Send, {Tab}
Send, {Tab}
Send, {Tab}
Send, {Tab}
Send, {Tab}
Send, {Tab}
Send, {Tab}
Send, {Tab}
Send, {Enter}
Return


IELoad(Pwb)
{
	While !(Pwb.busy)
		Sleep, 100
	While (Pwb.busy)
		Sleep, 100
	While !(Pwb.document.Readystate = "Complete")
		Sleep, 100
}
