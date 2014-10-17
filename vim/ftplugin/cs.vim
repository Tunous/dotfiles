nnoremap <buffer> gm :wa<CR>:silent OmniSharpBuildAsync<CR>
nnoremap <buffer> <Leader>F :OmniSharpFixUsings<CR>
nnoremap <buffer> gM :wa<CR>:!xbuild /p:Configuration=Release<CR>
