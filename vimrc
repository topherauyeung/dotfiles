set nocompatible      " This should be the first line. It sets vim to not be backwards compatible with vi.
"
"
let mapleader = "," "Custom for me, you might want a different leader
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
""Bundle 'scrooloose/syntastic'
Bundle 'othree/html5.vim'
Bundle 'tristen/vim-sparkup'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'kchmck/vim-coffee-script'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-surround'
"Bundle 'joestelmach/lint.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'acevery/snipmate-plus'
Bundle 'nono/vim-handlebars'
Bundle 'mklabs/grunt.vim'
"Bundle 'ag.vim'

"
"" VISUAL STUFF
"
set title             " Sets the title at top of tab to be the filename if "titlestring" isn't defined
set laststatus=2      " Has to do with the status bar at the bottom. Check :help laststatus
set number            " Line numbers on the left hand side
set visualbell        " That bell is the worst sound. Shut it the fuck off.
syntax on             " Sets syntax highlighting on because what is this notepad
filetype plugin indent on " This gets vim to automatically load filetype specific options for plugins and indentation
"
"
"" BASIC FUNCTIONALITY
"
set encoding=utf-8    " Duh
set history=512       " Default is 20, I'd rather set this to ∞
set nofoldenable      " Don't fold shit because it's the worst.


" Swap file stuff. Pay no mind.

set noswapfile
set hidden
set undofile
set undodir=~/.vim/undodir

autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save

" Formatting
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab


" Fix indenting for css style things (sass, css)

au BufEnter *.css set nocindent
au BufLeave *.css set cindent
au BufEnter *.scss set nocindent
au BufLeave *.scss set cindent

autocmd BufNewFile,BufRead *.scss set ft=scss.css "Sets filetpe of scss to be css. Helps with plugins.

autocmd BufNewFile,BufRead *.json set ft=json


imap <leader>,m <c-x><c-o> "Omni completion

" Enter newlines without entering insert mode
" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nmap <CR> o<Esc>k

" TMUX STUFF don't worry about it
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      " The sleep and & gives time to get back to vim so tmux's focus tracking
      " can kick in and send us our ^[[O
      execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &"
      redraw!
    endif
  endfunction
  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

set statusline+=%#warningmsg#
set statusline+=%*
"set statusline+=%{SyntasticStatuslineFlag()}


" Tab Navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tn  :tabnew<CR>

nnoremap gb  :Gbrowse<CR> " Open current file on github.com

" Local list nav
nnoremap fj :execute "noautocmd vimgrep /" . expand("<cword>") . "/j **" <Bar> cnext<CR>

noremap cn :cn<CR>
nnoremap cp :cp<CR>

" Custom Plugin Mappings
nnoremap ff :CtrlP<CR>
nnoremap -- :GundoToggle<CR>

" Only set if you use Syntastic
"let g:syntastic_auto_loc_list=2
"let g:syntastic_auto_jump=0
"let g:syntastic_enable_highlighting = 0
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_loc_list_height=5
"let g:syntastic_ignore_files=['\.scss']

"" Ignore node_modules in CtrlP
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'

" Automatic brackets when typing css
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

set iskeyword+=- "Makes foo-bar considered one word

map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>  " Open with path of file
nnoremap <leader>ev :vsplit $MYVIMRC<cr> " ,ev will open up your vimrc in a vertical split
nnoremap <leader>ft :set filetype=HTML<cr> ",ft sets filtype to html

set wildignore=node_modules/*,*.jpg,*.png,*.gif,*.woff

autocmd FileType css set omnifunc=csscomplete#CompleteCSS " Gives css auto completion to files using filetype=css
