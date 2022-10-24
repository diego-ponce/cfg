" plug{{{1
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
" Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'nvie/vim-flake8'
Plug 'dense-analysis/ale'
Plug 'voldikss/vim-floaterm'
Plug 'GEverding/vim-hocon'
Plug 'jupyter-vim/jupyter-vim'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'junegunn/vim-easy-align'
Plug 'tweekmonster/startuptime.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'dhruvasagar/vim-zoom'
call plug#end()
" general{{{1
" -- SETS --{{{2
set background=dark
set colorcolumn=80
set encoding=utf-8
set expandtab
set foldmethod=marker
set incsearch
set list
set listchars=tab:▸\ ,eol:¬
set nobackup
set nocompatible
set noerrorbells
set noswapfile
set nowrap
set number
set relativenumber
set shiftwidth=4
set smartcase
set smartindent
set tabstop=4 softtabstop=4
set undodir=~/.vim/undodir
set undofile

" -- KEYWORDS --{{{2
syntax on
highlight ColorColumn ctermbg=0 guibg=lightgrey


" -- LETS --{{{2
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25


" -- REMAPS --{{{2
" resize panes
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
" make Y more like C and D
nnoremap Y y$
nnoremap nn :setl rnu!<CR>
" keep cursor in one place
nnoremap n nzzzv
nnoremap N Nzzzv
" update undo points at certain chars
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
vnoremap < <gv
vnoremap > >gv
" open important files quickly
nnoremap 'r :e ~/.zshrc<CR>
nnoremap 'v :e $MYVIMRC<CR>
" ignorecase toggle
nnoremap <F9> :set ignorecase! ignorecase?<CR>
let pairs = { ":" : ":",
            \ "." : ".",
            \ "<bar>" : "<bar>" }
for [key, value] in items(pairs)
exe "nnoremap ci".key." T".key."ct".value
exe "nnoremap ca".key." F".key."cf".value
exe "nnoremap vi".key." T".key."vt".value
exe "nnoremap va".key." F".key."vf".value
exe "nnoremap di".key." T".key."dt".value
exe "nnoremap da".key." F".key."df".value
exe "nnoremap yi".key." T".key."yt".value
exe "nnoremap ya".key." F".key."yf".value
endfor


" -- AUTOCMDS --{{{2
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


" leader{{{1
let mapleader = " "
map <leader>at :ALEToggle<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
inoremap <leader>jk <esc>
vnoremap <leader>jk <esc>
nnoremap <leader>z za
nnoremap <leader>w :w<CR>
nnoremap <leader>r :source %<CR>
" functions{{{1

" plugins{{{1
"-- FZF --
" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
if executable('rg')
    let g:rg_derive_root='true'
endif
nnoremap <Leader>ps :Rg<SPACE>


"-- GITGUTTER --
" https://github.com/airblade/vim-gitgutter#getting-started
set updatetime=100

"-- GRUVBOX --
colorscheme gruvbox

"-- ALE --
let g:ale_virtualenv_dir_names=[]
let g:ale_enabled=0
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'javascript': ['eslint'] ,
            \ 'python': ['black'],
            \ }
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_flake8_options = '--max-line-length 88 --extend-ignore=E203'

"-- SURROUND --
inoremap <C-e> <C-R>=AutoPairsFastWrap()<CR>
let g:surround_100 = "{{ \r }}"

"-- EMMET --
"redifine trigger key
let g:user_emmet_leader_key=','

"-- JUPYTER VIM --
if has('nvim')
    let g:python3_host_prog = '/usr/local/bin/python3'
endif

if has('python3')
    " let python_path = '/Users/dponce1/sql_stuff/venv/bin/python'
    let pythonx = '/Users/dponce1/sql_stuff/venv/bin/python'
else
    let python_path = '/usr/bin/python2'
endif

"-- COMMENTARY --
autocmd FileType sql setlocal commentstring=--\ %s


"-- EASY ALIGN --
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:airline_theme='violet'

" }}}
