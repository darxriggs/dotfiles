set nowrap

"[E] enable syntax highlighting
syntax on
"[E] enable case-insenitiv search
set ignorecase
"[A] jump to term as you search
set incsearch
"[A] let backspace remove the newline character (\n)
set bs=2
"[A] automatic folding
"set foldmethod=indent
"[A] smart indent
set expandtab
set shiftwidth=4
set ts=4
set smarttab
set ai
set si
set hlsearch
"set mouse=a

" press space to clear search highlighting and any message already displayed
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

"[A] english and german spell-checking using ispell
:map <F9> :w!<CR>:!ispell -d english %<CR>:e!%<CR><CR>
:map <F10> :w!<CR>:!ispell -d ngerman %<CR>:e!%<CR><CR>

" paste mode
set pastetoggle=<F2>
" file browser
:map <F12> :NERDTreeToggle<CR>
" comments
:map <S-C-F12> :TComment<CR>
set wildignore+=.class,.swp,.svn,.git,.hg,target/**

" show cursor line and column in the status line
set ruler

" show matching brackets
set showmatch

" display mode INSERT/REPLACE/...
set showmode

" Required to be able to use keypad keys and map missed escape sequences
set esckeys

" get easier to use and more user friendly vim defaults
" CAUTION: This option breaks some vi compatibility.
"          Switch it off if you prefer real vi compatibility
set nocompatible

" Complete longest common string, then each full match
" enable this for bash compatible behaviour
" set wildmode=longest,full

" Try to get the correct main terminal type
if &term =~ "xterm"
    let myterm = "xterm"
else
    let myterm =  &term
endif
let myterm = substitute(myterm, "cons[0-9][0-9].*$",  "linux", "")
let myterm = substitute(myterm, "vt1[0-9][0-9].*$",   "vt100", "")
let myterm = substitute(myterm, "vt2[0-9][0-9].*$",   "vt220", "")
let myterm = substitute(myterm, "\\([^-]*\\)[_-].*$", "\\1",   "")

if myterm == "linux"
    " keys in insert/command mode.
    map! <Esc>[G  <Insert>
    " KP_5 (NumLock off)
    " keys in normal mode
    " KP_5 (NumLock off)
    map <ESC>[G  i
endif

" This escape sequence is the well known ANSI sequence for
" Remove Character Under The Cursor (RCUTC[tm])
map! <Esc>[3~ <Delete>
map  <ESC>[3~    x

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

" Changed default required by SuSE security team
set modelines=0

set background=light

let mapleader = ","

" on wrapping lines move a line on the monitor not the whole line in the file
nmap k gk
nmap j gj

" let all files open
set hidden

" Go programming language
filetype off
filetype plugin indent off
set runtimepath+=/usr/share/vim/addons/
filetype plugin indent on

" show whitespaces
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.

au BufNewFile,BufRead *.t set filetype=perl
au BufNewFile,BufRead *.gradle set filetype=groovy

execute pathogen#infect()
execute pathogen#helptags()

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = ''

set t_Co=256
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme railscasts
