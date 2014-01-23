set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tpope/vim-rails.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/BufOnly.vim.git'
Bundle 'ervandew/supertab.git'
Bundle 'tpope/vim-fireplace.git'
Bundle 'guns/vim-clojure-static.git'
Bundle 'kien/rainbow_parentheses.vim.git'
Bundle 'Raimondi/delimitMate.git'
Bundle 'statianzo/vim-jade.git'
Bundle 'duff/vim-scratch.git'
Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'jelera/vim-javascript-syntax.git'
Bundle 'mattsacks/vim-fuzzee.git'


" use an undo file
set undofile
set undodir=~/.vim/.vimundo/

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set listchars=tab:▸\ ,eol:¬
set list

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

 "Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Exit insert mode
imap jk <Esc>

" Autocomplete on dashes
set iskeyword+=-

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> ˚ 10gk
nnoremap <silent> ∆ 10gj

map ; :

" Turn off accidental lowercasing
vnoremap u y
vnoremap U y

" Change ex-mode keybinding
nnoremap <C-q> Q
nnoremap Q q

" Add shortcuts for common commands
map <C-t> :NERDTree<CR>
map <C-e> :NERDTreeFind<CR>
map <C-c> :call BrewCoffee()<CR>
map <C-a> :Ack

" Turn on rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|dump|map|log|jpg|ico|png|gif)$'
let g:ctrlp_max_files = 0
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/source_maps/*,*/link_infos/*,*.log,*.dump,*/node_modules/*
noremap <Esc>p <c-p>

"gui stuff
set gfn=Monaco:h12
set guioptions-=T
syntax on

"get rid of the scroll bars in macvim~!
if has("gui_running")
  set guioptions+=LlRrb
  set guioptions-=LlRrb
  set vb
endif

" Splits
map <C-\> :vsp<CR>
map <C-]> :sp<CR>
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
set winwidth=80
set winminwidth=10
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" Buffer navigation
nnoremap <silent> <tab> <C-i>
nnoremap <silent> <S-tab> <C-o>

" Commenting
filetype plugin on

" Ack
map <C-m> :cn<CR>
map <C-n> :cp<CR>

" Color Column
set colorcolumn=80

" Default color scheme
syntax enable

if !has('gui_running')
  let g:solarized_termtrans=1
endif

let g:solarized_visibility="low"
let g:solarized_contrast="normal"

set background=dark
colorscheme solarized


" Changes all tabs to spaces (for highlighting purposes)
map <silent> <D-i> :%s/	/  /g<CR>

" Remove search highlighting with esc
nnoremap <silent> <esc> :noh<CR><esc>

" Mouse
if has("mouse")
  set mouse=a
  set mousehide
endif

" No middleclick paste
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>

"no backup and i hate .sw*
set nobackup
set noswapfile

" Auto save buffers whenever you lose focus
au FocusLost * silent! wa

" Auto save buffers when you switch context
set autowriteall

"u equls t_
onoremap u t_

"p equals i(
onoremap p i(

"b equals i[
onoremap b i[

"r equals i{
onoremap r i{

"q equals i"
onoremap q i"

"No arrow keys bro
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

nnoremap <silent> Y y$
nnoremap <silent> R v$hp
nnoremap <silent> <C-y> ggyy<C-o>

" Fold blocks
map <Leader>z zf%

" Auto folding in coffeescript
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" make uses real tabs
au FileType make set noexpandtab

" everything else uses expandtab
au FileType ruby,coffee,javascript,json set expandtab

" Remove trailing whitespace on save
fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType objc let b:noStripWhitespace=1

" make objc not expandtab
au FileType objc set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg='#00333e' ctermbg=3

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Cawfee
function! BrewCoffee()
  silent! !coffee -p % &> /tmp/coffeetmp.js
  sview /tmp/coffeetmp.js
endfunc

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
"set showcmd

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
