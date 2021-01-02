let g:vim_markdown_folding_disabled = 1

augroup markdown
  autocmd FileType markdown TableModeEnable
  autocmd FileType markdown nmap mk ysiw<kbd>
  autocmd FileType markdown nmap mb ysiw*l.f*l
  autocmd FileType markdown nmap me ysiw`f`l
  autocmd FileType markdown nmap mtl ysiw]f]a()<Esc>
  autocmd FileType markdown nmap mil ysiw]i!<Esc>f]a()<Esc>

  autocmd FileType markdown vmap mk S<kbd>
  autocmd FileType markdown vmap mb S*lysiw*f*l
  autocmd FileType markdown vmap me S`f`
  autocmd FileType markdown vmap mtl S]f]a()<Esc>
  autocmd FileType markdown vmap mil S]i!<Esc>f]a()<Esc>
  autocmd FileType markdown vmap mc S<c-b-s><Esc>:%s/<\(\/\)\?c-b-s>/```/g<CR>
augroup END

