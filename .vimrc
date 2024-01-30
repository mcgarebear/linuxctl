" -----------------------------------------------------------------------------
" Common Vim Settings
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Leader Key
" -----------------------------------------------------------------------------

" Set the leader key
let mapleader = ","
" From insert mode, pressing leader twice quickly enters normal mode
inoremap <leader><leader> <ESC>
" From visual mode, pressing // will yank the visually selected text and
" perform a search
"
" <C-R> => CTRL-R: Insert the contents of a number or named register
" "     => The unamed register, containing the text of the last delete or yank
" <CR>  => Carriage return
"
" Certain characters have special meaning and will be treated as a regular
" expression. Use \V for "very no magic" mode. In addition, use the expression
" register to escape forward and back slashes
vnoremap // y\V<C-R>=escape(@",'/\')<CR><CR>

" -----------------------------------------------------------------------------
" Colors
" -----------------------------------------------------------------------------

" If using vim over SSH or certain color-limited terminals, tell vim to use
" 256 color mode in order to get greater accuracy of display
set t_Co=256
" defaults:
"
" blue      darkblue default delek   desert elflord
" evening   industry koehler morning murphy pablo
" peachpuff ron      slate   shine   torte  zellner
colorscheme slate
if has('gui_running')
  colorscheme desert
endif

" -----------------------------------------------------------------------------
" Global settings
" -----------------------------------------------------------------------------

" enable filetype detection, load filetype plugins, and load indent files for
" the plugins
filetype plugin indent on
" do not allow backwards compatibility with vi
set nocompatible
" internally, use UTF-8 encoding for displaying text/output
set encoding=utf-8
" autoreload the .vimrc file after being modified
autocmd BufWritePost $MYVIMRC :source $MYVIMRC
" Enable auto changing of directories
"
" When on, Vim will change the current working directory whenever you open a
" file, switch buffers, delete a buffer, or open/close a window. It will change
" to the directory containing the file which was opened or selected.
"
" NOTE: When this option is on some plugins may not work
" set autochdir

" -----------------------------------------------------------------------------
" Autocompletion
" REQUIRES: You complete me plugin
" -----------------------------------------------------------------------------

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" -----------------------------------------------------------------------------
" File Options
" -----------------------------------------------------------------------------

" use unix line endings when dealing with files
set fileformat=unix
set fileformats=unix,dos
" when working with files, use UTF-8 encoding
set fileencoding=utf-8

" -----------------------------------------------------------------------------
" Tabs & Indention
" -----------------------------------------------------------------------------

" number of spaces per TAB when reading - width of TAB character
set tabstop=2
" number of spaces per TAB when editing
set softtabstop=2
" number of columns text is indented through <<, >>, ==
set shiftwidth=2
" hitting TAB in insert mode produces spaces
set expandtab
" perform auto-indenting on the new line
set smartindent

" -----------------------------------------------------------------------------
" Editing Files
" -----------------------------------------------------------------------------

" backspace compatibility
"   indent => allow backspace over autoindent
"   eol    => allow backspace over line breaks
"   start  => allow backspace over start of insert
set backspace=indent,eol,start
" enable syntax highlighting
syntax enable
" turn on line numbers and relative line numbers (hybrid mode)
"
" when entering insert mode or a buffer loses focus, relative line numbers
" are turned off to show absolute line numbers. When exiting to normal mode,
" go back to relative line numbering.
set number
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup end

" -----------------------------------------------------------------------------
" Ruler & Guides
" -----------------------------------------------------------------------------

" turn on the ruler
" display buffer, line, and column
set ruler
set rulerformat=%n,%l,%c
" make a vertical line ruler on common terminal widths
set colorcolumn=80,132
" show horizontal, vertical line at curor's position
set cursorline
" set cursorcolumn

" -----------------------------------------------------------------------------
" Navigation
" -----------------------------------------------------------------------------

" <leader>+jkhl to navigate splits
"   <leader>+h => left
"   <leader>+j => down
"   <leader>+k => up
"   <leader>+l => right
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>

" -----------------------------------------------------------------------------
" Folds
" -----------------------------------------------------------------------------

" Enable folding and fold based on indention
set foldenable
set foldmethod=indent

" -----------------------------------------------------------------------------
" Functions & Leader Mapping
" -----------------------------------------------------------------------------

" strip all trailing whitespace from file lines
"
" %s     => run s[ubstitute] over entire buffer
" \s+\+$ => regex match: at least one whitespace char to EOL
" ge     => global substitution, no error
func! DeleteTrailingWhitespace()
  %s/\s\+$//ge
endfunc
nnoremap <leader>c :call DeleteTrailingWhitespace()<CR>

" Toggle open/closed NERDTree plugin
nnoremap <leader>t :NERDTreeToggle<CR>
