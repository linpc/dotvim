" pathogen
call pathogen#infect()
call pathogen#helptags()

syntax on		" switch syntax on

set softtabstop=4	" press <TAB> operation when editing.
set shiftwidth=4	" Number of spaces to use for each step of (auto)indent. for `cindent' `>>', `<<'
set tabstop=8		" Number of spaces that a <Tab> in the file counts for.
set smarttab		" press <TAB> will expand 4 spaces, twice <TAB> will go '\t'

set autoindent cindent	" always set autoindenting on
" set smartindent	" Do smart autoindenting when starting a new line. REPLACED by 'cindent'
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set nomodeline		" security reason
set esckeys		" map missed escape sequences (enables keypad keys)
set autoread		" any change to current editing file will be reload automatically
set ignorecase		" ignore case when search
set smartcase		" do case-sensitive search if any capital letter in keyword
set hlsearch		" highlight the hunt keywords
set showmatch		" show the match brackets
set matchpairs+=<:>	" Allow % to bounce between angles too "
set showcmd		" Show (partial) command in the last line of the screen.
set incsearch		" jump to the neaeest position when input keyword instantly
set number		" show line numbers
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,.svn
set showmode		" show current mode of Vi(m)
set nomodeline		" security reason
" set title		" set terminal title
" show the cursor position all the time

" disable sound on errors
set noerrorbells
set novisualbell
set vb t_vb=

" ------------------------------------------------------------
"  Editing Settings
" ------------------------------------------------------------

set ffs=unix,dos ff=unix	" file stored formate
set nocompatible	" without Vi-compatible

" set noexpandtab when editing Makefile
"autocmd BufRead,BufNewFile ?akefile* set noexpandtab
autocmd BufRead,BufNewFile ?akefile* set sw=8

" Syntax Fold
syn region myFold start="{" end="}" transparent fold   
syn sync fromstart
set foldmethod=manual
" set fdm=indent
" ??
set fdc=3
" set formatoptions=mtcql	" for formating chinese

" Normal Mode indent
" nmap <Tab> v>
" nmap <S-Tab> v<
" Visual/Select Mode
" vmap <Tab> >gv
" vmap <S-Tab> <gv

" ------------------------------------------------------------
"  Color Scheme
" ------------------------------------------------------------

" colorscheme yzlin256
colorscheme inkpot
set t_Co=256		" 256-color terminal

set background=dark
" set comment to cyan
hi Comment ctermfg=cyan
"hi Comment term=bold ctermfg=darkcyan
hi Search         guifg=NONE        guibg=NONE        gui=underline ctermfg=231        ctermbg=57        cterm=underline
" hi Comment ctermfg=240	" set comment to gray

" ------------------------------------------------------------
"  Status line settings
" ------------------------------------------------------------

" command status line to height 2
" set cmdheight=2

set ruler
set laststatus=2	" always show info
set cursorline		" current line highlight

" set status line infomation
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
"highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white
highlight User7 ctermfg=240

" %1* -> User1's highlight, %2*->User2's highlight
" =   -> Separation point between left and right aligned items.
" <   -> Where to truncate line if too long.  Default is at the start.
set statusline=%4*%<\ %1*[%F]			" filename
set statusline+=%4*\ %5*[%{&encoding},		" encoding
set statusline+=%{&fileformat}]%m		" file format
set statusline+=%4*\ %7*[%{CurDir()}]
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%V%4*\ \<\ %2*%P%4*\ \>

" ------------------------------------------------------------
"  Tab view config
" ------------------------------------------------------------
map tn :tabnext<CR>
map tp :tabprev<CR>
map te :tabnew
map tc :tabclose<CR>
nmap [D :tabprev<CR>
nmap [C :tabnext<CR>
imap [D <ESC>:tabprev<CR>
imap [C <ESC>:tabnext<CR>
" nmap <F10> :tabprev<CR>
" nmap <F11> :tabnext<CR>
" F8: move current tab to left
nmap <silent> <F8> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" F9: move current tab to right
nmap <silent> <F9> :execute 'silent! tabmove ' . tabpagenr()<CR>

" ------------------------------------------------------------
"  autocmd, functions
" ------------------------------------------------------------

" OmniComplete
" fun! OmniComplete()
"     let left = strpart(getline('.'), col('.') - 2, 1)
"     if left =~ "^$"
"         return ""
"     elseif left =~ ' $'
"         return ""
"     else
"         return "\<C-x>\<C-o>"
" endfun
" inoremap <silent> <S-Tab> <C-R>=OmniComplete()

" autocmd FileType c set omnifunc=ccomplete#Complete
" autocmd FileType php set ofu=phpcomplete#CompletePHP
" autocmd FileType python set ofu=pythoncomplete#Complete
" autocmd FileType javascript set ofu=javascriptcomplete#CompleteJS
" autocmd FileType html set ofu=htmlcomplete#CompleteTags
" autocmd FileType css set ofu=csscomplete#CompleteCSS
" autocmd FileType xml set ofu=xmlcomplete#CompleteTags

" c autotidy by indent
autocmd FileType c :set equalprg=indent

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

" ------------------------------------------------------------
"  Plugins settings
" ------------------------------------------------------------
" bundle/vim-easymotion
let g:EasyMotion_leader_key = ','

" bundle/nerdtree: tells NERDTree to use ASCII chars
let g:NERDTreeDirArrows = 0

" bundle/supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabNoCompleteAfter = [',', ';', '{', '}', '(', ')', '[', ']', '\s']

" ------------------------------------------------------------
"  Encoding
" ------------------------------------------------------------
set encoding=utf-8	" internal encoding
set fileencoding=utf-8	" file encoding
set termencoding=utf-8	" Terminal encoding
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le
" for ugly big5 file: <c>onvert
nmap <leader>c :e ++enc=big5<CR>

" ------------------------------------------------------------
"  Special key mapings
" ------------------------------------------------------------

set timeoutlen=500  " milliseconds that is waited for a key code or mapped key sequence to complete.

" diable arrow keys
" normal mode
map <UP> <Nop>
map <DOWN> <Nop>
map <LEFT> <Nop>
map <RIGHT> <Nop>
" insert mode
inoremap <UP> <Nop>
inoremap <DOWN> <Nop>
inoremap <LEFT> <Nop>
inoremap <RIGHT> <Nop>

" set leader to ,
let mapleader=","
let g:mapleader=","

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>
" ,/ toggles hlsearch mode
nmap <leader>/ :set hlsearch!<BAR>set hlsearch?<CR>

" add a new line without entering insert mode
noremap <CR> o<Esc>

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" ------------------------------------------------------------
"  Appendix function keys:
" ------------------------------------------------------------

" toggle NerdTree List
map <F2> <Esc>:NERDTreeToggle<CR>
"
" syntax debug: show highlight group
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"
" open the corresponding .{h,c,cpp} under the same directory
map <F4> :tabe %:s#\.cpp$#.XY_CPP_XY#:s#\.h$#.cpp#:s#.XY_CPP_XY#.h#:s#\.cc$#.h#:s#\.[cC]$#.h#<CR>
"
" F8: move tab to left
" F9: move tab to right
