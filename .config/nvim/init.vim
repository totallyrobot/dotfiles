set nocompatible 
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.Vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.Vim'
Plugin 'totallyrobot/onedark.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Raimondi/delimitMate'
Plugin 'glepnir/dashboard-nvim'
Plugin 'junegunn/fzf.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'Shougo/denite.nvim'
Plugin 'Shougo/unite.vim'
Plugin 'liuchengxu/vim-which-key'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-commentary'
Plugin 'vbe0201/vimdiscord'
Plugin 'skanehira/badapple.vim'
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
set shell=/usr/bin/env\ zsh

" map for vim-which-key
let g:which_key_map = {}

let g:which_key_map.w = {
                        \ 'name': '+window',
                        \ 's': {
                        \       'name': '+splits',
                        \       'v': 'vertical-split',
                        \       'h': 'horizontal-split',
                        \ },
                        \}

let g:which_key_map.c = {
                        \ 'name': '+config-files',
                        \ 'w': 'i3-config',
                        \ 'v': 'neovim-config',
                        \ 'z': {
                        \       'name': '+zsh',
                        \       'z': 'zsh-config',
                        \       'p': 'p10k-config',
                        \ },
                        \ 'a': 'alacritty-config',
                        \ 'p': 'polybar-config',
                        \ 'c': 'picom-config',
                        \ 'r': 'rofi-config'
                        \}

let g:which_key_map.p = {
                        \ 'name': '+plugins',
                        \ 'i': 'install-plugins',
                        \ 'c': 'remove-unneeded-plugins',
                        \ 'u': 'update-plugins',
                        \}

let g:which_key_map.n = 'new-file'

let g:which_key_map.g = {
                        \ 'name': '+git',
                        \ 'c': {
                        \       'name': '+commit',
                        \       'a': 'commit-all',
                        \       'c': 'commit-normal',
                        \ },
                        \ 'a': {
                        \       'name': '+add',
                        \       '.': 'add-everything',
                        \       'f': 'add-file',
                        \ },
                        \}

let g:which_key_map.e = {
                        \ 'name': '+editor',
                        \ 'n': 'toggle-nerdtree',
                        \ 'c': 'comment-line',
                        \ 'g': {
                        \       'name': '+gitgutter',
                        \       'g': 'toggle-gitgutter',
                        \       '0': 'disable-gitgutter',
                        \       '1': 'enable-gitgutter',
                        \ },
                        \}

let g:which_key_map.f = {
                        \ 'name': '+files',
                        \ 'h': 'history',
                        \}

let g:dashboard_custom_header = readfile(getenv('HOME') . '/stuff/dragon_noColor.txt')
let g:dashboard_default_executive = 'fzf'

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ""
let g:airline_right_sep = ""

let g:dashboard_default_header = 'evil'
let g:indentLine_fileTypeExclude = ['dashboard']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

call which_key#register('<Space>', "g:which_key_map")

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler nonumber norelativenumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number relativenumber


"" keybinds
set timeoutlen=0
" leader key
let mapleader = "\<Space>"
" keybinds
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>. :Files<CR>
nnoremap <silent> <Leader>n :DashboardNewFile<CR>:echom ''<CR>
" windows
"" splits 
nnoremap <silent> <Leader>wsh :vs<CR>:echom ''<CR>
nnoremap <silent> <Leader>wsv :sp<CR>:echom ''<CR>
" plugins
nnoremap <silent> <Leader>pi :PluginInstall<CR>:echom ''<CR>
nnoremap <silent> <Leader>pu :PluginUpdate<CR>:echom ''<CR>
nnoremap <silent> <Leader>pc :PluginClean<CR>:echom ''<CR>
" editor
"" NERDTree
nnoremap <silent> <Leader>en :NERDTreeToggle<CR>:echom ''<CR>
"" gitgutter
nnoremap <silent> <Leader>egg :GitGutterToggle<CR>:echom ''<CR>
nnoremap <silent> <Leader>eg1 :GitGutterEnable<CR>:echom ''<CR>
nnoremap <silent> <Leader>eg0 :GitGutterDisable<CR>:echom ''<CR>
"" vim-commentary
nnoremap <silent> <Leader>ec :Commentary<CR>:echom ''<CR>
" config files
nnoremap <silent> <Leader>cv :edit $HOME/.config/nvim/init.vim<CR>:echom ''<CR>
nnoremap <silent> <Leader>cw :edit $HOME/.config/i3/config<CR>:echom ''<CR>
nnoremap <silent> <Leader>czz :edit $HOME/.zshrc<CR>:echom ''<CR>
nnoremap <silent> <Leader>czp :edit $HOME/.p10k.zsh<CR>:echom ''<CR>
nnoremap <silent> <Leader>ca :edit $HOME/.config/alacritty/alacritty.yml<CR>:echom ''<CR>
nnoremap <silent> <Leader>cr :edit $HOME/.config/rofi/config.rasi<CR>:echom ''<CR>
nnoremap <silent> <Leader>cp :edit $HOME/.config/polybar/config<CR>:echom ''<CR>
nnoremap <silent> <Leader>cc :edit $HOME/.config/picom.conf<CR>:echom ''<CR>
" git
nnoremap <silent> <Leader>gca :Git add .<CR>:Git commit<CR>
nnoremap <silent> <Leader>gcc :Git commit<CR>
nnoremap <silent> <Leader>ga. :Git add .<CR>:echom ''<CR>
nnoremap <silent> <Leader>gaf :execute 'Git add '.input('File to add: ')<CR>:echom ''<CR>
