let g:which_key_map = {}

nnoremap <silent> <Leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <Leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" - [general]
map <Leader><CR> :nohlsearch<CR>
inoremap <c-n> <nop>
" - [coc]
map tt :CocCommand explorer<CR>
" - [vista]
map tb :Vista!!<CR>
map tbb :Vista finder<CR>
" - [ranger]
map tr :RangerCurrentFileExistingOrNewTab<CR>
map tw :RangerWorkingDirectoryExistingOrNewTab<CR>
" - [Tabularize]
if exists(":Tabularize")
  vmap <Leader>= :Tabularize /"<CR>
endif
" - [undotree]
nnoremap tu :UndotreeToggle<CR>
" - [tomtom/tcomment_vim]
nmap <Leader>/ gcc
vmap <Leader>/ gc
" snippets
imap <C-E> <Plug>(coc-snippets-expand-jump)

" Easy way to navigate between windows
nnoremap <silent> <C-h> <C-W>h
nnoremap <silent> <C-l> <C-W>l
nnoremap <silent><expr> <C-j> translator#window#float#has_scroll() ?
                            \ translator#window#float#scroll(1) : "\<C-W>j"
nnoremap <silent><expr> <C-k> translator#window#float#has_scroll() ?
                            \ translator#window#float#scroll(0) : "\<C-W>k"

let g:which_key_map['e'] = [ ':Buffers'   , 'recent visited' ]
" conflit : 
" a: CocList diagnostics
" c CocList commands
"  c 
" e Coc extensions
" f coc-format-select
" j CocNext
" o CocList outline
" p CocListResume
" r r ! (use snippet)
" s CocList -I symbols
" CocList -A --normal yanl
""


let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : ['bd'        , '★ delete-buffer']   ,
      \ 'o' : ['%bd|e#'    , '★ delete-buffers but this']   ,
      \ 'D' : ['bd!'       , '  force delete-buffer']   ,
      \ 'c' : [':DiffOrig' , '★ show diff']   ,
      \ 'f' : ['bfirst'    , '  first-buffer']    ,
      \ 'h' : ['Startify'  , '  home-buffer']     ,
      \ 'l' : ['blast'     , '  last-buffer']     ,
      \ 'n' : ['bnext'     , '  next-buffer']     ,
      \ 'p' : ['bprevious' , '  previous-buffer'] ,
      \ '?' : ['Buffers'   , '★ fzf-buffer']      ,
      \ }

" f is for find and replace
let g:which_key_map.f = {
      \ 'name' : '+find & replace' ,
      \ 'f' : [':Farr --source=vimgrep'    , '★ file'],
      \ 'p' : [':Farr --source=rgnvim'     , '★ project'],
      \ 'F' : [':Farf --source=vimgrep'    , '★ file (only find)'],
      \ 'P' : [':Farf --source=rgnvim'     , '★ project (only find)'],
      \ }

" s for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'                              , '★ history'],
      \ 'a' : [':Ag'                                    , '★ text Ag'],
      \ 'b' : [':BLines'                                , '  current buffer'],
      \ 'c' : [':Commits'                               , '  commits'],
      \ 'C' : [':BCommits'                              , '  buffer commits'],
      \ 'g' : [':GFiles?'                               , '★ modified git files'],
      \ 'h' : [':History'                               , '★ file history'],
      \ 'H' : [':History:'                              , '  command history'],
      \ 'l' : [':Lines'                                 , '  lines'] ,
      \ 'm' : [':Maps'                                  , '  normal maps'] ,
      \ 'p' : [':Helptags'                              , '  help tags'] ,
      \ 'P' : [':Tags'                                  , '  project tags'],
      \ 's' : [':CocList snippets'                      , '★ snippets'],
      \ 'S' : [':Colors'                                , '  color schemes'],
      \ 'r' : [':Rg'                                    , '  text Rg'],
      \ 't' : [':BTags'                                 , '  buffer tags'],
      \ 'w' : [':Windows'                               , '★ search windows'],
      \ 'y' : [':Filetypes'                             , '  file types'],
      \ 'z' : [':FZF'                                   , '★ FZF'],
      \ }

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , '★ config'],
      \ ';' : ['<Plug>(coc-refactor)'                , '★ refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , '★ code action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , '★ selected action'],
      \ 'b' : [':CocNext'                            , '  next action'],
      \ 'B' : [':CocPrev'                            , '  prev action'],
      \ 'c' : [':CocList commands'                   , '  commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , '★ definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , '  declaration'],
      \ 'e' : [':CocList extensions'                 , '★ extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , '★ format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , '★ format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , '  hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , '  implementation'],
      \ 'I' : [':CocList diagnostics'                , '★ diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , '  float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , '  code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , '  next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , '  next error'],
      \ 'o' : [':Vista!!'                            , '★ outline'],
      \ 'O' : [':CocList outline'                    , '  search outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , '  prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , '  prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , '  quickfix'],
      \ 'r' : ['<Plug>(coc-references)'              , '  references'],
      \ 'R' : ['<Plug>(coc-rename)'                  , '★ rename'],
      \ 's' : [':CocList -I symbols'                 , '  references'],
      \ 'S' : [':CocList snippets'                   , '★ snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , '  type definition'],
      \ 'u' : [':CocListResume'                      , '  resume list'],
      \ 'U' : [':CocUpdate'                          , '  update CoC'],
      \ 'z' : [':CocDisable'                         , '  disable CoC'],
      \ 'Z' : [':CocEnable'                          , '  enable CoC'],
      \ '\' : [':CocRestart'                         , '  restart CoC'],
      \ '?' : [':CocList'                            , '  list CoC'],
      \ }
      " \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],

" y is for yank
let g:which_key_map.y = {
      \ 'name' : '+yank' ,
      \ 'l' : [':CocList yank'    , '★ yank list'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'b' : [':Git blame'                        , '★ blame'],
      \ 'B' : [':GBrowse'                          , '  browse'],
      \ 'c' : [':Gvdiffsplit'                      , '★ diff compare'],
      \ 'd' : [':Git diff'                         , '  diff'],
      \ 'f' : [':GitGutterFold'                    , '★ fold unchanged'],
      \ 'g' : [':Gstatus'                          , '  status'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , '  preview hunk'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , '  next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , '  prev hunk'],
      \ 'l' : [':Git log'                          , '  log'],
      \ 'm' : ['<Plug>(git-messenger)'             , '  message'],
      \ 'M' : [':Git mergetool'                    , '  Mergetool'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , '  stage hunk'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , '  undo hunk'],
      \ 'v' : [':GV'                               , '  view commits'],
      \ 'V' : [':GV!'                              , '  view buffer commits'],
      \ }

let g:maximizer_set_default_mapping = 0
" w is for workbench
let g:which_key_map.w = {
      \ 'name' : '+workbench' ,
      \ 'w' : [':MaximizerToggle!'    , '★ maximizer windows'],
      \ }

nmap <silent> <Leader>uu viw<Plug>SearchVisual
vmap <silent> <Leader>uu <Plug>SearchVisual

nmap <silent> <Leader>i viw<Plug>TranslateWV
vmap <silent> <Leader>i <Plug>TranslateWV

call which_key#register('<Space>', "g:which_key_map")
