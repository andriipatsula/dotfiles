"" be iMproved, required
set nocompatible
"" Required
filetype off

"#####################################################
" General settings
"#####################################################
" Set Arrow keys to Nop;
" Temporary solution, use them for some useful navigation
noremap  <Up>    <Nop>
" inoremap <Up>    <Nop> - for deoplete
vnoremap <Up>    <Nop>
noremap  <Down>  <Nop>
" inoremap <Down>  <Nop> - for deoplete
vnoremap <Down>  <Nop>
noremap  <Left>  <Nop>
inoremap <Left>  <Nop>
vnoremap <Left>  <Nop>
noremap  <Right> <Nop>
inoremap <Right> <Nop>
vnoremap <Right> <Nop>

noremap <S-j> <Nop>
noremap <S-k> <Nop>

let mapleader = "\<Space>"

inoremap <M-i> <Esc>l

"" Timeout of leader key
set ttimeout
set ttimeoutlen=50

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab

""
set nrformats-=octal
set shiftround

"" Highlight current line
set ruler
set cursorline

set laststatus=2
set showcmd
set wildmenu

set autoread

" set encoding=utf-8
"" Size of a hard tabstop
set tabstop=4
"" Size of an indent
set shiftwidth=4
"" Always uses spaces instead of tab characters
set expandtab

set listchars=tab:▒░,trail:·,extends:>,precedes:<,space:·
set list

set number
set hlsearch
set ignorecase
"" When 'ignorecase' and 'smartcase' are both on, if a pattern contains an
"" uppercase letter, it is case sensitive, otherwise, it is not.
set smartcase

"" Don't use Ex mode, use Q for formatting
map Q gq

"" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

set hidden

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

"" A comma separated list of options for Insert mode completion |ins-completion|.
set completeopt=menuone,longest,preview

"" redraw only when we need to.
set lazyredraw

if has('nvim')
    tnoremap <esc><esc> <C-\><C-n>
    tnoremap <M-i> <C-\><C-n>
    " autocmd WinEnter term://* startinsert

    " Window split settings
    highlight TermCursor ctermfg=red guifg=red
    set splitbelow
    set splitright

    " autocmd TermOpen * setlocal listchars=
endif

"#####################################################
" Plugins
"#####################################################
if has('nvim')
    set rtp+=~/.nvim/bundle/Vundle.vim
else
    set rtp+=~/.vim/bundle/Vundle.vim
endif

call vundle#begin()

"" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" gruvbox colorscheme
Plugin 'morhetz/gruvbox'
"" Airline themes
Plugin 'vim-airline/vim-airline-themes'
"" Lean & mean status/tabline for vim that's light as air.
Plugin 'vim-airline/vim-airline'

"" Underlines the word under the cursor
Plugin 'itchyny/vim-cursorword'
"" Commenting; see `code editing`
Plugin 'tomtom/tcomment_vim'

if has('nvim')
   Plugin 'Shougo/deoplete.nvim'
else
   Plugin 'Shougo/neocomplete.vim'
endif

"" rust syntax highlighting
Plugin 'rust-lang/rust.vim'
"" additional vim c++ syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
"" additional vim python highlighting
Plugin 'hdima/python-syntax'

"" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'kien/ctrlp.vim'

Plugin 'matze/vim-move'

"" dependency for vimfiler
Plugin 'Shougo/unite.vim'
"" file explorer
Plugin 'Shougo/vimfiler.vim'

Plugin 'Shougo/vimproc.vim'

"" ag
Plugin 'rking/ag.vim'
"" Navigate/manipulate buffers.
Plugin 'troydm/easybuffer.vim'
"" TODO try this: cohama/lexima.vim
Plugin 'raimondi/delimitmate'

Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'majutsushi/tagbar'
"" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"" All of your Plugins must be added before the following line
call vundle#end()

"#####################################################
" Code editing
"#####################################################
"" Reselect visual block after indent/outdent indent visual..
vnoremap < <gv
vnoremap > >gv

"" i - insert before the cursor
"" I - insert at the beginning of the line
"" a - move for one char right and start Insert mode
"" A - move to the end of the line and start Insert mode
"" ea - insert at the end of the word
"" o - insert new line below the current one
"" O - insert new line above the current one

"" in insert mode press Ctrl + O and enter command.. like combination or `:vs`
"" after the command fineshed - back in insert mode

"" Use :r !<command> to insert console output of any command into Vim.

"" *ip/*ap - inside/around paragraph
"" *i'/*a' - inside/around single quotes
"" *t'/*t' - inside/around tags
"" ..." ...( ...[ ...{
"" * - c[hange], y[ank], d[elete]

"#####################################################
" Code navigation
"#####################################################
" Move screen Up or Down on 7 line
noremap <M-k> 5<C-y>
noremap <M-j> 5<C-e>

noremap <S-k> 5-
noremap <S-j> 5<CR>

"" Use <c-u> and <c-d> instead
" nmap <S-M-k> <c-u>
" nmap <S-M-j> <c-d>

" Move to beginning/end of line
" nnoremap B ^
" nnoremap E $

" $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>

" Movement up down on wrapped lines
nnoremap j gj
nnoremap k gk

"" Ctrl + o - Back
"" Ctrl + i - Forward

"" '%' to navigate between brackets
"" '{' and '}' - navigate between paragraphs

"" gg - to the top of document
"" G - to the bottom of the file

"" e - move to the end of the word
"" b - move backward to begin of the word
"" w - move forward to the beginning of the word

"" H - move to the top of the screen
"" M - =//= middle of the screen
"" L - =//= bottom of the screen


"#####################################################
" Buffers navigation
"#####################################################
"" nnoremap <S-Right> :bnext<CR>
"" nnoremap <S-Left> :bprevious<CR>

" Close current buffer & do not close window
" http://stackoverflow.com/a/16505009 
nnoremap <leader>q :bp<cr>:bd #<cr>

" fast switching between the lasy two files
nnoremap <leader><leader> <C-^>

"#####################################################
" Windows navigation
"#####################################################
" Navigate over windows Up, Down, Left, Right
" nmap <Up> :wincmd k<CR>
" nmap <Down> :wincmd j<CR>
" nmap <Left> :wincmd h<CR>
" nmap <Right> :wincmd l<CR>

"" Use this instead
"" C-w + h j k l

"#####################################################
" Searching
"#####################################################
"" * – Go to the next occurrence of the current word under the cursor
"" # – Go to the previous occurrence of the current word under the cursor

"" /word - next occurrence of the word
"" ?word - previous occurrence of the word

"" http://tilvim.com/2013/08/22/clearing-search-highlights.html
"" clear the search buffer when hitting return
"" :noh - clears searching
" nnoremap <leader><space> :nohlsearch<cr>

" highlight last inserted text
nnoremap gV `[v`]

"" Ag always maps to Ag!
cabbrev Ag Ag!

map <S-F> :Ag --ignore-dir="*.reg" --ignore-dir="*.vcproj" --ignore-dir="CVS/*" --ignore-dir="*.sln" --ignore-dir="tags" 

"" Ctrl + ] and Ctrl + t
"" :tselect to see all maches of current tag.

"#####################################################
" Copy to/from System Clipboard
"#####################################################
"" two registers.. one - commented
noremap <Leader>y "*y
noremap <Leader>p "*p

"" allow to paste multiple times
"" http://stackoverflow.com/questions/7163947/vim-paste-multiple-times
xnoremap p pgvy

"" In Normal mode:
"" p - paste below current line/ before the current symbol
"" P - paster above current line/ after the current symbol

"" In Ex mode
"" Ctrl+R then " to paste yanked text.

"" Select all text in buffer
map <C-a> <esc>ggVG<CR>

" save session
" nnoremap <leader>s :mksession<CR>
nnoremap <leader>s :set spell!<CR>

highlight Search ctermfg=black ctermbg=white

"#####################################################
" Useful commands
"#####################################################
"" `ga` - see hex of current symbol
"" `g + Ctrl g` - statistic about current buffer

"" bufdo e - reload all opened buffers

"" List of buffers
" nnoremap <leader>ls :ls<CR>
nmap <F3> :EasyBuffer<CR>

"#####################################################
" Themes & visual effects
"#####################################################
"" Column 100 marker
augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#111111
    autocmd BufEnter * match OverLength /\%300v.*/
augroup END

"" gruvbox colorscheme settings
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='medium'

"#####################################################
" Plugin's settings
"#####################################################
"" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/CVS/*,*/Release/*,*/Debug/*,*/__pycache__/*
set wildignore+=*.dll,*.exe,*.lib,*.so,*.a,*.o,tags

nnoremap <leader>o :CtrlPCurWD<CR>
nnoremap <Leader>m :CtrlPBufTag<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPTag<CR>

"" VimFiler
nmap <F2> :VimFilerExplorer<CR>
"" h - goto up dir
"" I - enter input director
"" g? - open help in unite window
nmap <F8> :TagbarToggle<CR>
"" p - Jump to the tag under the cursor, but stay in the Tagbar window.
"" <Space> - Display the prototype of the current tag (i.e. the line defining it) in the command line.
"" v - Hide tags that are declared non-public.
let g:tagbar_left = 0 "Default value is 0

"" python-syntax
let g:python_highlight_all = 1

"" NeoComplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_multibyte_completion=1 
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\k\+'

"" deoplete
let g:deoplete#enable_at_startup = 1

"" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='onedark'
let g:airline_theme='cool'
let g:airline#extensions#tabline#enabled = 1

"" vim-move
let g:move_key_modifier = 'C'

"" Ag
let g:ag_working_path_mode = 'r'

"" EasyBuffer
let g:easybuffer_sort_mode = 's'

if has('autocmd')
    filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

