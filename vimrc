set nocompatible   " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set encoding=utf-8

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic' " syntax highlighting plugin
Plugin 'nvie/vim-flake8'
" color scheme
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'https://github.com/davidhalter/jedi-vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1 " see docstring of folded code

" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
"
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1 " goto defination on space-g
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

" enabling color scheme
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn

endif
syntax enable

" toggle between color scheme by pressing F5
call togglebg#map("<F5>")

" hide .pyc file
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set nu

" enabling pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

let g:solarized_termcolors=256

" Powerline setup
let g:Powerline_symbols = 'unicode'
