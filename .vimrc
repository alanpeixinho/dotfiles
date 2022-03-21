

" to work on any bash like xonsh
set shell=/usr/bin/bash

call plug#begin('~/.vim/plugged')

Plug 'chrisbra/csv.vim'

"autocomplete language servers
Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }

"fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Grep search
Plug 'wookayin/fzf-ripgrep.vim'

"status bottom line
Plug 'itchyny/lightline.vim'

"File Tree
Plug 'preservim/nerdtree'

"colorfull brackets and parenthesis matching
Plug 'frazrepo/vim-rainbow'

"easy commenter
Plug 'preservim/nerdcommenter'

"insert brackts automatically
Plug 'jiangmiao/auto-pairs'

"floating terminal
Plug 'voldikss/vim-floaterm'

"better syntax highlight
Plug 'sheerun/vim-polyglot'

"yapf code formatter
Plug 'mindriot101/vim-yapf'

"clangformat code formatter
Plug 'rhysd/vim-clang-format'

"Doxygen docs
Plug 'vim-scripts/DoxygenToolkit.vim'

"Python Docstring
Plug 'pixelneo/vim-python-docstring'

"auto format for several external programs
Plug 'Chiel92/vim-autoformat'


call plug#end()

"navigate tabs with shift+left shift+right
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>

"default yapf style as google style
let g:yapf_style = "google"

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
            \ execute 'NERDTree' argv()[0] | wincmd p | enew | endif

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"F2 toggle NERDTree open/close
nnoremap <Home> :NERDTreeToggle<CR>

"ctrl t as terminal toggle
noremap  <C-T>  :FloatermToggle<CR>
noremap! <C-T>  <Esc>:FloatermToggle<CR>
tnoremap <C-T>  <C-\><C-n>:FloatermToggle<CR>

"fzf remap for file search
nnoremap <C-F> :BLines<CR>
nnoremap <C-G> :Files<CR>

"prevent fzf file search to open a file inside nerdtree buffer
"au BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif

"goto definition
nnoremap <C-D> :call CocAction('jumpDefinition')<CR>

"rename symbol
nmap <leader>rn <Plug>(coc-rename)

"ctrl+/ toggle comment lines
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

autocmd FileType c,cpp,objc,cu,h,hpp nnoremap <C-i> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,cu,h,hpp vnoremap <C-i> :ClangFormat<CR>

nmap <C-i>   <Plug>ClangFormat
vmap <C-i>   <Plug>ClangFormat<CR>gv

xmap <leader>a  <Plug>(coc-codeaction-selected)

if &diff
    set noreadonly
endif

let g:vim_isort_config_overrides = { 'float_to_top': 'true' }

"allow mouse input
set mouse=a

let g:NERDTreeWinSize=45

"Set the colorscheme (installed in .vim dir)
"colorscheme atom-dark-256
colorscheme monokai

let NERDTreeIgnore = ['\.pyc$', '\.so$']

" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

"line number
set number

"turn on syntax highlight
"set nocompatible
syntax enable
"filetype detection
filetype plugin indent on
set termguicolors
