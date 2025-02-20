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
Plug 'ycm-core/YouCompleteMe'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
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

call plug#end()

let mapleader = "v"

let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

" NERDTree Toggle and open files in a new tab
nnoremap <C-n> :NERDTreeToggle<CR>

" FZF Open files in a new tab, split, or vertical split
nnoremap <leader>ff :Files<CR>
let g:fzf_action = {
      \ 'enter': 'tabedit',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" Navigate between tabs
nnoremap <C-Tab> :tabnext<CR>
nnoremap <C-S-Tab> :tabprev<CR>

" Close current tab
nnoremap <C-x> :tabclose<CR>

" Go to the definition of the symbol under the cursor
nnoremap <silent> gd :YcmCompleter GoTo<CR> " Go to definition

" Go to the definition in a vertical split (Peek Definition alternative)
nnoremap <silent> <leader>pd :vsp<CR>:YcmCompleter GoTo<CR> " Peek definition (open in vertical split)

" Show documentation for the symbol under the cursor
nnoremap <silent> K :YcmCompleter GetDoc<CR> " Show documentation (Hover)

" Find all references of the symbol under the cursor
nnoremap <silent> gr :YcmCompleter GoToReferences<CR> " Find references

" Rename all instances of the symbol under the cursor
nnoremap <silent> <leader>rn :YcmCompleter RefactorRename<CR> " Rename symbol

nnoremap <silent> <leader>c :pclose<CR> " Close preview window

" Other types of fuzzer searchers
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>

" Ensure we can copy to system clipboard
nmap <leader>y <Plug>OSCYankOperator
vmap <leader>y <Plug>OSCYankVisual
nmap <leader>yy <leader>y_

" Remap Ctrl + Arrow Down to scroll down 15 lines in Normal mode
nnoremap <C-Down> 15j

" Remap Ctrl + Arrow Up to scroll up 15 lines in Normal mode
nnoremap <C-Up> 15k

" Remap Ctrl + Arrow Down to extend the selection down 15 lines in Visual mode
vnoremap <C-Down> 15j

" Remap Ctrl + Arrow Up to extend the selection up 15 lines in Visual mode
vnoremap <C-Up> 15k

" Remap Ctrl+Backspace to delete the word before the cursor in insertmode
inoremap <Esc>[1;5H <Esc>daw<Esc>i

" Remap Ctrl+Shift+Right to move to the end of the line to the right of the
" cursor
noremap <C-S-Right> $
inoremap <C-S-Right> <Esc>$<Esc>i

" Remap Ctrl+Shift+Left to move to the end of the line to the left of the
" cursor
noremap <C-S-Left> 0

" Show available code actions
nmap <leader>a <Plug>(coc-codeaction)

" Show code actions for the current line
nmap <leader>ca <Plug>(coc-codeaction-line)

" Apply auto action:
nmap <leader>qf <Plug>(coc-fix-current)

" Accept Copilot Suggestion (like pressing Tab in VSCode)
imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")

" Show the next suggestion (like pressing Alt + ] in VSCode)
imap <silent><script><expr> <C-]> copilot#Next()

" Show the previous suggestion (like pressing Alt + [ in VSCode)
imap <silent><script><expr> <C-[> copilot#Previous()

" Dismiss the current suggestion
imap <silent><script><expr> <C-\> copilot#Dismiss()


" Don't load me if there's no ctags file
if !executable('ctags')
    let g:gutentags_dont_load = 1
endif

" Custom theme
highlight Comment ctermfg=LightYellow guifg=#d7af5f
highlight Directory ctermfg=Yellow guifg=#f1c40f
highlight Pmenu ctermbg=234 ctermfg=250 guibg=#2d2d2d guifg=#d3d3d3
highlight PmenuSel ctermbg=237 ctermfg=White guibg=#3e3e3e guifg=#ffffff
highlight PmenuSbar ctermbg=240 guibg=#4e4e4e
highlight PmenuThumb ctermbg=250 guibg=#d3d3d3
" For newer LSPs (Neovim 0.6+)
highlight DiagnosticError ctermfg=Red ctermbg=NONE guifg=#ff6b6b guibg=NONE
highlight DiagnosticWarn ctermfg=Yellow ctermbg=NONE guifg=#ffdd57 guibg=NONE

" For older LSPs and backward compatibility
highlight LspDiagnosticsDefaultError ctermfg=Red ctermbg=NONE guifg=#ff6b6b guibg=NONE
highlight LspDiagnosticsDefaultWarning ctermfg=Yellow ctermbg=NONE guifg=#ffdd57 guibg=NONE

" Underline errors and warnings (optional)
highlight DiagnosticUnderlineError gui=underline guisp=#ff6b6b
highlight DiagnosticUnderlineWarn gui=underline guisp=#ffdd57

" General Vim error and warning colors (for good measure)
highlight Error ctermfg=Red ctermbg=NONE guifg=#ff6b6b guibg=NONE
highlight WarningMsg ctermfg=Yellow ctermbg=NONE guifg=#ffdd57 guibg=NONE

" For coc.nvim error and warning highlights
highlight CocErrorSign ctermfg=Red guifg=#ff6b6b
highlight CocWarningSign ctermfg=Yellow guifg=#ffdd57
highlight CocErrorHighlight cterm=underline gui=underline guisp=#ff6b6b
highlight CocWarningHighlight cterm=underline gui=underline guisp=#ffdd57

" For ALE error and warning highlights
highlight ALEErrorSign ctermfg=Red guifg=#ff6b6b
highlight ALEWarningSign ctermfg=Yellow guifg=#ffdd57
highlight ALEError ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ff6b6b
highlight ALEWarning ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=#ffdd57

" For YouCompleteMe error and warning highlights
highlight YcmErrorSign ctermfg=Red guifg=#ff6b6b
highlight YcmWarningSign ctermfg=Yellow guifg=#ffdd57
highlight YcmErrorText ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ff6b6b
highlight YcmWarningText ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=#ffdd57

" For nvim-treesitter error and warning highlights
highlight TSWarning ctermfg=Yellow guifg=#ffdd57
highlight TSError ctermfg=Red guifg=#ff6b6b

colorscheme industry

