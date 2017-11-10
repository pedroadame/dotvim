" My vim configuration - Pedro Adame - github.com/pedroadame/dotvim

"""""""""""""""""""
"" Vundle settings
"""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
"""" Plugins start
call vundle#begin()

" Make Vundle manage itself
Plugin 'gmarik/Vundle.vim'
" Fuzzy file finder. Hit ctrl-p and start typing filename
Plugin 'kien/ctrlp.vim'
" Tree view navigator
Plugin 'scrooloose/nerdtree'
" Easy comment/uncomment with <leader>c<space>
Plugin 'scrooloose/nerdcommenter'
" View git modified/added/etc files in nerdtree
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Navigate faster with <leader><leader>w and then hit highlighted letter
Plugin 'easymotion/vim-easymotion'
" CSS3 syntax
Plugin 'hail2u/vim-css3-syntax'
" Status bar
Plugin 'vim-airline/vim-airline'
" Status bar themes
Plugin 'vim-airline/vim-airline-themes'
" Show | in lines to easily see indentation
Plugin 'Yggdroot/indentLine'
" Solarized colorscheme
Plugin 'altercation/vim-colors-solarized'
" :Rename :Delete and other helpful functions
Plugin 'tpope/vim-eunuch'
" Slim syntax highlighting
Plugin 'slim-template/vim-slim'
" Integrate vim with git
Plugin 'tpope/vim-fugitive'
" Easy surrounding ()[]""'' handler
Plugin 'tpope/vim-surround'
" Auto-type end when opened ruby do-end block or function
Plugin 'tpope/vim-endwise'
" Make vim awesome to work on rails projects
Plugin 'tpope/vim-rails'
" Make C-a and C-x work with dates
Plugin 'tpope/vim-speeddating'
" Let's repeat  vim-surround
Plugin 'tpope/vim-repeat'
" Twig syntax highlighting
Plugin 'evidens/vim-twig'
" <leader>ww in a split and then in another and they will be swapped
Plugin 'wesQ3/vim-windowswap'
" Show devicons in NERDTree, vim-airline...
Plugin 'ryanoasis/vim-devicons'
" Show git status on the gutter
Plugin 'airblade/vim-gitgutter'
" Run Ruby tests on tmux pane
Plugin 'benmills/vimux'
Plugin 'jgdavey/vim-turbux'
" Vue.js syntax
Plugin 'posva/vim-vue'
" Open zeal easily
Plugin 'KabbAmine/zeavim.vim'
" Useful mappings
Plugin 'tpope/vim-unimpaired'
call vundle#end()
filetype plugin indent on
"""" Plugins end

" Run matchit macro to make % match HTML tags
runtime 'macros/matchit.vim'

""""""""""""""""""
"" Editor settings
""""""""""""""""""
" Visual
syntax enable " Enable syntax
set background=dark
colorscheme solarized "Solarized with dark background
set cursorline "Crosshair: X
set cursorcolumn "Crosshair: Y
set number "Line numbers
set belloff=all "No bells
set scrolloff=10 "Scroll 10 lines from top/bottom

" Seach settings
set hlsearch "Highlight search
set incsearch "Search as you type
set ignorecase "Search ignoring case
set smartcase "But if we type an upcase letter, then search with case

" Indentation settings
" #indent { tabs: 2-spaces !important } //Always 2 spaces per tab :D
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

" Auto read a file when changed from outside vim
set autoread

" Fix backspace
set backspace=indent,eol,start

""""""""""""""""""""""
"" Plugins settings
""""""""""""""""""""""
" Vim Airline
set laststatus=2 "Make airline always visible
let g:airline_powerline_fonts = 1 "Make it powerlineish

" Easymotion highlight colors
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" Make NERDCommenter add a space after a comment character
let g:NERDSpaceDelims = 1

""""""""""""""""""""""
"" Keyboard shortcuts
""""""""""""""""""""""
let mapleader = ',' " Make comma the leader key

" Byebye cursor arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Exit insert mode with jk
inoremap jk <ESC>

" Make vertical move through wrapped lines normal
nnoremap j gj
nnoremap k gk

" Change windows easily
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Resize windows easily
noremap <F5> 10<C-w><
noremap <F6> 10<C-w>>

" Shortcut to edit this file
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Remove trailing spaces
nnoremap <leader>ss mz:%s/\s\+$//e<CR>`z:noh<CR>
" Disable highlighted last search words
nnoremap <leader><space> :noh<CR>
" Reindent current file.
noremap <F7> mzgg=G`z
" Open a tree navigator of current dir
noremap <C-n> :NERDTreeToggle<CR>

" Turbux configuration
let g:turbux_command_prefix = 'docker-compose run tests bundle exec'
nnoremap <leader>a :call VimuxRunCommand("docker-compose run tests bundle exec rspec")<CR>

" Autosave/load foldings
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
