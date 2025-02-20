" Force Coc.nvim Diagnostic Colors
autocmd ColorScheme * highlight CocErrorSign ctermfg=Red guifg=#ff6b6b
autocmd ColorScheme * highlight CocWarningSign ctermfg=Yellow guifg=#ffdd57
autocmd ColorScheme * highlight CocErrorHighlight ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ff6b6b gui=underline
autocmd ColorScheme * highlight CocWarningHighlight ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=#ffdd57 gui=underline

" Force ALE Diagnostic Colors
autocmd ColorScheme * highlight ALEErrorSign ctermfg=Red guifg=#ff6b6b
autocmd ColorScheme * highlight ALEWarningSign ctermfg=Yellow guifg=#ffdd57
autocmd ColorScheme * highlight ALEError ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ff6b6b
autocmd ColorScheme * highlight ALEWarning ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=#ffdd57

" Force YCM Diagnostic Colors
autocmd ColorScheme * highlight YcmErrorSign ctermfg=Red guifg=#ff6b6b
autocmd ColorScheme * highlight YcmWarningSign ctermfg=Yellow guifg=#ffdd57
autocmd ColorScheme * highlight YcmErrorText ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ff6b6b
autocmd ColorScheme * highlight YcmWarningText ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=#ffdd57

" Force Treesitter Diagnostic Colors
autocmd ColorScheme * highlight DiagnosticError ctermfg=Red guifg=#ff6b6b
autocmd ColorScheme * highlight DiagnosticWarn ctermfg=Yellow guifg=#ffdd57
autocmd ColorScheme * highlight DiagnosticUnderlineError cterm=underline gui=underline guisp=#ff6b6b
autocmd ColorScheme * highlight DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#ffdd57

" General Vim Error and Warning Colors
autocmd ColorScheme * highlight Error ctermfg=Red ctermbg=NONE guifg=#ff6b6b guibg=NONE
autocmd ColorScheme * highlight WarningMsg ctermfg=Yellow ctermbg=NONE guifg=#ffdd57 guibg=NONE

