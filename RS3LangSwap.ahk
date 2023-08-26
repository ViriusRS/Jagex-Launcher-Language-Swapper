; https://github.com/ViriusRS/Jagex-Launcher-Language-Swapper#readme
; =====CONFIG=====
cacheFolder := "C:\ProgramData\Jagex" ; Game cache directory
xPos := 30 ; Horizontal positon of overlay
yPos := 120 ; Vertical position of overlay
opacity := 255 ; Overlay opacity (0-255)
offset := 6 ; Adjust if you're experiencing click inaccuracies (Default 6)
; #NoTrayIcon ; Uncomment to hide the AutoHotKey system tray icon for this script
; ===============
#Persistent
SetWorkingDir %A_ScriptDir%
Gui +LastFound
hWnd := WinExist()
DllCall("RegisterShellHookWindow", uInt, hWnd)
msgNum := DllCall("RegisterWindowMessage", Str, "SHELLHOOK")
OnMessage(msgNum, "ShellMessage")
OnMessage(0x0201, "WM_LBUTTONDOWN")

filePath := cacheFolder "\launcher\preferences.cfg"
FileRead, fileContents, %filePath%
If RegExMatch(fileContents, "Language=(\d*)", language) && FileExist("RS3LangSwap.png") {
    WS_EX_NOACTIVATE := 0x08000000
    WinSet, TransColor, 0x111111 %opacity%
    Gui, % "+E" WS_EX_NOACTIVATE " +LastFound -Caption +AlwaysOnTop +ToolWindow -Border"
    Gui, Color, 0x111111
    Gui, Add, Picture,, RS3LangSwap.png
    Gui, Add, Progress, x64 y6 w4 h35 Background0x39acff vActive
    GuiControl, Move, Active, % "x" 64 "y" offset + 37 * language1
}
Else {
    MsgBox, Failed to load the required files`nRead the GitHub documentation for further instructions
    ExitApp
}
Return

ShellMessage(wParam, lParam) {
    global xPos, yPos
    If (wParam = 32772) { ; HSHELL_WINDOWACTIVATED
        WinGet, processName, ProcessName, A
        If (processName = "JagexLauncher.exe") {
            WinGetPos, X, Y,,, ahk_exe JagexLauncher.exe
            overlayX := X + xPos
            overlayY := Y + yPos
            Gui, Show, x%overlayX% y%overlayY% NoActivate, RS3LangSwap
        }
        Else
            Gui, Hide
    }
}
Return

WM_LBUTTONDOWN(wParam, lParam) {
    global offset
    languageIndex := Floor(((lParam >> 16) - offset) / 37)
    If (languageIndex >= 0)
        ChangeLanguage(languageIndex)
}
Return

ChangeLanguage(languageIndex) {
    global filePath, offset
    FileRead, fileContents, %filePath%
    If RegExMatch(fileContents, "Language=(\d*)", language) {
        If (languageIndex != language1) {
            newContents := RegExReplace(fileContents, "Language=\d*", "Language=" languageIndex)
            FileDelete, %filePath%
            FileAppend, %newContents%, %filePath%
            GuiControl, Move, Active, % "x" 64 "y" offset + 37 * languageIndex
        }
    }
}
Return
