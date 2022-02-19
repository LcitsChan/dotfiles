" Edit vim config
map <Leader>rc :e $MYVIMRC<CR>
map <Leader>rv :source $MYVIMRC<CR>

" Navigation
noremap j gj
noremap k gk
noremap L $
noremap H ^

" Quit and Save
noremap <Leader>qq :q<CR>
" noremap Q :q!<CR>
noremap <Leader>qa :qa<CR>
noremap <Leader>z :w<CR>

" Escape 
inoremap fd <Esc>
inoremap jk <C-o>

nnoremap oo o<Esc>0d$<Esc>
nnoremap OO O<Esc>0d$<Esc>

" Resize splits with arrow keys
nnoremap <up> :res -5<CR>
nnoremap <down> :res +5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>

" Create new window
nnoremap th :set nosplitright<CR>:vsplit<CR>:set splitright<CR><>
nnoremap tl :set splitright<CR>:vsplit<CR>
nnoremap tk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nnoremap tj :set splitbelow<CR>:split<CR>


" System Clipboard
nnoremap Y y$
nnoremap <Leader>yy "+yy
nnoremap <Leader>yY "+y$
vnoremap <Leader>yy "+y
noremap <Leader>yp "+p
noremap <Leader>yP "+P

" Searching
nnoremap <Leader>ys g*
nnoremap <Leader>yf *
vnoremap <Leader>yf y/<C-R>"<CR>

" Templete for replacement 
map <Leader><Leader> /<+ph+><CR>:nohlsearch<CR>c6l
imap ,,, <+ph+> 
nmap ,,, i<+ph+> 
