"General 
let mapleader=" "
syntax on
set path+=**
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu 
set relativenumber
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set laststatus=2
set backspace=indent,eol,start
set clipboard=unnamedplus
set mouse=a
set guicursor=
set nohlsearch
set hidden
set cursorline
set completeopt=menuone,noselect
set shortmess+=c

let g:vimsyn_embed= 'l'

"Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
"Plug 'sirver/ultisnips'
Plug 'arcticicestudio/nord-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'nelsyeung/twig.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'dracula/vim'
Plug 'whatyouhide/vim-gotham'
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
call plug#end() 

set termguicolors     " enable true colors support

source ~/.config/nvim/color.vim

" LSP
source ~/.config/nvim/lsp-config.vim
luafile ~/.config/nvim/compe-config.lua
luafile ~/.config/nvim/lsp/python-lsp.lua
luafile ~/.config/nvim/lsp/bash-lsp.lua
luafile ~/.config/nvim/lsp/clangd-lsp.lua

"tab completion 
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"let g:airline#extensions#tabline#enabled = 1

map <leader>s :setlocal spell spelllang=fr<CR>
map <leader>g :Goyo<CR>
map <leader>o :Files<CR>
map <leader>h :Help<CR>
map <leader>b :Buffers<CR>
map <leader>r :Rg<CR>
map <leader>a <C-^>

autocmd FileType tex,latex setlocal spell spelllang=fr
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

function! Preview()
        execute "! zathura /tmp/op.pdf &"
endfunction

function! Compile()
        let extension = expand('%:e')
        if extension == "ms"
                execute "! groff -ms % -T pdf > /tmp/op.pdf"
        elseif extension == "tex"
                execute "! pandoc -f latex -t latex % -o /tmp/op.pdf"
        elseif extension == "md"
                execute "! pandoc % -s -o /tmp/op.pdf -V geometry:margin=1in"
        endif
endfunction

noremap <leader>p :call Preview()<CR><CR><CR>
noremap <leader>q :call Compile()<CR><CR>
" autocmd BufWritePost *.md call Compile()<CR><CR>

autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
