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


#cs------------------------------------------------
	;~ Do the validation
#ce------------------------------------------------
Func _doValidation()
	$retVal = True
	$errorMsg = ""

	If (GUICtrlRead($InputFileSize) == "") Then
		$errorMsg = $errorMsg & $MSG_VALID_FILESIZE & @CR
	ElseIf (Int(GUICtrlRead($InputFileSize)) == @error) Then
		$errorMsg = $errorMsg & $MSG_VALID_FILESIZE_NONUMBER & @CR
	EndIf

	If (GUICtrlRead($InputNumber) == "") Then
		$errorMsg = $errorMsg & $MSG_VALID_FILENUMBER & @CR
	ElseIf (Int(GUICtrlRead($InputNumber)) == @error) Then
		$errorMsg = $errorMsg & $MSG_VALID_FILENUMBER_NONUMBER & @CR
	EndIf

	$savepath = GUICtrlRead($InputSavePath)
	If ($savepath == "") Then
		$errorMsg = $errorMsg & $MSG_VALID_FILEPATH & @CR
	Else
		$retVal = _IsDir($savepath)
		If ($retVal == 0) Then
			$errorMsg = $errorMsg & $MSG_VALID_FILEPATH_NODIR & @CR
		ElseIf ($retVal == -1) Then
			$iMsgBoxAnswer = MsgBox(8244,$MSG_VALID_FILEPATH_NOTEXIST,$MSG_VALID_FILEPATH_CREATE)
			Select
				Case $iMsgBoxAnswer = 6 ;Yes
					If (DirCreate($savepath) == 0) Then
						$errorMsg = $errorMsg & $MSG_VALID_FILEPATH_CANTCREATE & @CR
					EndIf
				Case $iMsgBoxAnswer = 7 ;No
					$errorMsg = $errorMsg & $MSG_VALID_FILEPATH_OTHER
			EndSelect
		EndIf
	EndIf

	If ($errorMsg <> "") Then
		MsgBox(8240,$MSG_VALID_ERRORS, $errorMsg)
		$retVal = False
	EndIf
	Return $retVal
EndFunc   ;==>_doValidation


#cs ================================================
	;==< Checks if the given path is an existing folder.
	;==< Return :
	;==<   1 = Is Dir
	;==<   0 = Is Not a Dir
	;==<   -1= File or Dir does not exist.
	;==<
#ce ================================================
Func _IsDir($s_DirDrive)
	If FileExists($s_DirDrive) = 1 Then
		If DirGetSize($s_DirDrive) = -1 Then
			Return 0; no dir
		Else
			Return 1; is dir
		EndIf
	Else
		Return -1; File or Dir does not exist.
	EndIf
EndFunc   ;==>_IsDir


;~ Func _fileDelete()
;~ 	$success = FileDelete($filepath)
;~ 	If $success = 1 Then
;~ 		Return True
;~ 	ElseIf $success = 0 Then
;~ 		Return False
;~ 	EndIf
;~ 	Return False
;~ EndFunc   ;==>_fileDelete



;~ Func _getFileSize()
;~ 	$size = FileGetSize($filepath)
;~ 	Return $size
;~
;~ EndFunc   ;==>_getFileSize


;~ Func _fileExists()
;~ 	$file = FileExists($filepath)
;~ 	If $file = 1 Then
;~ 		Return True
;~ 	ElseIf $file = 0 Then
;~ 		Return False
;~ 	EndIf
;~ 	Return False
;~ EndFunc   ;==>_fileExists