syntax on

set encoding=utf-8
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set number relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set noesckeys
set noshowmode

""set colorcolumn=80
""highlight ColorColumn ctermbg=0 guibg=white

call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'

Plug 'morhetz/gruvbox'
""Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'mkitt/tabline.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'chrisbra/Colorizer'

""Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
""Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set background=dark
""let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox

""detect root and use .gitignore
if executable('rg')
	let g:rg_derive_root='true'
endif

""ignore some files while searching
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:ctrlp_use_caching=0

""set so=10
let &scrolloff = &lines / 4

""powerline fonts for airline
let g:airline_powerline_fonts = 1

""clipboard
vmap <leader>xy :!xclip -f -sel clip<CR>
map <leader>xp mz:-lr !xclip -o -sel clip<CR>

noremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>
noremap <leader>u :UndotreeShow<CR>
noremap <leader>q :qa<CR>
noremap <leader>r :vertical resize 80<CR>
noremap <leader>o :only<CR>
noremap <leader>i :only <bar> :wincmd v <bar> :Ex <CR> :vertical resize 30 <CR> :wincmd l <CR>
noremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
noremap <leader>ps :rg<SPACE>
noremap <silent> <leader>= :vertical resize +10<CR>
noremap <silent> <leader>- :vertical resize -10<CR>

""YCM
noremap <silent> <leader>gd :YcmCompleter GoTo<CR>
noremap <silent> <leader>gf :YcmCompleter FixIt<CR>
noremap <silent> <leader>f :YcmCompleter Format<CR>

""LaTex Preview
noremap <silent> <leader>pl :LLPStartPreview<CR>
