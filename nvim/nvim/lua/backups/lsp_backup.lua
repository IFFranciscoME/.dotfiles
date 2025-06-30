-- plugins/lsp.lua
local M = {}

--local config = require("plugins.configs.lsp")
--local on_attach = config.on_attach
--local capabilities = config.capabilities
-- local lspconfig = require("lspconfig")

-- Setup mason so it can manage external tooling
require('mason').setup()
require('mason-lspconfig').setup()
require('j-hui/fidget.nvim').setup()
require('saghen/blink.cmp').setup()

-- LSP settings
M.on_attach = function(client, bufnr)
  -- Keymaps helper
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  
  -- Format command
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format({ async = true })
  end, { desc = 'Format buffer with LSP' })
end

-- nvim-cmp capabilities
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities(M.capabilities)

-- Server configurations
M.servers = {

  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        diagnostics = { enable = true },
        cargo = { features = "all" },
        checkOnSave = { command = "clippy" },
      },
    },
  },

  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true
        }
      }
    },
    on_init = function(client)
      client.config.settings.python.pythonPath = '/Users/franciscome/.pyenv/versions/3.11.8/bin/python'
    end
  },

  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false
        },
        telemetry = { enable = false }
      }
    }
  },

  clangd = {},
  gopls = {},
  html = {},
  bashls = {},
  cssls = {},
  jsonls = {},
  yamlls = {},
  ts_ls = {},

}

return M


