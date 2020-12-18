
    "~ ~ ~ General ~ ~ ~"
"syntax on
filetype on             "enable filetype detection
filetype plugin indent on      "use filetype specific indentation

let mapleader="\<SPACE>"
let s:settings_config_dir = expand('~/.config/nvim')
let s:settings_plugin_dir = expand(s:settings_config_dir . '/ftplugin')

let g:UltiSnipsExpandTrigger='<c-e>'
let g:UltiSnipsJumpForwardTrigger='<c-n>'
let g:UltiSnipsJumpBackwardTrigger='<c-p>'
"Glob
" let g:netrw_banner = 0          "Remove retrw banner"
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4    "Browse in split new vertical split"
" let g:netrw_altv = 1
" let g:netrw_winsize = 25        "Width of split 25%"


"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END


"set number          "show line numbers
"set relativenumber  "use relative numbers"
set showmatch       "show matching brackets
set tabstop=4       "tabs are 4 spaces
set shiftwidth=4    "indentation with <, > are 4 spaces
set expandtab       "indent spaces when tab is pressed
set nojoinspaces    "prevent inserting 2 spaces after J command
set timeoutlen=400  "set timeout after keypress to 500 ms
set cursorline
set showtabline=2
set signcolumn=yes
"set smartindent
"set autoindent
" issue: https://github.com/vim/vim/issues/1735#issuecomment-383353563
set ttyfast
set regexpengine=1
set synmaxcol=100      "include syntax highlighting for long lines"
set redrawtime=10000    "increase redraw time to fix syntax break for large files"

set diffopt+=iwhite " No whitespace in vimdiff
set showcmd         " Show partial command in statusline

"~ ~ ~ Theme & Colours ~ ~ ~"
"colorscheme nord
colorscheme gruvbox8


set autoindent
set noshowmode
set hidden
set nowrap
set noswapfile

set shortmess+=OI
set completeopt=menuone,noselect       "autocomplete popup behaviour"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

set inccommand=nosplit          "do not split for results in preview window"
set mouse=a                     "enable mouse"
set ignorecase                  "insensitive search"
set smartcase

set encoding=UTF-8
set inccommand=split            " live preview of substitutions"

"set path=.,**                  "set path to current file and children
