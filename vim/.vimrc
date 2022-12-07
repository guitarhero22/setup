 "
set background=dark
colorscheme PaperColor

"colors
let &term = "xterm-256color"

if has('termguicolors')
 set termguicolors
endif

"Nerd Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"YCM

nnoremap <F12> :YcmCompleter GoTo<CR>
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>gtp :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
nnoremap <leader>gti :YcmCompleter GoToInclude<CR>
nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>yd :YcmDiags<CR>

"Buffer switching
"nnoremap <C-m> :bnext<CR>
"nnoremap <C-i> :tabnext<CR>
"nnoremap <C-n> :tabnew<CR>
"nnoremap <C-w> :tabclose<CR>
nmap ; :

"Tab and syntax highlighting
filetype plugin indent on
syntax on
set ts=4 sw=4
set autoindent
set smartindent
"set expandtab

"format on save
"map <C-K> :py3f /usr/share/clang/clang-format.py
"imap <C-K> <c-o>:py3f /usr/share/clang/clang-format.py
"function! Formatonsave()
"  let l:formatdiff = 1
"  py3f /usr/share/clang/clang-format.py
"endfunction
"autocmd BufWritePre *.hpp,*.h,*.cc,*.cpp call Formatonsave()

"vim auto brackets
let g:snipMate = { 'snippet_version' : 1 }

"my config for braces
"inoremap ( ()<left>
"inoremap (( (
"inoremap [ []<left>
"inoremap [[ [
"inoremap { {}<left>
"inoremap {{ {
"inoremap <expr> } (matchstr(getline('.'), '\%' . col('.') . 'c.') ==? '}') ? '<right>':'}'
"inoremap <expr> ] (matchstr(getline('.'), '\%' . col('.') . 'c.') ==? ']') ? '<right>':']'
"inoremap <expr> ) (matchstr(getline('.'), '\%' . col('.') . 'c.') ==? ')') ? '<right>':')'
"inoremap {<CR> {<CR>}<ESC>O

set autoread

"line numbering
set number
fu! SetRelNum(...)
if &relativenumber==1
set relativenumber!
else
set relativenumber!
endif
endfu
command Rn set relativenumber! 