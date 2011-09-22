" Autoload modules
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" Basic configuration
set nocompatible
set number
"set mouse=a
inoremap jj <ESC>

" Tab settings
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

" Color and theme
set t_Co=256
syntax on
colorscheme twilight

" Textmate compatibility
set list
set listchars=tab:▸\ ,eol:¬

" Search tweaks
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Fix line wrapping
set nowrap
set textwidth=80
set formatoptions=qrn1
" set colorcolumn=85

" Code Folding
set foldmethod=indent
set foldlevel=99

" Remove trailing whitespace
:nnoremap <leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
