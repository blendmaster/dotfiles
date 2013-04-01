set nocompatible               " be iMproved

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'

Bundle 'Lokaltog/vim-easymotion'

Bundle 'altercation/vim-colors-solarized'

" Wait till out of beta
" Bundle 'Lokaltog/powerline'
Bundle 'Lokaltog/vim-powerline'

Bundle 'tpope/vim-fugitive'

Bundle 'tpope/vim-surround'

Bundle 'tpope/vim-repeat'

Bundle 'tpope/vim-unimpaired'

Bundle 'scrooloose/nerdcommenter'

Bundle 'kien/ctrlp.vim'

Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

Bundle 'scrooloose/syntastic'

Bundle 'Gundo'

Bundle 'tpope/vim-foreplay'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'paredit.vim'

Bundle 'nathanaelkane/vim-indent-guides'

Bundle 'majutsushi/tagbar'

Bundle 'godlygeek/tabular'

Bundle 'kshenoy/vim-signature'

Bundle 'Valloric/YouCompleteMe'

Bundle 'Raimondi/delimitMate'

Bundle 'kchmck/vim-coffee-script'
Bundle 'satyr/vim-coco'
Bundle 'wavded/vim-stylus'

Bundle 'mattn/zencoding-vim'
Bundle 'othree/html5.vim'

Bundle 'sudo.vim'

Bundle 'camelcasemotion'
Bundle 'michaeljsmith/vim-indent-object'

Bundle 'YankRing.vim'

Bundle 'goldfeld/vim-seek'

filetype plugin indent on

set virtualedit=block " Allow movement on non-present characters in block mode
set shortmess+=filmnrxoOtT " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set history=1000 " Store a ton of history (default is 20)
set hidden " allow buffer switching without saving
set backup " backups are nice ...
set noswapfile " swapfiles are lame
if has('persistent_undo')
    set undofile "so is persistent undo
    set undolevels=1000 "maximum number of changes that can be undone
    set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif
au BufWinLeave * silent! mkview "make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)

set autowrite
set autoread
set clipboard=unnamedplus " default yank to system clipboard. ctrl+c/v works as expected
set cf " error jumping

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
set nonu " Line numbers off
set relativenumber " relative numbers are more useful
set showmatch " show matching brackets/parenthesis
set incsearch " find as you type search
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
set colorcolumn=85

set tabstop=2       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=2    " Number of spaces to use for each step of (auto)indent.
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
set smarttab        " When on, a <Tab> in front of a line inserts blanks
set autoindent      " Copy indent from current line when starting a new line
set wrap
set formatoptions=qcrn1 " stuff?
set cursorline
set cursorcolumn " I kinda like the crosshairs actually
set pastetoggle=<F12> " pastetoggle (sane indentation on pastes)
set gdefault " auto global replace

" Remove trailing whitespaces
" dangerous with non-text files, but who ever edits those?
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" toggle spellcheck, which is usually annoying but sometimes useful
map <F5> :setlocal spell! spelllang=en_us<CR>

" enable delimit mate expanders
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
" balance matchpairs should make fixing or moving parens easier
let delimitMate_balance_matchpairs = 1

let mapleader = ","

" Remap j/k to easymotion versions
" Too annoying, since easymotion also takes over block visual mode, and ezj/k
" will jump to the beginning of the line (destroying the selected block
" usually)
" will muscle train myself motions some other way
"nnoremap j <NOP>
"nnoremap k <NOP>
"let g:EasyMotion_mapping_j='j'
"let g:EasyMotion_mapping_k='k'

" Use only one leader for more useful motions
" XXX would set custom leader key for all mappings but
" it doesn't work for some reason
" FIXME neither does this. what the fuck
"let g:EasyMotion_mapping_w=',w'
"let g:EasyMotion_mapping_e=',e'
"let g:EasyMotion_mapping_b=',b'

" keep selection after editing indentation
vnoremap < <gv
vnoremap > >gv

" scroll with long wrapped lines
nnoremap j gj
nnoremap k gk

" shortcuts
nnoremap ; :

" toggle search highlighting
nnoremap <Leader> <Space> :set hlsearch!<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set mouse=a         " Enable the use of the mouse.
set mousemodel=popup_setpos " enable right click menu

syntax on

set background=dark " When set to "dark", Vim will try to use colors that look
colorscheme solarized
set guifont=Ubuntu\ Mono\ 11
set guioptions-=T  "remove toolbar

map <F9> :NERDTreeTabsToggle<CR>

" ctrlp options"
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_map = '<c-q>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
" defer to git ls for faster listening
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

"Gundo
map <F7> :GundoToggle<CR>

"YankRing
:nnoremap <silent> <F11> :YRShow<CR>

"tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_clojure = {
  \ 'ctagstype' : 'lisp',
  \ 'kinds' : [
  \   'f:function',
  \   'v:variables'
  \ ]
\ }

" make indent guides more subtle
let g:indent_guides_color_change_percent = 2
let g:indent_guides_start_level = 1
let g:indent_guides_enable_on_vim_startup = 0

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

" Autosave files on changes because explicitly saving to persistent storage is
" old-fashioned

" save on focus lost
au FocusLost * silent! :wa
" save current file when leaving insert mode
au InsertLeave * silent! :w
" save current file if nothing is pressed for `updatetime` ms (in normal mode)
au CursorHold * if !&ro | silent! w | endif

" stop ycm from changing updatetime to 2000
let g:ycm_allow_changing_updatetime = 0
set updatetime=250

