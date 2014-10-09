" Toggle between interactive rebase options
" Source:
" http://bloerg.net/2013/12/04/a-tiny-vim-plugin-for-interactive-git-rebasing.html
function RebaseActionToggle()
    let line = getline(".")
    let result = matchstr(line, "^\\a")
    let transitions = {'p': 'squash', 's': 'edit', 'e': 'fixup', 'f': 'pick'}
    execute "normal! ^cw" . transitions[result]
    execute "normal! ^"
endfunction

noremap <CR> :call RebaseActionToggle()<CR>
