set nobackup
set tabstop=4
set cindent shiftwidth=4
set hlsearch
set showmode
set ruler
set backspace=indent,eol,start
set nocompatible
filetype plugin on
syntax on
set showcmd
"set nu
set tw=0
"set incsearch	
set fileformats=unix,dos

map <F2> :e ++ff=dos<CR>
map <F3> :set mouse=a<CR>
"map <F4> :set mouse=<CR>
map <F4> :TlistToggle<CR>
map <F5> :ToggleType<CR> :30sp /0/typing/.1.c<CR> <C-W>w gg
"map <F5> :invnumber<CR>
"map <F8> [I

"map <F8> :qa<CR>
map <F8> dd :w<CR> :b2<CR><ESC>p<ESC>:w<CR><ESC>:b1<CR>
"map <F8> dd :w<CR> :b2<CR><ESC>p<ESC>:w<CR><ESC>:b1<CR>gg:36<CR>
"map <F7> /<C-R>=expand("<cword>")<CR><CR> :b3<CR>n
map <F7> <C-W>w<ESC>:q<CR>
nmap <F9> :call Mydict2()<CR> <C-W>w b
nmap <F10> :call Mydict1()<CR> <C-W>w b
map <F11> :call Myword()<CR><C-W>w /<C-R>=expand("<cword>")<CR><CR>N
map <F12> <ESC>^i*<ESC>ww

" Detect the system
function! MySys()
    if has("win32")
return "win32"
    elseif has("unix")
        return "unix"
    else
return "mac"
    endif
endfunction

let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File=1
let Tlist_File_Fold_Auto_Close=1
"let Tlist_WinWidth=50

function! Myword()
  cd /0
  let expl=system('grep -rin -m 10 ' .
        \  expand("<cword>") .
        \  ' /0/grep '
        \  )
  windo if  
        \ expand("%")=="diCt-tmp" |  
        \ q!|endif  
  bel 30sp diCt-tmp  
  setlocal buftype=nofile bufhidden=hide noswapfile  
  s/^/\=expl/  
  :0
endfunction  

function! Mydict1()  
  let expl=system('sdcv -n -u Oxford ' . 
        \  expand("<cword>"))  
  windo if  
        \ expand("%")=="diCt-tmp" |  
        \ q!|endif  
  bel 30sp diCt-tmp  
  setlocal buftype=nofile bufhidden=hide noswapfile  
  1s/^/\=expl/  
  silent :%s/\./\.\r/g
  :set syntax=eng
  1  
endfunction  

function! Mydict2()  
  let expl=system('sdcv -n -u Longman ' .  
        \  expand("<cword>"))  
  windo if  
        \ expand("%")=="diCt-tmp" |  
        \ q!|endif  
  bel 30sp diCt-tmp  
  setlocal buftype=nofile bufhidden=hide noswapfile  
  1s/^/\=expl/  
  ":%s/\/\//\r/
  silent :%s/\/\//\r/ge
  silent :%s/--/\r--/ge
  silent :%s/\n\s*\n/\r/g
  :set syntax=eng
  1  
endfunction  




"	\ 'auto_export': 1,

if MySys()=="unix"
	"colorscheme ron
	colorscheme darkblue
	set fileencodings=utf-8,gb2312,gbk,gb18030
	set termencoding=utf-8
	"set fileformats=unix
	set encoding=utf-8
	
	let g:vimwiki_list = [{'path': '/workspace/wiki/',
		\ 'path_html': '/var/www/',
		\ 'template_path': '/workspace/wiki/.template/',
		\ 'template_default': 'united',
		\ 'index': 'index',
		\ 'ext': '.txt',
		\ 'syntax': 'markdown',
		\ 'nested_syntaxes': {'python': 'python', 'cpp': 'cpp', 'c': 'c', 'java': 'java'},
		\ 'template_ext': '.html'},
		\ {'path': '/workspace/wiki/reading'}]
	
endif

if MySys()=="win32"
	cd d:\dropbox\reading
	set fileformats=dos
	colorscheme darkblue

	let &termencoding=&encoding
	set fileencodings=utf-8
	let g:vimwiki_list = [{'path': 'd:/Dropbox/reading',
	    \ 'path_html': 'd:/wiki_html/',
	    \ 'template_path': 'd:/wiki/.template/',
	    \ 'template_default': 'united',
	    \ 'index': 'index',
	    \ 'ext': '.txt',
	    \ 'syntax': 'markdown',
	    \ 'nested_syntaxes': {'python': 'python', 'cpp': 'cpp', 'c': 'c', 'java': 'java'},
	    \ 'template_ext': '.html'},
		\ {'path': 'd:/wiki/',
	    \ 'index': 'index',
	    \ 'ext': '.md'}]

endif 

function! Clean_Srt()
    silent %s/^\d\+\n\s*\d\{2}:.*-->.*\n//ge   "删除序号和时间轴
    silent %s/<.\{-}>//ge                   "删除尖括号内的内容
    silent %s/^$\n//ge                      "删除隔行
    silent %s/[^.!?]\zs\n/ /ge              "拼接断行
    silent %s/\n/&&/g                       "重新添加隔行
endfunction
