" File: pawno_light.vim
" Pawno Light Theme for Neovim
" Author: Gonza (2025)

highlight clear
set background=light
syntax reset

" UI
highlight Normal       guifg=#000000 guibg=#FFFFFF
highlight LineNr       guifg=#808080 guibg=#FFFFFF
highlight CursorLineNr guifg=#000000 guibg=#FFFFFF gui=bold
highlight Visual       guibg=#D3D3D3
highlight StatusLine   guifg=#000000 guibg=#E0E0E0
highlight VertSplit    guifg=#C0C0C0
highlight Search       guifg=#000000 guibg=#FFFF00

" Syntax
highlight Comment      guifg=#008000 gui=italic
highlight Constant     guifg=#FF0000
highlight String       guifg=#FF0000
highlight Number       guifg=#FF0000

highlight Statement    guifg=#000000 gui=bold
highlight Keyword      guifg=#000000 gui=bold

highlight Function     guifg=#0000FF
highlight Identifier   guifg=#0000FF
highlight Type         guifg=#0000FF

highlight PreProc      guifg=#008000
highlight Include      guifg=#008000

highlight Special      guifg=#FF0000
highlight Error        guifg=#FF0000 guibg=#FFFFFF gui=bold
