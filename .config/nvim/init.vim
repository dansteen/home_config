" these go at the top so we don't load python prior to them
" Path to various interpreters for neovim
let g:python_host_prog  = '/home/dsteen/.asdf/shims/python2'
let g:python3_host_prog  = '/usr/bin/python' "'/home/dsten/.asdf/shims/python'
let g:ruby_default_path = '/home/dsteen/.asdf/shims/ruby'
" Skip the check of neovim module
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1
set re=1

" Specify a directory for plugins
" Need to do install the plugin manager first: curl -fLo
" ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.local/share/nvim/plugged')
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'hashivim/vim-hashicorp-tools'
Plug 'fatih/vim-hclfmt'

Plug 'majutsushi/tagbar' 
Plug 'airblade/vim-gitgutter'
Plug 'zxqfl/tabnine-vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'tpope/vim-abolish'
call plug#end()

set encoding=utf-8
let mapleader = ","
syntax on
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command! Wq :execute ':W' | :q

" set up some key maps
map [l :lnext<CR>
map ]l :lprev<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

colo molokai
set hidden
set autochdir

"set spell spelllang=en_us
"setlocal spell spelllang=en_us


filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab 
set smarttab

" List chars
"set listchars=""                  " Reset the listchars
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect
set completeopt-=preview
" select completions with tab key
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" set clipboards to sync
"set clipboard=unnamed,unnamedplus

" we dont want to conceal anything
let g:vim_json_syntax_conceal = 0

" more simple clipboard interaction
vnoremap  <leader>y  "+y 
nnoremap  <leader>y  "+y 
nnoremap  <leader>Y  "+yg_ 
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" python stuff
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

" better tmux integration
"let g:clipboard = {
"      \   'name': 'tmux-nox',
"      \   'copy': {
"      \      '+': 'tmux -L inner load-buffer - \; tmux -L inner save-buffer /mnt/downloads/shared.clipboard',
"      \      '*': 'tmux -L inner load-buffer - \; tmux -L inner save-buffer /mnt/downloads/shared.clipboard',
"      \    },
"      \   'paste': {
"      \      '+': 'tmux -L inner load-buffer /mnt/downloads/shared.clipboard \; tmux -L inner save-buffer -',
"      \      '*': 'tmux -L inner load-buffer /mnt/downloads/shared.clipboard \; tmux -L inner save-buffer -',
"      \   },
"      \   'cache_enabled': 1,
"      \ }

" fix text 
autocmd VimEnter * :Abolish {ases,asse,ase}s{ment,ments} {assess}{}

