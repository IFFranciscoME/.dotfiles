local M = {}

function M.setup()

    -- Optional: Set any specific configurations for vim-fugitive here
    -- Example: Change the number of context lines in diffs
    -- Adjust the number of context lines as needed

  vim.opt.diffopt:append 'context:10'   -- Key mappings for Git commands
  vim.api.nvim_set_keymap('n', '<leader>gs', ':Gstatus<CR>',
    { noremap = true, silent = true })  -- Git status
    vim.api.nvim_set_keymap('n', '<leader>gc', ':Gcommit<CR>',
    { noremap = true, silent = true })  -- Git commit
    vim.api.nvim_set_keymap('n', '<leader>gp', ':Gpush<CR>',
    { noremap = true, silent = true })  -- Git push
    vim.api.nvim_set_keymap('n', '<leader>gl', ':Glog<CR>',
    { noremap = true, silent = true })  -- Git log
end
return M
