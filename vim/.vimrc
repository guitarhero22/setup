  ""Common vim files between ubuntu and windows
if has('unix')
	let &packpath=&packpath.',/home/rushabh/windows/Users/rusha/vimfiles/'
	set clipboard=unnamedplus
endif

"Gui remove top bars and font
if has('win32')
	set clipboard=unnamed
	set guifont=Consolas:h11
	packadd vimtweak
	packadd transparency-windows-vim
	colorscheme one
else
	set background=light
	colorscheme paper
endif

if has("gui_running")
	set guioptions -=m
	set guioptions -=T
	set guioptions -=r
	set belloff=all
endif

"colors
if &term == "alacritty"
  let &term = "xterm-256color"
  endif

  if has('termguicolors')
    set termguicolors
    endif

"Buffer switching
map <C-m> :bnext<CR>
nnoremap <C-i> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>
"nnoremap <C-w> :tabclose<CR>
nmap ; :

"Tab and syntax highlighting
filetype plugin indent on
syntax on
set ts=4 sw=4
set autoindent
set smartindent
"set expandtab

"my config for braces
inoremap ( ()<left>
inoremap (( (
inoremap [ []<left>
inoremap [[ [
inoremap { {}<left>
inoremap {{ {
inoremap <expr> } (matchstr(getline('.'), '\%' . col('.') . 'c.') ==? '}') ? '<right>':'}'  
inoremap <expr> ] (matchstr(getline('.'), '\%' . col('.') . 'c.') ==? ']') ? '<right>':']' 
inoremap <expr> ) (matchstr(getline('.'), '\%' . col('.') . 'c.') ==? ')') ? '<right>':')' 
inoremap {<CR> {<CR>}<ESC>O

"line numbering
set number
set relativenumber
fu! SetRelNum(...)
	if &relativenumber==1 
		set relativenumber!
	else
		set relativenumber!
	endif
endfu 
command Rn set relativenumber!

"Vim Notes Plugin
"setting path for notes
if has('win32')
	let notePath='C:/Users/rusha/Documents'	
else 
	let notePath='~'
endif

function! AddPreToList(l, pre)
	let i = 0
	while i < len(a:l)
		let a:l[i] = a:pre.(a:l[i])
		let i += 1
	endwhile
	return a:l
endfunction

let note_dirs = ['/sem6/',
			\'/sem6/hs101/', 
			\'/sem6/748/project/notes/', '/sem6/diary/', 
			\'/sem6/302', '/sem6/310/',
			\'/sem6/748/notes',
			\'/sem6/317/']
command TakeNotes packadd vim-misc | packadd vim-notes | 
			\ let g:notes_directories = AddPreToList(note_dirs, notePath)|
			\ inoremap <C-d> <C-r>=strftime("%d-%m-%y")<CR> |
			\ inoremap <C-t> <C-r>=strftime("%H:%M")<CR> |
			"\ colorscheme
command Date put =strftime(\"%d-%m-%y\")
command DiaryToday exe 'Note '.strftime("%B %d, %y")
command Time put =strftime(\"%H:%M\")

"make backspace working in windows
set backspace=indent,eol,start

"Competetive Programming
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r <CR>
if has('win32')
	autocmd filetype cpp nnoremap <F10> :!%:r<CR>
else 
	autocmd filetype cpp nnoremap <F10> :!./%:r<CR>
endif
"Snippets
let g:snipMate = {'snippet_version' : 1}
