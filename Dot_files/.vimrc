"GENERALNE USTAWIENIA

"ustawi numery
:set nu

"set hlsearch

"ustawi numer wzglęem pozycji
:set rnu

"case insensitive
:set ignorecase

"jeżeli litey będą wilkie to takie wyniki będą
:set smartcase

"incremental search
:set incsearch

"szuka w głąb folerów (w autocomplete)
:set path+=**

"pasek podpowiedzi wyszukiwania
:set wildmenu

"rezygnuje z archaizmów vi
:set nocompatible

"pokaż statusbar, 2=zawsze
:set laststatus=2

"automatyczne wciencia w kodzie
:set autoindent 

"poświetlanie skłani
:syntax enable

"menu podpowiedzi autouzupełniania
:set completeopt=menuone,noinsert

"ABERACJA - zamiana
"zamiana czeskich błędów
iabbr sysout System.out.println();

"MAPOWIANIE

"wykona polecenie (jeśli filetype to sh, dodaj nagłówek) po wpisaniu ;b
:autocmd filetype sh inoremap ;b #!/bin/bash<Enter>
:autocmd filetype java inoremap ;m public<space>class<Enter>{<Enter><Tab>public<Space>static<Space>void<Space>main(String[]<Space>args)<Enter>{<Enter><Enter>}<Enter><Backspace>}<Esc>6kA  

"postawi q! po wpisaniu Q
cnoremap Q q!

"inny syntaks, też mapowanie w comad line
" wykrywa rodzaj pliku i go koloruje względem jezyka programowania
:cmap  ft filetype detect

"ODŚWIERZANIE PLIKÓW KOFIGURACYJNYCH

" Odświerzy Xrec. albo Xef. za każym razem gdy coś zmienie w nim
autocmd BufWritePost *Xrecoures,*Xdefaults !xrdb %
autocmd BufWritePost *vimrc !i3-msg reload %

"KOMENDY KONSOLOWE

"Do tego poniżej tzrba mieć zainstalowny program CTAGS
"stworzy tagfile w katalogu w ktorym jesteś, z plikami
".. oraz -Rekursywnie
command! MakeTags !ctags -R .

"NETRW
"usunie baner netrw
let g:netrw_baner=0 
"open in a priory winow
"let g:netrw_browse_split=4
