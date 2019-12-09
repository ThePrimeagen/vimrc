set nocompatible              " be iMproved, required
set exrc
set noswapfile
set nobackup
set encoding=utf-8

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'git@github.com:kien/ctrlp.vim.git'
Plugin 'git@github.com:rking/ag.vim.git'
Plugin 'git@github.com:moll/vim-node.git'
Plugin 'morhetz/gruvbox'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'fatih/vim-go'
Plugin 'hotoo/jsgf.vim'
Plugin 'rcticicestudio/nord-vim'
Plugin 'git@github.com:ajh17/VimCompletesMe.git'
Plugin 'git@github.com:Valloric/YouCompleteMe.git'
Plugin 'lyuts/vim-rtags'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set of basic vim options
colorscheme gruvbox
set noerrorbells
set vb t_vb=
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set nowrap
set colorcolumn=80
set autochdir " sets the cwd to whatever file is in view.  This allows better
              " omni completion.
autocmd BufWritePre * %s/\s\+$//e

" I am the best
set hidden
let g:racer_cmd = "/home/mpaulson/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" Go
let g:go_fmt_command = "goimports"

" You Complete Me
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_max_diagnostics_to_display=0
" DEBUG STUFFS
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_warning_symbol = '.'
let g:ycm_error_symbol = '..'
let g:ycm_server_use_vim_stdout = 1
" DEBUG STUFFS

" Let definitions
let mapleader= " "
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ag_working_path_mode="r"

" ag items.  I need the silent ag.
if executable('ag')
  " Use ag over grep "
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore "
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache "
  let g:ctrlp_use_caching = 0
endif

" For simple sizing of splits.
map - <C-W>-
map + <C-W>+

" Remaps.  This is where the magic of vim happens
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
nmap <leader>pf :CtrlP<CR>
nmap <leader>ps :Ag<SPACE>
nnoremap <Leader>gd :GoDef<Enter>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
nnoremap <silent> <Leader>vr :vertical resize 30<CR>
nnoremap <silent> <Leader>r+ :vertical resize +5<CR>
nnoremap <silent> <Leader>r- :vertical resize -5<CR>
nnoremap <silent> <Leader>;; iif err != nil { <esc>o} <esc>:w<CR>
nmap <leader><leader> V
vmap <Leader>y "+y
vmap <Leader>= <C-W><C-=>

" Autocompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
autocmd BufEnter *.tsx set filetype=typescript


