python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Display the status line even when only one window is displayed
set laststatus=2

" Setup vim-plug and my vim plugins
call plug#begin('~/.vim/plugged')

" Always-on loading
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-git', { 'for': 'git' }

" Initialize plugin system (vim-plug)
call plug#end()

" Open/Close NERDTree with Ctrl+N
map <C-n> :NERDTreeToggle<CR>

" Recommended for vim-gutter
set updatetime=100
