syntax on
set number
set signcolumn=no

call plug#begin('~/.vim/plugged')
Plug 'ojroques/vim-oscyank'
Plug 'airblade/vim-rooter'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'ycm-core/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-dispatch'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'github/copilot.vim'
Plug 'DanBradbury/copilot-chat.vim'
call plug#end()

filetype plugin indent on

let mapleader = "v"

" Toggle nerd tree
nnoremap <C-n> :NERDTreeToggle<CR>

" Toggle file search
nnoremap <C-S-p> :Files<CR>

" Yank to system clipboard
vnoremap <leader>y "+y

" Open copilot chat
nnoremap <leader>c :CopilotChatOpen<CR>

" Rename all instances of the symbol under the cursor
nnoremap <silent> <leader>rn :YcmCompleter RefactorRename<CR> " Rename symbol

" Go to the definition of the symbol under the cursor
nnoremap <silent> gd :YcmCompleter GoTo<CR> " Go to definition

" Find all references of the symbol under the cursor
nnoremap <silent> gr :YcmCompleter GoToReferences<CR> " Find references

" Go to the definition in a vertical split (Peek Definition alternative)
nnoremap <silent> <leader>pd :vsp<CR>:YcmCompleter GoTo<CR> " Peek definition (open in vertical split)

" Show documentation for the symbol under the cursor
nnoremap <silent> K :YcmCompleter GetDoc<CR> " Show documentation (Hover)

" Remap Ctrl + Arrow Down to scroll down 15 lines in Normal mode
nnoremap <C-Down> 15j

" Remap Ctrl + Arrow Up to scroll up 15 lines in Normal mode
nnoremap <C-Up> 15k

" Remap Ctrl + Arrow Down to extend the selection down 15 lines in Visual mode
vnoremap <C-Down> 15j

" Remap Ctrl + Arrow Up to extend the selection up 15 lines in Visual mode
vnoremap <C-Up> 15k


if !executable('ctags')
    let g:gutentags_dont_load = 1
endif

vmap <leader>a <Plug>CopilotChatAddSelection

highlight Comment ctermfg=LightYellow guifg=#d7af5f
highlight Directory ctermfg=Yellow guifg=#f1c40f
highlight Pmenu ctermbg=234 ctermfg=250 guibg=#2d2d2d guifg=#d3d3d3
highlight PmenuSel ctermbg=237 ctermfg=White guibg=#3e3e3e guifg=#ffffff
highlight PmenuSbar ctermbg=240 guibg=#4e4e4e
highlight PmenuThumb ctermbg=250 guibg=#d3d3d3
highlight DiagnosticError ctermfg=Red ctermbg=NONE guifg=#ff6b6b guibg=NONE
highlight DiagnosticWarn ctermfg=Yellow ctermbg=NONE guifg=#ffdd57 guibg=NONE
highlight LspDiagnosticsDefaultError ctermfg=Red ctermbg=NONE guifg=#ff6b6b guibg=NONE
highlight LspDiagnosticsDefaultWarning ctermfg=Yellow ctermbg=NONE guifg=#ffdd57 guibg=NONE
highlight DiagnosticUnderlineError gui=underline guisp=#ff6b6b
highlight DiagnosticUnderlineWarn gui=underline guisp=#ffdd57
highlight Error ctermfg=Red ctermbg=NONE guifg=#ff6b6b guibg=NONE
highlight WarningMsg ctermfg=Yellow ctermbg=NONE guifg=#ffdd57 guibg=NONE
highlight CocErrorSign ctermfg=Red guifg=#ff6b6b
highlight CocWarningSign ctermfg=Yellow guifg=#ffdd57
highlight CocErrorHighlight cterm=underline gui=underline guisp=#ff6b6b
highlight CocWarningHighlight cterm=underline gui=underline guisp=#ffdd57
highlight ALEErrorSign ctermfg=Red guifg=#ff6b6b
highlight ALEWarningSign ctermfg=Yellow guifg=#ffdd57
highlight ALEError ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ff6b6b
highlight ALEWarning ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=#ffdd57
highlight YcmErrorSign ctermfg=Red guifg=#ff6b6b
highlight YcmWarningSign ctermfg=Yellow guifg=#ffdd57
highlight YcmErrorText ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ff6b6b
highlight YcmWarningText ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=#ffdd57
highlight TSWarning ctermfg=Yellow guifg=#ffdd57
highlight TSError ctermfg=Red guifg=#ff6b6b

colorscheme industry

