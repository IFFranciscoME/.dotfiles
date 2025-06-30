vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', '<leader>1', '1<C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>2', '2<C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>3', '3<C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>4', '4<C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>5', '5<C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>6', '6<C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>7', '7<C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>8', '8<C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>9', '9<C-w>w', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>wa", "<cmd>wa<cr>", { silent = false, noremap = true})

vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, { desc = "Open Diagnostic in Float" })

-- Togglers
vim.keymap.set('n', '<leader>te', '<Cmd>Neotree toggle<CR>', { desc = '[T]oggle Neotree [E]xplorer' })

--- Leet code
vim.keymap.set("n", "<leader>lt", "<cmd>Leet test<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>li", "<cmd>Leet info<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>ld", "<cmd>Leet daily<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>lr", "<cmd>Leet restore<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>lc", "<cmd>Leet console<cr>", {silent = true, noremap = true})

--- Layout
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- LSP
vim.keymap.set("n", "K",  vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
vim.keymap.set("n", "<leader>td",  vim.lsp.buf.type_definition, { desc = "Type [D]efinition" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

-- Diagnostics navigation
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, { desc = "Show Diagnostics" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Open a focusable diagnostic popup after jumping to a diagnostic
local function show_diagnostic_with_focus()
  vim.diagnostic.open_float(nil, { focusable = true })
end

-- Jump to previous diagnostic and open popup
vim.keymap.set('n', '[d', function()
  vim.diagnostic.goto_prev()
  show_diagnostic_with_focus()
end, { desc = "Prev Diagnostic (with popup)" })

-- Jump to next diagnostic and open popup
vim.keymap.set('n', ']d', function()
  vim.diagnostic.goto_next()
  show_diagnostic_with_focus()
end, { desc = "Next Diagnostic (with popup)" })

-- Formatting
vim.keymap.set({'n', 'v'}, '<leader>f', function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format" })

--- Debugger for Rust ---

