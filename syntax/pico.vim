" Vim syntax file
" Language:	Pico (and Borg)
" Maintainer:	Karsten Verelst <karsten@sex.rave.org>
" Last change: 2006 Nov 20 15:57:56
"
" known Bugs:
"  - Defintions do not work recursively. so f(x):g(y):1 is colored wrong. 
"  - Multiline definitions don't work either
"
" Suggestions and bug reports are solicited by the author.


" Initializing:

syn clear
syn case match

" Text

syn match      PicoText    /'[^']*'/
syn match      PicoText    /'[^']*$/
syn match      PicoText    /"[^"]*"/
syn match      PicoText    /"[^"]*$/

" Comments

syn match      PicoComment    /`[^`]*`/
syn match      PicoComment    /`[^`]*$/

" keywords

syn keyword PicoControl for while if begin until case


" Simple special types:

syn keyword	PicoType	oneline    true
syn keyword	PicoType	oneline    false
syn keyword	PicoType	oneline    void

syn keyword PicoBuiltin char ord number text random clock length explode implode size table display accept load dump read eval print tag rank make get set capture commit escape error
syn keyword PicoCont call continue
syn keyword PicoMath trunc abs sqrt sin cos tan arcsin arccos arctan exp log 
syn keyword PicoTest is_void is_number is_fraction is_text is_table is_function is_dictionary is_continuation

" Numbers

syn match  PicoNumber         "-\?\<\d\+\>"
syn match  PicoNumber         "-\?\<\d\+\.\d\+\>"
syn match  PicoNumber         "-\?\<\d\+[eE]-\=\d\+\>"
syn match  PicoNumber         "-\?\<\d\+\.\d\+[eE]-\=\d\+\>"

" highlight "; }" as an error
syn match  PicoSepError       ";\s*}"

" the difficult stuff.
" Pico/Borg uses semantic coloring:
" variable definition -> blue
" function definition -> red
" table definition -> green
" Most difficult part is that xxx: and xxx:: matches while xxx:= doesn't.
" So we need 1 lookahead.

" var ->  id :
syn match	PicoVarDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*:[^=]"me=e-2
syn match	PicoVarDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*:$"me=e-1

" tab -> id[...] :
syn match	PicoTabDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*\[[^]]*\]\s*:[^=]"me=e-2
syn match	PicoTabDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*\[[^]]*\]\s*:$"me=e-1

" func -> id(...) :
syn match	PicoFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*(.*)\s*:[^=]"me=e-2
syn match	PicoFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*(.*)\s*:$"me=e-1

" func -> id@id() :
syn match	PicoFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*@\s*[_a-zA-Z][_a-zA-Z0-9]*\s*(.*)\s*:[^=]"me=e-2
syn match	PicoFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*@\s*[_a-zA-Z][_a-zA-Z0-9]*\s*(.*)\s*:$"me=e-1

" func -> id@id :
syn match	PicoFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*@\s*[_a-zA-Z][_a-zA-Z0-9]*\s*:[^=]"me=e-2
syn match	PicoFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*@\s*[_a-zA-Z][_a-zA-Z0-9]*\s*:$"me=e-1

" func -> a binop b :
syn match	PicoFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*[#<>=&\*\/\\\$\%\|\~\+\-\!\^\?]\+\s*[_a-zA-Z][_a-zA-Z0-9]*\s*:[^=]"me=e-2
syn match	PicoFunDef	"[_a-zA-Z][_a-zA-Z0-9]*\s*[#<>=&\*\/\\\$\%\|\~\+\-\!\^\?]\+\s*[_a-zA-Z][_a-zA-Z0-9]*\s*:$"me=e-1


" Synchronization and wrapping up...

syn sync match matchPlace grouphere NONE "^"
" We only color numbers and keywords and we stated that
" multiline definitions are known to bug.
" So the context is limited to 1 line only.

if !exists("did_pico_syntax_inits")
  let did_pico_syntax_inits= 1

	hi link PicoBuiltin   Operator
  hi link PicoComment		Comment
	hi link PicoCont      Keyword
  hi link PicoControl		Conditional
	hi link PicoFunDef    Function
	hi link PicoMath      Operator
	hi link PicoNumber    Number
	hi link PicoSepError  Error
	hi link PicoTabDef    Function
  hi link PicoTest      Conditional
  hi link PicoText		  String
  hi link PicoType		  String
	hi link PicoVarDef    Function

  endif

let b:current_syntax = "pico"
