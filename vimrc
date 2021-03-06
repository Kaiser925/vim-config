" normal settings
set nu
set nocompatible

set cursorline
set showmatch 

set tabstop=4
set shiftwidth=4
set autoindent

syntax enable
syntax on 

" inoremap
inoremap jk <Esc>

" auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdtree'

Plug 'jistr/vim-nerdtree-tabs'

Plug 'Xuyuanp/nerdtree-git-plugin'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plug 'majutsushi/tagbar'

Plug 'jiangmiao/auto-pairs'

Plug 'KeitaNakamura/neodark.vim'
Plug 'crusoexia/vim-monokai'
Plug 'acarapetis/vim-colors-github'
Plug 'rakr/vim-one'

Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'dgryski/vim-godef'

Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

Plug 'scrooloose/nerdcommenter'
call plug#end()


set termguicolors
colorscheme one " 主题
set background=dark

let g:go_fmt_command = "goimports" 
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"


let g:deoplete#enable_at_startup = 1
" ===================================================================
" Settings of go-vim
" ===================================================================
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2

" =================================================================== 
" NERDTree
" ===================================================================
map <F10> :NERDTreeToggle<CR>
nmap <M-m> :NERDTreeFind<CR>

let NERDTreeShowLineNumbers=1

let NERDTreeAutoCenter=1

let NERDTreeShowHidden=0

let NERDTreeIgnore=['\.pyc','\~$','\.swp']

let g:nerdtree_tabs_open_on_console_startup=1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeShowIgnoredStatus = 1
nmap <Leader>pwd :NERDTreeCWD<CR>

:nn <Leader>1 1gt
:nn <Leader>2 2gt
:nn <Leader>3 3gt
:nn <Leader>4 4gt
:nn <Leader>5 5gt
:nn <Leader>6 6gt
:nn <Leader>7 7gt
:nn <Leader>8 8gt
:nn <Leader>9 8gt
:nn <Leader>0 :tablast<CR>

" ===================================================================
" Settings of MarkDown
" ===================================================================
map <silent> <F5> <Plug>MarkdownPreview
map <silent> <F6> <Plug>StopMarkdownPreview


nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
" ===================================================================
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
" ===================================================================
if has("autocmd")
	au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
	au InsertEnter,InsertChange *
		\ if v:insertmode == 'i' |
		\   silent execute '!echo -ne "\e[6 q"' | redraw! |
		\ elseif v:insertmode == 'r' |
		\   silent execute '!echo -ne "\e[4 q"' | redraw! |
		\ endif
	au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
