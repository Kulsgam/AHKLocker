#HotkeyInterval 20
#MaxHotkeysPerInterval 20000

global x
global OutputVar
global AllKeys
global Message := "Press !F2 to unlock"
Return ; end of auto-execute section

!F1::
x:=1
AllKeys := get_AllKeys()
Disable_Keys(True)
return

!F2::
Disable_Keys(False)
AllKeys := "NumpadEnter|Home|End|Pg|PgDn|Del|Ins|RButton|CtrlBreak|MButton|XButton1|XButton2|Back|Tab|NumpadClear|Shift|Ctrl|Alt|Pause|CapsLock|Esc|NumpadPgUp|NumpadPgDn|NumpadEnd|NumpadHome|Numpad|Numpad|Numpad|Numpad|PrintScreen|NumpadIns|NumpadDel|Help|1|2|3|4|5|6|7|8|9|LWin|RWin|AppsKey|Sleep|Numpad0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|NumpadMult|NumpadAdd|NumpadSub|NumpadDot|NumpadDiv|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|F13|F14|F15|F16|F17|F18|F19|F20|F21|F22|F23|F24|Numlock|ScrollLock|Wheel|Wheel|Wheel|Wheel|LShift|RShift|LCtrl|RCtrl|LAlt|RAlt|Browser_Back|Browser_Forward|Browser_Refresh|Browser_Stop|Browser_Search|Browser_Favorites|Browser_Home|Volume_Mute|Volume_|Volume_|Media_Next|Media_Prev|Media_Stop|Media_Play_Pause|Launch_Mail|Launch_Media|Launch_App1|Launch_App2|;|=|,|-|.|/|`|[|\|]|'|\"
Disable_Keys(True)
InputBox, OutputVar
if(OutputVar = "heybaby")
{
    Disable_Keys(False)
    x:=2
}
else
{
    Disable_Keys(False)
    AllKeys := get_AllKeys()
    x:=1
    Disable_Keys(True)
}
return

;-------------------------------------------------------------------------------
get_AllKeys() { ; return a pipe delimited list of all keys
;-------------------------------------------------------------------------------
    Keys := "NumpadEnter|Home|End|PgUp|PgDn|Left|Right|Up|Down|Del|Ins"

    Loop, 254
        If KeyName := GetKeyName(Format("VK{:X}", A_Index))
            Keys .= "|" KeyName

    For key, val in {Control: "Ctrl", Escape: "Esc", Left: "", Right: "", Space: "", LButton: ""}
        Keys := StrReplace(Keys, key, val)

    Return, Keys
}

;-------------------------------------------------------------------------------
Disable_Keys(BOOL := False) { ; (en/dis) -able all keys
;-------------------------------------------------------------------------------
    global Block := BOOL ? "On" : "Off"

    For each, KeyName in StrSplit(AllKeys, "|")
        Hotkey, *%KeyName%, Block_Input, %Block% UseErrorLevel

    Block_Input:
    Return
}

#If (x = 1)
{
    *Wheeldown::
    *Wheelup::
    *Wheelleft::
    *Wheelright::
    return

    $LButton::
    MouseMove, 960, 540
    Send {LButton}
    return
}