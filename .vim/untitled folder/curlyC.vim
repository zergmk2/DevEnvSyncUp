" curlyC.vim
" From Long Truong : Vim Tip #125.
" Automatically comments {} in C/C++/Java.

au BufNewFile,BufRead *.c,*.cc,*.h imap }<CR> <Esc>:call CurlyBracket()<CR>a
au BufNewFile,BufRead *.cpp,*.C imap }<CR> <Esc>:call CurlyBracket()<CR>a
au BufNewFile,BufRead *.java,*.idl imap }<CR> <Esc>:call CurlyBracket()<CR>a

function CurlyBracket()
 let l:startline = line(".")
 let l:result1 = searchpair('{', '', '}', 'bW')
 if (result1 > 0)
 let l:linenum = line(".")
 let l:string1 = substitute(getline(l:linenum), '^\s*\(.*\)\s*$', '\1', "")
 if (l:string1 =~ '^{')
 let l:string1 = substitute(getline(l:linenum - 1), '^\s*\(.*\)\s*$', '\1', "") . " " . l:string1
 sil exe "normal k"
 endif

 " get else part if necessary
 if (l:string1 =~ "^}")
 sil exe "normal 0"
 let l:result2 = searchpair('{', '', '}', 'bW')
 if (l:result2 > 0)
 let l:linenum = line(".")
 let l:string2 = substitute(getline(l:linenum), '^\s*\(.*\)\s*$', '\1', "")
 if (l:string2 =~ '^{')
 let l:string2 = substitute(getline(l:linenum - 1), '^\s*\(.*\)\s*$', '\1', "") . " " . l:string2
 endif
 let l:string1 = l:string2 . " ... " . l:string1
 endif
 endif

 " remove trailing whitespaces and curly brace
 let l:my_string = substitute(l:string1, '\s*{[^{]*$', '', "")
 let l:my_strlen = strlen(l:my_string)
 if (l:my_strlen > 30)
 let l:my_string = strpart(l:my_string,0,30)."..."
 endif

 sil exe ":" . l:startline
 sil exe "normal i}"
 if ((l:startline - l:linenum) > 10)
 sil exe "normal a /* " . l:my_string . " */"
 endif

 endif
endfunction

