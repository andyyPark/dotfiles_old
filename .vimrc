" vim configuration
set nocompatible
set backspace=indent,eol,start

" Color Scheme
colorscheme slate

" Enable syntax processing
syntax on

" Spaces & Tabs
set tabstop=2
set softtabstop=2
set expandtab " tabs are spaces
set shiftwidth=2
set autoindent
set smartindent
set cindent

" UI configuration
set number
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase
let mapleader=" "
nnoremap <leader>, :noh<cr>

" Movement
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>
nnoremap s <nop>

" Leader Shortcuts
let mapleader=" "
inoremap jk <esc>

" Split Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <leader><tab> :e#<cr>
nnoremap close :bp<cr>:bd #<cr>
nnoremap exit :q<cr>
nnoremap sout :wq<cr>
nnoremap tclose :tabclose<cr>
nnoremap ,1 1gt<cr>
nnoremap ,2 2gt<cr>
nnoremap ,3 3gt<cr>
nnoremap ,4 3gt<cr>
nnoremap ,5 3gt<cr>
nnoremap ,6 3gt<cr>
nnoremap ,7 3gt<cr>
nnoremap ,8 3gt<cr>
nnoremap ,9 3gt<cr>
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

set splitbelow
set splitright

call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    let g:vimtex_fold_enabled = 0

Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsSnippetDirectories=["/Users/andypark/.vim/plugged/ultisnips", "UltiSnips"]
    let g:UltiSnipsEditSplit="vertical"

Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'

Plug 'preservim/nerdtree'

" setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
call plug#end()


" Plugins
function! FixSpellingError()
  normal! mm[s1z=`m
endfunction
nnoremap <leader>sp :call FixSpellingError()<cr>
nnoremap <leader>srp :source %<cr>

"  NerdTree
"autocmd VimEnter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
