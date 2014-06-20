highlight MatchParen term=bold ctermbg=Black ctermfg=Red guibg=Red guifg=Black

" on probation: flag needless whitespace
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/
