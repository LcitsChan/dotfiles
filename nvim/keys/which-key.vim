let g:which_key_map = {}

nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" - [general]
map <LEADER><CR> :nohlsearch<CR>
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
" nmap <leader>/ gcc
" vmap <leader>/ gc



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
      \ '1' : ['b1'        , '  buffer 1']        ,
      \ '2' : ['b2'        , '  buffer 2']        ,
      \ 'd' : ['bd'        , '★ delete-buffer']   ,
      \ 'c' : ['%bd|e#'    , '★ delete-buffers but this']   ,
      \ 'D' : ['bd!'       , '  force delete-buffer']   ,
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
      \ }

" s for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'                              , '★ history'],
      \ ';' : [':FzfPreviewCommandPalette'              , '★ commands'],
      \ 'a' : [':Ag'                                    , '★ text Ag'],
      \ 'b' : [':CocCommand fzf-preview.BufferLines'    , '  current buffer'],
      \ 'B' : [':CocCommand fzf-preview.Buffers'        , '  open buffers'],
      \ 'c' : [':Commits'                               , '  commits'],
      \ 'C' : [':BCommits'                              , '  buffer commits'],
      \ 'd' : [':CocCommand fzf-preview.DirectoryFiles' , '  directories'],
      \ 'f' : [':CocCommand fzf-preview.ProjectFiles'   , '  files'],
      \ 'g' : [':CocCommand fzf-preview.GitFiles'       , '  git files'],
      \ 'G' : [':GFiles?'                               , '★ modified git files'],
      \ 'h' : [':History'                               , '★ file history'],
      \ 'H' : [':History:'                              , '  command history'],
      \ 'l' : [':Lines'                                 , '  lines'] ,
      \ 'm' : [':CocCommand fzf-preview.Marks'          , '  list marks'],
      \ 'M' : [':Maps'                                  , '  normal maps'] ,
      \ 'p' : [':Helptags'                              , '  help tags'] ,
      \ 'P' : [':Tags'                                  , '  project tags'],
      \ 'q' : [':CocCommand fzf-preview.QuickFix'       , '  quickfix list'],
      \ 's' : [':CocList snippets'                      , '★ snippets'],
      \ 'S' : [':Colors'                                , '  color schemes'],
      \ 't' : [':Rg'                                    , '  text Rg'],
      \ 'T' : [':BTags'                                 , '  buffer tags'],
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

call which_key#register('<Space>', "g:which_key_map")
