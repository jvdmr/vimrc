" git.vim : syntax highlighting for git commit message files
"  Language:	git
"  Maintainer:	Joris Vandermeersch <joris@infogroep.be>
"  Last Change: Mon Jul 30 2007 00:50:36 CEST
"  Version:		0.1

" Read the config syntax to start with
if version < 600
  so <sfile>:p:h/conf.vim
else
  runtime! syntax/conf.vim
  unlet b:current_syntax
endif

let g:loaded_syntax_git= "1"

syn clear
syn case match
syn match	gitComment		/^#\( \+.*\)\?$/
syn match	gitComment		/^#	/
syn match	gitStatement	/modified:.*$/
syn match	gitQuestion		/new file:.*$/
syn match	gitWarningMsg	/deleted:.*$/
syn match	gitDirectory	/renamed:.*$/

if !exists("g:did_git_syntax_inits")
  let g:did_git_syntax_inits = 1
  hi def link gitComment	Comment
  hi def link gitStatement	Statement
  hi def link gitQuestion	Question
  hi def link gitWarningMsg	WarningMsg
  hi def link gitDirectory	Directory
endif

let b:current_syntax = "git"
" vim: ts=4
