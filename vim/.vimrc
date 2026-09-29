let mapleader = " "

let g:tmux_navigator_disable_netrw_workaround = 1

imap jj <ESC>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
"nmap <M-j> mz:m+<CR>`z
"nmap <M-k> mz:m-2<CR>`z
"vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

" Sets yank/delete/paste functionality to
" interact with the system's clipboard,
" rather than internal vim registers
set clipboard=unnamed " For Windows/MacOS
" set clipboard=unnamedplus " For Linux

nmap <leader>o o<ESC>
nmap <leader>O O<ESC>
" -------------------------------------------
" Copy/Paste/Delete Behavior Modifications
" -------------------------------------------

" ------
" x
" ------

" Normal character delete does not save values
nnoremap x "_x

" Special character delete saves values
nnoremap <leader>x x

" ------
" c/C
" ------

" Normal change does not save values
nnoremap c "_c

" Special change saves values
nnoremap <leader>c c

" 'Change to end of line' does not save values
nnoremap C "_C

" Special 'change to end of line' saves values
nnoremap <leader>C C

" Normal visual change does not save values
vnoremap c "_c

" Special visual change saves values (like 'cut')
vnoremap <leader>c c

" ------
" d/D
" ------

" Normal delete does not save values
nnoremap d "_d

" Special delete saves values
nnoremap <leader>d d

" Delete to end of line does not save values
nnoremap D "_D

" Special 'delete to end of line' saves values
nnoremap <leader>D D

" Normal visual delete does not save values
vnoremap d "_d

" Special visual delete saves values (like 'cut')
vnoremap <leader>d d

" ------
" p/P
" ------

" Delete selected contents and paste *without*
" saving the selected values
vnoremap p "_dp
vnoremap P "_dP

