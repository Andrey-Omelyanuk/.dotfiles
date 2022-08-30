set shell=/bin/bash 
set nocompatible " отключаем обратную совместимость с vi
set clipboard=unnamedplus " теперь мы можем копировать/вставлять инфу из-вне вима
set nowrap

" Automatic installation (https://github.com/junegunn/vim-plug/wiki/faq#automatic-installation)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source 
endif

call plug#begin('~/.vim/plugged')
" base
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} "
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'Shougo/deol.nvim'
"Plug 'vim-scripts/vim-auto-save'
" web - frontend
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'herringtondarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript' 

Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'posva/vim-vue'
" python
Plug 'klen/python-mode'
Plug 'sirver/ultisnips'
Plug 'davidhalter/jedi-vim'
call plug#end()

set encoding=utf-8 
filetype plugin indent on " включаем определение типа файла и загрузку соответствующих ему плагинов и файлов отступов

let g:mapleader=','


syntax on " подсветка синтаксиса
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox 
" let g:gruvbox_italic=1
set background=dark " цвет фона
"set background=light " цвет фона

set number          " показать номера строк

set backupcopy=yes  " иначе webpack не видит обновление файла
" настройка отступов
set expandtab
set smarttab
set tabstop=2       " табуляция отображаеться как 2 пробела
set shiftwidth=2
filetype plugin indent on 

set hlsearch        " подсветка результатов поиска по /

set nofoldenable    " disable folding

" NERDTree
let NERDTreeIgnore = ['\.pyc$']
map <C-n> :NERDTreeToggle<CR>

"
map <Leader> <Plug>(easymotion-prefix)

" we need this for vue pluging
autocmd FileType vue syntax sync fromstart

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" vim-javascript
let g:javascript_plugin_jsdoc = 1 " Enable syntax highlighting for JSDocs

" vim-auto-save - off because I have frezzes!
"let g:auto_save = 1  " enable AutoSave on Vim startup
"let g:auto_save_in_insert_mode = 1
"let g:auto_save_silent = 1 " do not display the auto-save notification

