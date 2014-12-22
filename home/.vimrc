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
Plugin 'hylang/vim-hy'

" autocomplete
Plugin 'ervandew/supertab'

"tmux
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'

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

" Tmux line
let g:tmuxline_powerline_separators = 0

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#h',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : '%a',
      \'z'    : '%R'}

" autocomplete settings
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Support for tmux modified keys
" see: http://stackoverflow.com/questions/15445481/mapping-arrow-keys-when-running-tmux
if &term =~ '^screen' && exists('$TMUX')
  set mouse+=a
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
  " tmux will send xterm-style keys when xterm-keys is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
  execute "set <xHome>=\e[1;*H"
  execute "set <xEnd>=\e[1;*F"
  execute "set <Insert>=\e[2;*~"
  execute "set <Delete>=\e[3;*~"
  execute "set <PageUp>=\e[5;*~"
  execute "set <PageDown>=\e[6;*~"
  execute "set <xF1>=\e[1;*P"
  execute "set <xF2>=\e[1;*Q"
  execute "set <xF3>=\e[1;*R"
  execute "set <xF4>=\e[1;*S"
  execute "set <F5>=\e[15;*~"
  execute "set <F6>=\e[17;*~"
  execute "set <F7>=\e[18;*~"
  execute "set <F8>=\e[19;*~"
  execute "set <F9>=\e[20;*~"
  execute "set <F10>=\e[21;*~"
  execute "set <F11>=\e[23;*~"
  execute "set <F12>=\e[24;*~"
endif

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>

let g:jedi#use_tabs_not_buffers = 0
