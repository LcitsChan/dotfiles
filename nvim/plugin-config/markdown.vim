let g:vim_markdown_folding_disabled = 1

augroup markdown
  autocmd FileType markdown TableModeEnable
  autocmd FileType markdown noremap <LocalLeader>t :TableModeToggle<CR>
  autocmd FileType markdown noremap <LocalLeader>f :TableFormat<CR>
  autocmd FileType markdown noremap <LocalLeader>pp :MarkdownPreview<CR>
  autocmd FileType markdown noremap <LocalLeader>pc :MarkdownPreviewStop<CR>
  autocmd FileType markdown nmap <LocalLeader>k ysiw<kbd>
  autocmd FileType markdown nmap <LocalLeader>b ysiw*l.f*l
  autocmd FileType markdown nmap <LocalLeader>e ysiw`f`l
  autocmd FileType markdown nmap <LocalLeader>tl ysiw]f]a()<Esc>
  autocmd FileType markdown nmap <LocalLeader>il ysiw]i!<Esc>f]a()<Esc>

  autocmd FileType markdown vmap <LocalLeader>k S<kbd>
  autocmd FileType markdown vmap <LocalLeader>b S<mbold><Esc>:%s/<\(\/\)\?mbold>/**/g<CR>
  autocmd FileType markdown vmap <LocalLeader>e S`f`
  autocmd FileType markdown vmap <LocalLeader>tl S]f]a()<Esc>
  autocmd FileType markdown vmap <LocalLeader>il S]i!<Esc>f]a()<Esc>
  autocmd FileType markdown vmap <LocalLeader>c S<c-b-s><Esc>:%s/<\(\/\)\?c-b-s>/```/g<CR>
augroup END

