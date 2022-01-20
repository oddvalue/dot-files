" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible


"Sets text width to 72 chars for git commits
autocmd Filetype gitcommit setlocal textwidth=72

" Enables spell check
set spell

set mouse=a
set bs=2
set ttymouse=xterm2

" Spelling
"highlight clear SpellBad
"highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
"highlight clear SpellCap
"highlight SpellCap term=underline cterm=underline
"highlight clear SpellRare
"highlight SpellRare term=underline cterm=underline
"highlight clear SpellLocal
"highlight SpellLocal term=underline cterm=underline

" yet to find out what this does
filetype indent plugin on

" Enables syntax highlighting
syntax on

" Sets encoding
set encoding=utf-8

"Enables and colours line numbers
"set number
"highlight LineNr ctermfg=darkgrey

" Sets a tab to be = to 4 spaces
set tabstop=4

" Set automatic indentation
set autoindent
set smartindent

" Moves cursor to the top of the file when a git commit
autocmd BufReadPost COMMIT_EDITMSG
 \ exe "normal! gg"

set esckeys " Allow cursor keys in insert mode.
set history=1000 " Increase history from 20 default to 1000
set title " Show the filename in the window titlebar.
set showmode "Show current mode down the bottom
set visualbell "No sounds

" This shows what you are typing as a command.  I love this!
set showcmd

" Highlight things that we find with the search
set hlsearch

command W w " Remap :W to :w


" <F3> comments, <F4> uncomments
vmap <F3> :s/^/#/<CR>
vmap <F4> :s/^#//<CR>

set pastetoggle=<F2>


" Toggle file tree
map <F7> :NERDTreeToggle ~/<CR>


set t_Co=256

colorscheme nord
"let g:molokai_original=1
