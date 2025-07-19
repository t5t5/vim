" Загрузка основных настроек
source $HOME\_vimrc.base

" Статусная строка
set statusline=%F%m%r%h%w\ [FF,FE,TE=%{&fileformat},%{&fileencoding},%{&encoding}\]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Настройка кодировок файлов
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  setglobal nobomb
  set fileencodings=ucs-bom,utf-8,cp1251,latin1
endif

" Ремапы клавиш, работа со вкладками и сохранение файлов
map <TAB> <ESC>%v%
map <F6> :tabnew<CR>
map <F9> :tabclose<CR>
map <F7> :tabprevious<CR>
map <F8> :tabnext<CR>
map <F2> :w<CR>
imap <F2> <ESC>:w<CR>a

" Редко когда надо [ без пары =)
imap [ []<LEFT>
" Аналогично и для {
imap {<CR> {<CR>}<Esc>O

" Плагины
call plug#begin()
Plug 'vim-scripts/oceandeep'
Plug 'lervag/wiki'
Plug 'dhruvasagar/vim-table-mode'
Plug 'othree/xml.vim'
Plug 't5t5/comments.vim'
call plug#end()

" Применение темы
colorscheme oceandeep

" Загрузка indent файла для bat и cmd
autocmd BufNewFile,BufRead *.bat,*.cmd source $HOME\vimfiles\indent\bat.vim
