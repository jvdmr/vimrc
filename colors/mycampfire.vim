" Vim color file
" Maintainer:	Joris Vandermeersch <joris@infogroep.be>
" Last Change: Sat May 23 2009 13:35:06 CEST

hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "mycampfire"

"hi Normal			ctermfg=gray		ctermbg=black
hi Normal			ctermfg=gray		ctermbg=black
hi ErrorMsg			ctermfg=red			ctermbg=black
hi Visual			ctermfg=lightblue	ctermbg=fg			cterm=reverse
hi VisualNOS		ctermfg=lightblue	ctermbg=fg			cterm=reverse,underline
hi Todo				ctermfg=lightred	ctermbg=darkblue
hi Search			ctermfg=white		ctermbg=darkblue	cterm=underline				term=underline
hi IncSearch		ctermfg=darkblue	ctermbg=gray

hi SpecialKey		ctermfg=darkcyan
hi Directory		ctermfg=cyan
hi Title			ctermfg=magenta							cterm=bold
hi WarningMsg		ctermfg=red
hi WildMenu			ctermfg=yellow		ctermbg=black		cterm=none					term=none
hi ModeMsg			ctermfg=lightblue
hi MoreMsg			ctermfg=darkgreen
hi Question			ctermfg=green							cterm=none
hi NonText			ctermfg=darkblue

hi StatusLine		ctermfg=blue		ctermbg=gray		cterm=none					term=none
hi StatusLineNC		ctermfg=black		ctermbg=gray		cterm=none					term=none
hi VertSplit		ctermfg=black		ctermbg=gray		cterm=none					term=none

hi Folded			ctermfg=darkgrey	ctermbg=black		cterm=bold					term=bold
hi FoldColumn		ctermfg=darkgrey	ctermbg=black		cterm=bold					term=bold
hi LineNr			ctermfg=green							cterm=none

hi DiffAdd			ctermbg=darkblue						cterm=none					term=none
hi DiffChange		ctermbg=magenta							cterm=none
hi DiffDelete		ctermfg=blue		ctermbg=cyan
hi DiffText								ctermbg=red			cterm=bold

hi lCursor			ctermfg=bg			ctermbg=darkgreen

hi Comment			ctermfg=white
"hi Constant			ctermfg=magenta							cterm=none
hi Special			ctermfg=brown							cterm=none
hi Identifier		ctermfg=cyan							cterm=none
hi Statement		ctermfg=yellow							cterm=none
"hi PreProc			ctermfg=magenta							cterm=none
hi PreProc			ctermfg=11								cterm=none
hi Include			ctermfg=darkred							cterm=none
hi rubySharpBang	ctermfg=brown							cterm=none
hi type				ctermfg=green							cterm=none
hi Underlined												cterm=underline				term=underline
hi Ignore			ctermfg=bg
hi String			ctermfg=3								cterm=NONE					term=NONE			start=^[[m^[[33m	stop=^[[m^[[32m
"hi Constant			ctermfg=136								cterm=NONE					term=NONE			start=^[[m^[[33m	stop=^[[m^[[32m
hi Constant			ctermfg=red								cterm=NONE					term=NONE			start=^[[m^[[33m	stop=^[[m^[[32m
hi PMenu			ctermfg=lightgray	ctermbg=darkgray
hi PMenuSel			ctermfg=white		ctermbg=black									term=underline
hi Function			ctermfg=172
hi Number			ctermfg=142
" vim:ts=4
