Gui, Add, Radio, x82 y699 w200 h40 , Radio
Gui, Add, Radio, x22 y19 w240 h50 , Job failed and Next Instance successfull
Gui, Add, Radio, x22 y79 w240 h50 , Job failed and Next Instance also failed
Gui, Add, Radio, x22 y199 w240 h50 , Job Not running scheduler processing reocrds
Gui, Add, Radio, x22 y259 w240 h50 , Job running long and completed
Gui, Add, Radio, x22 y319 w240 h50 , Job running long and skipping
Gui, Add, Radio, x22 y139 w240 h50 , Job Not Running and Splitting
; Generated using SmartGUI Creator 4.0
Gui, Show, x127 y87 h394 w292, New GUI Window
Return

GuiClose:
ExitApp