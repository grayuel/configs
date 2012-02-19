if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif

set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'zathura'

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F5> :!/usr/bin/ctags -R --c-kinds=+p --fields=+iaS --extra=+q .<cr> 

"spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

color xoria256

syntax on
