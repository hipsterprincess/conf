"""""""""""""""""""""""""""""""""'"""""""""""""""""""""""""""""""""'""""""""""""
""" Plugins

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'YankRing.vim'
Plugin 'bufexplorer.zip'
Plugin 'Valloric/YouCompleteMe' "run ~/.vim/bundle/YouCompleteMe/install.py
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""'"""""""""""""""""""""""""""""""""'""""""""""""
""" Settings

syntax on
set encoding=utf-8
set ttyfast
set term=xterm-256color
set noswapfile
set hidden
set backspace=indent,eol,start
set wrap
set gdefault

" indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent

" search
set incsearch
set ignorecase
set smartcase
set showmatch

" visuals
set showmode
set ruler
set number
set cursorline
set wildmenu
set wildmode=list:longest
set showtabline=1
set colorcolumn=81
set laststatus=2
set scrolloff=1
set statusline=[%n]\ %<%f\ %h%m%r%{fugitive#head()}%=%-14.(%l,%c%V%)\ %P

"""""""""""""""""""""""""""""""""'"""""""""""""""""""""""""""""""""'""""""""""""
""" Colors

colorscheme solarized
set background=dark

hi! TabLine     cterm=none ctermfg=fg   ctermbg=0
hi! TabLineSel  cterm=bold ctermfg=5    ctermbg=0
hi! TabLineFill cterm=none              ctermbg=0
"set tabline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let label = ''
    for bufnr in buflist
        if getbufvar(bufnr, "&modified")
            let label = '+'
        endif
    endfor
    return label . resolve(bufname(buflist[winnr - 1]))
endfunction

function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999X X'
    endif
    return s
endfunction

"set tabline=%!MyTabLine()


"""""""""""""""""""""""""""""""""'"""""""""""""""""""""""""""""""""'""""""""""""
""" Mappings

let mapleader=" "

nnoremap    <leader>S   :source ~/.vimrc<cr>
nnoremap    <leader>R   :edit<cr>
nnoremap    <leader>D   :%d<cr>
nnoremap    <leader>H   :tabe<cr>:help<cr>:on<cr>

nnoremap s      mM:split<cr><c-w><c-w>
nnoremap 2      mM:vsplit<cr><c-w><c-w>
nnoremap <c-t>  mM:tabe<cr>
nnoremap <c-w>  mM:tabe<cr>
nnoremap q      :quit<cr>
nnoremap Q      :quita<cr>


" visual mode copy
vnoremap c y

" edit dotfiles
nnoremap    <leader>er  :edit $MYVIMRC<cr>
nnoremap    <leader>ev  :edit $MYVIMRC<cr>
nnoremap    <leader>ei  :edit ~/.viminfo<cr>
nnoremap    <leader>eb  :edit ~/.bash_profile<cr>
nnoremap    <leader>et  :edit ~/.tmux.conf<cr>
nnoremap    <leader>es  :edit ~/.ssh/config<cr>

" edit tmp files
nnoremap <leader>ts  :edit /tmp/foo.sql<cr>
nnoremap <leader>tx  :edit /tmp/foo.xml<cr>
nnoremap <leader>tjs :edit /tmp/foo.json<cr>
nnoremap <leader>tja :edit /tmp/foo.java<cr>

" emacs style command-line
cnoremap    <c-o>       <c-f>

cnoremap    <c-a>       <home>
cnoremap    <c-e>       <end>
cnoremap    <c-d>       <del>
cnoremap    <c-p>       <up>
cnoremap    <c-n>       <down>
cnoremap    <c-b>       <left>
cnoremap    <c-f>       <right>
cnoremap    b         <s-left>
cnoremap    f         <s-right>

inoremap    <c-a>       <home>
inoremap    <c-e>       <end>
inoremap    <c-d>       <del>
inoremap    <c-p>       <up>
inoremap    <c-n>       <down>
inoremap    <c-b>       <left>
inoremap    <c-f>       <right>
inoremap    b         <s-left>
inoremap    f         <s-right>
inoremap    d         <esc>ce

" open & close
nnoremap    <leader>t   :tabe %<cr>
nnoremap    <leader>o   :only<cr>
nnoremap    <leader>w   :write<cr>
nnoremap    <leader>E   :edit<cr>
nnoremap    <leader>q   :quit<cr>
nnoremap    <leader>Q   :quita<cr>

" select windows
nnoremap    <c-h>       <c-w>h
nnoremap    <c-j>       <c-w>j
nnoremap    <c-k>       <c-w>k
nnoremap    <c-l>       <c-w>l

" resize windows (alt + shift + h | j | k | l)
nnoremap    H         11<c-w><
nnoremap    L         11<c-w>>
nnoremap    J         5<c-w>+
nnoremap    K         5<c-w>-

" select tabs
nnoremap    <c-n>       gt
nnoremap    <c-p>       gT

" move tabs
nnoremap    <leader>p   :-tabmove<cr>
nnoremap    <leader>n   :+tabmove<cr>
nnoremap    <leader>0   :tabmove 0<cr>
nnoremap    <leader>$   :tabmove<cr>

" tmux integration
noremap     <leader>c   :w !tmux load-buffer - <cr><cr>

" osx integration
noremap     <leader>C   :w !pbcopy<cr><cr>

" psql integration
noremap     <leader>rp  :w !psql -d kwallet_local -1 -f -<cr>

" toggle settings
nnoremap    <leader>!p  :set paste!<cr>
nnoremap    <leader>!h  :set hlsearch!<cr>
nnoremap    <leader>!n  :set number!<cr>
nnoremap    <leader>!t  :call ShowTablineToggle()<cr>
nnoremap    <leader>!c  :call SetColorColumnToggle()<cr>
function! ShowTablineToggle()
    if &showtabline ; setlocal showtabline=0
    else            ; setlocal showtabline=1
    endif
endfunction
function! SetColorColumnToggle()
    if &colorcolumn ; setlocal colorcolumn=0
    else            : setlocal colorcolumn=81
    endif
endfunction

" disable noob keys
noremap     <bs>        <nop>
noremap     <up>        <nop>
noremap     <down>      <nop>
noremap     <left>      <nop>
noremap     <right>     <nop>
noremap!    <bs>        <nop>
noremap!    <up>        <nop>
noremap!    <down>      <nop>
noremap!    <left>      <nop>
noremap!    <right>     <nop>

"""""""""""""""""""""""""""""""""'"""""""""""""""""""""""""""""""""'""""""""""""
""" Plugin settings

let g:ctrlp_max_height=20
let g:ctrlp_working_path_mode = '0'


"""""""""""""""""""""""""""""""""'"""""""""""""""""""""""""""""""""'""""""""""""
""" Plugin mappings

nnoremap    <leader>g   :Gstatus<cr>:only<cr>

nnoremap    <leader>b   :BufExplorer<cr>

nnoremap    <leader>=   :YRShow<cr>

let g:yankring_replace_n_nkey = 'N'
let g:yankring_replace_n_pkey = 'P'

let g:ctrlp_map = '<c-o>'

"""""""""""""""""""""""""""""""""'"""""""""""""""""""""""""""""""""'""""""""""""
