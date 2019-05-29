"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
" Required:
set runtimepath+=/home/dsteen/.config/nvim/dein/repos/github.com/Shougo/dein.vim
" Required:
call dein#begin('/home/dsteen/.config/nvim/dein')
" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')
" Add or remove your plugins here:
call dein#add('fatih/vim-go')
call dein#add('elzr/vim-json')
call dein#add('b4b4r07/vim-hcl')
call dein#add('hashivim/vim-terraform')
call dein#add('majutsushi/tagbar')
call dein#add('vim-syntastic/syntastic')
"call dein#add('Shougo/deoplete.nvim')
"call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('hashivim/vim-hashicorp-tools')
call dein#add('fatih/vim-hclfmt')
"call dein#add('Blackrush/vim-gocode')
call dein#add('tpope/vim-obsession')
call dein#add('airblade/vim-gitgutter')
call dein#add('frioux/vim-regedit')
call dein#add('zxqfl/tabnine-vim')

"call dein#add('davidhalter/jedi-vim')
"call dein#add('ervandew/supertab')
" call dein#add('chrisbra/changesPlugin')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()
" Required:
filetype plugin indent on
syntax enable
" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

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

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" needed in order to be able to jump to errors
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" we dont want to conceal anything
let g:vim_json_syntax_conceal = 0

" go stuff
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'gotype' ]
"set autowrite
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>m  <Plug>(go-imports)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_list_type = "quickfix"

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


