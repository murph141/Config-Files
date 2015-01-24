" Initial Setup
syntax enable
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
set t_Co=256
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" Auto indent
filetype indent on
filetype plugin on

" Change indentation
au FileType c setl sw=2 sts=2
au FileType python setl sw=4 sts=4
set expandtab
set autoindent
set smartindent

" Key Mappings
map <UP> <nop>
map <DOWN> <nop>
map <LEFT> <nop>
map <RIGHT> <nop>
inoremap <UP> <nop>
inoremap <DOWN> <nop>
inoremap <LEFT> <nop>
inoremap <RIGHT> <nop>

" Misc
set backspace=eol,start,indent
set hlsearch
set incsearch
set magic
set mat=2
set nocompatible
set noerrorbells visualbell t_vb=
set noswapfile
set nu
set ruler
set showmatch
set smartcase
set wildmenu
set wrap

" Status line formatting
set statusline=%F%m%r%h%w\ \|\ Line:\ %l/%L[%p%%]\ \|\ Col:\ %v\ \|\ Format:\ %{&ff}\ \|\ Type:\ %Y
set laststatus=2
set viminfo='10,\"100,:20,%,n~/.viminfo
highlight ModeMsg cterm=bold ctermfg=Magenta
highlight StatusLine term=reverse ctermbg=White ctermfg=Black
