" Plugins {{{
filetype off " required
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lambdalisue/vim-pyenv',
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-unimpaired'
Plug 'thinca/dockerfile-vim'
Plug 'Keithbsmiley/rspec.vim', { 'for': 'ruby' }
Plug 'kien/ctrlp.vim'
Plug 'maralla/completor.vim'
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-consul'
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-vagrant'
Plug 'cespare/vim-toml'
Plug 'junegunn/vim-emoji'
Plug 'w0rp/ale'
Plug 'leafgarland/typescript-vim'
call plug#end()
" }}}
" Whitespace {{{
set tabstop=4     " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4  " number of spaces to move with <</>>
" set textwidth=80
set expandtab     " tabs are spaces
set smarttab      " make <tab> insert indents correctly based on vim settings
set list lcs=tab:\|\
" }}}
" Colours {{{
set background=dark
colorscheme jellybeans
" }}}
" UI {{{
set nocompatible   " Use Vim defaults instead of 100% vi compatibility
set history=50     " keep 50 lines of command line history
set number         " show line numbers
set cursorline     " highlight current line
set showmatch      " Show matching brackets.
set ruler          " show the cursor position all the time
filetype plugin indent on
" lower priority extensions for tab completion
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" }}}
" Syntax {{{
syntax on
" Recognize exact file names as file types
au BufRead,BufNewFile {Gemfile,Vagrantfile,Berksfile} set ft=ruby
au BufRead,BufNewFile *.sls set ft=yaml
" }}}
" Searching {{{
set incsearch  " search as characters are entered
set hlsearch   " highlight searches
set ignorecase " Do case insensitive matching
set smartcase  " Do smart case matching
" }}}
" Folding {{{
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nexted folds max
nnoremap <space> za
set foldmethod=indent " default to indent folding
" should bind zr and zm to something. if only it was toggleable
" }}}
" Misc {{{
set modelines=1                    " allow per-file vim configs
set lazyredraw                     " redraw when needed. speeds up macros
set backspace=indent,eol,start     " more powerful backspacing
set swapfile
set dir=~/.local/tmp
"autocmd BufWritePre * :%s/\s\+$//e " auto-remove trailing whitespace
" jump to last position in file
if has('autocmd')
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Disable mouse selection
set mouse-=a

" Make vim work on a mac
nmap <Esc>b <S-Left>
nmap <Esc>f <S-Right>

" Add ctrl+a/ctrl+e like in bash for 10keyless
nmap <C-a> <Home>
nmap <C-e> <End>

" Add W command to save as root
command W :execute ':silent w !sudo tee % > /dev/null' <bar> :edit!

" }}}

" Per-plugin configs
" NERDTree {{{
nmap <F8> :NERDTreeToggle<CR>
nmap <s-F8> :NERDTreeFind<CR>

" }}}
" vim-pyenv {{{
let g:pyenv#auto_activate = 1
" }}}
" Airline {{{
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
" }}}
" Tagbar {{{
let g:tagbar_autoclose = 1
let g:tagbar_type_puppet = {
    \ 'ctagstype': 'puppet',
    \ 'kinds': [
        \'c:class',
        \'s:site',
        \'n:node',
        \'d:definition'
      \]
    \}

" Tab control keys
nmap <F9> :TagbarToggle<CR>
" }}}
" signify {{{
let g:signify_vcs_list = ['git'] " Ignore other VCS; improves load speed on non-VCS files being edited
" }}}
" C9 {{{
    autocmd BufRead,BufNewFile ~/git/newclient/* set expandtab
" }}}

" vim:foldmethod=marker:foldlevel=0
