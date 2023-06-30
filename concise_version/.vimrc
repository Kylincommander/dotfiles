

" Allow use mouse
set ttymouse=xterm2
set mouse=a

" 
set number
set relativenumber

" Ignore compiled files
  set wildignore=*.o,*~,*.pyc
  if has("win16") || has("win32")
      set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
  else
      set wildignore+=.git\*,.hg\*,.svn\*
  endif

"Always show current position
      set ruler

" Ignore case when searching
      set ignorecase

" When searching try to be smart about cases 
      set smartcase

" Highlight search results
      set hlsearch

" Makes search act like search in modern browsers
      set incsearch 

" Show how many matches and which one you are looking at when doing search
      set shortmess-=S

" Don't redraw while executing macros (good performance config)
      set lazyredraw 

" For regular expressions turn magic on
      set magic

" Show matching brackets when text indicator is over them
      set showmatch 

" Add a bit extra margin to the left
"      set foldcolumn=1

"set lines=50 columns=160
" Resize the current vim window to the suitble size when openup
autocmd VimEnter * resize

" Hilight cursor line and column
set cursorcolumn
set cursorline

" Always Keeps 5 lines visible above/below cursor.
set scrolloff=5


" """"""""""""""""""""""""""""""
" " => Custom braces-matching 
" """"""""""""""""""""""""""""""

" This is useful when coding verilog
" You need to install matchit plugin with the guide with command:
"       :help matchit-install
" After installation done,
" Let the matchit plugin know what items can be matched.
if exists("loaded_matchit")
  " Don't ignore case
  let b:match_ignorecase=0

  " Don't ignore match in the comments
  let b:match_skip = '0'
  "You can get the default behavior with >
  "    let b:match_skip = 's:comment\|string'

  let b:match_words=
      \ '\<begin\>:\<end\>,' .
      \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
      \ '\<module\>:\<endmodule\>,' .
      \ '\<if\>:\<else\>,' .
      \ '\<function\>:\<endfunction\>,' .
      \ '`ifdef\>:`else\>:`endif\>,' .
      \ '\<task\>:\<endtask\>,' .
      \ '\<specify\>:\<endspecify\>'
endif






" """"""""""""""""""""""""""""""
" " => Key Bindings 
" """"""""""""""""""""""""""""""

" Easier split navigations
"- Already manually installed a plugin from 
"   https://github.com/christoomey/vim-tmux-navigator/blob/master/plugin/tmux_navigator.vim
"- Below remap nolonger required.
"nnoremap <C-j> <C-w><C-j>
"nnoremap <C-k> <C-w><C-k>
"nnoremap <C-l> <C-w><C-l>
"nnoremap <C-h> <C-w><C-h>


" """"""""""""""""""""""""""""""
" " => Status line / Tabline related
" """"""""""""""""""""""""""""""

" set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

" Always show tabline bar
set showtabline=2


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Enable syntax highlighting
 syntax enable 

 try
     " colorscheme desert

     "Third Party color scheme from  : https://github.com/tomasiser/vim-code-dark
     colorscheme codedark
 endtry

 set background=dark

 " Set extra options when running in GUI mode
 if has("gui_running")
     set guioptions-=T
     set guioptions-=e
     set t_Co=256
     set guitablabel=%M\ %t
     set guifont=Monospace\ 18
 endif


 " Bellow are configurations for plugin ranbow brackets from : 
 " https://github.com/frazrepo/vim-rainbow
 let g:rainbow_active = 1

 let g:rainbow_load_separately = [
     \ [ '*.v' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['begin','end']] ], 
     \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
     \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
     \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
     \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<','>']] ],
     \ ]
 
 let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
 let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

 " Set utf8 as standard encoding and en_US as the standard language
 set encoding=utf8

 " Use Unix as the standard file type
 set ffs=unix,dos,mac

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Text, tab and indent related
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4


set ai "Auto indent
    " Auto indent could be annoying when pasting in vim not gvim,
    " So map F3 to toggle paste mode to avoid that
    set pastetoggle=<F3>


set si "Smart indent
set wrap "Wrap lines

" Show tab and white space as characters like VSCode.




" """"""""""""""""""""""""""""""
" " => Visual mode related
" """"""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :call VisualSelection('f', '')<CR>
" vnoremap <silent> # :call VisualSelection('b', '')<CR>


" Return to last edit position when opening files (You want this!)
     autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif



" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction



