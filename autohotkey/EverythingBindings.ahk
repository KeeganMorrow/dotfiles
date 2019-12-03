#SingleInstance Force

#NoTrayIcon     ;Delete this line if you want the tray icon to be visible.
EverythingPath := "C:\Program Files\Everything\Everything.exe"       ;If your everything.exe isn't here, fix that. Keep the quotes.
MyUsername := "Keegan Morrow"           ;Go to %userprofile% and change this to the title of that window. Keep the quotes.
MyRecycleBin := "Recycle Bin"       ;Go to your Recycle Bin and change this to the title of that window. Keep the quotes.
MyThisPC := "This PC"               ;Go to your This PC and change this to the title of that window. Keep the quotes.

;You can delete below blocks if you don't want the features. Replace ^F with F3 if you are using that instead.

;BLOCK 1 - DESKTOP
#IfWinActive, ahk_class WorkerW
<#F::
    RunPath := "-p ""%UserProfile%""" . "\" . "Desktop" . "\"
    Run, %EverythingPath% %RunPath%
Return

#IfWinActive, ahk_class Progman
<#F::
    RunPath := "-p ""%UserProfile%""" . "\" . "Desktop" . "\"
    Run, %EverythingPath% %RunPath%
Return


;BLOCK 2 - TASKBARS
#IfWinActive, ahk_class Shell_TrayWnd
<#F::
    Run, %EverythingPath%
Return

;BLOCK 3 - EXPLORER WINDOW
#IfWinActive, ahk_class CabinetWClass
<#F::
    ControlGetText, RunPath, ToolbarWindow323, A
    RunPath := SubStr(RunPath, 10)
    isnotauserfolder := ":\"
    IfNotInString, RunPath, %isnotauserfolder%
    {
        if (RunPath == MyThisPC) 
        {
            RunPath := ""
        } else if (RunPath == MyUsername) {
            RunPath := "-p ""%UserProfile%"""
        } else if (RunPath == MyRecycleBin) {
            RunPath := "-s ""\$RECYCLE.BIN """
        } else {
            RunPath := "-p ""%UserProfile%""" . "\" . RunPath . "\"
        }
    } else {
        RunPath := "-p """ . RunPath . """"
    }
    Run, %EverythingPath% %RunPath%
Return

#IfWinActive, 
<#F::
    Run, %EverythingPath%
Return

;#If