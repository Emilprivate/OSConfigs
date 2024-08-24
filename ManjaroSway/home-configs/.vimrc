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

