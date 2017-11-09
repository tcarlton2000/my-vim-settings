set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'
Plugin 'jiangmiao/auto-pairs'
Plugin 'hashivim/vim-vagrant'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'ekalinin/dockerfile.vim'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'burnettk/vim-angular'
Plugin 'mileszs/ack.vim'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Bundle 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set nu
set rnu
set clipboard=unnamed

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
syntax on

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Autocomplete imports on save
let g:go_fmt_command = "goimports"

au BufRead,BufNewFile *.go set filetype=go
autocmd FileType python setlocal foldmethod=indent
autocmd FileType go setlocal foldmethod=syntax

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

" Enable folding with the spacebar
nnoremap <space> za
nmap <F8> :TagbarToggle<CR>
nnoremap <Leader>aj :%!python -m json.tool<CR>
map <f12> :!ctags -R .<cr>
map <f10> :vs note:Tasks<cr>
:tnoremap <Esc> <C-\><C-n>
map <Tab> <C-W>w
map <Bar> <C-W>v<C-W><Right>
map -     <C-W>s<C-W><Down>
:tnoremap <M-h> <C-\><C-N><C-w>h
:tnoremap <M-j> <C-\><C-N><C-w>j
:tnoremap <M-k> <C-\><C-N><C-w>k
:tnoremap <M-l> <C-\><C-N><C-w>l
:inoremap <M-h> <C-\><C-N><C-w>h
:inoremap <M-j> <C-\><C-N><C-w>j
:inoremap <M-k> <C-\><C-N><C-w>k
:inoremap <M-l> <C-\><C-N><C-w>l
:nnoremap <M-h> <C-w>h
:nnoremap <M-j> <C-w>j
:nnoremap <M-k> <C-w>k
:nnoremap <M-l> <C-w>l

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" Change where new windows appear
set splitbelow
set splitright
