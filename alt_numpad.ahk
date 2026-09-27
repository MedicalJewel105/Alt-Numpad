#Requires AutoHotkey v2.0
#SingleInstance Force

; Переменная состояния режима Numpad
global NumpadMode := false

; Нажатие и отпускание Правого Alt (Alt Gr) переключает режим Numpad
~RAlt Up:: {
    if (A_PriorKey == "RAlt") {
        global NumpadMode := !NumpadMode
        if (NumpadMode)
            ToolTip "Numpad: ВКЛЮЧЕН"
        else
            ToolTip "Numpad: ВЫКЛЮЧЕН"
        SetTimer () => ToolTip(), -1000
    }
}

; Этот блок активен ТОЛЬКО когда режим NumpadMode включен (после нажатия Alt Gr)
#HotIf NumpadMode

; Если зажат ЛЕВЫЙ Alt (<!) + цифра — отправляем сигнал "вслепую" для Alt-кодов
<!1::Send "{Blind}{Numpad1}"
<!2::Send "{Blind}{Numpad2}"
<!3::Send "{Blind}{Numpad3}"
<!4::Send "{Blind}{Numpad4}"
<!5::Send "{Blind}{Numpad5}"
<!6::Send "{Blind}{Numpad6}"
<!7::Send "{Blind}{Numpad7}"
<!8::Send "{Blind}{Numpad8}"
<!9::Send "{Blind}{Numpad9}"
<!0::Send "{Blind}{Numpad0}"

; Если нажимается ПРОСТО цифра — отправляем чистый Numpad (для игр и расчетов)
1::Send "{Numpad1}"
2::Send "{Numpad2}"
3::Send "{Numpad3}"
4::Send "{Numpad4}"
5::Send "{Numpad5}"
6::Send "{Numpad6}"
7::Send "{Numpad7}"
8::Send "{Numpad8}"
9::Send "{Numpad9}"
0::Send "{Numpad0}"

#HotIf
