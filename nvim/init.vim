""
set termguicolors
" Vim Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'santiagovrancovich/nerdtree'
Plug 'danilo-augusto/vim-afterglow'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf', { 'dir' : '~/.fzf', 'do' : './install' }
Plug 'ggreer/the_silver_searcher', { 'do' : './build.sh; sudo make install' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'vim-airline/vim-airline'
Plug 'KenN7/vim-arsync'
Plug 'tpope/vim-commentary'
Plug 'bfrg/vim-cpp-modern'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'psliwka/vim-smoothie'
Plug 'garbas/vim-snipmate'
Plug 'dracula/vim', { 'as' : 'dracula' }
Plug 'vim-airline/vim-airline-themes'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ghifarit53/tokyonight-vim'
Plug 'embark-theme/vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'tomasiser/vim-code-dark'
Plug 'tribela/vim-transparent', { 'on' : 'TransparentEnable' }
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }
Plug 'joshdick/onedark.vim'
Plug 'othree/xml.vim'
Plug 'madox2/vim-ai'
Plug 'vim-autoformat/vim-autoformat'
Plug 'skywind3000/asyncrun.vim'
Plug 'folke/zen-mode.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.7.0'}
Plug 'ryanoasis/vim-devicons'

call plug#end()

function Nothing()
    " Defulat theme
    set background=dark
    colorscheme default
endfunction

function Dark()
    set background=dark
    colorscheme ayu
    " let g:dracula_italic = 0
    let g:airline_theme='ayu_dark'
endfunction

function Gruvbox()
    set background=dark
    let g:gruvbox_contrast_dark="hard"
    colorscheme gruvbox
    let g:airline_theme='dark'
endfunction


function Lit()
    set background=light
    colorscheme PaperColor
    let g:airline_theme='papercolor'
endfunction
call Dark()

nnoremap <F4> :bp<bar>sp<bar>bn<bar>bd<CR>

"Nerd Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" let g:NERDTreeMinimalMenu=1

"Tabs And buffers
nnoremap <F2> :bp<CR>
nnoremap <F3> :bn<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <leader>n :tabnew<CR>
nnoremap <C-n> :tabnext<CR>
let g:indentLine_char_list = ['|']
let g:airline#extensions#tabline#enabled = 1


"YCM
nnoremap <F12> :YcmCompleter GoTo<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
"nnoremap <leader>gtp :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
nnoremap <leader>gti :YcmCompleter GoToInclude<CR>
nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>yd :YcmDiags<CR>

"FZF
set rtp+=~/.fzf

" Find Files using fzf
nnoremap <C-p> :Files<CR>


"Buffer switching
nmap ; :

"Tab and syntax highlighting
filetype plugin indent on
syntax on
set ts=4 sw=4
set autoindent
set smartindent
set expandtab
set backspace=indent,eol,start

au FileType xml setlocal sw=2 ts=2 autoindent smartindent

" format on save
" map <C-K> :py3f /usr/share/clang/clang-format.py
" imap <C-K> <c-o>:py3f /usr/share/clang/clang-format.py
" function! Formatonsave()
"   let l:lines = 'all'
"   let l:formatdiff = 1
"   py3f /usr/share/clang/clang-format.py
" endfunction
let g:formatdef_cmake_format='"cmake-format -"'
autocmd BufWritePre *.hpp,*.h,*.cc,*.cpp,*.cpp.in,*.h.in :Autoformat
autocmd BufWritePre CMakeLists.txt,*.cmake :Autoformat

" For snipmate
let g:snipMate = { 'snippet_version' : 1 }

set autoread

"line numbering
set number
command Rn set relativenumber!
command P :AsyncRun source ~/.rsync.sh; rsync_
command CO :cclose
command CP :copen

set relativenumber

let g:ycm_always_populate_location_list = 1

set mouse=a
set scroll=5

"for git diffs
set diffopt+=vertical

let &t_SI = "\e[4 q"
let &t_EI = "\e[2 q"

autocmd FileType cpp setlocal commentstring=//\ %s
" Disable quote concealing in JSON files
let g:vim_json_conceal=0

"nvim config starts...

if exists("g:neovide")
    let s:pattern = '^\([^0-9]*\)\([1-9][0-9]*\)$'
    let s:minfontsize = 6
    let s:maxfontsize = 16
    function! AdjustFontSize(amount)
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = str2nr(cursize) + a:amount
    let newfont = fontname .  newsize
    echo newfont
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
        let &guifont = newfont
    endif
    endfunction

    function! LargerFont()
      call AdjustFontSize(1)
    endfunction
    command! LargerFont call LargerFont()
    nnoremap \LF :call LargerFont()<CR>

    function! SmallerFont()
      call AdjustFontSize(-1)
    endfunction
    nnoremap \SF :call SmallerFont()<CR>

    let g:neovide_cursor_animate_command_line = v:false
    let $BUILD_SERVERS="ninja184"
    let $RSYNC_EXCLUDE_FILES="build third_party/packages.built log .vscode .vim-arsync *.swp .cache"
    set title
    let &titlestring="Neovide: %{substitute(getcwd(), $HOME . '/', '', '') . '/'}"
endif 

let g:asyncrun_status = "stopped" 
function AsyncRunExit()
    if g:asyncrun_status == "success"
        lua require("notify")(vim.g.asyncrun_status .. ": " .. vim.env.BUILD_SERVERS, "info")
    elseif g:asyncrun_status == "failure"
        lua require("notify")(vim.g.asyncrun_status .. ": " .. vim.env.BUILD_SERVERS, "error")
        copen
        norm G
    endif
endfunction
let g:asyncrun_exit = 'call AsyncRunExit()'
let g:asyncrun_bell = 1
augroup QuickfixStatus
	au! BufWinEnter quickfix setlocal 
		\ statusline=%t\ [%{g:asyncrun_status}]\ %{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P
augroup END

set guifont=JetBrains\ Mono:h11

lua require('plug-configs.tterm-conf')
