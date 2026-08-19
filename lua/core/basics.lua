vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = ""
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.g.loaded_perl_provider = 0

-- O Neovim detecta o clipboard do sistema automaticamente:
-- wl-clipboard no Wayland, xclip/xsel no X11.
-- Se quiser que todo yank/delete vá direto para o clipboard do sistema,
-- descomente a linha abaixo:
-- vim.opt.clipboard = 'unnamedplus'
