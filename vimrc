" Enable VIM features by disabling compatibility with the old VI
set nocompatible

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


""" Key Bindings

" Backspace deletes like most programs in insert mode
set backspace=2

"Force to use vim keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Clear search highlighting by pressing Ctrl-L
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

"Key to insert mode with paste using F2 key
map <F2> :set paste<CR>i
" Leave paste mode on exit
au InsertLeave * set nopaste

" Toggle nerdtree with F10
map <silent> <F10> :NERDTreeToggle<CR>
" Current file in nerdtree with F9
map <silent> <F9> :NERDTreeFind<CR>


""" Visual Settings

" Set up schema
syntax enable
set background=dark
colorscheme gruvbox

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 120 characters is
set colorcolumn=120

" Numbers
set number relativenumber
set numberwidth=5

" Always display the status line
set laststatus=2

" Highlight search keyword
set hlsearch

""" Misc

" Always use the system clipboard
set clipboard+=unnamedplus

" Disable file backups
set nobackup
set nowritebackup

" Disable creating .swp files
set noswapfile

set showcmd       " display incomplete commands
set incsearch     " do incremental searching

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Quicker window movement. Seemlessly navigate between Vim/Tmux panes
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>


" Tune gitgutter
set updatetime=250

" Enable cursorline & scrolling optimization
set lazyredraw
set ttyfast
set cursorline

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=128

" Reduce timeout after <ESC> is recieved.
set timeoutlen=1000
set ttimeoutlen=0

" For more information see https://vi.stackexchange.com/a/10125
filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END


""" Plugins

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
set t_Co=256

" Ignore for CtrlP
set wildignore+=*/target/*

" Nerd Tree
" Fix showing '^G' as node delimiter
let g:NERDTreeNodeDelimiter = "\u00a0"


""" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
