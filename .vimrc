set number

filetype plugin on

set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'zathura'

"spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

color xoria256

syntax on
