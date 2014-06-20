" Vim syntax file
" Language:		Ambienttalk
" Maintainer:		Joris Vandermeersch <joris@infogroep.be>
" Last change: Tue Mar 02 2010 17:53:25 CET
" URL:			http://joris.rave.org/ambienttalk.vim
" ----------------------------------------------------------------------------

" Initializing:

if exists("b:current_syntax")
  finish
endif

syn clear
syn case match

" Text

syn match      atText    /'[^']*'/
syn match      atText    /'[^']*$/
syn match      atText    /"[^"]*"/
syn match      atText    /"[^"]*$/

" Comments

syn match      atComment    /\/\/.*/
syn match      atComment    /\/\*\_.\{-}\*\//

" keywords

syn keyword atControl for while if then else begin until case def actor self


" Simple special types:

syn keyword	atType	oneline    true
syn keyword	atType	oneline    false
syn keyword	atType	oneline    void

syn keyword atBuiltin char ord number text random clock length explode implode size table display accept load dump read eval print tag rank make get set capture commit escape error
syn keyword atCont call continue
syn keyword atMath trunc abs sqrt sin cos tan arcsin arccos arctan exp log 
syn keyword atTest is_void is_number is_fraction is_text is_table is_function is_dictionary is_continuation

" Numbers

syn match  atNumber         "-\?\<\d\+\>"
syn match  atNumber         "-\?\<\d\+\.\d\+\>"
syn match  atNumber         "-\?\<\d\+[eE]-\=\d\+\>"
syn match  atNumber         "-\?\<\d\+\.\d\+[eE]-\=\d\+\>"

" highlight "; }" as an error
"syn match  atSepError       ";\s*}"

" the difficult stuff.
" at/Borg uses semantic coloring:
" variable definition -> blue
" function definition -> red
" table definition -> green
" Most difficult part is that xxx: and xxx:: matches while xxx:= doesn't.
" So we need 1 lookahead.

" var ->  id :
syn match	atVarDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*:[^=]"me=e-2
syn match	atVarDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*:$"me=e-1

" tab -> id[...] :
syn match	atTabDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*\[[^]]*\]\s*:[^=]"me=e-2
syn match	atTabDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*\[[^]]*\]\s*:$"me=e-1

" func -> id(...) :
syn match	atFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*(.*)\s*:[^=]"me=e-2
syn match	atFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*(.*)\s*:$"me=e-1

" func -> id@id() :
syn match	atFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*@\s*[_a-zA-Z][_a-zA-Z0-9]*\s*(.*)\s*:[^=]"me=e-2
syn match	atFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*@\s*[_a-zA-Z][_a-zA-Z0-9]*\s*(.*)\s*:$"me=e-1

" func -> id@id :
syn match	atFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*@\s*[_a-zA-Z][_a-zA-Z0-9]*\s*:[^=]"me=e-2
syn match	atFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*@\s*[_a-zA-Z][_a-zA-Z0-9]*\s*:$"me=e-1

" func -> a binop b :
syn match	atFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*[#<>=&\*\/\\\$\%\|\~\+\-\!\^\?]\+\s*[_a-zA-Z][_a-zA-Z0-9]*\s*:[^=]"me=e-2
syn match	atFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*[#<>=&\*\/\\\$\%\|\~\+\-\!\^\?]\+\s*[_a-zA-Z][_a-zA-Z0-9]*\s*:$"me=e-1


" Synchronization and wrapping up...

syn sync match matchPlace grouphere NONE "^"
" We only color numbers and keywords and we stated that
" multiline definitions are known to bug.
" So the context is limited to 1 line only.

if !exists("did_ambienttalk_syntax_inits")
  let did_ambienttalk_syntax_inits= 1

	hi link atBuiltin   Operator
  hi link atComment		Comment
	hi link atCont      Keyword
  hi link atControl		Conditional
	hi link atFunDef    Function
	hi link atMath      Operator
	hi link atNumber    Number
	hi link atSepError  Error
	hi link atTabDef    Function
  hi link atTest      Conditional
  hi link atText		  String
  hi link atType		  String
	hi link atVarDef    Function

  endif

let b:current_syntax = "ambienttalk"
