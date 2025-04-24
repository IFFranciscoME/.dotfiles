vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Save undo history
vim.o.undofile = true

-- Enable break indent
-- vim.o.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Make line numbers default
-- vim.wo.number = true
-- vim.wo.relativenumber = true
-- vim.wo.signcolumn = 'yes'

vim.o.updatetime = 150

-- Set highlight on search
-- vim.o.hlsearch = true

vim.g.lazyvim_python_lsp = "pyright"

--vim.cmd()
vim.opt.clipboard = 'unnamedplus'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Concealer for Neorg
-- vim.o.conceallevel=2
-- vim.cmd("autocmd BufWinEnter * setlocal nomodifiable")

