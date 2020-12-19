set nocompatible 
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.Vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.Vim'
Plugin 'joshdick/onedark.vim'
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

let g:dashboard_custom_header = readfile('/home/totallyrobot/stuff/dragon_parsed.txt')

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ""
let g:airline_right_sep = ""

let g:dashboard_default_header = 'evil'
let g:indentLine_fileTypeExclude = ['dashboard']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"" keybinds
set timeoutlen=0
" leader key
let mapleader = "\<Space>"
" keybinds
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>. :DashboardFindFile<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>n :DashboardNewFile<CR>
" windows
"" splits 
nnoremap <silent> <Leader>wsh :vs<CR>
nnoremap <silent> <Leader>wsv :sp<CR>
" plugins
nnoremap <silent> <Leader>pi :PluginInstall<CR>
nnoremap <silent> <Leader>pu :PluginUpdate<CR>
nnoremap <silent> <Leader>pc :PluginClean<CR>
nnoremap <silent> <Leader>en :NERDTreeToggle<CR>
" config files
nnoremap <silent> <Leader>cv :edit $HOME/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>cw :edit $HOME/.config/i3/config<CR>
nnoremap <silent> <Leader>czz :edit $HOME/.zshrc<CR>
nnoremap <silent> <Leader>czp :edit $HOME/.p10k.zsh<CR>
nnoremap <silent> <Leader>ca :edit $HOME/.config/alacritty/alacritty.yml<CR>
" git
nnoremap <silent> <Leader>gca :Git add .<CR>:Git commit<CR>
nnoremap <silent> <Leader>gcc :Git commit<CR>
nnoremap <silent> <Leader>ga. :Git add .<CR>
nnoremap <silent> <Leader>gaf :execute 'Git add '.input('File to add: ')<CR>
" comment
