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

#Region AutoIt3Wrapper directives section
;** List of compiler directives used by AutoIt3Wrapper.exe
#AutoIt3Wrapper_icon=icons\icon.ico
#AutoIt3Wrapper_outfile=Dummy File Generator.exe
#AutoIt3Wrapper_UseAnsi=y
#AutoIt3Wrapper_Res_Comment=More informations under www.blogging-it.com
#AutoIt3Wrapper_Res_Description=Generate dummy files with a specified size
#AutoIt3Wrapper_Res_Fileversion=1.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Markus Eschenbach
#EndRegion

Global $cancelProcess = false

#include <message.au3>
#include <gui.au3>