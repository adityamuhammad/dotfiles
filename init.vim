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
cmap jj <c-c>
vmap v <Esc>

let g:mapleader=","

set autowrite
"set number
set splitright
set splitbelow

set pastetoggle=<F2>
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

set hlsearch
set incsearch
set ignorecase
set smartcase
map <CR> :nohl<CR>

"mapping switch windows
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

"set undo directory backups
set undofile
set undodir=~/.config/vim/undodir

"Plug Plugins manager
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

"syntax background , and colorscheme
set background=dark
set t_Co=256
syntax on
colorscheme grb256
set termguicolors     " enable true colors support

if exists('$TMUX')
  " Colors in tmux
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


"fzf mapping
map <leader>f :Files<CR>
map <C-P> :GFiles<CR>
map <C-B> :Buffers<CR>

filetype plugin indent on

"set 4 tab for php file
"autocmd Filetype php setlocal shiftwidth=4 tabstop=4

"Airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline_section_c = '%t'
let g:airline_powerline_fonts= 0
let g:Powerline_symbols='unicode'
let g:airline_theme='serene'


"nerdtree
map <C-n> :NERDTreeToggle<cr>
nnoremap <C-t> :call NumberToggle()<cr>

" emmet settings
let g:user_emmet_settings = {
  \    'indentation' : '  '
  \}

"git gutter
let g:gitgutter_override_sign_column_highlight = 1
set updatetime=100
