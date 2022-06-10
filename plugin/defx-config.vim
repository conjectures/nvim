"https://github.com/Shougo/defx.nvim/blob/master/doc/defx.txt
"https://github.com/kristijanhusak/defx-icons
"Toggle defx

let g:defx_icons_enable_syntax_highlight = 0
let g:defx_icons_column_length = 1
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_copy_icon = ''
let g:defx_icons_move_icon = ''
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''

" " filename column as percentage of window width
" call defx#custom#column('filename', {
"       \ 'min_width' : "-70",
"       \ 'max_width' :"-100" 
"       \ })

call defx#custom#column('git', 'indicators', {
  \     'Modified'  : '•',
  \     'Staged'    : '✚',
  \     'Untracked' : 'ᵁ',
  \     'Renamed'   : '≫',
  \     'Unmerged'  : '≠',
  \     'Ignored'   : 'ⁱ',
  \     'Deleted'   : '✖',
  \     'Unknown'   : '?'
  \   })

call defx#custom#column('time', {
      \ 'format': '%Y %b%e %H:%M',
      \ })

call defx#custom#option('_', {
  \ 'resume': 1,
  \ 'winwidth': 30,
  \ 'split': 'vertical',
  \ 'root_marker': '',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 0,
  \ 'columns': "git:indent:icons:filename",
  \ 'ignored_files': '*.pyc,*.pyd,*~,*.swo,*.swp,.git',
  \ 'buffer_name': 'defxplorer',
  \ 'toggle': 1
  \ })


augroup user_plugin_defx
    autocmd!
    " Define defx window mappings
    autocmd FileType defx call <SID>defx_mappings()

    " Delete defx if it's the only buffer left in the window
    autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif

    " Move focus to the next window if current buffer is defx
    autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif

    "autocmd FileType defx 
augroup END


function! s:defx_mappings() abort
    " Defx window keyboard mappings
    setlocal norelativenumber nonumber
    setlocal signcolumn=no expandtab
    setlocal cursorline

    nnoremap <silent><buffer><expr> <CR>  <SID>defx_toggle_tree()
"    nnoremap <silent><buffer><expr> e     <SID>defx_toggle_tree()
    nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()
    nnoremap <silent><buffer><expr> h     defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> t     defx#do_action('open_tree', 'recursive')
    "nnoremap <silent><buffer><expr> st    defx#do_action('multi', [['drop', 'tabnew'], 'quit'])
    nnoremap <silent><buffer><expr> sh    defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
    nnoremap <silent><buffer><expr> sv    defx#do_action('multi', [['drop', 'split'], 'quit'])
    nnoremap <silent><buffer><expr> P     defx#do_action('preview')
    nnoremap <silent><buffer><expr> y     defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
"    nnoremap <silent><buffer><expr> gx    defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')

"    " Defx's buffer management
    nnoremap <silent><buffer><expr> <Esc>  defx#do_action('quit')
    nnoremap <silent><buffer><expr> q      defx#do_action('quit')
"    nnoremap <silent><buffer><expr> se     defx#do_action('save_session')
    nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')

"    " File/dir management
    nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
    nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
    nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')
    nnoremap <silent><buffer><expr><nowait> r  defx#do_action('rename')
    nnoremap <silent><buffer><expr> dd defx#do_action('remove_trash')
    nnoremap <silent><buffer><expr> K  defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N  defx#do_action('new_multiple_files')

"    " Change directory
    nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
"    nnoremap <silent><buffer><expr><nowait> &  defx#do_action('cd', getcwd())
"    nnoremap <silent><buffer><expr> <BS>  defx#async_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~     defx#async_action('cd')
    nnoremap <silent><buffer><expr> u   defx#do_action('cd', ['..'])
"    nnoremap <silent><buffer><expr> 2u  defx#do_action('cd', ['../..'])
"    nnoremap <silent><buffer><expr> 3u  defx#do_action('cd', ['../../..'])
"    nnoremap <silent><buffer><expr> 4u  defx#do_action('cd', ['../../../..'])

" Resize window dynamically
    nnoremap <silent><buffer><expr> > defx#do_action('resize', defx#get_context().winwidth + 10)
    nnoremap <silent><buffer><expr> < defx#do_action('resize', defx#get_context().winwidth - 10)
"    
"    " Selection
"    nnoremap <silent><buffer><expr> *  defx#do_action('toggle_select_all')
"    nnoremap <silent><buffer><expr><nowait> <Space>
"    	\ defx#do_action('toggle_select') . 'j'
"    
"    nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'Time')
"     nnoremap <silent><buffer><expr> C
"       \ defx#do_action('toggle_columns', 'git:indent:icons:filename:size:time:type')
"    
"    " Tools
"    nnoremap <silent><buffer><expr> w   defx#do_action('call', '<SID>toggle_width')
"    nnoremap <silent><buffer><expr> gd  defx#async_action('multi', ['drop', 'quit', ['call', '<SID>git_diff']])
"    nnoremap <silent><buffer><expr> gr  defx#do_action('call', '<SID>grep')
    nnoremap <silent><buffer>expr> f  defx#do_action('call', '<SID>find_files')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_tree', ['nested', 'toggle'])
    endif
    return defx#do_action('multi', ['drop','quit'])
endfunction

"function! s:find_files(context) abort
  "Find files in parent dir
  "let


map - :Defx<CR>
