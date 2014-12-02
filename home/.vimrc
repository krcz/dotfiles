set nocompatible
filetype off

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim' " package management

Plugin 'bling/vim-airline' " status line
Plugin 'bling/vim-bufferline' " buffers in status line
Plugin 'Yggdroot/indentLine'

" colourschemes
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-scripts/miko'
Plugin 'gmarik/ingretu'

Plugin 'scrooloose/nerdtree' " file manager
Plugin 'sjl/gundo.vim' " undo tree

Plugin 'tpope/vim-fugitive' " git integration
Plugin 'mhinz/vim-signify' " show changes in git repo

Bundle 'mattn/webapi-vim'
Plugin 'mattn/gist-vim' " Gist

" lang support
Plugin 'JuliaLang/julia-vim' " Julia
Plugin 'davidhalter/jedi-vim' " Python

" autocomplete
Plugin 'ervandew/supertab'

" To learn
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'SirVer/ultisnips' or 'Shougo/neosnippet.vim'

call vundle#end()

filetype plugin indent on
syntax on
set fileencoding=utf8 encoding=utf8
colorscheme miko

autocmd FileType * set tabstop=2 shiftwidth=2 expandtab
autocmd Filetype python set tabstop=8 shiftwidth=4 expandtab

" Show airline always
set laststatus=2

" autocomplete settings
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

nnoremap <silent> <C-left> <C-W>h
nnoremap <silent> <C-right> <C-W>l
nnoremap <silent> <C-up> <C-W>k
nnoremap <silent> <C-down> <C-W>j

let g:jedi#use_tabs_not_buffers = 0
