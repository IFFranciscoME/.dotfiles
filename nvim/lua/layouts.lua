
----------------------------------------------------------------------------------- WINDOW SPLIT --
----------------------------------------------------------------------------------- ------------ --

-- Opens a split window below the current one, and, opens a terminal
-- vim.cmd("autocmd VimEnter * belowright split")

-- Reduce the height of the terminal window
-- vim.cmd("autocmd VimEnter * horizontal resize -15")

-- Reveals the files-tree in the left
vim.cmd("autocmd VimEnter * Neotree filesystem reveal left")
--vim.wo.number = false

-- Reduce the width of the file-tree window
vim.cmd("autocmd VimEnter * vertical resize -10")

-- Conditionally set line numbers : Neotree: No, Terminal: No, Other: Yes

vim.api.nvim_create_autocmd({ "WinNew", "BufWinEnter", "VimEnter" }, {
  callback = function()
    local ft = vim.bo.filetype
    if ft ~= "neo-tree" and ft ~= "terminal" then
      vim.wo.number = true
      vim.wo.relativenumber = true
    else
      vim.wo.number = false
      vim.wo.relativenumber = false
    end
  end,
})
