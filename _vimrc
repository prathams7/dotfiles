filetype plugin indent on 
syntax on

set guioptions-=m
set guioptions-=T

set autoread
set belloff=all
set completeopt-=preview
set expandtab
set incsearch
set laststatus=2
set nobackup
set noerrorbells
set noswapfile
set nowrap
set nu rnu
set shiftwidth=4
set signcolumn=yes
set smartcase
set smartindent
set t_Co=256
set updatetime=100

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set tabstop=4 softtabstop=4
set title
set undodir=~/.vim/undodir
set undofile

" Fix backspace behavior
set backspace=indent,eol,start

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'fisadev/vim-isort'
Plug 'gruvbox-community/gruvbox'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-utils/vim-man'
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dense-analysis/ale'

call plug#end()

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
let g:gruvbox_bold=0
set background=dark
colorscheme gruvbox

" Highlight current line number
" stackoverflow.com/questions/8247243/highlighting-the-current-line-number-in-vim
" highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" hi Normal guibg=NONE ctermbg=NONE
" let $FZF_DEFAULT_OPTS='--reverse'

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" git gutter
let g:gitgutter_max_signs = -1
let g:gitgutter_show_msg_on_hunk_jumping = 0
let g:gitgutter_map_keys = 0

" fzf
let $FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'

" Rustfmt
let g:rustfmt_autosave = 1

" Indent Guides
let g:indentLine_color_term=237
let g:indentLine_char='¦'

" Ignore startup message coc
let g:coc_disable_startup_warning = 1

" https://shapeshed.com/vim-statuslines/#showing-the-statusline 
" function! GitBranch()
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction

" function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{FugitiveStatusline()}
set statusline+=%#CursorColumn#
set statusline+=\ %f
set statusline+=\ %#Error#
set statusline+=%m
set statusline+=%#CursorColumn#
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ 

nnoremap <C-p> :Files<Cr>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>se :UltiSnipsEdit<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" git gutter map
nnoremap <leader>ghs :GitGutterStageHunk<CR>
nnoremap <leader>ghp :GitGutterPreviewHunk<CR>
nnoremap <leader>ghu :GitGutterUndoHunk<CR>
nnoremap <leader>ghf :GitGutterFold<CR>

" git status (fugitive)
nmap <leader>gs :G<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
"
" Rename word across entire project
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Close NERDTree if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" UltiSnips Directories
let g:UltiSnipsSnippetDirectories=["/home/shanu/.vim/UltiSnips/", "UltiSnips"]
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
