" File Name: fluxbox.vim
" Maintainer: Moshe Kaminsky <kaminsky@math.huji.ac.il>
" Original Date: May 23, 2002
" Last Update: June 16, 2003
" Description: fluxbox menu syntax file

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syntax keyword fluxboxMenu submenu end begin workspaces config stylesmenu contained
syntax keyword fluxboxAction exec stylesdir exit restart reconfig nop style contained
syntax keyword fluxboxPreProc include
syntax region fluxboxType matchgroup=fbSqBrackets start=/\[/ end=/\]/ contains=fluxboxAction,fluxboxMenu,fluxboxPreProc nextgroup=fluxboxHeader skipwhite oneline
syntax region fluxboxHeader matchgroup=fbRdBrackets start=/(/ end=/)/ contained nextgroup=fluxboxCommand skipwhite oneline
syntax region fluxboxCommand matchgroup=fbClBrackets start=/{/ end=/}/ contained oneline contains=fluxboxParam
syntax region fluxboxFold fold start=/\[submenu\]/ start=/\[begin\]/ end=/\[end\]/ contains=TOP keepend extend transparent
syntax match fluxboxComment /^\s*#.*$/
syntax match fluxboxParam / [^}]*/ contained display

highlight link fluxboxMenu Special
highlight link fluxboxAction Identifier
highlight link fluxboxHeader Type
highlight link fluxboxCommand Statement
highlight link fluxboxPreProc PreProc
highlight link fluxboxComment Comment
highlight link fluxboxParam Constant
setlocal foldmethod=syntax
syntax sync fromstart

let b:current_syntax = 'fluxbox'

