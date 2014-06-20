" Vim syntax file
" Language:	C
" Maintainer:	Joris Vandermeersch <joris@infogroep.be>
" Last Change: Mon Aug 06 2007 00:54:41 CEST

syn keyword	cType		string filebuf exception
syn match	cType		"[iofs]*\(string\)\?stream"
syn match	cType		"\A\~\?\([A-Z]\+[a-z]\+\)\+"hs=s+1,rs=s+1
syn match	cType		"\A\~\?[A-Z]\+\(:\)\@="hs=s+1,rs=s+1
syn match	cType		"^\~\?\([A-Z]\+[a-z]\+\)\+"
syn match	cType		"^\~\?[A-Z]\+:"me=e-1,he=e-1,re=e-1

" vim: ts=8
