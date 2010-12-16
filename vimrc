set nocompatible " Vim, not Vi. Must be at top

" Disable arrow keys *shock* *horror*!
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

syntax on
colorscheme molokai 

set nobackup
set ruler
set number
"set relativenumber " Line numbers relative to your position
set incsearch " Search for text as you enter it
set tabstop=2
set shiftwidth=2
set guifont=Monaco:h12
set smartindent
set autoindent
set splitbelow " Split windows below current window
"set hlsearch " Turn on search highlighting
set nohls " Turn off search highlighting
set foldenable
set ignorecase " Case insensitive
set smartcase " All lower case string = case-insenstive; any uppercase chars = case-senstive

" Command auto-complete
set wildmenu
set wildmode=list:longest " File/dir autocomplete

" Set , as leader
let mapleader = ","

" Map spacebar to :
nmap <space> :

" Shortcut to htdocs folder with ,ht
nmap <leader>ht :cd /Applications/XAMPP/htdocs <CR>

" Shortcut to user dir with ,hm
nmap <leader>hm :cd ~/ <CR>

" Source .vimrc file after save
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Map ,nt to NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Auto change directory to that of file in the buffer
autocmd BufEnter * cd %:p:h

" Change ZenCoding plugin key to Ctrl+E (was Ctrl-Y + ,)
let g:user_zen_leader_key = '<C-e>'

" Delete previous word with Ctrl+Backspace
imap <C-BS> <c-w>

" Run 'SortCSS' to alphabetise all properties
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort

" Open .vimrc file in vsp with ,ev
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Map jj to Esc to exit out of Insert mode easier 
inoremap jj <ESC>

nmap <leader>bv :bel vsp 

" Save when losing focus
"au FocusLost * :wa
