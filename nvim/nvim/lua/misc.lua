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

-- To toggle line numbers
vim.api.nvim_create_user_command('ToggleTerminalNumbers', function()
  if vim.wo.number or vim.wo.relativenumber then
    vim.wo.number = false
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = false
  end
end, {})

-- local diagnostics = { disable = { 'missing-fields' } }
-- disable warnings (mainly because python)
-- vim.diagnostic.config({
--    virtual_text = false,
-- })
--
