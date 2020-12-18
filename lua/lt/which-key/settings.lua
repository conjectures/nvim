vim.g.which_key_map = {
    s = { name = 'source' },
    b = { name = 'buffer' },
    e = { name = 'edit' }
}
vim.cmd('call which_key#register("<Space>", "g:which_key_map")')
