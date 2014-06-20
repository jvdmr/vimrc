" Vim color file

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "cnf"

hi Normal		ctermfg=gray ctermbg=none
hi ErrorMsg		ctermfg=white ctermbg=lightred
hi Visual		ctermfg=magenta ctermbg=fg 		cterm=reverse
"hi VisualNOS	ctermfg=lightblue ctermbg=fg 	cterm=reverse,underline
hi Todo			ctermfg=white	ctermbg=red 	cterm=none
hi Search		ctermfg=black ctermbg=brown 	cterm=underline,bold term=underline,bold
hi IncSearch	ctermfg=black ctermbg=magenta	cterm=underline,bold term=underline,bold

"hi SpecialKey		ctermfg=darkcyan
"hi Directory		ctermfg=cyan
"hi Title			ctermfg=magenta cterm=bold
"hi WarningMsg		ctermfg=red
"hi WildMenu		ctermfg=yellow ctermbg=black cterm=none term=none
"hi ModeMsg			ctermfg=lightblue
"hi MoreMsg			ctermfg=darkgreen	ctermfg=darkgreen
"hi Question		ctermfg=green cterm=none
"hi NonText			ctermfg=darkblue

hi StatusLine		ctermfg=black ctermbg=white term=none cterm=bold
hi StatusLineNC		ctermfg=white ctermbg=white term=none cterm=none
hi VertSplit		ctermfg=grey ctermbg=grey term=none cterm=none

hi Folded			ctermfg=cyan ctermbg=none cterm=bold term=bold
"hi FoldColumn		ctermfg=darkgrey ctermbg=black cterm=bold term=bold
"hi LineNr			ctermfg=green cterm=none

"hi DiffAdd			ctermbg=darkblue term=none cterm=none
"hi DiffChange		ctermbg=magenta cterm=none
"hi DiffDelete		ctermfg=blue ctermbg=cyan 
"hi DiffText		cterm=bold ctermbg=red 

"hi Cursor			ctermfg=bg ctermbg=black
"hi lCursor			ctermfg=bg ctermbg=darkgreen


hi Comment			ctermfg=darkblue
hi Constant			ctermfg=magenta cterm=bold
hi Special			ctermfg=red cterm=bold
hi Identifier		ctermfg=cyan cterm=bold
hi Statement		ctermfg=yellow cterm=bold
hi PreProc			ctermfg=magenta cterm=none
hi type				ctermfg=green cterm=bold
hi Underlined		cterm=underline term=underline

hi MyTagListTagName  	ctermfg=white	cterm=underline,bold
hi MyTagListTagScope 	ctermfg=cyan	cterm=none
hi MyTagListTitle   	ctermfg=magenta cterm=none
hi MyTagListComment 	ctermfg=blue	cterm=none
hi MyTagListFileName 	ctermfg=yellow 	cterm=bold
