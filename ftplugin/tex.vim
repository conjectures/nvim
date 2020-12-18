"Config file for .tex
"
    "Autocommands:
    "Compile everytime a change happens (latexmk&dispatch)
    autocmd BufWritePost <buffer> Dispatch! latexmk -pdf main.tex

    "Mappings:
    inoremap <SPACE> <SPACE><esc>:w<CR>a
    inoremap <CR> <CR><esc>:w<CR>i
    inoremap <esc> <esc>:w<CR>

    inoremap { {}<esc>i
    inoremap [ []<esc>i
    inoremap ( ()<esc>i


    "Functions:
    "
