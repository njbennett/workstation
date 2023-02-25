let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" note that you will need to run :PlugInstall when this changes
call plug#begin()
Plug 'elixir-editors/vim-elixir'
Plug 'overcache/NeoSolarized'
Plug 'github/copilot.vim'

" --- Plugins to make things more Luan's Vim-y ---
Plug 'ctrlpvim/ctrlp.vim'
"--- End Luan's Vim section ---
call plug#end()

" line numbers for pairing
set number

" Enable syntax highlighting
syntax on

" Enables filetype detection, loads ftplugin, and loads indent
" (Not necessary on nvim and may not be necessary on vim 8.2+)
filetype plugin indent on

set termguicolors
colorscheme NeoSolarized
