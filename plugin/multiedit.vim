" Plugin:       multiedit
" Description:  Like :tabedit but with multiple arguments
" Author:       ObserverOfTime <chronobserver@disroot.org>
" Version:      0.0.1
" License:      Poetic License

if exists('g:loaded_multiedit') || &compatible
    finish
endif

let g:loaded_multiedit = 1

if !exists('g:multiedit_command')
    let g:multiedit_command = 'Multiedit'
endif

if !exists('g:multiedit_glob')
    let g:multiedit_glob = 1
endif

execute 'command! -nargs=* -complete=file -bang '.
            \ g:multiedit_command .' :call s:MultiEdit(<bang>0, <f-args>)'

function! s:MultiEdit(bang, ...)
    if !len(a:000)
        tabnew
        return
    endif
    let l:files = []
    if g:multiedit_glob
        for l:a in a:000
            let l:multi = split(glob(l:a), '\n')
            if len(l:multi) > 0
                let l:files += l:multi
            elseif !a:bang && l:a =~# '\*'
                echoerr 'No matching files found for "'. l:a .'"'
            else
                let l:files += [l:a]
            endif
        endfor
    else
        let l:files = a:000
    endif
    for l:f in l:files
        if !isdirectory(l:f)
            silent execute 'tabedit '. l:f
        endif
    endfor
endfunction

" vim:set et sw=4 ts=4:
