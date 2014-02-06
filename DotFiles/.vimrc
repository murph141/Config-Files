" Enable coding syntax
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
syntax enable
map <UP> <nop>
map <DOWN> <nop>
map <LEFT> <nop>
map <RIGHT> <nop>
inoremap <UP> <nop>
inoremap <DOWN> <nop>
inoremap <LEFT> <nop>
inoremap <RIGHT> <nop>
set t_Co=256
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" Auto indent
filetype indent on
filetype plugin on

" Change indentation to 2 spaces instead of tabs
set expandtab
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set smartindent

" Misc
set incsearch
set hlsearch
set nu
set ruler
set wildmenu
set backspace=eol,start,indent
set smartcase
set showmatch
set mat=2
set magic
set wrap
set noswapfile
set noerrorbells visualbell t_vb=
set nocompatible

" Status line formatting
set viminfo='10,\"100,:20,%,n~/.viminfo
set statusline=%F%m%r%h%w\ \|\ Line:\ %l/%L[%p%%]\ \|\ Col:\ %v\ \|\ Format:\ %{&ff}\ \|\ Type:\ %Y
set laststatus=2
highlight StatusLine term=reverse ctermbg=White ctermfg=Black
highlight ModeMsg cterm=bold ctermfg=Magenta
