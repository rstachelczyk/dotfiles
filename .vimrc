let mapleader = " "

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
nnoremap <leader>c c

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

if has('ide')
  " mappings and options that exist only in IdeaVim
  map <leader>p <Action>(GotoFile)
  map <leader>f <Action>(FindInPath)
  map <leader>b <Action>(Switcher)

  sethandler <C-K> a:ide

  if &ide =~? 'intellij idea'
    if &ide =~? 'community'
      " some mappings and options for IntelliJ IDEA Community Edition

      " visual select and then S
      set surround

      " Highlight as you type your search
      set incsearch

      " Make searches case-insensitive
      set ignorecase

      set clipboard+=ideaput

      " Java - print
      nmap <leader>jp ddkA<ENTER>System.out.println();<ESC>hi

      " Go to implimentation
      nmap g] :action GotoImplementation<CR>

      " Comment Line / Selected Lines
      nnoremap <silent> <leader>/ :action CommentByLineComment<CR>
      vnoremap <silent> <leader>/ :action CommentByLineComment<CR>

      " Move lines up or down
      nnoremap <A-j> :action MoveLineDown<CR>
      nnoremap <A-k> :action MoveLineUp<CR>
      vnoremap <A-j> :action MoveLineDown<CR>
      vnoremap <A-k> :action MoveLineUp<CR>

      " attempt to recreate Cmd + D feature in VSCode
      " vmap <D-d> <C-D-g>
      vmap <D-d> :action SelectNextOccurrence<CR>


      " nnoremap <silent> <C-Tab> :action ActivateTerminalToolWindow<CR>

      " source ideavimrc file
      nnoremap <leader>si :source ~/.ideavimrc<CR>

    elseif &ide =~? 'ultimate'
      " some mappings and options for IntelliJ IDEA Ultimate Edition
    endif
  elseif &ide =~? 'pycharm'
    " PyCharm specific mappings and options
  endif
else
  " some mappings for Vim/Neovim
  " nnoremap <leader>f <cmd>Telescope find_files<cr>
endif
