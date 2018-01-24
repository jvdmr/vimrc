" Vim indent file
" Language: Tex
" Author:   Joris Vandermeersch <joris@vdmr.be>
" URL:      -
" Last Change: Sat Jul 18 2015 18:21:57 CEST

if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

setlocal indentexpr=GetTexIndent()
setlocal indentkeys+=o,O
setlocal nosmartindent

if exists("*GetTexIndent")
	finish
endif

function GetTexIndent()
	if getline(v:lnum) =~ '^\s*\(%\|\\\(end{document}\)\)'
    return 0
  endif
	if getline(v:lnum) =~ '^\s*\\\(chapter\|newpage\|tableofcontents\|bibliography\)'
		return 1
	endif
	if getline(v:lnum) =~ '^\s*\\section'
		return 2
	endif
	if getline(v:lnum) =~ '^\s*\\subsection'
		return 3
	endif
	if getline(v:lnum) =~ '^\s*\\subsubsection'
		return 4
	endif
	if getline(v:lnum) =~ '^\s*\\paragraph'
		return 5
	endif
	if getline(v:lnum) =~ '^\s*\\subparagraph'
		return 6
	endif
	if getline(v:lnum) =~ '^\s*\\subsubparagraph'
		return 7
	endif

	let lnum = prevnonblank(v:lnum - 1)
	" ignore comments and \newpage, \tableofcontents, ... commands
  while lnum != 0 && getline(lnum) =~ '^\s*\(%\|\\\(newpage\|tableofcontents\|bibliography\)\)'
    let lnum = prevnonblank(lnum - 1)
  endwhile

	if lnum == 0
		return 0
	endif

	let ind = indent(lnum)

	if getline(lnum) =~ '^\s*\\\(begin\|chapter\|section\|subsection\|subsubsection\|paragraph\|subparagraph\|subsubparagraph\)'
		let ind = ind + 1
	endif
	if getline(v:lnum) =~ '^\s*\\end'
		let ind = ind - 1
	endif
	
	return ind
endfunction
