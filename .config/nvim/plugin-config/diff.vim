" https://vim.fandom.com/wiki/Diff_current_buffer_and_the_original_file
" function! s:DiffWithSaved()
"   let filetype=&ft
"   diffthis
"   vnew | r # | normal! 1Gdd
"   diffthis
"   exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
" endfunction
" com! DiffSaved call s:DiffWithSaved()

" h DiffOrig
command! DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_
  \ | diffthis | wincmd p | diffthis
