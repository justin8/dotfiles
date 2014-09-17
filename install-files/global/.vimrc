set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles!
" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
Bundle 'davidhalter/jedi-vim'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'chrisbra/csv.vim'
Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-unimpaired'

" This is disabled because for some reason it asks for a username/password for
" https://github.com?
"Bundle 'nanotech/jellybeans'

set nocompatible                " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" trim trailing whitespace for python files (pep8)
autocmd BufWritePre *.py :%s/\s\+$//e

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd            " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set hlsearch            " Highlight searches. <C-L> to temprorarily turn off
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
"set incsearch          " Incremental search
"set autowrite          " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a            " Enable mouse usage (all modes)

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

colorscheme jellybeans

" Whitespace settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
" set textwidth=80
set smarttab
set expandtab

" Plugin customizations

" Reverse supertab completion order to be top-down
let g:SuperTabDefaultCompletionType = "<c-n>"

" Linting!
let g:syntastic_enable_perl_checker = 1
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_yaml_checkers=['yamlxs']
let g:syntastic_zsh_checkers=['zsh']
let g:syntastic_sh_checkers=['shellcheck']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_puppet_checkers=['puppet']
let g:syntastic_python_flake8_args = "--max-line-length=500"

" Statusline
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

" Tagbar
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
nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>
nmap <leader>o :Tagbar<CR>

set relativenumber
