" Sergio Vim config
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
se nu
set relativenumber
syntax enable
"tab and indexation
set noet ci pi sts=0 sw=3 ts=3
set laststatus=2
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme = 'onedark'
colorscheme onedark
"enable syntax and plugins (for netrw)
set noshowmode "to do not show mode, airline does it
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇ '
"let g:airline_symbols.branch = '⌥ '
"let g:airline_powerline_fonts = 1
filetype plugin on

function! NumberToggle() 
	if(&relativenumber == 1) 
		set norelativenumber
	else 
		set relativenumber
	endif 
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

"To move lines

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"search down into subfolders
"Provides tab-completion for all file-related tasks
set path+=**

"Display all matching files when we tab complete
set wildmenu

"NOW WE CAN:
"-Hit tab to :find by partial match
"-Use * to make ir fuzzy

"THINGS TO CONSIDER:
"-:b lets you autocomplete any open buffer

"FILE BROWSING:
let g:netrw_banner=0 " disable banner
"let g:netrw_browse_split=4 " open in a prior window
let g:netrw_altv=4			" open split to the right 
let g:netrw_liststyle=3		" tree view

"READ TEMPLATES: remap
"nmap forpy :-1r $HOME/.vim/for.py<CR>jkklj "normal mode remap 
"inoremap forpy :-1r $HOME/.vim/for.py<CR>jkkl<Esc><Tab> "normal mode remap 

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" always set autoindenting on
set autoindent		

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit
