" -------------------------------------------------------------- "
"  Editor Environment Settings					 "
" -------------------------------------------------------------- "

syntax on		" switch syntax on

set esckeys		" map missed escape sequences (enables keypad keys)
set autoread		" any change to current editing file will be reload automatically
set ignorecase		" ignore case when search
set smartcase		" do case-sensitive search if any capital letter in keyword
set hlsearch		" highlight the hunt keywords
set incsearch		" jump to the neaeest position when input keyword instantly
set showmatch		" show the match brackets
set matchpairs+=<:>	" Allow % to bounce between angles too "
set showcmd		" Show (partial) command in the last line of the screen.
set number		" show line numbers
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,.svn,.git
set showmode		" show current mode of Vi(m)
set nomodeline		" security reason
" set title		" set terminal title
set cursorline		" show the cursor position all the time
set nocompatible	" without Vi-compatible
set scrolloff=3		" start scrolling when n lines away from margins
set directory=~/tmp/.vimswap,~/tmp,.,/tmp,/var/tmp	" set vim swap path
set tabpagemax=100	" open multiple tabs with '-p' up to 100

" disable sound on errors
set noerrorbells
set novisualbell
set vb t_vb=

" -------------------------------------------------------------- "
"  Editing Settings						 "
" -------------------------------------------------------------- "

set softtabstop=4	" press <TAB> operation when editing.
set shiftwidth=4	" Number of spaces to use for each step of (auto)indent. for `cindent' `>>', `<<'
set tabstop=8		" Number of spaces that a <Tab> in the file counts for.
set smarttab		" press <TAB> will expand 4 spaces, twice <TAB> will go '\t'
set cinoptions=(1s	" http://linux.chinaitlab.com/manual/vim/indent.html

set autoindent cindent	" always set autoindenting on
" set smartindent	" Do smart autoindenting when starting a new line. REPLACED by 'cindent'
set backspace=indent,eol,start	" allow backspacing over everything in insert mode

set nobackup		" no need to make backup files

" Syntax Fold
syn region myFold start="{" end="}" transparent fold
syn sync fromstart
set foldmethod=manual
" set fdm=indent
" ??
"set fdc=3
" set formatoptions=mtcql	" for formating chinese

" Spell function
set spellfile=dict.en.add

" -------------------------------------------------------------- "
" Filetype specific settings					 "
" -------------------------------------------------------------- "

" by filename extension
" set noexpandtab when editing Makefile
autocmd BufRead,BufNewFile ?akefile* set sw=8 ts=8 noexpandtab
" set expandtab when editing .py, .md
autocmd BufRead,BufNewFile *.{md,pl,py} set expandtab
autocmd BufRead,BufNewFile bash-fc-* set filetype=sh
" set tabstop in LaTeX file
autocmd BufRead,BufNewFile *.tex set tabstop=4 spell spelllang=en_us
" so rare to do modula2 editing
autocmd BufReadPost,BufNewFile *.md set filetype=markdown
autocmd BufReadPost,BufNewFile *.ls set filetype=ls
" set style for jsx file
autocmd BufReadPost,BufNewFile *.jsx set filetype=javascript

" by filetype
autocmd FileType sh set sw=4 sts=4 expandtab
autocmd FileType perl set sw=4 sts=4 expandtab
autocmd FileType php set sw=4 sts=4 expandtab
autocmd FileType go set sw=4 sts=4 ts=4 noexpandtab
autocmd FileType markdown,rst set sw=4 sts=4 expandtab
autocmd FileType python set sw=4 sts=4 expandtab
autocmd FileType html set sw=4 ts=4 noexpandtab
autocmd FileType javascript,json,css,sass,scss,xml,ls set tabstop=4 sw=4 expandtab
autocmd FileType yaml set sw=2 ts=2 expandtab
autocmd FileType java set sw=2 ts=2 expandtab
autocmd FileType groovy set sw=4 sts=4 expandtab
autocmd FileType xml set sw=4 sts=4 noexpandtab

" -------------------------------------------------------------- "
"  Color Scheme							 "
" -------------------------------------------------------------- "

" colorscheme yzlin256
colorscheme inkpot
" colorscheme slate
set t_Co=256		" 256-color terminal

set background=dark
" set comment to cyan
hi Comment ctermfg=cyan
"hi Comment term=bold ctermfg=darkcyan
hi Search         guifg=NONE        guibg=NONE        gui=underline ctermfg=231        ctermbg=57        cterm=underline
" hi Comment ctermfg=240	" set comment to gray

if version >= 703
    highlight ColorColumn ctermbg=237 ctermfg=white guibg=#002929
    set colorcolumn=80
    autocmd FileType php set colorcolumn=120
    autocmd FileType java set colorcolumn=100
endif

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+$\| \+\ze\t/

" Spell
hi clear SpellBad
hi SpellBad term=underline cterm=underline ctermfg=red
hi SpellCap term=underline cterm=underline ctermfg=green
hi SpellRare term=underline cterm=underline ctermfg=yellow

" -------------------------------------------------------------- "
"  Status line settings						 "
" -------------------------------------------------------------- "

" command status line to height 2
" set cmdheight=2

set ruler
set laststatus=2	" always show info
" set cursorline		" current line highlight

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

" -------------------------------------------------------------- "
"  Tab view config						 "
" -------------------------------------------------------------- "

nmap tn :tabnext<CR>
nmap tp :tabprev<CR>
nmap te :tabnew 
nmap tc :tabclose<CR>
nmap [D :tabprev<CR>
nmap [C :tabnext<CR>
imap [D <ESC>:tabprev<CR>
imap [C <ESC>:tabnext<CR>

" F8: move current tab to left
nmap <silent> <F8> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" F9: move current tab to right
nmap <silent> <F9> :execute 'silent! tabmove ' . tabpagenr()<CR>

" -------------------------------------------------------------- "
"  autocmd, functions						 "
" -------------------------------------------------------------- "

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
" autocmd FileType c :set equalprg=indent

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  filetype plugin on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.  " Don't do it when the position is invalid or when inside an event handler
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

function ChangeNuMode()
    if (&number)
	set nonu
	set rnu
	set rnu?
    elseif (&rnu)
	set nornu
	set nonu?
    else
	set nu
	set nu?
    endif
endfunction

function ChangeTabMode()
    let sw=&shiftwidth
    let sts=&softtabstop

    if (sw == 4 && sts == 4 && &expandtab == 1)
	set softtabstop=8
	set shiftwidth=8
	set noexpandtab
	echo "softtabstop = 8, shiftwidth = 8, noexpandtab"
    elseif (sw == 8 && sts == 8 && &expandtab == 0)
	set softtabstop=4
	set shiftwidth=4
	echo "softtabstop = 4, shiftwidth = 4, noexpandtab"
    elseif (sw == 4 && sts == 4 && &expandtab == 0)
	set expandtab
	echo "softtabstop = 4, shiftwidth = 4, expandtab"
    else
	echo "No change, softtabstop = " &softtabstop ", shiftwidth = " &shiftwidth
	set expandtab?
    endif
endfunction

" -------------------------------------------------------------- "
"  Plugins settings						 "
" -------------------------------------------------------------- "

" pathogen
call pathogen#infect()
call pathogen#helptags()

" bundle/vim-easymotion
let g:EasyMotion_leader_key = ','

" bundle/nerdtree: tells NERDTree to use ASCII chars
let g:NERDTreeDirArrows = 0

" bundle/syntastic
let g:syntastic_php_phpcs_args = "--standard=PSR2 --tab-width=4"

" bundle/vim-go
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
" syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" -------------------------------------------------------------- "
"  Format, Encoding						 "
" -------------------------------------------------------------- "

set ffs=unix,dos ff=unix	" file stored formate
set nobomb		" no BOM(Byte Order Mark)"

set encoding=utf-8	" internal encoding
set fileencoding=utf-8	" file encoding
set termencoding=utf-8	" Terminal encoding
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le
" for ugly big5 file: <c>onvert
nmap <leader>c :e ++enc=big5<CR>

" -------------------------------------------------------------- "
"  Special key mapings						 "
" -------------------------------------------------------------- "

set timeoutlen=1000  " milliseconds that is waited for a key code or mapped key sequence to complete.

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

" double 0 == ^
nmap 00 ^
vmap 00 ^

" set leader to ','
map <SPACE> <Nop>
let mapleader="\ "
let g:mapleader="\ "

" ,q to quick quit
nmap <leader>q :q<CR>
" ,1 to quick write
nmap <leader>1 :w<CR>
" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>
" ,/ toggles hlsearch mode
nmap <leader>/ :set hlsearch!<BAR>set hlsearch?<CR>
" ,l rotate between nu, rnu, no{nu,rnu}
nmap <leader>l :call ChangeNuMode()<CR>
" ,<TAB> rotate between tab indention-mode
nmap <leader><TAB> :call ChangeTabMode()<CR>

" add a new line without entering insert mode
noremap <CR> o<Esc>

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" -------------------------------------------------------------- "
"  Appendix function keys					 "
" -------------------------------------------------------------- "

" <F1> default vim helper

" toggle NerdTree List
nmap <F2> <Esc>:NERDTreeToggle<CR>

" syntax debug: show highlight group
" nmap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" open the corresponding .{h,c,cpp} under the same directory
" nmap <F4> :tabe %:s#\.cpp$#.XY_CPP_XY#:s#\.h$#.cpp#:s#.XY_CPP_XY#.h#:s#\.cc$#.h#:s#\.[cC]$#.h#<CR>

" toggle TagList sider
" nmap <F6> :TlistToggle<CR>

" F8: move tab to left
" F9: move tab to right
