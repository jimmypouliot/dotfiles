python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Display the status line even when only one window is displayed
set laststatus=2

" Setup vim-plug and my vim plugins
call plug#begin('~/.vim/plugged')

" Always-on loading
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'

" fzf: PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-git', { 'for': 'git' }

" Initialize plugin system (vim-plug)
call plug#end()

" Open/Close NERDTree with Ctrl+N
map <C-n> :NERDTreeToggle<CR>

" Recommended for vim-gutter
set updatetime=100

" Link vim's unnamedplus register with system's clipboard
" Effectively shares clipboard between vim and system (X11 session)
" https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
set clipboard=unnamedplus
