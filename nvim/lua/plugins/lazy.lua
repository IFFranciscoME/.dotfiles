-- Install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Fixes Notify opacity issues
vim.o.termguicolors = true

---- ------------------------------------------------------------------------- --

require('lazy').setup({

  -- ------------------------------------------------------------------------- --

  -- {
  --  "ThePrimeagen/harpoon",
  --  branch = "harpoon2",
  --  dependencies = { "nvim-lua/plenary.nvim" }
  -- },

  -- ------------------------------------------------------------------------- --

  {
    "mistricky/codesnap.nvim",
    build = "make",
  },

  -- ------------------------------------------------------------------------- --

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true
  },

  -- ------------------------------------------------------------------------- --

  'onsails/lspkind.nvim',

  -- ------------------------------------------------------------------------- --

  {
    "iamcco/markdown-preview.nvim",
    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop"
    },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

 -- ------------------------------------------------------------------------- --

  "preservim/vim-pencil",

  -- ------------------------------------------------------------------------- --

  --{
  --  "sourcegraph/sg.nvim",
  --  dependencies = { "nvim-lua/plenary.nvim" },
  --},

  -- ------------------------------------------------------------------------- --

  -- {
  --  "epwalsh/obsidian.nvim",
  --  version = "*",  -- recommended, use latest release instead of latest commit
  --  lazy = true,
  --  ft = "markdown",
  --  dependencies = {
  --     "nvim-lua/plenary.nvim",
  --  },

  --  workspaces = {
  --     {
  --       name = "iteralabs",
  --        path = "Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/",
  --      },
  --    },
  -- },

  -- ------------------------------------------------------------------------- --

  'folke/zen-mode.nvim',
  'tpope/vim-obsession',

  -- ------------------------------------------------------------------------- --

  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        filtered_items = {
          show_hidden_count = true,
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },

      event_handlers = {
        event = "neo_tree_window_after_open",
        handler = function()
          --vim.o.number = false
          --vim.o.relativenumber = false
        end,
      },
    },
  },

  -- ------------------------------------------------------------------------- --
  -- ------------------------------------------------------------------------- --
  -- ------------------------------------------------------------------------- --
  -- ------------------------------------------------------------------------- --
  -- ------------------------------------------------------------------------- --
  -- ------------------------------------------------------------------------- --
  -- ------------------------------------------------------------------------- --

  "tpope/vim-surround",
  'xiyaowong/nvim-transparent',

  {
    'numToStr/FTerm.nvim',
    config = function()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    
    require 'FTerm'.setup({
      blend = 5,
      dimensions = {
        height = 0.45, -- 0.90,
        width = 0.45 - 0.90,
        x = 0.5,
        y = 0.5
      }
    })
    
    end
  },

  -- ------------------------------------------------------------------------- --

  {
  'rmagatti/goto-preview',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require 'goto-preview'.setup {
      width = 100,
      height = 15,
      border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
      default_mappings = true,
      debug = false,
      opacity = nil,
      resizing_mappings = false,
      post_open_hook = nil,
      references = {
        telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
      	focus_on_open = true,
      	dismiss_on_move = false,
      	force_close = true,
      	bufhidden = "wipe",
      	stack_floating_preview_windows = true,
      	preview_window_title = { enable = true, position = "left" }
      },
    }
  end
  },

  -- ------------------------------------------------------------------------- --

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  },

  -- ------------------------------------------------------------------------- --

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = false,
    config = function()
      require("todo-comments").setup {}
    end
  },

  -- ------------------------------------------------------------------------- --

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        enabled = false,
      })
    end
  },

  -- ------------------------------------------------------------------------- --

  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        -- add any options here
        routes = {
          {
            filter = {
              event = 'msg_show',
              any = {
                { find = '%d+L, %d+B' },
                { find = '; after #%d+' },
                { find = '; before #%d+' },
                { find = '%d fewer lines' },
                { find = '%d more lines' },
              },
            },
            opts = { skip = true },
          }
        },
      })
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  -- ------------------------------------------------------------------------- --

  'ray-x/go.nvim',
  'ray-x/guihua.lua',

  -- ------------------------------------------------------------------------- --

  {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  },

  -- ------------------------------------------------------------------------- --

  {
    "AlexvZyl/nordic.nvim",
  },


  {

    'ThePrimeagen/git-worktree.nvim',

  },

  -- ------------------------------------------------------------------------- --

  {
    "williamboman/nvim-lsp-installer"
  },

  -- ------------------------------------------------------------------------- --

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      'j-hui/fidget.nvim',
    },
  },

  -- ------------------------------------------------------------------------- --

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  },

  -- ------------------------------------------------------------------------- --

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },

  -- ------------------------------------------------------------------------- --

  'lewis6991/gitsigns.nvim',

  -- ------------------------------------------------------------------------- --

  'nvim-lualine/lualine.nvim',

  -- ------------------------------------------------------------------------- --

  -- { "lukas-reineke/indent-blankline.nvim", 
  --   main = "ibl",
  --  opts = {} 
  -- },

  -- ------------------------------------------------------------------------- --

  'numToStr/Comment.nvim',

  -- ------------------------------------------------------------------------- --

  -- 'tpope/vim-sleuth',

  -- ------------------------------------------------------------------------- --

  -- ------------------------------------------------------------------------- --

  {
    'tpope/vim-fugitive',
    config = function()
      require("plugins.vimfugitive")
    end
  },

  -- ------------------------------------------------------------------------- --

  { 'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- ------------------------------------------------------------------------- --

  'nvim-telescope/telescope-symbols.nvim',

  -- ------------------------------------------------------------------------- --

  { 'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1
  },

  -- ------------------------------------------------------------------------- --

  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.25, -- amount of dimming
        -- we try to get the foreground from the highlight groups or fallback color
        color = { "Normal", "#ffffff" },
        term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
        inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
      },
    context = 40
    }
  },


})
