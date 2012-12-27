" Installing pathogen
call pathogen#infect()

set nocompatible

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
" set list listchars=tab:\ \ ,trail:·

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

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> ˚ 10gk
nnoremap <silent> ∆ 10gj

map ; :

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|dump)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
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
set winwidth=84
set winminwidth=10
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" Buffer navigation
nnoremap <silent> <tab> :bnext<CR>
nnoremap <silent> <S-tab> :bprev<CR>

" Clipboard
set clipboard=unnamed

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

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=80
endfunction

function s:setupMarkup()
  call s:setupWrapping()
"  map <buffer> <Leader>p :Hammer<CR>
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" set clojure files to lisp coloring
au BufRead,BufNewFile *.clj set ft=lisp

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

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

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

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

