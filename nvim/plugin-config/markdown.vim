let g:vim_markdown_folding_disabled = 1

augroup markdown
  autocmd FileType markdown TableModeEnable
  autocmd FileType markdown noremap <localleader>t :TableModeToggle<CR>
  autocmd FileType markdown noremap <localleader>pp :MarkdownPreview<CR>
  autocmd FileType markdown noremap <localleader>pc :MarkdownPreviewStop<CR>
  autocmd FileType markdown nmap <localleader>k ysiw<kbd>
  autocmd FileType markdown nmap <localleader>b ysiw*l.f*l
  autocmd FileType markdown nmap <localleader>e ysiw`f`l
  autocmd FileType markdown nmap <localleader>tl ysiw]f]a()<Esc>
  autocmd FileType markdown nmap <localleader>il ysiw]i!<Esc>f]a()<Esc>

  autocmd FileType markdown vmap <localleader>k S<kbd>
  autocmd FileType markdown vmap <localleader>b S*lysiw*f*l
  autocmd FileType markdown vmap <localleader>e S`f`
  autocmd FileType markdown vmap <localleader>tl S]f]a()<Esc>
  autocmd FileType markdown vmap <localleader>il S]i!<Esc>f]a()<Esc>
  autocmd FileType markdown vmap <localleader>c S<c-b-s><Esc>:%s/<\(\/\)\?c-b-s>/```/g<CR>
augroup END

