" Make vim more useful than vi.
set nocompatible

" Add Vlug and add some plugins.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'romainl/vim-cool'
Plug 'maralla/completor.vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'gabrielelana/vim-markdown'

call plug#end()

" Theme adjustments: Enable italics for comments.
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

" Optimize for fast terminal connections.
set ttyfast

" Use the OS clipboard by default (on versions compiled with `+clipboard`).
set clipboard=unnamed

" Enable per-directory .vimrc files and disable unsafe commands in them.
set exrc
set secure

" Centralize backups, swap files and undo history.
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Do not create backups when editing files in certain directories.
set backupskip=/tmp/*,/private/tmp/*

" Automatically reload files when changed outside vim.
set autoread

" Enhance command-line completion.
set wildmenu

" Allow cursor keys in insert mode.
set esckeys

" Allow backspace in insert mode.
set backspace=indent,eol,start

" Use UTF-8 without BOM.
set encoding=utf-8 nobomb

" Change mapleader.
let mapleader=","

" Respect modeline in files.
set modeline
set modelines=4

" Make tabs as wide as four spaces.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you are currently on. Useful for READMEs, etc.
set autoindent

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Highlight searches.
set hlsearch

" Ignore case of searches (except when using capital letters).
set ignorecase
set smartcase

" Highlight dynamically as pattern is typed.
set incsearch

" Add the g flag to search/replace by default.
set gdefault

" Enable line numbers.
set number

" Highlight current line.
set cursorline

" Enable mouse in all modes.
set mouse=a

" Disable error bells (beep or screen flash).
set noerrorbells

" Do not reset cursor to start of line when moving around.
set nostartofline

" Always show the sign column.
set signcolumn=yes

" Do not show the intro message and the file path when starting vim.
set shortmess=atIF

" Do not show status line since we use vim-airline.
set laststatus=0

" Do not show the cursor position since we use vim-airline.
set noruler

" Do not show the current mode since we use vim-airline.
set noshowmode

" Show the filename in the window title bar.
set title

" Show the (partial) command as it is being typed.
set showcmd

" Start scrolling three lines before the horizontal window border.
set scrolloff=3

" Save a file as root (,W).
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Strip trailing whitespace (,ss).
function! StripWhitespace()
  let save_cursor=getpos(".")
  let old_query=getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Automatic commands.
if has("autocmd")
  " Enable file type detection.
  filetype on
  " Treat .json files as JavaScript.
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown.
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Use ag instead of ack.
if executable('ag')
    let g:ackprg='ag --vimgrep'
endif
let g:ackhighlight=1

" Use JSX highlighting on JSX files only.
let g:jsx_ext_required = 1

" Configure Airline.
let g:airline_theme='hybridline' " dracula is currently broken
let g:airline_powerline_fonts=1
let g:airline_statusline_ontop=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#non_zero_only=1
function! AirlineInit()
  call airline#parts#define_raw('modified', '%{&modified ? " (modified)" : ""}')
  call airline#parts#define_accent('modified', 'red')
  let g:airline_section_c = airline#section#create(['%f', 'modified'])
endfunction
autocmd VimEnter * call AirlineInit()
