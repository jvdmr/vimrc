" dvprops.vim : syntax highlighting for Dv::Util::Props configuration files
"  Language:	dvprops
"  Maintainer:	Joris Vandermeersch <joris@infogroep.be>
"  Last Change: Tue Aug 07 2007 02:22:30 CEST
"  Version:		0.1

let g:loaded_syntax_dvprops= "1"

syn clear
syn match	dvpropsStatement	/^.*\(=\)\@=/
syn match	dvpropsQuestion		/=.*$/hs=s+1,rs=s+1
syn match	dvpropsComment		/#.*$/

if !exists("g:did_dvprops_syntax_inits")
  let g:did_dvprops_syntax_inits = 1
  hi def link dvpropsStatement	Statement
  hi def link dvpropsQuestion	Question
  hi def link dvpropsComment	Comment
endif

let b:current_syntax = "dvprops"
" vim: ts=4
