" .vimrc 
" based on Botje's vimrc
" Maintainer: 	Joris Vandermeersch <jovdmeer@vub.ac.be>
" Last Change: Fri Jun 08 2018 13:17:51 CEST

version 6.5

" Settings: {{{

"let $termcolor = "campfire"
"let $termcolor = "vividchalk"
"let $termcolor = "mycampfire"
let $termcolor = "chela_light"
"let $termcolor = "oceanlight"
let $guicolor = "desertedocean"

color $termcolor

" ,v brings up my .vimrc
map ,v :sp ~/.vimrc<CR><C-W>_
" ,V reloads it -- making all changes active (have to save first)
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" go to next line after reindent
"nnoremap == ==j

" make switching between split windows easier
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" makes vim save at every :next, :rewind, :last, :first, :previous, :stop,
" :suspend, :tag, :!, :make, CTRL-] and CTRL-^ command; and when a :buffer,
" CTRL-O, CTRL-I, '{A-Z0-9}, or `{A-Z0-9} command takes one to another file.
set autowrite 

" allow backspace over everything in insert mode
set backspace=indent,eol,start

" make searches always ignore the case, unless there's  actually 
" capital characters in it
set ignorecase
set smartcase

set complete=.,w,b,u,t,i,]
set dictionary+=~/.vim/wordlists/perl.list,/usr/share/dict/words
set display=uhex
set diffopt+=iwhite
set fileformat=unix
set formatoptions=tcrqn
set printoptions+=syntax:y
set gdefault
set guioptions=Acgtm
set guifont=Andale\ Mono\ 12
set history=500						" hist buffer 50 lines
set hlsearch

" while typing the search, show what's found for what we typed already
set incsearch

set infercase
set isfname-==
set lazyredraw
set linebreak
" set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set magic

" make % also match < > tags
set matchpairs=(:),[:],{:},<:>
set matchtime=5
set mouse=

" keep no backup file
set nobackup

" set nocompatible mode - make sure we use vim to the full extend
set nocompatible					" no vi compat

set noexpandtab
set noerrorbells
"set nomesg
set modeline
set modelines=5
set nopaste							" normal insert mode
"set nowrapscan
set number
set pastetoggle=<F12>				" toggle auto indent (paste mode) in ins
set path+=/usr/include,*/,/usr/local/include
set report=0

" show the cursor position all the time
set ruler

set scrolloff=12						" 12 lines of context when searching
set shiftwidth=2							" shiftwidth = 4 spaces
set shortmess+=rnmx
" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" when completing from tags file, show the full tag. thus, in C or other code,
" see what arguments re required (code style permitting)
set showfulltag

" flash briefly to the matching parenthese if it's visible on the screen
set showmatch

set smartindent
set smarttab
set suffixes+=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar,.tgz,.tar,.zip
set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./*/tags,~/tags,*/tags,tags

" set tabstop at x spaces
set tabstop=2

"set textwidth=79
set textwidth=0
autocmd Syntax tex setlocal textwidth=78
set t_vb=
set undolevels=200
set visualbell
set wildmenu
set wildmode=list:longest,full
" set h and l keys so that they will wrap around linebrakes
" also set arrow keys for this same thing
set whichwrap=h,l,~,[,],<,>

set winminheight=0
set wrapscan              " searches wrap around (on probation)
set writebackup						" keep swapfile (.bak)
autocmd!

let g:timstamp_3 = '\(\%(L\|l\)ast *\%(changed\?\|modified\|updated\?\|edit\%(ed\)\?\) *:\).*$'
	\ . '!\1 %a %b %d %Y %H:%M:%S %Z'
let g:timstamp_4 = '\(\%(--\|//\|/\*\|#\|;\|\%\) \+\(D\|d\)ate *\(:\|=\)\).*$'
	\ . '!\1 %d %b %Y - %H:%M:%S'
let g:timstamp_5 = '^\( *\(D\|d\)ate *\(:\|=\)\).*$'
	\ . '!\1 "%d %b %Y - %H:%M:%S"'
" }}}

" Encodings: {{{
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,big5-hkscs,gbk,euc-jp,euc-kr,utf-bom,iso8859-1
" }}}

" Aestethics: {{{


if &t_Co > 2 || has("gui_running")
	syntax enable
	color $guicolor
	autocmd FileType gentoo-package-use hi Special	ctermfg=red
	autocmd FileType gentoo-package-use hi Keyword	ctermfg=green
	autocmd FileType gentoo-package-use	hi Comment	ctermfg=blue
endif

if has("autocmd")
	filetype plugin indent on
	autocmd FileType text setlocal textwidth=78
	autocmd FileType html,css set noet tabstop=2
" When editing a file, always jump to the last known cursor position.
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal g`\"" |
				\ endif
endif " has("autocmd")
" }}}

" Folds: {{{

autocmd FileType crontab setlocal nobackup nowritebackup
autocmd Syntax ambienttalk set foldmethod=manual
autocmd Syntax vim set foldmethod=marker
autocmd Syntax tex set foldmethod=manual
autocmd Syntax xml set foldmethod=manual
autocmd Syntax java set foldmethod=manual
autocmd Syntax scheme set foldmethod=manual
autocmd Syntax fluxbox set foldmethod=syntax
autocmd Syntax cpp set foldmethod=manual
autocmd Syntax c set foldmethod=manual
" autocmd Syntax *stuff* set foldmethod=indent
let php_folding=1
let perl_fold=1

" have zz fold a block (matching parentheses)
nnoremap zz zf%

" }}}

" Tabs: {{{

set tabpagemax=25

" }}}

" Compilers: {{{

autocmd Syntax perl compiler perl
autocmd Syntax tex compiler tex

set errorformat=%m\ at\ %f\ line\ %l%.%#,%-G%.%#

" when programming in  c++, lisp, have F9 run our code
autocmd FileType cpp nnoremap <F9> :!make run<CR>
autocmd FileType lisp nnoremap <F9> :!lisp -load % -eval '(quit)'<CR>

" }}}

" Objective-C: {{{
autocmd BufRead,BufNewFile *.m setlocal ft=objc
" }}}

" C/C++: {{{
augroup cprog
	au!
	autocmd FileType c,cpp set kp=man\ -S2:3:3X
	autocmd FileType c,cpp set efm=%f:%l:\ %m
	autocmd FileType c,cpp set efm+=%Dmake[%*\\d]:\ Entering\ directory\ `%f'
	autocmd FileType c,cpp set efm+=%Dmake[%*\\d]:\ Leaving\ directory\ `%f'
augroup END
" }}}

" Vagrant: {{{
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END
" }}}

" AmbientTalk: {{{
autocmd BufRead,BufNewFile *.at setlocal ft=ambienttalk
autocmd Syntax ambienttalk setlocal et
autocmd Syntax ambienttalk nnoremap <F9> :!iat % <CR>
" }}}

" Haskell: {{{
autocmd Syntax haskell setlocal et
autocmd Syntax haskell setlocal makeprg=runhaskell\ Setup*hs\ build
" }}}

" JSP: {{{
" recognize *.jsp as html pages
autocmd BufRead,BufNewFile *.jsp setlocal ft=html
" }}}

" Perl: {{{

autocmd Syntax perl setlocal keywordprg=perldoc\ -f

" recognize *.t as perl tests
autocmd BufRead,BufNewFile *.t setlocal ft=perl
autocmd BufRead,BufNewFile *.bm setlocal ft=perl

" }}}

" Pico: {{{
autocmd Syntax pico setlocal et
autocmd Syntax pico setlocal makeprg=tpico\ %
" }}}

" Scheme: {{{
autocmd Syntax scheme setlocal et
autocmd Syntax scheme nnoremap <F9> :!mred -fmv- % <CR>
autocmd Syntax scheme nnoremap <F6> :!mred -fmv- % <CR>
" }}}

" PHP: {{{
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1
" let php_oldStyle = 1
" }}}

" XML: {{{
autocmd Syntax xml setlocal et
" }}}

" TagList Entries: {{{
" URL: http://www.vim.org/scripts/script.php?script_id=273
autocmd Syntax perl let g:Tlist_Ctags_Cmd = '~/.vim/pl-tags'
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0
let Tlist_WinWidth = 30
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Show_One_File = 0
let Tlist_Compact_Format = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 3
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Use_SingleClick = 1

nnoremap <silent> <F4> :Tlist<CR>
inoremap <silent> <F4> <ESC>:Tlist<ESC>a
nnoremap <silent> <F3> :TlistSync<CR>
inoremap <silent> <F3> <ESC>:TlistSync<ESC>a
nnoremap <silent> <F2> :TlistUpdate<CR>
inoremap <silent> <F2> <ESC>:TlistUpdate<ESC>a
let tlist_make_settings  = 'make;m:makros;t:targets'
let tlist_qmake_settings = 'qmake;t:SystemVariables'

if has("autocmd")
" ----------  qmake : set filetype for *.pro  ----------
	autocmd BufNewFile,BufRead *.pro  set filetype=qmake
endif " has("autocmd")

" }}}

" Templates: {{{

" autocmd BufNewFile *.html 0r ~/.vim/templates/html
" autocmd BufNewFile *.xml read ~/.vim/templates/xml
autocmd BufNewFile *.xsl 0r ~/.vim/templates/xslt
autocmd BufNewFile *.pl  0r ~/.vim/templates/pl
autocmd BufNewFile *.pm  0r ~/.vim/templates/pm

" }}}

" Default Mappings: {{{

let s:cpo_save=&cpo
set cpo&vim
map! <xHome> <Home>
map! <xEnd> <End>
map! <S-xF4> <S-F4>
map! <S-xF3> <S-F3>
map! <S-xF2> <S-F2>
map! <S-xF1> <S-F1>
map! <xF4> <F4>
map! <xF3> <F3>
map! <xF2> <F2>
" map! <xF1> <F1>
map <xHome> <Home>
map <xEnd> <End>
map <S-xF4> <S-F4>
map <S-xF3> <S-F3>
map <S-xF2> <S-F2>
map <S-xF1> <S-F1>
map <xF4> <F4>
map <xF3> <F3>
map <xF2> <F2>
" map <xF1> <F1>

let &cpo=s:cpo_save
unlet s:cpo_save

" }}}

" Own Mappings: {{{

" press <F11> to switch between dark and light background colors
" doesn't always seem to work though...
map <F11> :set bg=dark<CR>
map <C-F11> :set bg=light<CR>

" have <F1> prompt for a help topic, rather than displaying the introduction
" page, and have it do this from any mode:
nnoremap <F1> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>

let mapleader = ";"
let maplocalleader = "\\"
nnoremap ;; ; " make ;; still search forward
map <F7> :w!<esc>:!validate "%"<CR>
imap <F9> :w!<esc>:make<CR>
nmap <F9> :w!<esc>:make<CR>
map <S-F11> :w<esc>:Explore<esc>		" save curr file, and open explorer
map <insert> zx<esc>				" fold all folds, but do not fold under cursor
map <delete> za<esc>				" fold/unfold current fold
map + <Plug>Traditional<esc>j

map <Leader>Tx :set filetype=xml<CR>
			\:source $VIMRUNTIME/syntax/xml.vim<CR>
			\:set foldmethod=manual<CR>
			\:source $VIMRUNTIME/syntax/syntax.vim<CR>
			\:source $ADDED/xml.vim<CR>
			\:echo "XML mode is on"<CR>

map <Leader>Th :set filetype=html<CR>
			\:source $VIMRUNTIME/syntax/html.vim<CR>
			\:set foldmethod=manual<CR>
			\:source $VIMRUNTIME/syntax/syntax.vim<CR>
			\:source $ADDED/html.vim<CR>
			\:echo "HTML mode is on"<CR>

map <Leader>p :put "<CR>
map <Leader>P :put! "<CR>
map <Leader>X /XXX<CR>cw
" have <Enter> also turning off highlighting
nnoremap <Enter> :nohls<Enter><Enter>
map <A-i> i <ESC>r
nmap Y y$

imap <Nul> <esc>
" set tab key for switching between split windows
noremap <Tab> <C-W>w
noremap <S-Tab> <C-W>W

" and have <F2> open a new horizontal window and ask for which file to open
noremap <F2> :new<CR>:e 
" same for <F3>, vertical
noremap <F3> :vne<CR>:e 

" make Q reformat current paragraph or select text
nnoremap <F10> gqap
vnoremap <F10> gq
map! <F10> <C-C><F10>a

" mac doesn't like <C-]>
map! <C-$> <C-]>

" }}}

" Commands: {{{

" Sorting, uniquing and shuffling
command! -nargs=* -range=% Sort <line1>,<line2>!sort <args>
command! -nargs=* -range=% Uniq <line1>,<line2>!uniq <args>
command! -nargs=* -range=% Rand <line1>,<line2>!rand <args>
command! Q :qall!
command! W :w!
command! Wq :wq!
command! WQ :wq!
" }}}

" Abbreviations: {{{
 iab HTML_DOCTYPE_FRAMESET <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
 iab HTML_DOCTYPE_LOOSE <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 iab HTML_DOCTYPE_STRICT <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 iab HTML_ENCODING <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
 iab PERL <Esc>:0r ~/.vim/templates/pl<CR>:set syntax=perl<CR>
 iab TEMP_HTML <Esc>:0r ~/.vim/templates/html<CR>:set syntax=html<CR>
 iab TEMP_XHTML <Esc>:0r ~/.vim/templates/xhtml<CR>:set syntax=html<CR>
 iab TEMP_XSLT <Esc>:0r ~/.vim/templates/xslt<CR>:set syntax=xml<CR>
 iab XHTML_10_DOCTYPE_FRAMESET <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
 iab XHTML_10_DOCTYPE_LOOSE <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 iab XHTML_10_DOCTYPE_STRICT <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 iab XHTML_11_DOCTYPE <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
 iab XHTML_HTML <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
 iab XML_10 <?xml version="1.0" encoding="UTF-8"?>
 iab XML_11 <?xml version="1.1" encoding="UTF-8"?>
 iab XSLT_LINK <?xml-stylesheet type="text/xsl" href="XXX.xsl"?>
 iab XSLT_OUTPUT_HTML <xsl:output method="html" version="4.01" encoding="utf-8" indent="no" />
 iab DOCBOOK_BOOK <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.4//EN" "docbookx.dtd">
 iab DOCBOOK_ARTICLE <!DOCTYPE article PUBLIC "-//OASIS//DTD DocBook XML V4.4//EN" "docbookx.dtd">
 iab CDATA <![CDATA[ ]]><ESC>F s
" }}}

" My Stuff {{{
if has("gui_running")
	color $guicolor
else
	color $termcolor
endif
imap <C-BS> <c-w>

let $ADDED = '~/.vim/added'
let perl_extended_vars=1
let b:match_ignorecase=1
set isk+=$,@,%,*,#,-,_

" latex-suite
set grepprg=grep\ -nH\ $*
let g:Tex_DefaultTargetFormat="pdf"

" kill sigs
au BufRead /tmp/mutt* normal :g/^> -- $/,/^$/-1d^M/^$^M^L

" SEE ALSO: .vim/after/colors/common.vim

" Don't like these .. :(
"  set laststatus=2
"  set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" }}}

" Vim 7 {{{
if v:version >= 700
	autocmd Filetype *
				\ if exists('&ofu') && &ofu == "" |
				\     source $VIMRUNTIME/autoload/syntaxcomplete.vim |
				\ endif

"  set spelllang=en
	set completeopt+=longest

	if has("gui_running")
		set cursorline
		hi cursorline guibg=#111111
	endif

	let g:GetLatestVimScripts_allowautoinstall=1

" {{{ ai and ii text objects
	onoremap <silent>ai :<C-u>cal IndTxtObj(0)<CR>
	onoremap <silent>ii :<C-u>cal IndTxtObj(1)<CR>
	vnoremap <silent>ai <Esc>:cal IndTxtObj(0)<CR><Esc>gv
	vnoremap <silent>ii <Esc>:cal IndTxtObj(1)<CR><Esc>gv
	function! IndTxtObj(inner)
		let curcol = col(".")
		let curline = line(".")
		let lastline = line("$")
		let i = indent(line("."))
		if getline(".") !~ "^\\s*$"
			let p = line(".") - 1
			let nextblank = getline(p) =~ "^\\s*$"
			while p > 0 && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
				-
				let p = line(".") - 1
				let nextblank = getline(p) =~ "^\\s*$"
			endwhile
			normal! 0V
			call cursor(curline, curcol)
			let p = line(".") + 1
			let nextblank = getline(p) =~ "^\\s*$"
			while p <= lastline && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
				+
				let p = line(".") + 1
				let nextblank = getline(p) =~ "^\\s*$"
			endwhile
			normal! $
		endif
	endfunction

" }}}
endif
" }}}

set bg=dark

"
" Last change: Fri Jun 08 2018 13:17:51 CEST
" vim: foldmethod=marker
