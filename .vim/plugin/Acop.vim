" Commenting of #endifs etc
" Author: Ben Schmidt, minor modifications by A. S. Budden.
command SmartPreProcCommenter call SmartPreProcCommenter()

function! SmartPreProcCommenter()
  mark y
  let saved_wrapscan=&wrapscan
  set nowrapscan
  let elsecomment=""
  let endcomment=""
  try
    " Find the last #if in the buffer
    $?^\s*#if
    while 1
      " Build the comments for later use, based on current line
      let content=getline('.')
      let elsecomment=BuildElseComment(content,elsecomment)
      let endcomment=BuildEndComment(content,endcomment)
      " Change # into ## so we know we've already processed this one
      " and don't find it again
      s/^\s*\zs#/##
      " Find the next #else, #elif, #endif which must belong to this #if
      /^\s*#\(elif\|else\|endif\)
      let content=getline('.')
      if match(content,'^\s*#elif') != -1
        " For #elif, treat the same as #if, i.e. build new comments
        continue
      elseif match(content,'^\s*#else') != -1
        " For #else, add/replace the comment
        call setline('.',ReplaceComment(content,elsecomment))
        s/^\s*\zs#/##
        " Find the #endif
        /^\s*#endif
      endif
      " We should be at the #endif now; add/replace the comment
      call setline('.',ReplaceComment(getline('.'),endcomment))
      s/^\s*\zs#/##
      " Find the previous #if
      ?^\s*#if
    endwhile
  catch /search hit TOP/
    " Once we have an error (pattern not found, i.e. no more left)
    " Change all our ## markers back to #
    silent! %s/^\s*\zs##/#
  endtry
  let &wrapscan=saved_wrapscan
  normal `y
endfunc

let s:PreProcCommentMatcher = '#\a\+\s\+\zs.\{-}\ze\(\s*\/\*.\{-}\*\/\)\?\s*$'

function! BuildElseComment(content,previous)
  let expression=escape(matchstr(a:content,s:PreProcCommentMatcher), '\~&')
  if match(a:content,'#ifdef') != -1
    return "/* NOT def ".expression." */"
  elseif match(a:content,'#ifndef') != -1
    return "/* def ".expression." */"
  elseif match(a:content,'#if') != -1
    return "/* NOT ".expression." */"
  elseif match(a:content,'#elif') != -1
    return substitute(a:previous,' \*/',', '.expression.' */','')
  else
    return ""
  endif
endfunc

function! BuildEndComment(content,previous)
  let expression=escape(matchstr(a:content,s:PreProcCommentMatcher), '\~&')
  if match(a:content,'#ifdef') != -1
    return "/* def ".expression." */"
  elseif match(a:content,'#ifndef') != -1
    return "/* NOT def ".expression." */"
  elseif match(a:content,'#if') != -1
    return "/* ".expression." */"
  elseif match(a:content,'#elif') != -1
    return substitute(a:previous,' \*/',', '.expression.' */','')
  else
    return ""
  endif
endfunc

function! ReplaceComment(content,comment)
  let existing=escape(matchstr(a:content,'#\a\+\s\+\zs.\{-}\s*$'), '\~&')
  if existing == ""
    return substitute(a:content,'^\s*#\a\+\zs.*'," ".a:comment,'')
  elseif existing != a:comment && match(existing,'XXX') == -1
    return a:content." /* XXX */"
  else
    return a:content
  endif
endfunc

