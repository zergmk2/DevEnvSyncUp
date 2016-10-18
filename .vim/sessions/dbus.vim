let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <expr> <Plug>(neocomplcache_start_unite_snippet) unite#sources#snippet#start_complete()
inoremap <silent> <expr> <Plug>(neocomplcache_start_unite_complete) unite#sources#neocomplcache#start_complete()
inoremap <Plug>(neocomplcache_start_auto_select_complete) <Down>
inoremap <Plug>(neocomplcache_start_auto_complete) 
imap <S-Tab> 
inoremap <C-Tab> 	
imap <F9> :InsPrevHita
imap <F8> :InsNextHita
imap <F5> :PreviewClassa
snoremap  a<BS>
snoremap  a<BS>
nmap d :cs find d =expand("<cword>")
nmap i :cs find i ^=expand("<cfile>")$
nmap f :cs find f =expand("<cfile>")
nmap e :cs find e =expand("<cword>")
nmap t :cs find t =expand("<cword>")
nmap c :cs find c =expand("<cword>")
nmap g :cs find g =expand("<cword>")
nmap s :cs find s =expand("<cword>")
snoremap % a<BS>%
snoremap ' a<BS>'
noremap <silent> ,u :sil s/^\V=escape(b:comment_leader,'\/')//e:noh
noremap <silent> ,c :sil s/^/=escape(b:comment_leader,'\/')/:noh
snoremap U a<BS>U
snoremap \ a<BS>\
nmap \vl <Plug>VLToggle
nmap <silent> \cv <Plug>VCSVimDiff
nmap <silent> \cu <Plug>VCSUpdate
nmap <silent> \cU <Plug>VCSUnlock
nmap <silent> \cs <Plug>VCSStatus
nmap <silent> \cr <Plug>VCSReview
nmap <silent> \cq <Plug>VCSRevert
nmap <silent> \cn <Plug>VCSAnnotate
nmap <silent> \cN <Plug>VCSSplitAnnotate
nmap <silent> \cl <Plug>VCSLog
nmap <silent> \cL <Plug>VCSLock
nmap <silent> \ci <Plug>VCSInfo
nmap <silent> \cg <Plug>VCSGotoOriginal
nmap <silent> \cG <Plug>VCSClearAndGotoOriginal
nmap <silent> \cd <Plug>VCSDiff
nmap <silent> \cD <Plug>VCSDelete
nmap <silent> \cc <Plug>VCSCommit
nmap <silent> \ca <Plug>VCSAdd
nmap <silent> \n <Plug>MarkClear
vmap <silent> \r <Plug>MarkRegex
nmap <silent> \r <Plug>MarkRegex
vmap <silent> \m <Plug>MarkSet
nmap <silent> \m <Plug>MarkSet
nmap \ihn :IHN
nmap \is :IHS:A
nmap \ih :IHS
snoremap ^ a<BS>^
snoremap ` a<BS>`
nmap gx <Plug>NetrwBrowseX
map <silent> mm <Plug>Vm_toggle_sign 
nmap wm :WMToggle
snoremap <Left> bi
snoremap <Right> a
snoremap <BS> a<BS>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")
vmap <kMultiply> *
map <S-F2> <Plug>Vm_goto_prev_sign
map <F2> <Plug>Vm_goto_next_sign
map <C-F2> <Plug>Vm_toggle_sign
nnoremap <silent> <Plug>CVSWatchRemove :CVSWatch remove
nnoremap <silent> <Plug>CVSWatchOn :CVSWatch on
nnoremap <silent> <Plug>CVSWatchOff :CVSWatch off
nnoremap <silent> <Plug>CVSWatchAdd :CVSWatch add
nnoremap <silent> <Plug>CVSWatchers :CVSWatchers
nnoremap <silent> <Plug>CVSUnedit :CVSUnedit
nnoremap <silent> <Plug>CVSEditors :CVSEditors
nnoremap <silent> <Plug>CVSEdit :CVSEdit
nnoremap <silent> <Plug>VCSVimDiff :VCSVimDiff
nnoremap <silent> <Plug>VCSUpdate :VCSUpdate
nnoremap <silent> <Plug>VCSUnlock :VCSUnlock
nnoremap <silent> <Plug>VCSStatus :VCSStatus
nnoremap <silent> <Plug>VCSSplitAnnotate :VCSAnnotate!
nnoremap <silent> <Plug>VCSReview :VCSReview
nnoremap <silent> <Plug>VCSRevert :VCSRevert
nnoremap <silent> <Plug>VCSLog :VCSLog
nnoremap <silent> <Plug>VCSLock :VCSLock
nnoremap <silent> <Plug>VCSInfo :VCSInfo
nnoremap <silent> <Plug>VCSClearAndGotoOriginal :VCSGotoOriginal!
nnoremap <silent> <Plug>VCSGotoOriginal :VCSGotoOriginal
nnoremap <silent> <Plug>VCSDiff :VCSDiff
nnoremap <silent> <Plug>VCSDelete :VCSDelete
nnoremap <silent> <Plug>VCSCommit :VCSCommit
nnoremap <silent> <Plug>VCSAnnotate :VCSAnnotate
nnoremap <silent> <Plug>VCSAdd :VCSAdd
map <S-F8> :NextInBlock
map <S-F9> :PrevInBlock
noremap <F5> :e!
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
noremap <F4> :set hlsearch! hlsearch?
nnoremap <silent> <F12> :bp
nnoremap <silent> <C-Right> :bp
nnoremap <silent> <C-Left> :bn
nnoremap <silent> <M-F12> :BufExplorer
nnoremap <silent> <F3> :Grep
nmap <F7> :cp
nmap <F6> :cn
nmap <F8> :!find `pwd` -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files :!cscope -b -i cscope.files -f cscope.out :cs reset
imap 	 
imap \ihn :IHN
imap \is :IHS:A
imap \ih :IHS
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoindent
set backspace=indent,eol,start
set completefunc=neocomplcache#manual_complete
set completeopt=menuone,longest,preview
set cscopeprg=/usr/bin/cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cscopetag
set cscopeverbose
set fileencodings=utf-8,gbk,ucs-bom,cp936,gb2312,gbk,gb18030
set guioptions=m
set helplang=en
set mouse=a
set printoptions=paper:letter
set ruler
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set showcmd
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tags=./tags,/usr/include/tags,/Development/ctags/cpp_src/tags
set termencoding=utf-8,gbk,ucs-bom,cp936,gb2312,gbk,gb18030
set visualbell
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /Development/open_source/dbus-1.4.14
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 /Development/open_source/dbus-1.4.14/compile
args compile
edit /Development/open_source/dbus-1.4.14/compile
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <F9> :call BASH_Debugger():redraw!
nmap <buffer> <silent> <NL> i=BASH_JumpCtrlJ()
nnoremap <buffer> "" ciW""P
nnoremap <buffer> '' ciW''P
map <buffer> <silent> \ro :call BASH_Toggle_Gvim_Xterm()
map <buffer> <silent> \rs :call BASH_Settings()
vmap <buffer> <silent> \rh :call BASH_Hardcopy("v")
nmap <buffer> <silent> \rh :call BASH_Hardcopy("n")
omap <buffer> <silent> \rh :call BASH_Hardcopy("n")
vmap <buffer> <silent> \rr :call BASH_Run("v")
map <buffer> <silent> \rd :call BASH_Debugger():redraw!
map <buffer> <silent> \rco :call BASH_SyntaxCheckOptionsLocal()
map <buffer> <silent> \rc :call BASH_SyntaxCheck()
map <buffer> <silent> \ra :call BASH_CmdLineArguments()
nmap <buffer> <silent> \rr :call BASH_Run("n")
omap <buffer> <silent> \rr :call BASH_Run("n")
map <buffer> <silent> \re :call BASH_MakeScriptExecutable()
noremap <buffer> \nts :BashStyle 
noremap <buffer> <silent> \ntr :call BASH_RereadTemplates()
noremap <buffer> <silent> \ntg :call BASH_EditTemplates("global")
noremap <buffer> <silent> \ntl :call BASH_EditTemplates("local")
noremap <buffer> <silent> \ne :call BASH_CodeSnippets("e")
vnoremap <buffer> <silent> \nw :call BASH_CodeSnippets("wv")
nnoremap <buffer> <silent> \nw :call BASH_CodeSnippets("w")
onoremap <buffer> <silent> \nw :call BASH_CodeSnippets("w")
noremap <buffer> <silent> \nr :call BASH_CodeSnippets("r")
nnoremap <buffer> <silent> \px a[:xdigit:]
nnoremap <buffer> <silent> \pw a[:word:]
nnoremap <buffer> <silent> \pu a[:upper:]
nnoremap <buffer> <silent> \ps a[:space:]
nnoremap <buffer> <silent> \ppu a[:punct:]
nnoremap <buffer> <silent> \ppr a[:print:]
nnoremap <buffer> <silent> \pl a[:lower:]
nnoremap <buffer> <silent> \pg a[:graph:]
nnoremap <buffer> <silent> \pd a[:digit:]
nnoremap <buffer> <silent> \pc a[:cntrl:]
nnoremap <buffer> <silent> \pb a[:blank:]
nnoremap <buffer> <silent> \pas a[:ascii:]
nnoremap <buffer> <silent> \pal a[:alpha:]
nnoremap <buffer> <silent> \pan a[:alnum:]
vnoremap <buffer> <silent> \sas s${[@]}<Left><Left><Left>P
nnoremap <buffer> <silent> \sas a${[@]}<Left><Left><Left><Left>
onoremap <buffer> <silent> \sas a${[@]}<Left><Left><Left><Left>
vnoremap <buffer> <silent> \sa s${[]}<Left><Left>P
nnoremap <buffer> <silent> \sa a${[]}<Left><Left><Left>
onoremap <buffer> <silent> \sa a${[]}<Left><Left><Left>
vnoremap <buffer> <silent> \se :call BASH_InsertTemplate("statements.echo", "v")
nnoremap <buffer> <silent> \se :call BASH_InsertTemplate("statements.echo")
onoremap <buffer> <silent> \se :call BASH_InsertTemplate("statements.echo")
vnoremap <buffer> <silent> \sp :call BASH_InsertTemplate("statements.printf", "v")
nnoremap <buffer> <silent> \sp :call BASH_InsertTemplate("statements.printf")
onoremap <buffer> <silent> \sp :call BASH_InsertTemplate("statements.printf")
vnoremap <buffer> <silent> \sfu :call BASH_InsertTemplate("statements.function", "v")
nnoremap <buffer> <silent> \sfu :call BASH_InsertTemplate("statements.function")
onoremap <buffer> <silent> \sfu :call BASH_InsertTemplate("statements.function")
vnoremap <buffer> <silent> \sw :call BASH_InsertTemplate("statements.while", "v")
vnoremap <buffer> <silent> \st :call BASH_InsertTemplate("statements.until", "v")
vnoremap <buffer> <silent> \ss :call BASH_InsertTemplate("statements.select", "v")
vnoremap <buffer> <silent> \sie :call BASH_InsertTemplate("statements.if-else", "v")
vnoremap <buffer> <silent> \si :call BASH_InsertTemplate("statements.if", "v")
vnoremap <buffer> <silent> \sfo :call BASH_InsertTemplate("statements.for", "v")
vnoremap <buffer> <silent> \sf :call BASH_InsertTemplate("statements.for-in", "v")
nnoremap <buffer> <silent> \sw :call BASH_InsertTemplate("statements.while")
onoremap <buffer> <silent> \sw :call BASH_InsertTemplate("statements.while")
nnoremap <buffer> <silent> \st :call BASH_InsertTemplate("statements.until")
onoremap <buffer> <silent> \st :call BASH_InsertTemplate("statements.until")
nnoremap <buffer> <silent> \ss :call BASH_InsertTemplate("statements.select")
onoremap <buffer> <silent> \ss :call BASH_InsertTemplate("statements.select")
nnoremap <buffer> <silent> \sie :call BASH_InsertTemplate("statements.if-else")
onoremap <buffer> <silent> \sie :call BASH_InsertTemplate("statements.if-else")
nnoremap <buffer> <silent> \si :call BASH_InsertTemplate("statements.if")
onoremap <buffer> <silent> \si :call BASH_InsertTemplate("statements.if")
nnoremap <buffer> <silent> \sfo :call BASH_InsertTemplate("statements.for")
onoremap <buffer> <silent> \sfo :call BASH_InsertTemplate("statements.for")
nnoremap <buffer> <silent> \sf :call BASH_InsertTemplate("statements.for-in")
onoremap <buffer> <silent> \sf :call BASH_InsertTemplate("statements.for-in")
noremap <buffer> <silent> \sl :call BASH_InsertTemplate("statements.elif")
noremap <buffer> <silent> \sc :call BASH_InsertTemplate("statements.case")
noremap <buffer> <silent> \cv :call BASH_CommentVimModeline()
noremap <buffer> <silent> \cr 0:s/^\s*echo\s\+\"// | s/\s*\"\s*$// | :normal ==j'
noremap <buffer> <silent> \ce ^iecho "<End>"j'
noremap <buffer> <silent> \ckn $:call BASH_InsertTemplate("comment.keyword-keyword")   
noremap <buffer> <silent> \cko $:call BASH_InsertTemplate("comment.keyword-workaround")
noremap <buffer> <silent> \ckw $:call BASH_InsertTemplate("comment.keyword-warning")   
noremap <buffer> <silent> \ckr $:call BASH_InsertTemplate("comment.keyword-tricky")    
noremap <buffer> <silent> \ckt $:call BASH_InsertTemplate("comment.keyword-todo")      
noremap <buffer> <silent> \ckb $:call BASH_InsertTemplate("comment.keyword-bug")       
vnoremap <buffer> <silent> \ct s:call BASH_InsertDateAndTime('dt')
nnoremap <buffer> <silent> \ct :call BASH_InsertDateAndTime('dt')
onoremap <buffer> <silent> \ct :call BASH_InsertDateAndTime('dt')
vnoremap <buffer> <silent> \cd s:call BASH_InsertDateAndTime('d')
nnoremap <buffer> <silent> \cd :call BASH_InsertDateAndTime('d')
onoremap <buffer> <silent> \cd :call BASH_InsertDateAndTime('d')
vnoremap <buffer> <silent> \cc :call BASH_CommentToggleRange()j
nnoremap <buffer> <silent> \cc :call BASH_CommentToggle()j
onoremap <buffer> <silent> \cc :call BASH_CommentToggle()j
noremap <buffer> <silent> \ch :call BASH_InsertTemplate("comment.file-description")
noremap <buffer> <silent> \cfu :call BASH_InsertTemplate("comment.function")
noremap <buffer> <silent> \cfr :call BASH_InsertTemplate("comment.frame")
noremap <buffer> <silent> \cs :call BASH_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call BASH_AdjustLineEndComm("v")
nnoremap <buffer> <silent> \cj :call BASH_AdjustLineEndComm("a")
onoremap <buffer> <silent> \cj :call BASH_AdjustLineEndComm("a")
vnoremap <buffer> <silent> \cl :call BASH_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call BASH_LineEndComment()A
onoremap <buffer> <silent> \cl :call BASH_LineEndComment()A
noremap <buffer> <silent> \hp :call BASH_HelpBASHsupport()
noremap <buffer> <silent> \hm :call BASH_help('m')
noremap <buffer> <silent> \hh :call BASH_help('h')
noremap <buffer> <silent> \hb :call BASH_help('b')
map <buffer> <silent> <F9> :call BASH_Debugger():redraw!
imap <buffer> <silent> <NL> =BASH_JumpCtrlJ()
imap <buffer> <silent> \ro :call BASH_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rs :call BASH_Settings()
imap <buffer> <silent> \rh :call BASH_Hardcopy("n")
imap <buffer> <silent> \rd :call BASH_Debugger():redraw!
imap <buffer> <silent> \rco :call BASH_SyntaxCheckOptionsLocal()
imap <buffer> <silent> \rc :call BASH_SyntaxCheck()
imap <buffer> <silent> \ra :call BASH_CmdLineArguments()
imap <buffer> <silent> \rr :call BASH_Run("n")
imap <buffer> <silent> \re :call BASH_MakeScriptExecutable()
inoremap <buffer> <silent> \px [:xdigit:]
inoremap <buffer> <silent> \pw [:word:]
inoremap <buffer> <silent> \pu [:upper:]
inoremap <buffer> <silent> \ps [:space:]
inoremap <buffer> <silent> \ppu [:punct:]
inoremap <buffer> <silent> \ppr [:print:]
inoremap <buffer> <silent> \pl [:lower:]
inoremap <buffer> <silent> \pg [:graph:]
inoremap <buffer> <silent> \pd [:digit:]
inoremap <buffer> <silent> \pc [:cntrl:]
inoremap <buffer> <silent> \pb [:blank:]
inoremap <buffer> <silent> \pas [:ascii:]
inoremap <buffer> <silent> \pal [:alpha:]
inoremap <buffer> <silent> \pan [:alnum:]
inoremap <buffer> <silent> \sas ${[@]}<Left><Left><Left><Left>
inoremap <buffer> <silent> \sa ${[]}<Left><Left><Left>
inoremap <buffer> <silent> \se :call BASH_InsertTemplate("statements.echo")
inoremap <buffer> <silent> \sp :call BASH_InsertTemplate("statements.printf")
inoremap <buffer> <silent> \sfu :call BASH_InsertTemplate("statements.function")
inoremap <buffer> <silent> \sw :call BASH_InsertTemplate("statements.while")
inoremap <buffer> <silent> \st :call BASH_InsertTemplate("statements.until")
inoremap <buffer> <silent> \ss :call BASH_InsertTemplate("statements.select")
inoremap <buffer> <silent> \sie :call BASH_InsertTemplate("statements.if-else")
inoremap <buffer> <silent> \si :call BASH_InsertTemplate("statements.if")
inoremap <buffer> <silent> \sfo :call BASH_InsertTemplate("statements.for")
inoremap <buffer> <silent> \sf :call BASH_InsertTemplate("statements.for-in")
inoremap <buffer> <silent> \sl :call BASH_InsertTemplate("statements.elif")
inoremap <buffer> <silent> \sc :call BASH_InsertTemplate("statements.case")
inoremap <buffer> <silent> \cv :call BASH_CommentVimModeline()
inoremap <buffer> <silent> \cr 0:s/^\s*echo\s\+\"// | s/\s*\"\s*$// | :normal ==j'
inoremap <buffer> <silent> \ce ^iecho "<End>"j'
inoremap <buffer> <silent> \ckn $:call BASH_InsertTemplate("comment.keyword-keyword")   
inoremap <buffer> <silent> \cko $:call BASH_InsertTemplate("comment.keyword-workaround")
inoremap <buffer> <silent> \ckw $:call BASH_InsertTemplate("comment.keyword-warning")   
inoremap <buffer> <silent> \ckr $:call BASH_InsertTemplate("comment.keyword-tricky")    
inoremap <buffer> <silent> \ckt $:call BASH_InsertTemplate("comment.keyword-todo")      
inoremap <buffer> <silent> \ckb $:call BASH_InsertTemplate("comment.keyword-bug")       
inoremap <buffer> <silent> \ct :call BASH_InsertDateAndTime('dt')a
inoremap <buffer> <silent> \cd :call BASH_InsertDateAndTime('d')a
inoremap <buffer> <silent> \cc :call BASH_CommentToggle()j
inoremap <buffer> <silent> \ch :call BASH_InsertTemplate("comment.file-description")
inoremap <buffer> <silent> \cfu :call BASH_InsertTemplate("comment.function")
inoremap <buffer> <silent> \cfr :call BASH_InsertTemplate("comment.frame")
inoremap <buffer> <silent> \cs :call BASH_GetLineEndCommCol()
inoremap <buffer> <silent> \cj :call BASH_AdjustLineEndComm("a")
inoremap <buffer> <silent> \cl :call BASH_LineEndComment()A
inoremap <buffer> <silent> \hp :call BASH_HelpBASHsupport()
inoremap <buffer> <silent> \hm :call BASH_help('m')
inoremap <buffer> <silent> \hh :call BASH_help('h')
inoremap <buffer> <silent> \hb :call BASH_help('b')
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=neocomplcache#manual_complete
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=~/.vim/bash-support/wordlists/bash.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'sh'
setlocal filetype=sh
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetShIndent()
setlocal indentkeys=0{,0},!^F,o,O,e,0=then,0=do,0=else,0=elif,0=fi,0=esac,0=done,),0=;;,0=;&,0=fin,0=fil,0=fip,0=fir,0=fix
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'sh'
setlocal syntax=sh
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd /Development/open_source/dbus-1.4.14
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
