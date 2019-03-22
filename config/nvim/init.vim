call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'zeis/vim-kolor'
Plug 'mhartington/oceanic-next'
Plug 'tomasr/molokai'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'rakr/vim-two-firewatch'
Plug 'KeitaNakamura/neodark.vim'
Plug 'aradunovic/perun.vim'
Plug 'joshdick/onedark.vim'
Plug 'Nequo/vim-allomancer'
Plug 'Townk/vim-autoclose'

call plug#end()

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

set noshowmode

set background=dark

if (has("termguicolors"))
	set termguicolors
endif

set t_Co=256

syntax on				

" let g:quantum_black=1
colorscheme onedark

set tabstop=4
set shiftwidth=4
