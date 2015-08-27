call plug#begin('~/.vim/bundle') " vim-plug 初始化

"""
" 插件列表
"""

" 必须使用单引号
Plug 'kien/ctrlp.vim'
Plug 'Yggdroot/indentLine'
"Plug 'Valloric/YouCompleteMe'
Plug 'jlanzarotta/bufexplorer'
Plug 'bigeagle/molokai'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'klen/python-mode'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'jrosiek/vim-mark'

" 还有好多插件

" 结束插件列表
call plug#end()

" Vim基础配置部分

if !exists("g:vimrc_loaded")
    " 设置颜色主题为 molokai
    colorscheme molokai
    let g:molokai_original = 1
    if has("gui_running")
	    " 设置 gvim 的外观
        set guioptions-=T "隐藏工具栏
        set guioptions-=L
        set guioptions-=r
        set guioptions-=m
        set gfn=Source\ Code\ Pro\ for\ Powerline\ Semi-Bold\ 10
        set gfw=STHeiti\ 9
        set langmenu=en_US
        set linespace=0
    endif " has
endif " exists(...)

set so=10           " 光标移动到倒数第10行时开始滚屏
set number          " 显示行号
syntax on           " 打开语法高亮
filetype on         " 打开文件类型支持
filetype plugin on  " 打开文件类型插件支持
filetype indent on  " 打开文件类型缩进支持

set list lcs=tab:\¦\   " 使用 ¦ 来显示 tab 缩进

if has("autocmd")   " 打开时光标放在上次退出时的位置
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif

set completeopt=longest,menu " 自动补全菜单

" 鼠标支持
if has('mouse')
    set mouse=a
    set selectmode=mouse,key
    set nomousehide
endif

set autoindent    " 自动缩进
set modeline      " 底部的模式行
set cursorline    " 高亮光标所在行
set cursorcolumn  " 高亮光标所在列

" 设置缩进宽度为 4 个空格
set shiftwidth=4 
set tabstop=4
set softtabstop=4

set showmatch     " 高亮括号配对
set matchtime=0
set nobackup      " 关闭备份
set nowritebackup
" set directory=~/.vim/.swapfiles//  " 把 swap 文件都放在 ~/.vim/.swapfiles/ 里

" neovim 和 tmux 配合必须打开
if has('nvim')
   set ttimeout
   set ttimeoutlen=0
endif

"在insert模式下能用删除键进行删除
set backspace=indent,eol,start

" 文件编码
set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set enc=utf-8

"语法折叠
set foldmethod=syntax
set foldcolumn=0  " 设置折叠区域的宽度
set foldlevel=100
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

set smartcase   " 搜索时，智能大小写
set ignorecase  " 搜索时，忽略大小写
set nohlsearch  " 关闭搜索高亮
set incsearch   " incremental search 
set autochdir   " 打开文件时，自动 cd 到文件所在目录

" 让 j, k 可以在 自动wrap的行中上下移动
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" Shift-T 开新 Tab
nmap T :tabnew<cr>

" 以下文件类型，敲 {<回车> 后，自动加入反括号 }
au FileType c,cpp,h,java,css,js,nginx,scala,go inoremap  <buffer>  {<CR> {<CR>}<Esc>O

" Vim基础配置部分结束

" 插件配置部分

source ~/.vim/config/rainbow_parentheses.vim
source ~/.vim/config/nerdtree.vim
source ~/.vim/config/syntastic.vim
source ~/.vim/config/airline.vim
source ~/.vim/config/tagbar.vim
" 插件配置部分结束
