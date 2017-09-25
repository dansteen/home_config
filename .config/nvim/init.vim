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
call dein#add('hashivim/vim-terraform')
call dein#add('majutsushi/tagbar')
call dein#add('vim-syntastic/syntastic')
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('hashivim/vim-hashicorp-tools')
call dein#add('fatih/vim-hclfmt')
call dein#add('Blackrush/vim-gocode')
call dein#add('b4b4r07/vim-hcl')

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

let mapleader = ","
syntax on
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command! Wq :execute ':W' | :q

" set up some key maps
map [l :lnext<CR>
map ]l :lprev<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

"call pathogen#infect()
"filetype plugin indent on
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
set completeopt-=preview
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
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_deadline = "5s"
"let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'gotype' ]
set autowrite
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>m  <Plug>(go-imports)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_list_type = "quickfix"
