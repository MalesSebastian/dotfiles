"VUNDLE STARTS HERE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder
Plugin 'junegunn/fzf.vim'

Plugin 'vim-airline/vim-airline' " Vim airline statusline
Plugin 'vim-airline/vim-airline-themes' " Plugin & themes

Plugin 'terryma/vim-multiple-cursors' " Multile cursors editing

Plugin 'flazz/vim-colorschemes' " Colorschemes pack to rule them all

Plugin 'scrooloose/nerdtree' " File explorer
Plugin 'Xuyuanp/nerdtree-git-plugin' " and its git support

Plugin 'ryanoasis/vim-devicons' " Icons for nerdtree

Plugin 'dense-analysis/ale' " Linter

Plugin 'leafgarland/typescript-vim' " Plugin to detect Typescript syntax

Plugin 'ycm-core/YouCompleteMe' " Autocomplete engine

Plugin 'pangloss/vim-javascript' " Better Javascript support

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" VUNDLE ENDS HERE
"
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=80	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use neither visual bell
set t_vb=	" nor beeping

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set cindent	" Use 'C' style program indenting
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

set ruler	" Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" Colorscheme
set background=dark
syntax enable
colorscheme dracula

" Airline settings
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='dracula'

" Nerd tree config
map <C-x> :NERDTreeToggle<CR>

" Split and tab settings
" Switch between windows with CTRL + direction key
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

" Map next and previous tab
map <F9> :tabp<CR>
map <F10> :tabn<CR>

" Split more naturally
set splitbelow
set splitright
" Linters of ALE
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'python': ['autopep8', 'flake8'],
\   'C': ['gcc'],
\   'C++': ['gcc']
\}
let g:ale_linters_explicit = 1
" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Javascript indent
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab
" Typescript indent
autocmd FileType typescript setlocal shiftwidth=4 tabstop=4 softtabstop=0 expandtab
