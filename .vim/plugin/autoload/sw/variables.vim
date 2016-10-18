"============================================================================"
"
"  Vim SQL Workbench/J Implementation
"
"  Copyright (c) Cosmin Popescu
"
"  Author:      Cosmin Popescu <cosminadrianpopescu at gmail dot com>
"  Version:     1.00 (2015-01-08)
"  Requires:    Vim 7
"  License:     GPL
"
"  Description:
"
"  Provides SQL database access to any DBMS supported by SQL Workbench/J. The
"  only dependency is SQL Workbench/J. Also includes powefull intellisense
"  autocomplete based on the current selected database
"
"============================================================================"

function! s:set_delimiters()
    if !exists('g:sw_p_suffix') && !exists('g:sw_p_prefix')
        let g:sw_prefix = sw#get_sw_setting('workbench.sql.parameter.prefix')
        let g:sw_suffix = sw#get_sw_setting('workbench.sql.parameter.suffix')
        if g:sw_prefix == ''
            let g:sw_p_prefix = '\$\['
        endif
        if g:sw_suffix == ''
            let g:sw_p_suffix = '\]'
        endif

        let g:parameters_pattern = g:sw_p_prefix . '[?&]\([a-zA-Z_].\{\-\}\)' . g:sw_p_suffix
        if g:sw_p_suffix == ''
            let g:parameters_pattern = g:parameters_pattern . '\>'
        endif
    endif
endfunction

function! s:init_vars()
    if !exists('b:variables')
        call sw#session#set_buffer_variable('variables', {})
    endif
endfunction

function! sw#variables#set(key, value, ...)
    call s:init_vars()
    let val = a:value
    if a:0
        let i = 1
        while i <= a:0
            execute "let v = a:" . i
            if i < a:0 || v != ''
                execute "let val = val . ' ' . a:" . i
            endif
            let i = i + 1
        endwhile
    endif
    call sw#session#set_buffer_variable("variables." . a:key, val)
endfunction

function! sw#variables#list()
    call s:init_vars()
    echo string(b:variables)
endfunction

function! sw#variables#autocomplete_names(ArgLead, CmdLine, CursorPos)
    call s:init_vars()
    let words = split('^' . a:CmdLine, '\v\s+')
    let result = []
    if len(words) == 1 || (len(words) == 2 && !(a:CmdLine =~ '\v\s+$'))
        for key in keys(b:variables)
            if key =~ a:ArgLead
                call add(result, key)
            endif
        endfor
    endif
    return result
endfunction

function! sw#variables#unset(key)
    call s:init_vars()
    call sw#session#unset_buffer_variable('variables.' . a:key)
endfunction

function! sw#variables#get(key)
    call s:init_vars()
    let value = input('Please input the value for ' . a:key . ': ')
    call sw#variables#set(a:key, value)
    return value
endfunction

function! sw#variables#extract(sql)
    call s:set_delimiters()
    let result = []
    let n = 0
    let i = match(a:sql, g:parameters_pattern, n)
    while i != -1
        let l = matchlist(a:sql, g:parameters_pattern, n)
        let s = substitute(l[0], '^' . g:sw_p_prefix . '?', '', 'g')
        let n = i + strlen(l[0]) + 1
        if index(result, l[1]) == -1
            call add(result, l[1])
        endif
        let i = match(a:sql, g:parameters_pattern, n)
    endwhile
    return result
endfunction
