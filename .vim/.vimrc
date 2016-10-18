set shortmess+=A
set mouse=a
set t_Co=256
:filetype plugin on
if has("cscope")
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb


"set tags+=set path+=/usr/include
"set path+=/usr/src/linux-headers-2.6.31-22-generic/include/linux
" add any database in current directory
if filereadable("cscope.out")
cs add cscope.out .
elseif filereadable("../cscope.out")
cs add ../cscope.out ..
elseif filereadable("../../cscope.out")
cs add ../../cscope.out ../..
elseif filereadable("../../../cscope.out")
cs add ../../../cscope.out ../../..

" else add database pointed to by environment
elseif $CSCOPE_DB != ""
cs add $CSCOPE_DB
endif

:cs add /Development/linux-2.6.22.6/cscope.out /Development/linux-2.6.22.6
:set csverb
:set cscopetag
:set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif
"nnoremap <F8> :TlistToggle<CR>
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <F8> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR> :!cscope -b -i cscope.files -f cscope.out<CR> :cs reset<CR>

nmap <F6> :cn<cr>
nmap <F7> :cp<cr>
""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
"nnoremap <F7> :Sexplore!<CR>
set tags=tags;
let g:winManagerWindowLayout='FileExplorer|TagList'

nmap wm :WMToggle<cr>
nnoremap <silent> <F3> :Grep<CR>
set autochdir 
colorscheme calmar256-dark
set nu!
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
set guioptions=L
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=prc

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

"comment visually selection
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java let b:comment_leader = '// '
au FileType sh,make let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '
noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

"c comments out a region
"u uncomments a region




" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


:nnoremap <C-v> "+P=']
:inoremap <C-v> <C-o>"+P<C-o>=']
" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

:set cscopequickfix=s-,c-,d-,i-,t-,e-
:set tags=./tags,/usr/include/tags,/usr/src/linux-headers-2.6.31-22-generic/include/linux/tags
