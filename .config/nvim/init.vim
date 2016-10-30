syntax on
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command! Wq :execute ':W' | :q

" set up some key maps
map [l :lnext<CR>
map ]l :lprev<CR>

call pathogen#infect()
filetype plugin indent on
" colo forestmonk
colo molokai
set hidden
set autochdir

"set spell spelllang=en_us
"setlocal spell spelllang=en_us


filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab "set list

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
