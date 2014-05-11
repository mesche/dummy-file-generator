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

#include <File.au3>

Local $buffer = 2048

Func _generateRandomFile($filepath, $InputFileName, $fileSize, $ComboType, $InputNumber)
	$fileSize = _convertToByte($fileSize, $ComboType)
	$filesuffix = ""
	$fileName = ""
	$result = StringInStr($InputFileName, ".")
	GUICtrlSetData($ProgressBar,0) ;set progressbar status

	If ($result <> 0) Then
		$filesuffix = StringMid($InputFileName, $result)
		$fileName = StringMid($InputFileName, 1, $result - 1)
	Else
		$fileName = $InputFileName
	EndIf

	For $c = 1 To $InputNumber Step +1
		;cancel generate file
		if($cancelProcess) then
			Return
		EndIf

		If ($InputNumber == 1) Then
			$file = FileOpen($filepath & "\" & $fileName & $filesuffix, 18)
		Else
			$file = FileOpen($filepath & "\" & $fileName & $c & $filesuffix, 18)
		EndIf
		$i = 0
		$output = _createRandomString($buffer)
		GUICtrlSetData($LabelStatus,$MSG_LBL_STATUS_GENERATEWAIT & $c  & " - " & $InputNumber)
		For $i = 0 To $fileSize - $buffer Step +$buffer
		;cancel generate file
		if($cancelProcess) then
			FileClose($file)
			Return
		EndIf
			FileWrite($file, $output)
		Next
		FileWrite($file, _createRandomString($fileSize - $i)) ;write the rest to the file
		FileClose($file)
		GUICtrlSetData($ProgressBar, $c / ($InputNumber / 100)) ;set progressbar status
		GUICtrlSetData($LabelStatus,$MSG_LBL_STATUS_DONE)
	Next
EndFunc   ;==>_generateRandomFile

;Create a random string with the given size
Func _createRandomString($fileSize)
	$returnValue = ""
	For $j = 1 To $fileSize Step +1
		$returnValue = $returnValue & Chr(Random(0, 256))
	Next
	Return $returnValue
EndFunc   ;==>_createRandomString

Func _convertToByte($fileSize, $type)
	$type = StringLower($type)
	$retVal = ""
	Select
		Case $type = "megabyte"
			$retVal = $fileSize * 1024 * 1024
		Case $type = "kilobyte"
			$retVal = $fileSize * 1024
		Case Else
			$retVal = $fileSize
	EndSelect

	Return $retVal
EndFunc   ;==>_convertToByte


;~ _OpenFolder() öffnet den ordner eurer wahl :
Func _OpenFolder($FolderPfad, $Flag = @SW_MAXIMIZE)
	$FolderPfad = StringReplace($FolderPfad, "/", "\")
	Run("explorer.exe " & '"' & $FolderPfad & '"', @WindowsDir, $Flag)
EndFunc   ;==>_OpenFolder