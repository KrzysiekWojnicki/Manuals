
" PLUGIN VIM
execute pathogen#infect()
" SETTINGS
:syntax enable
filetype plugin indent on
set laststatus=2
"ABERACJA - zamiana
"zamiana czeskich błędów
iabbr iosteram iostream
iabbr cerate create


: cmap Q q!
: cmap nt NERDTree 
: autocmd filetype cpp inoremap ;b #include<Space><iostream><Enter><Enter>using<Space>namespace<Space>std;<esc>k0i
: autocmd filetype cpp inoremap ;n #include<Space><iostream><Enter>using<Space>namespace<Space>std;<Enter>
: autocmd filetype html inoremap ;D <!DOCTYPE HTML><Enter><html<Space>lang="pl"><Enter><head><Enter><Enter></head><Enter><body><Enter><Enter></body><Enter></html><esc>^6ki
: autocmd filetype html inoremap ;d <div id=""><Enter><Enter></div><esc>2k3la
: autocmd filetype html inoremap ;b <br/>
: autocmd filetype css inoremap ;1 #<Enter>{<Enter>}<esc>2ki
: set autoindent 
: set incsearch
: set showmode 
" set hlsearch
: set showmode
: set ruler
: set nu
: set relativenumber

"set hlsearch
set incsearch
set ignorecase
set smartcase

noremap <CR> :nohlsearch<cr>
"wyłączanie strzełek w normal
no <up> <nop>
no <down> <nop>
no <left> <nop>
no <right> <nop>
" wyłączanie strzełek w insert 
ino <up> <nop>
ino <down> <nop>
ino <left> <nop>
ino <right> <nop>  

