vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Save undo history
vim.o.undofile = true

-- Enable break line to align it to the previous indent
-- vim.o.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Make the extra sign column active all the time
vim.wo.signcolumn = 'yes'

-- Update time (in millis) neovim updates after typing to refresh
vim.o.updatetime = 50

-- Set highlight on search
-- vim.o.hlsearch = true

-- make the two clipoards available (linux/macos/windows compatibility)
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

-- In order to not be affected by :Wa typo, so it works with :WA, :Wa, :wa, :wA
vim.api.nvim_create_user_command('Wa', 'wa', {bang = true})
vim.api.nvim_create_user_command('WA', 'wa', {bang = true})

-- Concealer for Neorg and avoid disappearing * in .md
-- vim.o.conceallevel=2
-- vim.cmd("autocmd BufWinEnter * setlocal nomodifiable")

-- Activate Inlay Hints with toggle.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    
    -- Your inlay hints toggle code
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, { bufnr = event.buf }) then
      vim.keymap.set('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end, { 
        buffer = event.buf,
        desc = '[T]oggle Inlay [H]ints'
      })
    end
  end,
})

