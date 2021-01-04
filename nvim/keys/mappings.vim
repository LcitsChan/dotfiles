" Edit vim config
map <Leader>rc :e $MYVIMRC<CR>
map <Leader>rv :source $MYVIMRC<CR>

" Navigation
noremap j gj
noremap k gk
noremap J 5j
noremap K 5k

" Quit and Save
noremap <silent> Q :q<CR>
noremap <silent> <C-Q> :qa<CR>
noremap <silent> <C-S> :w<CR>

" Easy way to navigate between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

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
nnoremap <Leader>ys g*<C-O>
nnoremap <Leader>yf *<C-O>
vnoremap <Leader>yf y/<C-R>"<CR><C-O>

" Templete for replacement 
map <Leader><Leader> /<+ph+><CR>:nohlsearch<CR>c6l
imap ,,, <+ph+> 
nmap ,,, i<+ph+> 
