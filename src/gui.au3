#cs------------------------------------------------
; ::::::::::::::: www.blogging-it.com :::::::::::::::
;
; Copyright (C) 2014 Markus Eschenbach. All rights reserved.
;
; This software is provided on an "as-is" basis, without any express or implied warranty.
; In no event shall the author be held liable for any damages arising from the
; use of this software.
;
; Permission is granted to anyone to use this software for any purpose,
; including commercial applications, and to alter and redistribute it,
; provided that the following conditions are met:
;
; 1. All redistributions of source code files must retain all copyright
;    notices that are currently in place, and this list of conditions without
;    modification.
;
; 2. All redistributions in binary form must retain all occurrences of the
;    above copyright notice and web site addresses that are currently in
;    place (for example, in the About boxes).
;
; 3. The origin of this software must not be misrepresented; you must not
;    claim that you wrote the original software. If you use this software to
;    distribute a product, an acknowledgment in the product documentation
;    would be appreciated but is not required.
;
; 4. Modified versions in source or binary form must be plainly marked as
;    such, and must not be misrepresented as being the original software.
;
; ::::::::::::::: www.blogging-it.com :::::::::::::::
#ce------------------------------------------------


#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#cs------------------------------------------------
	;~ Initialize the form, fields for the Graphical User Interface
#ce------------------------------------------------
#NoTrayIcon
Opt("TrayIconHide", 1)

;~ FORM
$FormMain = GUICreate($MSG_GUI_TITLE, 520, 278, 248, 183)
GUICtrlSetState(-1, $GUI_HIDE)
;~ LABELS
$LabelInfo = GUICtrlCreateLabel($MSG_LBL_INFO, 472, 8, 27, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
;Change cursor to HELP
GUICtrlSetCursor($LabelInfo,4)
$LabelFileSize = GUICtrlCreateLabel($MSG_LBL_FILESIZE, 24, 35, 121, 21)
GUICtrlSetFont(-1, 12, 400, 0, "Arial")
$LabelNumber = GUICtrlCreateLabel($MSG_LBL_FILENUMBER, 24, 67, 115, 22)
GUICtrlSetFont(-1, 12, 400, 0, "Arial")
$LabelSavePath = GUICtrlCreateLabel($MSG_LBL_SAVEPATH, 24, 98, 115, 22)
GUICtrlSetFont(-1, 12, 400, 0, "Arial")
$LabelFileName = GUICtrlCreateLabel($MSG_LBL_FILENAME, 24, 145, 115, 22)
GUICtrlSetFont(-1, 12, 400, 0, "Arial")
$LabelStatus = GUICtrlCreateLabel("", 80, 210, 380, 20)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$LabelCopyright = GUICtrlCreateLabel($MSG_LBL_COPYRIGHT, 5, 250, 200, 30)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
;Change cursor to CROSS
GUICtrlSetCursor($LabelCopyright,3)

;~ BUTTONS
$ButtonGenerate = GUICtrlCreateButton($MSG_BTN_GENERATE, 200, 180, 90, 25)
$ButtonCancel = GUICtrlCreateButton($MSG_BTN_CANCEL, 400, 88, 90, 25)
GUICtrlSetState(-1, $GUI_HIDE)
$LabelSelectFolder = GUICtrlCreateButton($MSG_BTN_SELECTFOLDER, 283, 120, 80, 17, 0)
$ButtonExit = GUICtrlCreateButton($MSG_BTN_EXIT, 420, 255, 74, 17)

;~ DROPDOWN
$ComboType = GUICtrlCreateCombo("", 288, 35, 75, 21)
GUICtrlSetData(-1, $MSG_DRDW_TYPE, $MSG_DRDW_TYPE_DEFAULT) ; add other items

;~ Input
$InputFileSize = GUICtrlCreateInput("1", 152, 35, 121, 21)
$InputNumber = GUICtrlCreateInput("1", 152, 67, 33, 21)
$InputSavePath = GUICtrlCreateInput($MSG_INP_SAVEPATH, 152, 98, 210, 21)
$InputFileName = GUICtrlCreateInput($MSG_INP_FILENAME, 152, 145, 210, 21)

;~ ProgressBar
$ProgressBar = GUICtrlCreateProgress(40, 220, 433, 17)




;Check every 250 ms if the cancel button was pressed
AdlibRegister("_checkGuiAction")

#include <randomfile.au3>
#include <validation.au3>

#cs------------------------------------------------
	;~ Initialize the GUI
#ce------------------------------------------------
_showGui() ;~ Show the GUI

#cs------------------------------------------------
	;~ Sets the GUI state to show the GUI
#ce------------------------------------------------
Func _showGui()
	GUISetState(@SW_SHOW)
EndFunc   ;==>_showGui

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $LabelSelectFolder
			_FileSelectFolder()
		Case $ButtonGenerate

			$valid = _doValidation()
			If ($valid) Then
				GUICtrlSetState($ButtonCancel, $GUI_SHOW)
				GUICtrlSetState($ButtonGenerate, $GUI_DISABLE)
				$cancelProcess = False
				GUICtrlSetData($LabelStatus, "")
				_generateRandomFile(GUICtrlRead($InputSavePath), GUICtrlRead($InputFileName), GUICtrlRead($InputFileSize), GUICtrlRead($ComboType), GUICtrlRead($InputNumber))
				GUICtrlSetState($ButtonCancel, $GUI_HIDE)
				GUICtrlSetState($ButtonGenerate, $GUI_ENABLE)
			EndIf
		Case $LabelInfo
			_getCopyrightPopup()
		Case $LabelCopyright
			_openEscheWebsite()
		Case $GUI_EVENT_CLOSE
			Exit
		Case $ButtonExit
			Exit
	EndSwitch
WEnd

#cs------------------------------------------------
	;~ Opens the select folder dialog
	;~
	;~ @RETURN  the selected path
#ce------------------------------------------------
Func _FileSelectFolder()
	$selectedPath = FileSelectFolder($MSG_MISC_SELECTFOLDER, '', 1)
	If ($selectedPath <> "") Then ;~ if the selected path it not empty then set the savepath to the inputfield
		GUICtrlSetData($InputSavePath, $selectedPath)
		Return True
	EndIf
	Return False
EndFunc   ;==>_FileSelectFolder


#cs------------------------------------------------
	;~ Opens the copyright popup
#ce------------------------------------------------
Func _getCopyrightPopup()
	;MsgBox features: Title=Yes, Text=Yes, Buttons=OK, Icon=Info
	MsgBox(8256, $MSG_MISC_COPYRIGHT, $MSG_MISC_COPYRIGHTBY)
EndFunc   ;==>_getCopyrightPopup



#cs------------------------------------------------
	;~ Open website with standard browser
#ce------------------------------------------------
Func _openEscheWebsite()
	Run(@ComSpec & ' /c start ' & $MSG_MISC_WEBSITE, "", @SW_HIDE)
EndFunc   ;==>_openEscheWebsite



#cs------------------------------------------------
	;~ Check if an action on the gui was done
#ce------------------------------------------------
Func _checkGuiAction()
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $ButtonCancel
			$cancelProcess = True
		Case $LabelInfo
			_getCopyrightPopup()
	EndSwitch
EndFunc   ;==>_checkGuiAction