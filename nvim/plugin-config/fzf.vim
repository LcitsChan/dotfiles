let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'TODO', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = $FZF_DEFAULT_OPTS." --height 80% --preview-window 'right:60%:nohidden'"

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Lines call fzf#vim#lines(<q-args>, {'options': ['--preview-window=hidden']}, <bang>0)
command! -bang -nargs=* BLines call fzf#vim#buffer_lines(<q-args>, {'options': ['--preview-window=hidden']}, <bang>0)
command! -bar -bang Colors call fzf#vim#colors({'options': ['--preview-window=hidden']}, <bang>0)
command! -bar -bang Helptags call fzf#vim#helptags({'options': ['--preview-window=hidden']}, <bang>0)
command! -bar -bang Windows call fzf#vim#windows({'options': ['--preview-window=hidden']}, <bang>0)
command! -bar -bang Maps call fzf#vim#maps("n", {'options': ['--preview-window=hidden']}, <bang>0)
command! -bar -bang Filetypes call fzf#vim#filetypes({'options': ['--preview-window=hidden']}, <bang>0)
