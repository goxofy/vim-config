nmap nt :NERDTreeToggle<cr>
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"let g:nerdtree_tabs_focus_on_files=1
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeDirArrows=1
