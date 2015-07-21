set nocp

"=====================================================
" Плагины
"=====================================================

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Основные
Plugin 'gmarik/Vundle.vim'

" IDE
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'fisadev/FixedTaskList.vim'

" Редактирование
Plugin 'ntpeters/vim-better-whitespace'

" Подсветка синтаксиса
Plugin 'quabug/vim-gdscript'

" Стиль
Plugin 'zeis/vim-kolor'


call vundle#end()
filetype on
filetype plugin on
filetype plugin indent on



"=====================================================
" Общее
"=====================================================
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

au FileType * setlocal noexpandtab autoindent tabstop=4 shiftwidth=4

set number
set ruler
set laststatus=2
set nowrap
set enc=utf-8
set scrolloff=2
set fileencodings=utf8,cp1251

set nobackup
set nowritebackup
set noswapfile

syntax on

set colorcolumn=126

if has("gui_running")
	set guioptions-=m
	set guioptions-=T
	set guioptions-=e
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L

	set lines=50 columns=128

"	autocmd vimenter * TagbarToggle
"	autocmd vimenter * NERDTree
"	autocmd vimenter * if !argc() | NERDTree | endif
endif

set cursorline
colorscheme kolor

set term=screen-256color



"=====================================================
" Настройка плагинов
"=====================================================
"""" Vim-Airline
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


"""" TabBar
map <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 0


"""" NerdTree
map <F11> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']


"""" TaskList
map <F2> :TaskList<CR>


"""" vim-better-whitspace
map <F7> :ToggleWhitespace<CR>



"=====================================================
" Настройка горячих клавиш
"=====================================================

" Выход в командный режим
" <Esc>
inoremap <M-space> <Esc>
vnoremap <M-space> <Esc>

" Переключение между буферами
" <C-h> предыдущий
" <C-l> следующий
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>

" Выбор буфера
" <F5>
nnoremap <F5> :buffers<CR>:edit<Space>#

noremap <F3> :setlocal spell spelllang=ru_ru,ru_yo,en_us<CR>
noremap <S-F3> :setlocal spell spelllang=<CR>

map <C-q> :bd<CR>



"=====================================================
" Прочее
"=====================================================

" <leader>l показывать скрытые символы
if has('multi_byte')
    if version >= 700
        " set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
        set listchars=tab:▸\ ,eol:¬
    else
        set listchars=tab:»\ ,trail:·,eol:¶,extends:>,precedes:<,nbsp:_
    endif
endif
nmap <leader>l :set list!<CR>


"=====================================================
" Использовать .vimrc проекта
"=====================================================
set exrc
set secure
