" Vundle stuff:
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

" airline status bar settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffers_label = 'tabs'
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_section_b = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''
let g:airline_section_z = 'L%l:C%c'
let g:airline_section_c = ''
let g:airline#extensions#wordcount#enabled = 0
let g:airline_theme='minimalist'
"let g:airline_theme='deus'

" toggle paste mode
"nnoremap <C-p> :set invpaste paste?<CR>
"set pastetoggle=<C-p>

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

" use :B to get a list of buffers, then enter number to switch 
:cmap B buffers<CR>:buffer<Space>

" jump to next buffer with t
:nnoremap t :bn<CR>

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
          exec cur_win_nr-1 . 'wincmd w'
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

set noshowmode

