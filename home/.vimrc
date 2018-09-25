set nocompatible
filetype off

if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
end

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline' " status line
Plug 'bling/vim-bufferline' " buffers in status line
Plug 'Yggdroot/indentLine'

" colourschemes
Plug 'tpope/vim-vividchalk'
Plug 'vim-scripts/miko'
Plug 'gmarik/ingretu'

Plug 'scrooloose/nerdtree' " file manager
Plug 'sjl/gundo.vim' " undo tree

Plug 'tpope/vim-fugitive' " git integration
Plug 'mhinz/vim-signify' " show changes in git repo

Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim' " Gist

" lang support
Plug 'JuliaLang/julia-vim' " Julia
Plug 'hylang/vim-hy'
Plug 'luochen1990/rainbow'
Plug 'rust-lang/rust.vim'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'tweekmonster/deoplete-clang2'
    Plug 'sebastianmarkow/deoplete-rust'
endif

"tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

" To learn
" Plug 'Lokaltog/vim-easymotion'
" Plug 'SirVer/ultisnips' or 'Shougo/neosnippet.vim'

call plug#end()

filetype plugin indent on
syntax on
set fileencoding=utf8 encoding=utf8
set background=dark
colorscheme vividchalk

autocmd FileType * set tabstop=2 shiftwidth=2 expandtab
autocmd Filetype python set tabstop=8 shiftwidth=4 expandtab

let g:deoplete#enable_at_startup = 1

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

let g:deoplete#sources#rust#racer_binary='/home/krcz/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/krcz/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

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

let g:rainbow_active = 1
let g:rainbow_conf = {
\    'ctermfgs': [15, 33, 196, 240, 161, 11],
\    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\    'operators': '_,_',
\    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold']
\}

let g:tex_conceal = ""
