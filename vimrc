"
"									 ___	 _____(_)_______ ___ _______________
"									 __ | / /__  / __  __ `__ \__  ___/_	___/
"									 __ |/ / _	/  _	/ / / / /_	/		 / /__
"									 _____/  /_/	 /_/ /_/ /_/ /_/		 \___/
"
" Initial settings ----------------------------------------------------------
" Plugin settings {{{

" Path settings {{{

filetype off
set rtp+=$VIM/vimfiles/bundle/vundle
call vundle#rc('$VIM/vimfiles/bundle/')

"}}}
" Vundle {{{

Bundle 'gmarik/vundle'

"}}}
" Fugitive {{{

Bundle 'tpope/vim-fugitive'

" }}}

" Airline {{{

Bundle 'bling/vim-airline'

" Symbols {{{

let g:airline_powerline_fonts = 1		 " Use poweline fonts
let g:airline_left_sep = ''				 " Left separator
let g:airline_right_sep = ''				 " Right separator
let g:airline_left_alt_sep = ''		 " Alternative left separator
let g:airline_right_alt_sep = ''		 " Alternative right separator
let g:airline_symbols.branch = ''	 " Branch icon
let g:airline_symbols.readonly = '' " Readonly icon
let g:airline_symbols.linenr = ''	 " Line number icon

"}}}

" Show buffers line when there is only one tab open
let g:airline#extensions#tabline#enabled = 1

" Solarized colorscheme (Remove!)
Bundle 'altercation/vim-colors-solarized'

"}}}

" Formatting --------------------------------------------------------------{{{

" Easy commenting of selected lines
Bundle 'scrooloose/nerdcommenter'

" Automatically close quotes, brackets, etc.
Bundle 'Raimondi/delimitMate'

" Line up text
Bundle 'godlygeek/tabular'

"}}}
" Navigation {{{

" Move lines by holding alt
Bundle 'matze/vim-move'

" Go to matching header/source file
Bundle 'vim-scripts/a.vim'

"}}}

" Tags {{{

" NONE yet!

" Mapping to create tags for current file
map <F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

"}}}

" }}}
" Set main settings {{{

filetype plugin indent on
syntax on
language messages pl.utf-8
set nocompatible
set encoding=utf-8

"}}}
" Set theme settings {{{

set guifont=Inconsolata-dz_for_Powerline:h9:cEASTEUROPE  " Inconsolata font

set background=dark																			 " Set dark background
colorscheme customized																	 " Use my own theme

"}}}

" Actual settings -----------------------------------------------------------
" Set options {{{

" Gui options {{{

if has("gui_running")
	set guioptions= " I don't want any guioptions
endif

"}}}
" Wildmenu options {{{

set wildmenu

"}}}
" Smart scrolling {{{

set scrolloff=15		 " Minimal number of screen lines to keep above or below cursor
set sidescrolloff=15 " Minimal number od screen linw to keep above or below cursor

"}}}
" Search options {{{

set hlsearch	 " Highlight search terms
set incsearch  " Show search matches as I type
set ignorecase " Ignore case when searching...
set smartcase  " unless I use uppercase characters

"}}}
" Mouse {{{

if has("moouse")
	set mouse=a			" Can use mouse in all modes
	set mousefocus	" Automatically activate window under mouse
endif

"}}}
" Tabs and spaces {{{

set tabstop=2				" Number of spaces for tab
set shiftwidth=2		" Number of spaces to use for indenting
set softtabstop=2		" Number of spaces that tab count's for
set noexpandtab			" Use spaces instead of tabs
set autoindent			" Always set autoindenting on
set copyindent			" Copy the previous indentation on autoindenting

"}}}
" Other {{{

set autoread													 " Read file if it was modified outside of vim
set autowrite													 " Writie file after executing specific commands
set autochdir													 " Automatically change working directory to directory of current file

set hidden														 " Allow not saved buffers in background

set clipboard=unnamed									 " Share system clipboard
set showcmd														 " Show executed command in commands line

set cursorcolumn											 " Highlight cursor column...
set cursorline												 " ...and line

set backspace=indent,eol,start				 " Make backspace delete everything in insert mode
set number														 " Show line numbers relative to current psition

set laststatus=2											 " Always show status line
set confirm														 " Show confirm dialog
set visualbell												 " Don't beep

set nowrap														 " Don't wrap lines
set notimeout ttimeout ttimeoutlen=200 " Time out on :mappings and key codes only

set nolist
set listchars=tab:\ ,eol:¬

set lines=50
set columns=120

"}}}"

"}}}
" Key mappings {{{

" Leader {{{

let mapleader="," " Use ',' as leader

" Pressing leader 2 times inserts it as normal character
inoremap <leader><leader> <leader>

"}}}

" Arrows keys to navigate between windows {{{

noremap <Up> <C-W>k
noremap <Down> <C-W>j
noremap <Left> <C-W>h
noremap <Right> <C-W>l
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"}}}
" Smart semicolon and function braces {{{

inoremap <leader>; <C-o>A;
inoremap <leader>} <C-o>A {<Return>}<C-o>k<C-o>o
inoremap <leader>{ <C-o>A {<Return>}<C-o>k<C-o>o

"}}}
" 'jk' to leave insert mode {{{

inoremap jk <Esc>
inoremap <Esc> Ooops, use jk instead...

"}}}
" Open vimrc file {{{

nnoremap <leader>ve  :edit $MYVIMRC<CR>
nnoremap <leader>vs  :split $MYVIMRC<CR>
nnoremap <leader>vv  :vsplit $MYVIMRC<CR>

"}}}
" Other {{{

" Turn off highlighting for current search
nnoremap <C-L> :nohlsearch<CR>

" Indend whole file, remove trailing spaces and retab
nnoremap <F2> :call Preserve("normal gg=G")<CR> :call Preserve("%s/\\s\\+$//e")<CR> :retab!<CR>

" Capitalize word next to cursor
inoremap <C-u> <Esc>:call Preserve("normal gUiw")<CR>a

" Toggle fullscreen
nnoremap <F11> :call <SID>ToggleFullscreen()<CR>

" Rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Yank to end of line
nnoremap Y y$

"}}}

"}}}
" Functions {{{
" Insert header preprocessor gates {{{

function! s:insert_gates()
	let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	execute "normal! i#ifndef " .gatename
	execute "normal! o#define " .gatename
	execute "normal! Go#endif"
	normal! kk
endfunction

"}}}
" Save current position and execute command {{{

function! Preserve(command)
	" Save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")

	" Execute command
	execute a:command

	" Restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

"}}}
" Toggle fullscreen {{{

let s:fullscreen_on = 1

function! s:ToggleFullscreen()
	if s:fullscreen_on
		simalt ~P
		let s:fullscreen_on = 0
	else
		simalt ~s
		let s:fullscreen_on = 1
	endif
endfunction

"}}}

"}}}
" Autocommands {{{
" Cursor column/line {{{
augroup cursor_lincol
	autocmd!
	" Set cursor column only visible in active window
	autocmd WinLeave * set nocursorcolumn
	autocmd WinEnter * set cursorline cursorcolumn
augroup END

"}}}
" Relative numbers {{{
augroup relative_numbers
	autocmd!
	" Use relatie number in active window...
	autocmd WinEnter						* set relativenumber
	autocmd BufNewFile,BufRead	* set relativenumber
	autocmd WinLeave						* set norelativenumber
	" ... but not in insert mode
	autocmd InsertEnter * set norelativenumber
	autocmd InsertLeave * set relativenumber
augroup END

"}}}
" Other {{{
augroup other
	autocmd!
	autocmd BufWritePost vimrc source $MYVIMRC										" Automatically source vimrc after saving
	autocmd BufNewFile,BufRead *.{h,hpp} call <SID>insert_gates() " Automatically add header file getes
	autocmd CursorHoldI * stopinsert															" Stop insert mode after inactivity
	autocmd VimEnter * call <SID>ToggleFullscreen()								" Set fullscreen on startup

	autocmd BufEnter,BufNew *.{c,cpp,h,hpp} compiler mingw
augroup END

"}}}

"}}}

" Math {{{

" :Calc
:command! -nargs=+ Calc :py print <args>
:py from cmath import *

" Insert mode math
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

"}}}

" Temporary mappings {{{

augroup temp
	autocmd!
	autocmd BufWritePost customized.vim colorscheme customized
augroup END
nnoremap <leader>vt :split c:\Lukas\ProgramFiles\Vim\vimfiles\colors\customized.vim<CR>

"}}}

" vim: foldmethod=marker: foldlevel=0
