#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
coordmode, mouse, Window
#SingleInstance Force

Start:
Gui, new, +MinSize200x500 MinimizeBox,
Gui, add, text, xmiddle ymiddle, RIGHT CLICK TO BEGIN
Gui, show, w350 h150 xcenter ycenter
return

mouse_pos:
Gui, new, +MinSize200x500 MinimizeBox, Cursor follower
Rbutton::
mousegetpos, Xpos, Ypos
gosub Coord_update
return

Coord_update:
Gui, add, text, x125 y15, PLEASE READ!!
Gui, add, text, x15 y30, HOW TO USE: Minimise this window, select the window that you 
Gui, add, text, x15 y45, want the coordinates off and right click on the area of 
Gui, add, text, x15 y60, the coordinates. This window will reappear showing you the 
Gui, add, text, x15 y75, relative coordinates. PRESS ESC TO EXIT
Gui, add, text, x15 y175, Cursor Coords
Gui, add, edit, x15 y195 w200 h25 readonly, Mouse X %Xpos% Mouse Y %Ypos%
Gui, add, text, x15 y225, Press ESC to exit
Gui, show,  w350 h250 xcenter ycenter

return


esc::ExitApp
