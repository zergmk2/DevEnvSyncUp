set viewoptions=folds
"au BufWinLeave * mkview
"au BufWinEnter *.* silent loadview
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
"vmap <space> zf

" CROSSFOLD FUNCTION
" ==================
" Made by the Coder of Salvation (http://leon.vankammen.eu) @ 2010
"
" inspired by Max Ischenko's http://www.vim.org/tips/tip.php?tip_id=108
" this is great when :
"   - you have big functions with big comments
"   - you have files containing multiple syntaxes (like html and javascript in 1 php file)
"
" USAGE: 1) press space on the beginning of a functioncomment and it will fold comment + function
"        2) press space on the beginning of an xml/html tag and it will fold the tag
"
function ToggleFold()
  set foldmethod=manual
  if foldlevel('.') == 0
    " No fold exists at the current line,
    " so create a fold based on braces or brackets
    let x    = line('.')    " the current line number (start fold)
    let y    = x + 1        " the end line number (end fold)
    let i    = indent('.')  " the indentation of the current line
    let last = line('$')    " the last line number
    normal 0

    " determine endtoken
    if ( &ft == "xml" || &ft == "html" )
      let endtoken = "<"
      normal j
    else
      let endtoken = "}"
    endif
    " goto endtoken on same indent
    while ( indent( search( endtoken ) ) != i )
    endwhile
    let y = line('.')
    " if we have extra blank space to fold, increment lastline for fold
    if( y != last && strlen( getline(y+1) ) == 0 )
      let y = y + 1
    endif
    " if last line, something went wrong and we are dealing with a comment?
    if y == last
     echo "?? hmm..got last line of file as fold-end, maybe try 'zf' on a visual selection?"
     return
    endif
    " Create the fold from x to y
    execute x . "," . y . " fold"
    normal j
  else
     " Delete the fold on the current line
     normal zd
  endif
endfunction

"nmap <space> :call ToggleFold()<CR>"


