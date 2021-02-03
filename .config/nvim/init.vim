
" here are some things we want to have happen regardless of whether we are in
" vscode or not

" Specify a directory for plugins
" Need to do install the plugin manager first: curl -fLo
" ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.local/share/nvim/plugged')
" plugins we always want
" cutlass and yoink fix our clpboard behavior.
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-cutlass'
" plugins we only want if we are not running in vscode
if ! exists('g:vscode')
  Plug 'elzr/vim-json', { 'for': 'json' }
  Plug 'hashivim/vim-hashicorp-tools'

  Plug 'majutsushi/tagbar' 
  Plug 'airblade/vim-gitgutter'
  Plug 'codota/tabnine-vim'
  Plug 'martinda/Jenkinsfile-vim-syntax'
  Plug 'tpope/vim-abolish'
end
call plug#end()

" configure cutlass. see here
" https://github.com/svermeulen/vim-cutlass
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D

" configure yoink see here:
" https://github.com/svermeulen/vim-yoink#settings
let g:yoinkSyncNumberedRegisters=1
let g:yoinkSavePersistently=1
let g:yoinkAutoFormatPaste=1
let g:yoinkMoveCursorToEndOfPaste=1
let g:yoinkSwapClampAtEnds=0
let g:yoinkIncludeNamedRegisters=1
let g:yoinkSyncSystemClipboardOnFocus=0
let g:yoinkIncludeDeleteOperations=1
" enable history 
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
" dont change cursor position on yank
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

" we want a different config if nvim is running inside vscode
if exists('g:vscode')
  ; We want to make sure that we exit insert mode when we switch focus
  au FocusLost,TabLeave * stopinsert
else
  " these go at the top so we don't load python prior to them
  " Path to various interpreters for neovim
  let g:python_host_prog  = '/home/dsteen/.asdf/shims/python2'
  let g:python3_host_prog  = '/usr/bin/python' "'/home/dsten/.asdf/shims/python'
  let g:ruby_default_path = '/home/dsteen/.asdf/shims/ruby'
  " Skip the check of neovim module
  let g:python_host_skip_check = 1
  let g:python3_host_skip_check = 1
  set re=1

  set encoding=utf-8
  let mapleader = ","
  syntax on
  command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
  command! Wq :execute ':W' | :q

  " set up some key maps
  "map [l :lnext<CR>
  "map ]l :lprev<CR>
  "map <C-n> :cnext<CR>
  "map <C-m> :cprevious<CR>

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

  " show full filepath in bar
  set statusline+=%F

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
  "vnoremap  <leader>y  "+y 
  "nnoremap  <leader>y  "+y 
  "nnoremap  <leader>Y  "+yg_ 
  "nnoremap <leader>p "+p
  "nnoremap <leader>P "+P
  "vnoremap <leader>p "+p
  "vnoremap <leader>P "+P

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

  " share data between nvim instances (registers etc)
  augroup SHADA
    autocmd!
    autocmd CursorHold,TextYankPost,FocusGained,FocusLost *
          \ if exists(':rshada') | rshada | wshada | endif
  augroup END
endif
