"General customizations ((
set guicursor=
"set nocompatible
set noerrorbells visualbell t_vb=
set tabstop=2
set expandtab
set shiftwidth=2
set noshowmode
set list listchars=tab:▸•,trail:•
set nocursorline

imap jj <Esc>
"imap <c-c> <Esc>
cmap jj <c-c>
vmap v <Esc>

let g:mapleader=","

set autowrite
set number
set splitright
set splitbelow
set pastetoggle=<F2>

  "search ((
set hlsearch
set incsearch
set ignorecase
set smartcase
map <CR> :nohl<CR>
  "))
"))

"Setups norelativenumber only in insert mode and when normal mode use relativenumber instead ((
"set number relativenumber
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END
"))

"Automatically source the Vimrc file on save ((
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
"))

"Jump to last cursor position unless its invalid or in an event handler ((
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" |
      \endif
"))


"Yanking to clipboard
map <leader>y "+yy

"Easy switch windows ((
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
"))

"set undo directory backups ((
set undofile
set undodir=~/.config/vim/undodir
"))

"Renaming current file ((
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>
"))

"vim-Plug Plugins manager ((
call plug#begin('~/.config/vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'qpkorr/vim-bufkill'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
call plug#end()
"))

"Display Settings ((
set background=dark
set t_Co=256
syntax on
colorscheme grb256
set termguicolors     " enable true colors support
filetype plugin indent on

if exists('$TMUX')
  " Colors in tmux
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
"))

"fzf  fuzzy finders setups ((
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

map <leader>f :Files<CR>
map <C-P> :GFiles<CR>
"))

"set 4 tab for php file ((
"autocmd Filetype php setlocal shiftwidth=4 tabstop=4
"))

"Airline Configuration ((
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline_section_c = '%t'
let g:airline_powerline_fonts= 0
let g:Powerline_symbols='unicode'
let g:airline_theme='serene'
"))

"Status line customizations ((
"function! GitInfo()
"  let git = fugitive#head()
"  if git != ''
"    return ' '.fugitive#head()
"  else
"    return ''
"endfunction
"set statusline =%{GitInfo()}\ %<%f\ %-4(%m%)%=%-19(%3l,%02c%03V%)\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ %3p%%\ %{&ft}\ 
"))

"NERDTree setups ((
map <C-n> :NERDTreeToggle<cr>
"autocmd BufEnter NERD_* setlocal rnu!
"))

"Emmet configuration ((
let g:user_emmet_settings = {
  \    'indentation' : '  '
  \}
"))

"Git Gutter custom ((
let g:gitgutter_override_sign_column_highlight = 1
set updatetime=100
"))
