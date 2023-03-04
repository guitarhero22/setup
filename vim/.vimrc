"
"Tabs And buffers
nmap ; :
nnoremap <F2> :bp<CR>
nnoremap <F3> :bn<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F9> :tabprev<CR>
nnoremap <F10> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>

"Tab and syntax highlighting
filetype plugin indent on
syntax on
set ts=4 sw=4
set autoindent
set smartindent
set expandtab
set backspace=indent,eol,start
set autoread

"line numbering
set number
set relativenumber
command Rn set relativenumber!

"crsor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"To set the gruvbox theme
"colorscheme gruvbox
"set background=dark
"let g:gruvbox_contrast_dark="hard"

"Nerd Tree
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" Zen Mode for neovim
"if has('nvim')
"    packadd zen-mode.nvim
"endif

" For snipmate
"let g:snipMate = { 'snippet_version' : 1 }

"format on save
"map <C-K> :py3f /usr/share/clang/clang-format.py
"imap <C-K> <c-o>:py3f /usr/share/clang/clang-format.py
"function! Formatonsave()
"  let l:formatdiff = 1
"  py3f /usr/share/clang/clang-format.py
"endfunction
"autocmd BufWritePre *.hpp,*.h,*.cc,*.cpp call Formatonsave()

"Vim tablime
"let g:indentLine_char_list = ['|']
"let g:airline#extensions#tabline#enabled = 1

"YCM
"nnoremap <F12> :YcmCompleter GoTo<CR>
"nnoremap <leader>gt :YcmCompleter GoTo<CR>
"nnoremap <leader>fi :YcmCompleter FixIt<CR>
"nnoremap <leader>gd :YcmCompleter GetDoc<CR>
"nnoremap <leader>gtp :YcmCompleter GetType<CR>
"nnoremap <leader>gp :YcmCompleter GetParent<CR>
"nnoremap <leader>gti :YcmCompleter GoToInclude<CR>
"nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
"nnoremap <leader>yd :YcmDiags<CR>

"FZF
"set rtp+=~/.fzf

" Find Files using fzf
"nnoremap <C-p> :Files<CR>