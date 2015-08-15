" Vim syntax file
" Language:	VHDL
" Maintainer:	Czo <Olivier.Sirol@lip6.fr>
" Credits:	Stephan Hegel <stephan.hegel@snc.siemens.com.cn>
" $Id: vhdl.vim,v 1.1 2004/06/13 15:34:56 vimboss Exp $

" VHSIC Hardware Description Language
" Very High Scale Integrated Circuit

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" case is not significant

" VHDL keywords
syn keyword vhdlOperator and or but not
syn keyword vhdlOperator who whom that which than when

syn keyword vhdlStatement such of on by to in from with
syn keyword vhdlStatement if

syn keyword vhdlComment formal informal U C n v  old fashioned BrE  adj adv AmE T spoken literary


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_vhdl_syntax_inits")
  if version < 508
    let did_vhdl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cDefine       PreProc
  HiLink vhdlSpecial   Special
  HiLink vhdlStatement Statement
  HiLink vhdlCharacter String
  HiLink vhdlString    String
  HiLink vhdlVector    String
  HiLink vhdlBoolean   String
  HiLink vhdlComment   Comment
  HiLink vhdlNumber    String
  HiLink vhdlTime      String
  HiLink vhdlType      Type
  HiLink vhdlOperator  Type
  HiLink vhdlGlobal    Error
  HiLink vhdlAttribute Type

  delcommand HiLink
endif

let b:current_syntax = "eng"

" vim: ts=8
