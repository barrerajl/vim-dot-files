set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'bling/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'

Plugin 'altercation/vim-colors-solarized'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'posva/vim-vue'

Plugin 'vim-ruby/vim-ruby'

Plugin 'tpope/vim-rails'

Plugin 'ekalinin/dockerfile.vim'

Plugin 'scrooloose/nerdcommenter'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'ngmy/vim-rubocop'

Plugin 'tpope/vim-endwise'

Plugin 'thoughtbot/vim-rspec'

Plugin 'jpo/vim-railscasts-theme'

" Needed for vim-session
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" Buffer unload without clossing the window
Plugin 'qpkorr/vim-bufkill'

" need to install ctags ubuntu package or similar
Plugin 'ludovicchabant/vim-gutentags'

" colors the parenthesis and so...
Plugin 'kien/rainbow_parentheses.vim'

" Shows a vertical line for code blocks
Plugin 'Yggdroot/indentLine'

" Fast file search need to install ack-grep package in ubuntu or similar
Plugin 'mileszs/ack.vim'

" Code completion and other helping functions
Plugin 'vim-syntastic/syntastic'

" Resize windows
Plugin 'breuckelen/vim-resize'

" Help with tags and quotes surrounding
Plugin 'tpope/vim-surround'

" CtrlP dependent plugin
Plugin 'ivalkeen/vim-ctrlp-tjump'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
set expandtab
set tabstop=2
set shiftwidth=2
set shell=/bin/bash
set smartindent
set scrolloff=2
"vim-colors-solarized configuration
syntax enable
"set background=dark
"let g:solarized_termcolors=256

" if !empty(glob("~/.vim/bundle/vim-colors-solarized"))
"   colorscheme solarized
" endif
if !empty(glob("~/.vim/bundle/vim-colors-solarized/"))
  colorscheme railscasts
endif

"syntastic & rubocop"
if !empty(glob("~/.vim/bundle/syntastic/"))
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_ruby_checkers = ['rubocop']
end

" vim-airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='light'

" leader
let mapleader = ","

" vim-rspec config
" RSpec.vim mappings
" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"

" vim-session options
let g:session_autosave='yes'
let g:session_autosave_periodic=1

" NERDtree config
let NERDTreeShowHidden=1

" Undo
set undofile                " Save undo's after file closes
set undodir=~/.vim_undo     " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" For rainbow parenthesis
if !empty(glob("~/.vim/bundle/rainbow_parentheses.vim/"))
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
end

" CtrlP highlight
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-ctrlp-tjump key binding
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" commands
command -nargs=? -bang Buffer if <q-args> != '' | exe 'buffer '.<q-args> | else | ls<bang> | let buffer_nn=input('Which one: ') | if buffer_nn != '' | exe buffer_nn != 0 ? 'buffer '.buffer_nn : 'enew' | endif | endif
