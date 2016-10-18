"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'einars/js-beautify'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'Yggdroot/indentLine'
Plugin 'Shougo/vimproc'
Plugin 'Shougo/unite.vim'
Plugin 'm2mdas/phpcomplete-extended'
Plugin 'burnettk/vim-angular'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set list
set listchars=tab:>-,trail:-,
set hidden
set laststatus=2
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
" 获取当前路径，将$HOME转化为~
function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "g")
	return curdir
endfunction
"set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|%{fugitive#statusline()}
"cs a /Development/Linux/mrvl-2.0/cscope.out /Development/Linux/mrvl-3.0
"允许光标在任何位置时用CTRL-TAB遍历buffer
let g:miniBufExplMapCTabSwitchBufs=1
"set tags=/path/to/tags
 "set tags+=/Development/linux-2.6.22.6/tags
set shortmess+=A
set mouse=a
set t_Co=256
"filetype plugin on
set nocp
"filetype plugin indent on
"set completeopt=longest,menu
let b:javascript_fold=1
let javascript_enable_domhtmlcss=1
set pastetoggle=<F9>
if has("cscope")
set csprg=/usr/bin/cscope
set csto=0
set cst
set cscopetag cscopeverbose
set csverb
set cscopetag
endif
if has('quickfix')
	"set cscopequickfix=s-,c-,d-,i-,t-,e-
endif

cnoreabbrev csa cs add
cnoreabbrev csf cs find
cnoreabbrev csk cs kill
cnoreabbrev csr cs reset
cnoreabbrev css cs show
cnoreabbrev csh cs help
set autoindent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"set fileencodings=utf-8,gbk,ucs-bom,cp936
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"nnoremap <F8> :TlistToggle<CR>
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:cw<CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:cw<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <F8> :!find `pwd` -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR> :!cscope -b -i cscope.files -f cscope.out<CR> :cs reset<CR>

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
nmap wn :TlistToggle<cr>
nnoremap <silent> <F3> :Grep<CR>
set autochdir 
colorscheme calmar256-dark
set nu!
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
set guioptions=m
"set guioptions=L
set termencoding=utf-8,gbk,ucs-bom,cp936,gb2312,gbk,gb18030
set encoding=utf-8
"set encoding=prc
set fileencodings=utf-8,gbk,ucs-bom,cp936,gb2312,gbk,gb18030
"let &termencoding=&encoding
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <C-left> :bn<CR>
nnoremap <silent> <C-right> :bp<CR>

nnoremap <silent> <F12> :bp<CR>
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
""""""""""""""""""""""""""""""""""""""""""""""""
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()



"""""""""""""""""""""""""""""""""""""""""""""""""



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



map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set cscopequickfix=s-,c-,d-,i-,t-,e-
let g:neocomplcache_enable_at_startup=1
let g:NeoComplCache_DisableAutoComplete=1
"let g:SuperTabDefaultCompletionType="context"
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview


"===================================================================
let g:quickfix_is_open = 0
let g:quickfix_return_to_window = 0
let g:vertical_is_open = 0

function! QuickfixToggle()
	if g:quickfix_is_open
		cclose
		let g:quickfix_is_open = 0
		execute g:quickfix_return_to_window . "wincmd w"
	else
		let g:quickfix_return_to_window = winnr()
		copen
		let g:quickfix_is_open = 1
	endif
endfunction

function! Test()
	let a = expand("<cword>")
	let @+ = a
"	if g:quickfix_is_open == 0
"		exec ":vs"
"		let g:vertical_is_open = 1
"	endif
	call setqflist([])
	exec ":cs f g " . a
	exec ":copen"
endfunction
set showcmd
"set tags=/Development/Linux/mrvl-3.0/tags
"keyboard shotcut list
:noremap <F5> :e!<CR>
map <C-up> :cclose<CR>
map <C-f> :call setqflist([])<CR>
map <C-down> :copen<CR>
map <C-p> :vsp <CR> <C-W>l :exec("tag ".expand("<cword>"))<CR>
"map <C-p> <C-W>l :exec("tag ".expand("<cword>"))<CR>
map <C-\> :call Test()<CR><CR>
"===================================================================
set paste
" Filter the quickfix list
function! FilterQFList(type, action, pattern)
	" get current quickfix list
	let s:curList = getqflist()
	let s:newList = []
	for item in s:curList
		if a:type == 0     " filter on file names
			let s:cmpPat = bufname(item.bufnr)
		elseif a:type == 1 " filter by line content
			let s:cmpPat = item.text . item.pattern
		endif
		if item.valid
			if a:action < 0
				" Keep only nonmatching lines
				if s:cmpPat !~ a:pattern
					let s:newList += [item]
				endif
			else
				" Keep only matching lines
				if s:cmpPat =~ a:pattern
					let s:newList += [item]
				endif
			endif
		endif
	endfor
	call setqflist(s:newList)
endfunction
nnoremap <C-l> :call FilterQFList(1, 1, inputdialog('Keep only lines matching:', ''))<CR>
:set cscopequickfix=g+,s+,c+,d+,i+,t+,e+

"mark.vim
"nnoremap <C-m> \\* <CR>
"nnoremap <C-n> \\# <CR>
"vnoremap y "+y
"noremap p "+p
"noremap y "+y
"noremap d "+d
"noremap dd "+dd
"vnoremap p "+p
"vnoremap d "+d

"Showing a different background colour in Vim past 80 characters
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")
set clipboard=unnamedplus				" use the system clipboard for yank/put/delete
set mousemodel=popup 					" right-click pops up context menu
set ruler						" show cursor position in status bar
"set cursorline						" highlight the current line
hi CursorLine   cterm=NONE ctermbg=0

set list
noremap <C-l> :set list!<CR>
"set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

let c_minlines = 200
"This will make the syntax synchronization start 100 lines before the first
"displayed line.  The default value is 50 (15 when c_no_if0 is set).  The
"disadvantage of using a larger number is that redrawing can become slow.

"" I haven't found how to hide this function (yet)
"function! RestoreRegister()
"  let @" = s:restore_reg
"  return ''
"endfunction
"
"function! s:Repl()
"    let s:restore_reg = @"
"    return "p@=RestoreRegister()\<cr>"
"endfunction
"
"" NB: this supports "rp that replaces the selection by the contents of @r
"vnoremap <silent> <expr> p <sid>Repl()
" set ts=4 sw=4 ai
" set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"auto complete feature for several languages
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_auto_trigger = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" Scrolling in vim autocomplete box with jk movement keys
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
set noswapfile

"===========================================
" vim-flak8 configuration
let g:flake8_ignore="E501"
"===========================================
filetype plugin indent on    " required
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
let g:clang_library_path='/usr/lib/llvm-3.5/lib/'
