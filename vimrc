python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Display the status line even when only one window is displayed
set laststatus=2

" Install vim-plug, if needed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Setup vim-plug and my vim plugins
call plug#begin('~/.vim/plugged')

" Always-on loading
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
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

" Avoid adding EOL when dealing with files which don't have one.
set nofixendofline

" Highlight all search matches (type :noh to temporarily hide them. Ctrl-L
" seems to work too, for some reason)
set hlsearch

" Incremental search
set incsearch

" Searches are case-insensitive, unless pattern contains an upper case letter
set ignorecase
set smartcase

" Type fd to exit insert mode, like in spacemacs
imap fd <Esc>
