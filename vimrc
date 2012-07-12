set nocompatible               " be iMproved
set encoding=utf-8
filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'gmarik/vundle'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Gundo'
Bundle 'nathanaelkane/vim-indent-guides'

filetype plugin indent on

set shortmess+=filmnrxoOtT " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore " allow for cursor beyond last character
set history=1000 " Store a ton of history (default is 20)
set spell " spell checking on
set hidden " allow buffer switching without saving
set backup " backups are nice ...
"set noswapfile " make vim write to the actual files, so they can be listened for changes
if has('persistent_undo')
    set undofile "so is persistent undo
    set undolevels=1000 "maximum number of changes that can be undone
    set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif
au BufWinLeave * silent! mkview "make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)

if has('cmdline_info')
  set ruler " show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set showcmd " show partial commands in status line and
" selected characters/lines in visual mode
endif

if has('statusline')
  set laststatus=2
endif

" why not
set encoding=utf-8
set fenc=utf-8

set ttyfast

set backspace=indent,eol,start " backspace for dummies
set linespace=0 " No extra spaces between rows
set nu " Line numbers on
set relativenumber " relative
set showmatch " show matching brackets/parenthesis
set incsearch " find as you type search
set hlsearch " highlight search terms
set winminheight=0 " windows can be 0 line high
set ignorecase " case insensitive search
set smartcase " case sensitive when uc present
set wildmenu " show list instead of just completing
set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap too
set scrolljump=5 " lines to scroll when cursor leaves screen
set scrolloff=3 " minimum lines to keep above and below cursor
set foldenable " auto fold code
set list
set listchars=tab:▸\ ,trail:¬,extends:#,nbsp:¬ " Highlight problematic whitespace
set colorcolumn=80

set tabstop=2       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=2    " Number of spaces to use for each step of (auto)indent.
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
set smarttab        " When on, a <Tab> in front of a line inserts blanks
set autoindent      " Copy indent from current line when starting a new line
set wrap
set formatoptions=qrn1 " stuff?
set cursorline
set pastetoggle=<F12> " pastetoggle (sane indentation on pastes)
set gdefault " auto global replace
"set comments=sl:/*,mb:*,elx:*/ " auto format comment blocks
" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml,groovy autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" save on focus lost
au FocusLost * :wa

let mapleader = ","

" unstupid regexes
nnoremap / /\v
vnoremap / /\v

" keep selection after editing indentation
vnoremap < <gv
vnoremap > >gv

" scroll with long wrapped lines
nnoremap j gj
nnoremap k gk

" shortcuts
nnoremap ; :

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set mouse=a         " Enable the use of the mouse.

syntax on

set background=dark " When set to "dark", Vim will try to use colors that look
colorscheme solarized
set guifont=Ubuntu\ Mono\ 12
set guioptions-=T  "remove toolbar

set laststatus=2 "show powerline

set iskeyword-=_ " makes _ word boundaries too

" open NERDtree automatically
autocmd vimenter * if !argc() | NERDTree | endif
"close vim automatically
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <F9> :NERDTreeToggle<CR>

" stole from spf13
function! InitializeDirectories()
  let separator = "."
  let parent = $HOME
  let prefix = '.vim'
  let dir_list = {
        \ 'backup': 'backupdir',
        \ 'views': 'viewdir',
        \ 'swap': 'directory' }

  if has('persistent_undo')
    let dir_list['undo'] = 'undodir'
  endif

  for [dirname, settingname] in items(dir_list)
    let directory = parent . '/' . prefix . dirname . "/"
    if exists("*mkdir")
      if !isdirectory(directory)
        call mkdir(directory)
      endif
    endif
    if !isdirectory(directory)
      echo "Warning: Unable to create backup directory: " . directory
      echo "Try: mkdir -p " . directory
    else
      let directory = substitute(directory, " ", "\\\\ ", "g")
      exec "set " . settingname . "=" . directory
    endif
  endfor
endfunction
call InitializeDirectories()

" ctrlp options
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
