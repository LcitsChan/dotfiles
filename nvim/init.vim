if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" -------------------- 
" Plugins
" -------------------- 
call plug#begin('~/.config/nvim/plugged')
                                                          " -- editor enhance
Plug 'junegunn/fzf.vim'                                   " Enhance fzf: more vim command support
Plug 'airblade/vim-rooter'                                " Changes Vim working directory to project root
Plug 'junegunn/vim-peekaboo'                              " The content of the registers Viewer
Plug 'brooth/far.vim'                                     " Find and replace
Plug 'majutsushi/tagbar'                                  " A class outline viewer
Plug 'liuchengxu/vista.vim'                               " Viewer for LSP symbols
Plug 'mbbill/undotree'                                    " The undo history visualizer
Plug 'neoclide/coc.nvim', {'branch': 'release'}           " Coc
Plug 'mhinz/vim-startify'                                 " Start Page
Plug 'farmergreg/vim-lastplace'                           " Reopen files at your last edit position'
Plug 'tommcdo/vim-exchange'                               " Exchange text, work like cx, cxx
                                                          " -- explorer
Plug 'francoiscabrol/ranger.vim'                          " Ranger file manager support, deps on bclose
Plug 'rbgrouleff/bclose.vim'                              " Deleting a buffer without closing the window
                                                          " -- productivity
Plug 'lambdalisue/suda.vim'                               " Do stuff when forget vim with sudo
Plug 'vim-scripts/ReplaceWithRegister'                    " Replace text with the contents of a register
Plug 'tomtom/tcomment_vim'                                " Comment easy way
Plug 'tpope/vim-surround'                                 " Quoting / Parenthesizing
Plug 'tpope/vim-repeat'                                   " Enhance . repeat(expr, count)
Plug 'kana/vim-textobj-user'                              " Base function for create text object
Plug 'kana/vim-textobj-entire'                            " Text object for entire buffer
Plug 'vim-scripts/argtextobj.vim'                         " Text object for args
Plug 'justinmk/vim-sneak'                                 " Jump to any location by two characters
Plug 'gcmt/wildfire.vim'                                  " Smart selection of the closest text object
Plug 'junegunn/goyo.vim'                                  " Markdown: focus mode
Plug 'mg979/vim-visual-multi'                             " Multi cursor
Plug 'liuchengxu/vim-which-key'                           " Keybinding viewer
Plug 'psliwka/vim-smoothie'                               " Smooth scrolling
Plug 'voldikss/vim-floaterm'                              " Floating builtin term
Plug 'AndrewRadev/switch.vim'                             " 
let g:switch_mapping = "gs"
                                                          " -- highlight
Plug 'junegunn/limelight.vim'                             " Dimmer of code block
Plug 'RRethy/vim-illuminate'                              " Highlight other words under the cursor
Plug 'blueyed/vim-diminactive'                            " Dim inactive windows
Plug 'hotoo/highlight-cursor-word.vim'                    " Highlight words which under text-cursor(caret)
Plug 'lfv89/vim-interestingwords'                         " Highlighting and navigating through different words in a buffer.
Plug 'szw/vim-maximizer'                                  " Maximizes window
                                                          " -- format code
Plug 'godlygeek/tabular'                                  " Text filtering and alignment
Plug 'junegunn/vim-easy-align'                            " Alignment
Plug 'jiangmiao/auto-pairs'                               " Auto pairs for symbol
                                                          " -- svn
Plug 'airblade/vim-gitgutter'                             " Shows a git diff in the sign column.
Plug 'tpope/vim-fugitive'                                 " Fugitive is the premier Vim plugin for Git
Plug 'tpope/vim-rhubarb'                                  " GitHub extension for fugitive.vim
Plug 'junegunn/gv.vim'                                    " Git commit browse
Plug 'rhysd/git-messenger.vim'                            " Reveal the commit messages under the cursor
                                                          " -- language support
Plug 'dart-lang/dart-vim-plugin'                          " Dart language Support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }        " Go plugin
Plug 'chr4/nginx.vim'                                     " Nginx syntax
                                                          " -- colorscheme
"Plug 'vim-airline/vim-airline'                            " Lean & mean status/tabline for vim
"Plug 'vim-airline/vim-airline-themes'                     " Statusbar Theme:  base on airline
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'                   " Theme: Solarized implementation
Plug 'dracula/vim', { 'as': 'dracula' }                   " Dark Theme
Plug 'junegunn/seoul256.vim'                              " Theme seoul256
Plug 'trevordmiller/nova-vim'
Plug 'ap/vim-css-color'                                   " Realtime render color
                                                          " -- markdown
Plug 'plasticboy/vim-markdown'                            " Markdown Vim Mode
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mzlogin/vim-markdown-toc'                           " Markdown TOC
Plug 'dhruvasagar/vim-table-mode'                         " Markdown table tool
                                                          " -- tools
Plug 'voldikss/vim-browser-search'                        " Online Search
Plug 'voldikss/vim-translator'                            " Translator
Plug 'neoclide/jsonc.vim'                                 " Jsonc syntax support

call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


" -------------------- 
" Plugin setting
" -------------------- 
                                                               " - [fzf]
if !empty(glob('/usr/local/opt/fzf'))
  set rtp+=/usr/local/opt/fzf
elseif !empty(glob('/home/linuxbrew/.linuxbrew/opt/fzf'))
  set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
elseif !empty(glob('~/.linuxbrew/opt/fzf'))
  set rtp+=~/.linuxbrew/opt/fzf
endif
                                                               " - [francoiscabrol/ranger]
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 0                                 " open ranger when vim open a directory
                                                               " - [mbbill/undotree]
if has("persistent_undo")
    set undodir=~/.config/nvim/tmp/undo
    set undofile
endif
                                                               " GitGutter
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_sign_allow_clobber = 1
                                                               " fugitive
let g:fugitive_no_maps = 1


" -------------------- 
" Appearance & behavior
" -------------------- 

if !empty(glob('~/.config/nvim/language.vim'))
  source ~/.config/nvim/language.vim
endif


" -------------------- 
" Appearance & behavior
" -------------------- 
                                                                 " - Theme
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg = 'dark'
"let g:airline_theme='dracula'
"let g:airline_theme='seoul256'
let g:airline_theme='nova'
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
" let g:lightline = {
"       \ 'colorscheme': 'nova',
"       \ }
let g:lightline = {
      \ 'colorscheme': 'nova',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

set background=dark
" colorscheme dracula
" colorscheme seoul256
colorscheme nova
let g:solarized_termcolors=256

                                                                 " - Behavior
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
set timeoutlen=300                                               " Time in milliseconds to wait for a mapped sequence to complete
set scrolloff=100                                                " - Keep cursor always in the center screen
set list
set listchars=eol:↵,nbsp:_,tab:>-,trail:·,extends:↷,precedes:↶
"set nocursorcolumn                                              " Do not highlight column (speeds up highlighting)
"set nocursorline                                                " Do not highlight cursor (speeds up highlighting)
set cursorline                                                   " Highlight the screen line of the cursor with CursorLine
set nocompatible                                                 " Enables us Vim specific features
set lazyredraw                                                   " Wait to redraw

                                                                 " https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
                                                                 " - For iterm2 cursor style
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

                                                                 " - System
filetype off                                                     " Reset filetype detection first ...
filetype plugin indent on                                        " ... and enable filetype detection
syntax enable on
set ttyfast                                                      " Indicate fast terminal conn for faster redraw
"set ttymouse=iterm2                                             " Indicate terminal type for mouse codes
"set ttyscroll=3                                                 " Speedup scrolling

" -------------------- 
" Editor
" -------------------- 

                                 " - Text
set autoread                     " Automatically read changed files
set autowrite                    " Automatically save before :next, :make etc.
set encoding=utf-8               " Set default encoding to UTF-8
set fileformats=unix,dos,mac     " Prefer Unix over Windows over OS 9 formats

                                 " - Indent
set expandtab                    " Use the appropriate number of spaces to insert a <Tab>
set autoindent                   " Copy indent from current line when starting a new line
set tabstop=2                    " Number of spaces that a <Tab> in the file counts for.
set smarttab                     " Insert blanks in front of a line according to 'shiftwidth'
set shiftwidth=2                 " Number of spaces to use for each step of (auto)indent.
set softtabstop=2                " Number of spaces that a <Tab> counts for while performing editing operations
set backspace=indent,eol,start   " Makes backspace key more powerful.

                                 " - More info
set number                       " Show line numbers
set relativenumber               " Show the line number relative to cursorline
set showcmd                      " Show me what I'm typing
set cmdheight=1                  " Display more cmd's info
set wrap
set whichwrap+=<,>,h,l
set wildmenu                     " command-line completion operates in an enhanced mode.
set completeopt=menu,menuone     " Show popup menu, even if there is one entry
set pumheight=10                 " Completion window max size
set laststatus=2                 " Show status line always

                                 " - Search
set ignorecase                   " Search case insensitive...
set smartcase                    " ... but not it begins with upper case
set incsearch                    " Shows the match while typing
set hlsearch                     " Highlight found searches
set noshowmatch                  " Do not show matching brackets by flickering
set noshowmode                   " We show the mode with airline or lightline

                                 " - Error prompt
set noerrorbells                 " No beeps
set visualbell                   " Use visual bell instead of beeping

                                 " - Buffer
set hidden                       " Buffer should still exist if window is closed
set noswapfile                   " Don't use swapfile
set nobackup                     " Don't create annoying backup files
set nowritebackup                " Do not make a backup before overwriting a file
set history=700                  " The command-lines that you enter are remembered in a history table.

                                 " - Window
set splitright                   " Vertical windows should be split to right
set splitbelow                   " Horizontal windows should split to bottom


""""""""""""""""""""""""""""""""""""""""""

" --------------------
" Settings
" -------------------- 
source ~/.config/nvim/plugin-config/startify.vim
source ~/.config/nvim/plugin-config/coc.vim
source ~/.config/nvim/keys/mappings.vim
source ~/.config/nvim/keys/which-key.vim
source ~/.config/nvim/plugin-config/fzf.vim
source ~/.config/nvim/plugin-config/far.vim
source ~/.config/nvim/plugin-config/diff.vim
source ~/.config/nvim/plugin-config/vim-go.vim
source ~/.config/nvim/plugin-config/floaterm.vim
source ~/.config/nvim/plugin-config/vim-easy-align.vim
source ~/.config/nvim/plugin-config/limelight.vim
source ~/.config/nvim/plugin-config/markdown.vim
source ~/.config/nvim/plugin-config/tools.vim

" Experimental
highlight NonText ctermfg=59 guifg=#727272
highlight! link SignColumn Normal

let g:vista_default_executive = 'coc'

set foldmethod=indent
set foldlevel=99
set foldenable
set viewoptions=cursor,folds,slash,unix

autocmd BufRead,BufNewFile setting.json set filetype=jsonc

