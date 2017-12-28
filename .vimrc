set nocompatible

" Automatic installation (https://github.com/junegunn/vim-plug/wiki/faq#automatic-installation)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source 
endif

call plug#begin('~/.vim/plugged')

" base
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" web - frontend
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'

" python
Plug 'klen/python-mode'
Plug 'sirver/ultisnips'
Plug 'davidhalter/jedi-vim'


call plug#end()

filetype plugin on

let g:mapleader=','

syntax on
colorscheme gruvbox
set background=dark " цвет фона
set number          " показать номера строк

" настройка отступов
set expandtab
set smarttab
set tabstop=2       " табуляция отображаеться как 2 пробела
set shiftwidth=2
filetype plugin indent on 

set hlsearch        " подсветка результатов поиска по /

" NERDTree
let NERDTreeIgnore = ['\.pyc$']
map <C-n> :NERDTreeToggle<CR>

"
map <Leader> <Plug>(easymotion-prefix)

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" vim-javascript
let g:javascript_plugin_jsdoc = 1 " Enable syntax highlighting for JSDocs
