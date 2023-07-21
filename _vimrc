" Отображение кириллицы во внутренних сообщениях программы
lan mes ru_RU.UTF-8

set nocompatible

"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
set backspace=indent,eol,start whichwrap+=<,>,[,]
"behave mswin
set iskeyword=@,48-57,_,192-255
set number
set ts=3
set nowrap " (no)wrap - динамический (не)перенос длинных строк
set mouse=a " включает поддержку мыши при работе в терминале (без GUI)
set mousehide " скрывать мышь в режиме ввода текста
set t_Co=256 " использовать больше цветов в терминале
set termguicolors
set hlsearch " подсветка при поиске
set statusline=%F%m%r%h%w\ [FF,FE,TE=%{&fileformat},%{&fileencoding},%{&encoding}\]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
syntax on " включить подсветку синтаксиса
set laststatus=2
set history=500 " хранить больше истории команд
set textwidth=1000
" При вставке фрагмента сохраняет отступ
set pastetoggle=
"set undofile


"" Автоматически перечитывать конфигурацию VIM после сохранения
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

set clipboard=unnamed " Window - во избежание лишней путаницы использовать системный буфер обмена вместо буфера Vim
"set clipboard=unnamedplus " linux - во избежание лишней путаницы использовать системный буфер обмена вместо буфера Vim

"Нумеровать строки не относительно начала файла, а относительно текущего положения курсора. Удобно при выполнении команд, для которых нужно считать строки. Включается командой
"set relativenumber

"Подсвечивать определенные столбцы в буфере, включается командой
set colorcolumn=""
"Где вместо … нужно указать через запятую номера столбцов, которые нужно подсветить. Я у себя выставил «set colorcolumn=81» чтобы видеть какие строки не влезли в 80 символов.
":hi ColorColumn ctermbg=darkgrey guibg=darkgrey

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  setglobal nobomb
  set fileencodings=ucs-bom,utf-8,cp1251,latin1
endif
"--------------------------------------------------------------------------------
"НАСТРОЙКИ ОТСТУПА
set shiftwidth=4 " размер отступов (нажатие на << или >>)
set tabstop=4 " ширина табуляции
set softtabstop=4 " ширина 'мягкого' таба
set autoindent " ai - включить автоотступы (копируется отступ предыдущей строки)
set cindent " ci - отступы в стиле С
set smartindent " Умные отступы (например, автоотступ после {)
"--------------------------------------------------------------------------------

"Настройка шрифтов
set guifont=source_code_pro:h11:cRUSSIAN,courier_new:h11:cRUSSIAN

"--------------------------------------------------------------------------------
"НАСТРОЙКИ ПЕРЕКЛЮЧЕНИЯ РАСКЛАДОК КЛАВИАТУРЫ
"" Взято у konishchevdmitry
"setlocal spell spelllang=ru_yo,en_us
set keymap=russian-jcukenwin " настраиваем переключение раскладок клавиатуры по <C-^>
set iminsert=0 " раскладка по умолчанию - английская
set imsearch=0 " аналогично для строки поиска и ввода команд
function! MyKeyMapHighlight()
   if &iminsert == 0 " при английской раскладке статусная строка текущего окна будет серого цвета
      hi StatusLine ctermfg=Blue guifg=Blue
   else " а при русской - зеленого.
      hi StatusLine ctermfg=DarkRed guifg=DarkRed
   endif
endfunction
call MyKeyMapHighlight() " при старте Vim устанавливать цвет статусной строки
autocmd WinEnter * :call MyKeyMapHighlight() " при смене окна обновлять информацию о раскладках
" использовать Ctrl+F для переключения раскладок
cmap <silent> <C-F> <C-^>
imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
"--------------------------------------------------------------------------------

" Используем символы для непечатаемых символов
set listchars=eol:⮠,tab:→→,trail:~,extends:>,precedes:<,space:·
" Цвета для непечатаемых символов
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

map <TAB> <ESC>%v%
map <F6> :tabnew<CR>
map <F9> :tabclose<CR>
map <F7> :tabprevious<CR>
map <F8> :tabnext<CR>
map <F2> :w<CR>
imap <F2> <ESC>:w<CR>a
map <F12> ::TlistToggle<CR>


"let g:Tlist_Show_One_File = 1

" Редко когда надо [ без пары =)
imap [ []<LEFT>
" Аналогично и для {
imap {<CR> {<CR>}<Esc>O

map <c-w><c-s> :FirstExplorerWindow<cr> 
map <c-w><c-b> :BottomExplorerWindow<cr> 
map <c-w><c-t> :WMToggle<cr>

imap <C-V> "+gPi
cmap <C-V> <C-R>+


"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

call plug#begin()
Plug 'vim-scripts/oceandeep'
Plug 'lervag/wiki'
Plug 'dhruvasagar/vim-table-mode'
Plug 'othree/xml.vim'
Plug 't5t5/comments.vim'
call plug#end()

colorscheme oceandeep

autocmd BufNewFile,BufRead *.bat,*.cmd source $HOME\vimfiles\indent\bat.vim
