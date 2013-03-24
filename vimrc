set nocompatible " Vim, not Vi.

" Powerline
set guifont=PowerlineSymbols\ for\ Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2

" Disable arrow keys *shock* *horror*!
"inoremap  <up>     <nop>
"inoremap  <down>   <nop>
"inoremap  <left>   <nop>
"inoremap  <right>  <nop>
"noremap   <up>     <nop>
"noremap   <down>   <nop>
"noremap   <left>   <nop>
"noremap   <right>  <nop>

syntax on
set background=dark
" set background=light
colorscheme solarized
" colorscheme molokai

" Use pathogen to manage plugins
call pathogen#infect()

set ruler
set number
" set relativenumber " Line numbers relative to your position
"set cursorline
set incsearch " Search for text as you enter it
" set tabstop=2
" set shiftwidth=2
set tabstop=4
set shiftwidth=4
set expandtab
set guifont=Consolas:h12
set smartindent
set autoindent
set splitbelow " Split windows below current window
set hlsearch " Turn on search highlighting
" set nohls " Turn off search highlighting
" set winwidth=79
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

" Indent Guides options
let g:indent_guides_color_change_percent = 4 " default 10
let g:indent_guides_start_level = 2 " default 1

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

" Map ,nt and ,q to NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>
nmap <leader>q :NERDTreeToggle <CR>

" Show hidden files in NERDTree (except .DS_Store)
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$']

" Disable NERDTree showing on startup
" let NERDTreeHijackNetrw=0

" Auto change directory to that of file in the buffer
" Interferes with PeepOpen
"autocmd BufEnter * cd %:p:h

" Change splits easier with ,w
nmap <leader>w <C-W><C-W>

" Delete previous word with Ctrl+Backspace
imap <C-BS> <c-w>

" Run 'SortCSS' to alphabetise all properties
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPS (mostly from garybernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make j and k work by screen line, not file line
nnoremap j gj
nnoremap k gk

" Open .vimrc file in vsp with ,ev
" nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>ev :topleft 40 :split $MYVIMRC<cr>

" Clear search buffer on return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr><cr>:<backspace>
endfunction
call MapCR()

" Switch between to files
nnoremap <leader><leader> <c-^>

" Move around splits wither <c-hjkl>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Map jj to Esc to exit out of Insert mode easier 
"inoremap jj <ESC>

nmap <leader>bv :bel vsp 
cmap bv bel vsp 

" Save when losing focus
" au FocusLost * :wa

" Hide MacVim toolbar by default
set go-=T

" .less CSS styling
au BufNewFile,BufRead *.less set filetype=less

" Write with sudo
cmap w!! %!sudo tee > /dev/null %

" Change pwd to that of current file
cmap acd cd %:p:h

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS (mostly from garybernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass 

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Indent p tags
  autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  " Source .vimrc file after save
  autocmd BufWritePost $MYVIMRC so $MYVIMRC
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

