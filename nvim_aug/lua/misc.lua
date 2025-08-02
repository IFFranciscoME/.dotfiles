-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Do not hide tripple backquote content 
vim.cmd("set conceallevel=0")

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :q!<CR>
      set nobuflisted
    ]]
  end,
})

