" vim configuration
set nocompatible
set backspace=indent,eol,start
set noerrorbells
set spelllang=en_us
set spell
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set timeoutlen=1000
set ttimeoutlen=0

" Enable syntax processing
filetype plugin on
syntax on

" Spaces & Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " tabs are spaces
set autoindent
set smartindent
set cindent

" UI configuration
set number relativenumber
set showcmd
set cursorline
set ruler
filetype indent on
set wildmenu
set lazyredraw
set showmatch

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" Yank/Copy
vnoremap <C-Y> "*yy

" Movement
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap ^ <Nop>
nnoremap $ <Nop>
nnoremap s <Nop>

" Leader Shortcuts
let mapleader=" "
nnoremap <leader>, :noh<CR>
inoremap jk <esc>

" Split Navigations
set splitbelow
set splitright
nnoremap <C-V> :vnew<Space>
nnoremap <C-Bslash> :new<Space>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap -v :vertical resize -2<CR>
nnoremap =v :vertical resize +2<CR>
nnoremap -h :resize -2<CR>
nnoremap =h :resize +2<CR>

" Tabs
nnoremap <C-T> :tabnew<Space>
" nnoremap <leader><tab> :e#<CR>
nnoremap close :bp<CR>:bd #<CR>
nnoremap exit :q<CR>
nnoremap sout :wq<CR>
nnoremap tclose :tabclose<CR>
nnoremap ,1 1gt<CR>
nnoremap ,2 2gt<CR>
nnoremap ,3 3gt<CR>
nnoremap ,4 3gt<CR>
nnoremap ,5 3gt<CR>
nnoremap ,6 3gt<CR>
nnoremap ,7 3gt<CR>
nnoremap ,8 3gt<CR>
nnoremap ,9 3gt<CR>

" Buffers
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'
    let g:vimwiki_list = [{'path': '~/vimwiki/',
                            \ 'syntax': 'markdown', 'ext': '.md'}]
Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'

call plug#end()

" Colorscheme
colorscheme dracula

" NERDTree Config
nnoremap <C-N> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | else | NERDTree | endif
let g:NERDTreeNaturalSort = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1

" Ale Config
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\}
let g:ale_fix_on_save = 1

" Fugitive Config
nnoremap gs :Git<CR>

" setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

function! FixSpellingError()
   set spell
   normal! mm[s1z=`m
endfunction

nnoremap <leader>sp :call FixSpellingError()<CR>
nnoremap <leader>srp :source %<CR>


" Run python sCRipts
imap <F5> <Esc>:w<CR>:!clear;python3 %<CR>
nmap <F5> <Esc>:w<CR>:!clear;python3 %<CR>
" autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:ter python3 "%"<CR>
autocmd Filetype python nnoremap <buffer> <Leader>r :w<CR>:vert ter python3 "%"<CR>

"autocmd Filetype html set omnifunc=htmlcomplete

" EMMET CONFIG
let g:user_emmet_leader_key=','
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
