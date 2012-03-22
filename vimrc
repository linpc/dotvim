" pathogen
call pathogen#infect()
call pathogen#helptags()
" 打開語法效果
syntax on
" 依檔名打開語法效果
filetype on

" smarttab: 按 <TAB> 每次會跳 4, 跳了兩次會自動變 '\t'
set sw=4
set softtabstop=4	" ??
set shiftwidth=4	" 自動縮排 4 格
set tabstop=8
set smarttab

set autoindent cindent
set smartindent		" ??
set backspace=indent,eol,start
set nomodeline		" security reason
set autoread		" 正在編輯的檔案有變動時立即更新
set ignorecase		" 搜尋不分大小寫
set smartcase		" 若搜尋字包含大寫字母的話就有分大小寫
set hlsearch		" 高亮度提示搜尋字
set showmatch		" 顯示對應的括號
set showcmd		" 顯示未完成的指令
set incsearch		" 一邊輸入搜尋字一邊跳到找到的地方
set number		" 顯示行號
set showmode		" 顯示現在的模式
set title		" 自動設定標題
" show the cursor position all the time
set ruler

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

colorscheme yzlin256	" 使用面板
set t_Co=256		" 256 色

set ffs=unix,dos ff=unix	" 檔案格式優先
set nocompatible	" 關閉 vi 兼容模式

" 將註解由深藍色變綠色
set background=dark
hi Comment ctermfg=cyan
"hi Comment term=bold ctermfg=darkcyan
hi Search         guifg=NONE        guibg=NONE        gui=underline ctermfg=231        ctermbg=57        cterm=underline
" hi Comment ctermfg=240	" 將註解由深藍色變灰色

" 遇到 Makefile 就 set noexpandtab
"autocmd BufRead,BufNewFile ?akefile* set noexpandtab
autocmd BufRead,BufNewFile ?akefile* set sw=8

" 底下的command status line為兩行
" set cmdheight=2

set laststatus=2	" 總是顯示資訊
set cursorline		" Line highlight 設此是游標整行會標註顏色

" 設定狀態列訊息
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

" Syntax Fold
syn region myFold start="{" end="}" transparent fold   
syn sync fromstart
set foldmethod=manual
" set fdm=indent
" ??
set fdc=3
" set formatoptions=mtcql	" 方便中文重排設定

" tab config
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
nmap <silent> <F8> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nmap <silent> <F9> :execute 'silent! tabmove ' . tabpagenr()<CR>

" Normal Mode時,可用tab及shift-Tab做縮排
nmap <tab> v>
nmap <s-tab> v<
" Visual/Select Mode時，也行
nmap <tab> v>
nmap <s-tab> v<
" Visual/Select Mode時，也行
vmap <tab> >gv
vmap <s-tab> <gv

" 設定 OmniComplete
fun! OmniComplete()
    let left = strpart(getline('.'), col('.') - 2, 1)
    if left =~ "^$"
        return ""
    elseif left =~ ' $'
        return ""
    else
        return "\<C-x>\<C-o>"
endfun
inoremap <silent> <S-Tab> <C-R>=OmniComplete()

autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType php set ofu=phpcomplete#CompletePHP
" autocmd FileType python set ofu=pythoncomplete#Complete
" autocmd FileType javascript set ofu=javascriptcomplete#CompleteJS
autocmd FileType html set ofu=htmlcomplete#CompleteTags
autocmd FileType css set ofu=csscomplete#CompleteCSS
autocmd FileType xml set ofu=xmlcomplete#CompleteTags

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

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" ------------------------------------------------------------
"  Plugins settings
" ------------------------------------------------------------
" bundle/vim-easymotion
let g:EasyMotion_leader_key = ','

" bundle/vim-autoclose
let g:AutoClosePairs_add = "<> \""

" ------------------------------------------------------------
"  End of Plugins settings
" ------------------------------------------------------------

" set leader to ,
let mapleader=","
let g:mapleader=","

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>
" ,/ toggles hlsearch mode
nmap <leader>/ :set hlsearch!<BAR>set hlsearch?<CR>

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set encoding=utf-8	" 內部編碼
set fenc=utf-8		" 編碼
set tenc=utf-8		" Terminal編碼
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le
" for ugly big5 file: <c>onv
nmap <leader>c :e ++enc=big5<CR>

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

" show highlight group
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
