
----------------------------------------------------------------------------------- WINDOW SPLIT --
----------------------------------------------------------------------------------- ------------ --

-- Opens a split window below the current one, and, opens a terminal
-- vim.cmd("autocmd VimEnter * belowright split")
-- Reduce the height of the terminal window
-- vim.cmd("autocmd VimEnter * horizontal resize -15")


-- 3 cols : [1, 2, 3]
vim.cmd("autocmd VimEnter * vertical split")
vim.cmd("autocmd VimEnter * horizontal split")

-- Reveals the files-tree in the left
vim.cmd("autocmd VimEnter * Neotree filesystem reveal left")
--vim.wo.number = false

-- Reduce the width of the file-tree window
-- vim.cmd("autocmd VimEnter * vertical resize -15")

-- Conditionally set line numbers : Neotree: No, Other: Yes
vim.api.nvim_create_autocmd({ "WinNew", "BufWinEnter", "VimEnter" }, {
  callback = function()
    local ft = vim.bo.filetype
    if ft ~= "neo-tree" then
      vim.wo.number = true
      vim.wo.relativenumber = false
    else
      vim.wo.number = false
      vim.wo.relativenumber = false
    end
  end,
})

-- Hide line numbers when a new terminal is open
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- Helper function to automatically toggle line numbers
vim.api.nvim_create_user_command('ToggleTerminalNumbers', function()
  if vim.wo.number or vim.wo.relativenumber then
    vim.wo.number = false
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = false
  end
end, {})

