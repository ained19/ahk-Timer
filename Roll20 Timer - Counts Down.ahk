#SingleInstance Force
#NoEnv 
#WinActivateForce
SetWorkingDir %A_ScriptDir%
SendMode Input


GMain:
	Gui, new, +MinSize200x500 alwaysontop MinimizeBox,Game Timer
	Gui, add, text, x15 y15, Please enter your game title
	Gui, add, edit,vR20_GameWin x15 y35 w300 h20, 
	Gui, add, text,x15 y70,Time in minutes
	Gui, add, edit, vTime_minutes Number x15 y90 h20 w50, 0
	Gui, add, text, x120 y70, X Co-ords
	Gui, add, edit, vMouseX Number x120 y90 h20 w50, 0
	Gui, add, text, x195 y70, Y Co-ords
	Gui, add, edit, vMouseY Number x195 y90 h20 w50, 0
	Gui, add, Button, x255 y115 h20 w80 gGsubmit, Submit
	Gui, show, NoActivate w350 h150 xcenter ycenter
	Guicontrol,, R20_GameWin
return


Gsubmit:
	Gui, submit, NoHide
	Gametitle := R20_GameWin
	min := Time_minutes
	xcord := MouseX
	ycord := MouseY
	Edit_input_Detect := strlen(R20_GameWin)
	if (Edit_input_Detect <= 0) {
	msgbox, 1, Error, Window Not found
	return
	}
	Gosub Win_call

return


Win_call:
	IfWinExist, %Gametitle% 
	{
	WinActivate
	WinMaximize
	Gosub Timer_loop
	}
	else
	{
	msgbox, 1, Error, Window Not found
	return
	}
	


Timer_Loop:
		;click xcord, ycord ;1700 X 970
		sleep 50
		if(x <= 0) 
		{ x = %min%
		 }
		else { x = %min%
		;below Loop is a timer that counts in minutes, The number next to loop represents the number of minutes.
		loop, %min%{
			click %xcord%, %ycord%
			x -= 1
			send, %x%
			send {enter}
			;the sleep paramater below defines the amount of time between each count, it works in milliseconds.
			sleep 60000
		} 
		send, Done
		send {enter}
		return
		}

Lalt::ExitApp


;id="textchat-input" - This is the element in html where I want to type to on roll20.net



/*
Known Bugs:
*If the R20_GameWin field is empty it runs on itself.
*/




