" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

set termguicolors

"Settings for all the file
set number relativenumber
set encoding=utf-8
filetype plugin on
set path+=**
set wildmenu
"Options for colorscheme
syntax on
"Mouse options
set mouse=a
" Setting for TAB
set tabstop=4
set shiftwidth=4
set expandtab

set clipboard+=unnamedplus

"Plugins, all installed manualy
source ~/.config/nvim//scripts/autoclose.vim
source ~/.config/nvim/scripts/stl.vim

"Plugins, with Vim-Plug
call plug#begin()
"markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"latex
Plug 'lervag/vimtex'
"autocompleation
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Snippets
Plug 'honza/vim-snippets'
"GUI (colorscheme and status line)
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'stevearc/vim-arduino'
Plug 'vimwiki/vimwiki'
call plug#end()

let mapleader = "<F2>"

colorscheme gruvbox
set background=light

let g:airline_theme = 'gruvbox' 

let g:vimtex_view_method = 'zathura'

let g:vimwiki_list = [{'path': '~/Documenti/Vimwiki/vimwiki', 'path_html': '~/Documenti/Vimwiki/Html/'}]

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

let g:rust_fold=1
