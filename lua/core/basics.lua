vim.g.have_nerd_font = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = ""
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.g.loaded_perl_provider = 0
vim.g.clipboard = {
    name = 'myClipboard',
    copy = {
        ['+'] = { 'tmux', 'load-buffer', '-' },
        ['*'] = { 'tmux', 'load-buffer', '-' },
    },
    paste = {
        ['+'] = { 'tmux', 'save-buffer', '-' },
        ['*'] = { 'tmux', 'save-buffer', '-' },
    },
    cache_enabled = 1,
}
