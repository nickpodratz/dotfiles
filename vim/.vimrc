" #### Plugins ####

" Load vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins
call plug#begin('~/.vim/plugged')
Plug 'arzg/vim-colors-xcode'
Plug 'fatih/vim-go'
Plug 'jceb/vim-orgmode'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'wikitopian/hardmode'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
call plug#end()

" YCM: configure
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_stop_completion = ['<C-y>', '<UP>', '<DOWN>']

" Numbertoggle: configure
set number relativenumber

" Org-Mode: configure
packloadall
silent! helptags ALL


" #### Config ####

" Appearance
colorscheme xcodedark
set colorcolumn=81 | let &colorcolumn=join(range(81,999),",")
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣
set visualbell
syntax on

" Formatting
filetype plugin indent on 
set splitbelow splitright
set tabstop=4 shiftwidth=0
set textwidth=80 fo=cqt

" Navigation
set clipboard=unnamed
set hlsearch
set mouse=a


" #### Mappings ####

" C-p: FZF file selecting
nnoremap <C-p> :<C-u>FZF<CR>

" C-m: empty pane adding
nnoremap <C-w><C-m> :<c-u>vnew<cr>
nnoremap <C-w>m :<c-u>vnew<cr>

" F5: paste mode toggling
set pastetoggle=<F5>

" F6: hidden characters toggling
map <F6> :set list!<CR>

" F7: next tab jumping
map <F7> :tabp <CR>

" F8: C-code compiling & executing
map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>

" F9: previous tab jumping
map <F9> :tabn <CR>

" Save .vimrc: hot-reloading
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | 
	if has('gui_running') | so $MYGVIMRC | endif
augroup END
