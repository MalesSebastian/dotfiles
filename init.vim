" Don't try to be vi compatible 
set nocompatible
" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" Vim-plug
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Color scheme
Plug 'nanotech/jellybeans.vim'

" Nerd tree
Plug 'scrooloose/nerdtree'

" Vim airline
Plug 'bling/vim-airline'

" Vim airline theme
Plug 'vim-airline/vim-airline-themes'

" Autocomplete framework
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-clang'

" Indentline 
Plug 'yggdroot/indentline'

" PEP8 checker
Plug 'scrooloose/syntastic'

" Markdown plugins
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Fugitive vim
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

" End of Vim-plug

" For plugins to load correctly
filetype plugin indent on

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=2
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" Colorscheme
colorscheme jellybeans
" Airline colorscheme
let g:airline_theme='jellybeans'

" Open nerd tree if dir is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 
    \ && isdirectory(argv()[0]) && !exists("s:std_in") | 
    \ exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open nerd tree if press Ctrl + N
map <C-n> :NERDTreeToggle<CR>

" Stop vim from adding annoying comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Switch between windows with CTRL + direction key
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

" Highlight overlength line
highlight OverLength ctermbg=red ctermfg=black guibg=#592929
let s:activatedh = 0 
function! ToggleH()
    if s:activatedh == 0
        let s:activatedh = 1
        match OverLength /\%80v.\+/
    else
        let s:activatedh = 0 
        match none
    endif
endfunction
nnoremap <F8> :call ToggleH()<CR>

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Autocomplete settings
set shortmess+=c
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set modifable for nerdtree
set modifiable
