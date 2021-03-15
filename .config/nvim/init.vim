call plug#begin(stdpath('data') . '/plugged')
Plug 'romgrk/doom-one.vim'
" statusbar
Plug 'glepnir/galaxyline.nvim'
" automatic closing of quotes and brackets
Plug 'Raimondi/delimitMate'
" doom-emacs like dashboard when starting neovim
Plug 'glepnir/dashboard-nvim'
" file manager
Plug 'junegunn/fzf.vim'
" shows lines at indented lines 
Plug 'Yggdroot/indentLine'
" icons are neat
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
" file manager 2
Plug 'kyazdani42/nvim-tree.lua'
" menus
Plug 'Shougo/unite.vim'
" show available keyboard shortcuts
Plug 'liuchengxu/vim-which-key'
" git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" comments
Plug 'tpope/vim-commentary'
" plugin for git ui
Plug 'kdheepak/lazygit.nvim'
" code completion
Plug 'neoclide/coc.nvim'
" tag bar
Plug 'preservim/tagbar'
" buffer bar
Plug 'romgrk/barbar.nvim'
call plug#end()
filetype plugin indent on       " required

" luafile ~/.config/nvim/init.lua

" various other settings
set mouse=a
set nowrap
set number
set relativenumber
set termguicolors
colorscheme doom-one
set noshowmode
set autoindent
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
set smartcase
set ignorecase
set expandtab
set shell=/usr/bin/zsh

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
                        \ 'p': 'update-vim-plug',
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
                        \ 'l': 'lazygit',
                        \}

let g:which_key_map.e = {
                        \ 'name': '+editor',
                        \ 'n': 'toggle-nvimtree',
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

" dashboard 
let g:dashboard_custom_header = readfile(getenv('HOME') . '/stuff/dragon_noColor.txt')
let g:dashboard_default_executive = 'fzf'

" galaxyline config
luafile ~/.config/nvim/configs/galaxyline.lua

" indent line
let g:indentLine_fileTypeExclude = ['dashboard', 'terminal']

" WhichKey
call which_key#register('<Space>', "g:which_key_map")
let g:which_key_position = 'botright'
let g:which_key_centered = 0
let g:which_key_use_floating_win = 0

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noruler nonumber norelativenumber
  \| autocmd BufLeave <buffer> set laststatus=2 ruler number relativenumber
"
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '__pycache__' ] "empty by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window

" disable line numbers in terminal
au TermOpen * setlocal listchars= nonumber norelativenumber ft=terminal
au TermOpen * startinsert
au BufEnter,BufWinEnter,WinEnter term://* startinsert
au BufLeave term://* stopinsert

"" syntax highlighting
" rofi config file
au BufReadPost *.rasi set syntax=css
" enable embedded script highlighting
let g:vimsyn_embed = 'l'

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
nnoremap <silent> <Leader>pi :PlugInstall<CR>:echom ''<CR>
nnoremap <silent> <Leader>pu :PlugUpdate<CR>:echom ''<CR>
nnoremap <silent> <Leader>pc :PlugClean<CR>:echom ''<CR>
nnoremap <silent> <Leader>pp :PlugUpgrade<CR>:echom ''<CR>
" editor
"" NvimTree
nnoremap <silent> <Leader>en :NvimTreeToggle<CR>:echom ''<CR>
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
nnoremap <silent> <Leader>gl :LazyGit<CR>
" coc.nvim
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"go into insert mode in terminal if it is clicked
nnoremap <silent><expr> <LeftMouse> (&buftype ==# 'terminal' ? ':startinsert<CR>' : '')
