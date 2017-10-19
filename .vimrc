" Vundle stuff:
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" toggle paste mode
"nnoremap <C-p> :set invpaste paste?<CR>
"set pastetoggle=<C-p>
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

" use :B to get a list of buffers, then enter number to switch 
:cmap B buffers<CR>:buffer<Space>


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


