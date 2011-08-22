set nocompatible " Vim, not Vi.

" Disable arrow keys *shock* *horror*!
"inoremap  <up>     <nop>
"inoremap  <down>   <nop>
"inoremap  <left>   <nop>
"inoremap  <right>  <nop>
"noremap   <up>     <nop>
"noremap   <down>   <nop>
"noremap   <left>   <nop>
"noremap   <right>  <nop>

" Make j and k work by screen line, not file line
nnoremap j gj
nnoremap k gk

syntax on
" colorscheme rdark
set background=light
colorscheme solarized

" Use pathogen to manage plugins
call pathogen#runtime_append_all_bundles()

set ruler
"set number
set relativenumber " Line numbers relative to your position
"set cursorline
set incsearch " Search for text as you enter it
" set tabstop=2
" set shiftwidth=2
set tabstop=4
set shiftwidth=4
" set expandtab
set guifont=M+\ 1m:h11
set smartindent
set autoindent
set splitbelow " Split windows below current window
"set hlsearch " Turn on search highlighting
set nohls " Turn off search highlighting
set foldenable
set ignorecase " Case insensitive
set smartcase " All lower case string = case-insenstive; any uppercase chars = case-senstive
:filetype plugin on " Required for snipMate

" Persistent undo, swap file directory and no backup files
set nobackup
set undofile
set undodir=~/.bin/dotfiles/vim/tmp/undo
set directory=~/.bin/dotfiles/vim/tmp/swap

" EnhancedCommentify script options
let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyPretty = 'Yes'
let g:EnhCommentifyUseSyntax = 'Yes'

" Command auto-complete
set wildmenu
set wildmode=list:longest " File/dir autocomplete

" Code completion
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP

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

" Map ,nt and ,q to NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>
nmap <leader>q :NERDTreeToggle <CR>

" Show hidden files in NERDTree (except .DS_Store)
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$']

" Auto change directory to that of file in the buffer
" Interferes with PeepOpen
"autocmd BufEnter * cd %:p:h

" Change splits easier with ,w
nmap <leader>w <C-W><C-W>

" Delete previous word with Ctrl+Backspace
imap <C-BS> <c-w>

" Run 'SortCSS' to alphabetise all properties
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort

" Open .vimrc file in vsp with ,ev
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Map jj to Esc to exit out of Insert mode easier 
"inoremap jj <ESC>

nmap <leader>bv :bel vsp 
cmap bv bel vsp 

" Save when losing focus
au FocusLost * :wa

" Hide MacVim toolbar by default
set go-=T

" .less CSS styling
au BufNewFile,BufRead *.less set filetype=less

" Write with sudo
cmap w!! %!sudo tee > /dev/null %

" Change pwd to that of current file
cmap acd cd %:p:h
