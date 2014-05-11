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
	;~ English Message File
#ce------------------------------------------------

;~ FORM
Dim Const $MSG_GUI_TITLE = "Dummy File Generator"

;~ LABELS
Dim Const $MSG_LBL_INFO = "INFO"
Dim Const $MSG_LBL_FILESIZE = "Size Of The File"
Dim Const $MSG_LBL_FILENUMBER = "Amount Of Files"
Dim Const $MSG_LBL_SAVEPATH = "Save To Path"
Dim Const $MSG_LBL_FILENAME = "Name Of File(s)"
Dim Const $MSG_LBL_COPYRIGHT = "© 2014 by Markus Eschenbach" & @cr & "http://www.blogging-it.com"
Dim Const $MSG_LBL_STATUS_GENERATEWAIT = "Please wait....   generating file "
Dim Const $MSG_LBL_STATUS_DONE = "Generation done."

;~ BUTTONS
Dim Const $MSG_BTN_GENERATE = "Generate"
Dim Const $MSG_BTN_CANCEL = "Cancel"
Dim Const $MSG_BTN_SELECTFOLDER = "Select Folder"
Dim Const $MSG_BTN_EXIT = "Exit"

;~ DROPDOWN
Dim Const $MSG_DRDW_TYPE = "Megabyte|Kilobyte|Byte"
Dim Const $MSG_DRDW_TYPE_DEFAULT = "Megabyte"


;~ INPUT VALUES
Dim Const $MSG_INP_SAVEPATH = @TempDir & "\dummyfiles"
Dim Const $MSG_INP_FILENAME = "dummyfile.bin"

;~ MISC
Dim Const $MSG_MISC_SELECTFOLDER = "Choose a folder."
Dim Const $MSG_MISC_COPYRIGHT = "Copyright"
Dim Const $MSG_MISC_COPYRIGHTBY = "© 2014 by Markus Eschenbach"
Dim Const $MSG_MISC_WEBSITE = "http://www.blogging-it.com"

;~ VALIDATION
Dim Const $MSG_VALID_ERRORS = "Errors"
Dim Const $MSG_VALID_FILESIZE = "Please enter the file size."
Dim Const $MSG_VALID_FILESIZE_NONUMBER = "The file size of files is not a correct number."
Dim Const $MSG_VALID_FILENUMBER = "Please enter the amount of files."
Dim Const $MSG_VALID_FILENUMBER_NONUMBER = "The amount of files is not a correct number."
Dim Const $MSG_VALID_FILEPATH = "Please select a save path."
Dim Const $MSG_VALID_FILEPATH_NODIR = "Selected path is not a dir!"
Dim Const $MSG_VALID_FILEPATH_NOTEXIST = "Path does not exist"
Dim Const $MSG_VALID_FILEPATH_CREATE = "Would you create the path?"
Dim Const $MSG_VALID_FILEPATH_CANTCREATE = "Can't create the path! Please select an other path!"
Dim Const $MSG_VALID_FILEPATH_OTHER = "Please select an other path!"