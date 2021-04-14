
" vim configuration
set nocompatible

" --- Begin the plugging
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'enter': 'tab split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS="--bind \"ctrl-n:preview-down,ctrl-p:preview-up\""
let g:fzf_buffers_jump = 1
let g:fzf_nvim_statusline = 0
let g:fzf_layout = { 'down': '~40%' }
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--info=inline', '--preview', '~/.config/nvim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
nnoremap <silent> <C-F> :Files<CR>
nnoremap <silent> <C-B> :BLines<CR>
nnoremap <silent> <C-G> :Rg<CR>

Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=1
let g:tex_conceal='abdmg'

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dracula/vim',{'as':'dracula'}

Plug 'junegunn/seoul256.vim'
let g:seoul256_background = 235

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key = ','

Plug 'tpope/vim-fugitive'
nnoremap gs :Git<CR>

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-commentary'
nnoremap <C-C> :Commentary<CR>
vnoremap <C-C> :Commentary<CR>

Plug 'jiangmiao/auto-pairs'
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'preservim/nerdtree'
nnoremap <C-N> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | else | NERDTree | endif
let g:NERDTreeNaturalSort = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1

Plug 'dense-analysis/ale'
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\}
let g:ale_fix_on_save = 1

Plug 'vimwiki/vimwiki'
    let g:vimwiki_list = [{'path': '~/vimwiki/',
                            \ 'syntax': 'markdown', 'ext': '.md'}]

call plug#end()

" --- Enable Syntax Processing
filetype plugin on
filetype indent on
syntax on

vnoremap <C-Y> "*yy

" --- Spaces & Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " tabs are spaces
set autoindent
set smartindent
set cindent

" --- UI Configuration
set number relativenumber
set showcmd
set cursorline
set ruler
set wildmenu
set lazyredraw
set showmatch
set splitbelow
set splitright
colorscheme seoul256

" --- Searching Configuration
set incsearch
set hlsearch
set ignorecase
set smartcase

" --- Vim Configuration
set backspace=indent,eol,start
set noerrorbells
set spelllang=en_us
set spell
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
let mapleader=" "

" --- Key Remapping
inoremap jk <ESC>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" --- Movement
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap ^ <NOP>
nnoremap $ <NOP>
nnoremap s <NOP>

" --- Split Navigations
nnoremap <C-V> :vnew<SPACE>
nnoremap <C-Bslash> :new<SPACE>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <RIGHT> :vertical resize -2<CR>
nnoremap <LEFT> :vertical resize +2<CR>
nnoremap <UP> :resize -2<CR>
nnoremap <DOWN> :resize +2<CR>

" --- Tabs
nnoremap <C-T> :tabnew<SPACE>
nnoremap <TAB> gt
nnoremap <S-TAB> gT
nnoremap <C-W> :bd<CR>

" --- Functions
nnoremap <leader>srp :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>, :noh<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <F5> :call ToggleColorScheme()<CR>
inoremap <F3> <C-R>=strftime("%b %d %Y")<CR>

function! ToggleColorScheme()
    if (g:colors_name == "dracula")
        colorscheme seoul256
    else
        colorscheme dracula
    endif
endfunction
