set nocompatible 
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.Vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.Vim'
Plugin 'joshdick/onedark.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'glepnir/dashboard-nvim'
Plugin 'liuchengxu/vim-clap'
Plugin 'Yggdroot/indentLine'
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'
call vundle#end()               " required
filetype plugin indent on       " required

" various other settings
set mouse=a
set number
set relativenumber
set termguicolors
colorscheme onedark
set noshowmode
set autoindent
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
set smartcase
set ignorecase
set expandtab
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
let g:dashboard_default_header = 'evil'
let g:indentLine_fileTypeExclude = ['dashboard']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"" keybinds
" leader key
let mapleader = "\<Space>"
" keybinds
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>. :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
