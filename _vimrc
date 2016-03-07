set nocompatible
filetype off
set ic
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
let path='~/.vim/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" git wrapper for vim
Plugin 'tpope/vim-fugitive'
" NERDTREE is the folder view for vim
Plugin 'https://github.com/scrooloose/nerdtree.git'
" JSON pretty print and higlight
Plugin 'https://github.com/elzr/vim-json.git'
" Pretty print json
Plugin 'git://github.com/tpope/vim-jdaddy.git'
" ctrl-p fuzzy finder better then command-t because it doesn't demand ruby
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

" All of your Plugins must be added before the following line
call vundle#end()            " require
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nu
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=LightGrey
:map <F1>m :%s/\r//g
set enc=utf-8

let g:pydiction_location = 'C:/vim/vimfiles/ftplugin/pydiction/complete-dict'
" set guifont=Consolas:h11:cANSI
set guifont=DejaVu_Sans_Mono:h10:cANSI
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
" Show " in json files. This is from vim-json
let g:vim_json_syntax_conceal = 0
set noruler
set laststatus=2
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset


function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
