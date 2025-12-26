

" to work on any bash like xonsh
set shell=/bin/bash
let $SHELL ='/bin/bash'

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

"case transformation and invariant case search/replace
Plug 'tpope/vim-abolish'

"show git info
Plug 'zivyangll/git-blame.vim'

"git diff
Plug 'airblade/vim-gitgutter'

"git merge
Plug 'samoshkin/vim-mergetool'

"helper to highlight and remove unecessary whitespace
Plug 'ntpeters/vim-better-whitespace'

"gdb frontend
Plug 'puremourning/vimspector'

" fugitive git wrapper
Plug 'tpope/vim-fugitive'

"Chapel lang highlight
Plug '~/.chapel-highlight-vim/'

Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

Plug 'preservim/vim-markdown'

"man pages
Plug 'vim-utils/vim-man'

"multiline editing
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"default yapf style as google style
let g:yapf_style = "google"

if !exists('g:formatters_typescriptreact')
    let g:formatters_typescriptreact = ['tsfmt']
endif

let g:formatdef_latexindent = '"latexindent -"'

let g:instant_markdown_autostart = 0

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
            \ execute 'NERDTree' argv()[0] | wincmd p | enew | endif

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"F2 toggle NERDTree open/close
nnoremap <Home> :NERDTreeToggle<CR>

"fzf remap for file search
nnoremap <C-F> :BLines<CR>
nnoremap <C-G> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

"prevent fzf file search to open a file inside nerdtree buffer
"au BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif

"goto definition
nmap <leader>gd :call CocAction('jumpDefinition')<CR>

"rename symbol
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>fr <Plug>(coc-references)

"git blame
nnoremap <C-b> :<C-u>call gitblame#echo()<CR>

"ctrl+/ toggle comment lines
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

autocmd FileType c,cpp,objc,cu,h,hpp nnoremap <C-i> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,cu,h,hpp vnoremap <C-i> :ClangFormat<CR>

nmap <C-i>   <Plug>ClangFormat
vmap <C-i>   <Plug>ClangFormat<CR>gv

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)w

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"

autocmd BufNewFile,BufRead *.xonsh set syntax=python

if &diff
    set noreadonly
endif

let g:vim_isort_config_overrides = { 'float_to_top': 'true' }

"allow mouse input
set mouse=n
set ttymouse=xterm2

"external clipboard
set clipboard=unnamedplus

let g:NERDTreeWinSize=45
let g:NERDTreeWinPos = "right"

let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"] = '<C-S-Down>'
let g:VM_maps["Add Cursor Up"]= '<C-S-Up>'

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
