" toggle paste mode
nnoremap <C-p> :set invpaste paste?<CR>
set pastetoggle=<C-p>
set showmode

" use vim
set nocompatible

" add filename to tmux tab
autocmd BufEnter,BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window bash"))

" hide buffers instead of closing them
set hidden

" avoid the escape button
imap jk <Esc>

" unix file format
set ff=unix

" highlight syntax
syntax enable

" set number of terminal colors
set t_Co=256

" color theme
colorscheme xterm16

" indent new lines
set autoindent
set smartindent

" set tab size
set tabstop=4

" set the number of spaces inserted for a tab
set shiftwidth=4

" insert space characters whenever the tab is pressed
set expandtab

" incremental searching
set incsearch

" highlight search
set hlsearch

" use space to get out of highlighted search
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" ignore case in search
set ignorecase

" search case sensitive if pattern contains uppercase
set smartcase

" allow backspace to delete end of line, indent, and start of line characters
set backspace=indent,eol,start

" UTF encoding
set encoding=utf-8

" highlight current line
" set cursorline

" make vim quiet
set visualbell

" tree view
let g:netrw_liststyle=3

" dont save history file
let g:netrw_dirhistmax = 0

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Change directory to the current buffer when opening files.
set autochdir

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
      call VexSize()
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" set width of Vexplore
fun! VexSize()
  let vex_width = 50
  exe "vertical resize" . vex_width
  set winfixwidth
  call NormalizeWidths()
endf
fun! NormalizeWidths()
  let eadir_pref = &eadirection
  set eadirection=hor
  set equalalways! equalalways!
  let &eadirection = eadir_pref
endf


