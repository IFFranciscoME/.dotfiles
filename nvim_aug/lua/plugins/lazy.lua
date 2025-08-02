
-------------------------------------------------------------------------------------- --
-- Install lazy if not installed --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

-- Add path for lazy
vim.opt.rtp:prepend(lazypath)

-- Fixes Notify opacity issues
vim.o.termguicolors = true

-------------------------------------------------------------------------------------- --

require("lazy").setup({

	-- ------------------------------------------------------------------------- --

	{
		"AlexvZyl/nordic.nvim",
		opts = {},
	},

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
					hide_dotfiles = true,
					hide_gitignored = true,
				},
			},

		},
	},

	-- -- ------------------------------------------------------------------------- --
	
  {
    "mason-org/mason.nvim",
    opts = {},
  },

	-- -- ------------------------------------------------------------------------- --

  -- Configuration for the Language Server Protocol

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
		},
	},

	-- ------------------------------------------------------------------------- --

	-- Vscode like icons

	{
		"onsails/lspkind.nvim",
	},

	-- ------------------------------------------------------------------------- --

	-- Interactive preview (on explorer) of Markdown files

	{
		"iamcco/markdown-preview.nvim",
		cmd = {
			"MarkdownPreviewToggle",
			"MarkdownPreview",
			"MarkdownPreviewStop",
		},
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- ------------------------------------------------------------------------- --

	{
		"rmagatti/goto-preview",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("goto-preview").setup({
				width = 200,
				height = 20,
				border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
				default_mappings = true,
				debug = false,
				opacity = nil,
				resizing_mappings = true, -- false
				post_open_hook = nil,
				references = {
					telescope = require("telescope.themes").get_dropdown({
						hide_preview = false,
					}),
					focus_on_open = true,
					dismiss_on_move = false,
					force_close = true,
					bufhidden = "wipe",
					stack_floating_preview_windows = true,
					preview_window_title = { enable = true, position = "left" },
				},
			})
		end,
	},

	-- ------------------------------------------------------------------------- --

	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	},

	-- ------------------------------------------------------------------------- --

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	-- ------------------------------------------------------------------------- --

	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				enabled = true,
			})
		end,
	},

	-- ------------------------------------------------------------------------- --

	{
		"ThePrimeagen/git-worktree.nvim",
	},

	-- ------------------------------------------------------------------------- --

  -- Highlight, edit, and navigate code
  
	{ 
	  "nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	-- ------------------------------------------------------------------------- --
	
	-- Enhanced git interface and commands
	
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},

	-- ------------------------------------------------------------------------- --
	
	-- Horizontal Status Line
	
	{
		"nvim-lualine/lualine.nvim",
		opts = {},
	},

	-- ------------------------------------------------------------------------- --

  -- Visual vertical line for indentation

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "|", -- Dashed vertical line. Alternatives: "┊", "┋"
				highlight = { "IblIndent" }, -- Use your custom highlight group
			},
		},
	},

	-- ------------------------------------------------------------------------- --

	{
		"numToStr/Comment.nvim",
		opts = {},
	},

	-- ------------------------------------------------------------------------- --

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- ------------------------------------------------------------------------- --
  
  {
    "nvim-telescope/telescope-symbols.nvim",
  },

	-- ------------------------------------------------------------------------- --

	{ 
	  "nvim-telescope/telescope-fzf-native.nvim",
	  build = "make",
	  cond = vim.fn.executable("make") == 1 
	},

	-- ------------------------------------------------------------------------- --

	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				routes = {
					{
						filter = {
							event = "msg_show",
							any = {
								{ find = "%d+L, %d+B" },
								{ find = "; after #%d+" },
								{ find = "; before #%d+" },
								{ find = "%d fewer lines" },
								{ find = "%d more lines" },
							},
						},
						opts = { skip = true },
					},
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	--
	-- ------------------------------------------------------------------------- --

	"ray-x/go.nvim",
	"ray-x/guihua.lua",

	-- ------------------------------------------------------------------------- --

	--{
	--	"windwp/nvim-autopairs",
	--	config = function()
	--		require("nvim-autopairs").setup({})
	--	end,
	--},


	-- ------------------------------------------------------------------------- --

  	-- Save the current state of Nvim (windows, open folders, etc)

  {
		  "tpope/vim-obsession",
	},

	-- ------------------------------------------------------------------------- --

	{
		"numToStr/FTerm.nvim",

		    config = function()
		    local map = vim.api.nvim_set_keymap
		    local opts = { noremap = true, silent = true }

		    require("FTerm").setup({
					blend = 0,
					dimensions = {
						height = 0.90,
						width = 0.45, -- 0.90,
						x = 0.5,
						y = 0.5,
					},
				})

				end
	},
	
	-- ------------------------------------------------------------------------- --

	-- Code completition

	-- {
	--   "hrsh7th/nvim-cmp",
	--   dependencies = {
	--     "hrsh7th/cmp-nvim-lsp",
	--     "L3MON4D3/LuaSnip",
	--     "saadparwaiz1/cmp_luasnip",
	--   },
	-- },

	-- ------------------------------------------------------------------------- --

	-- Custom commands specification

	{
	  "ThePrimeagen/harpoon",
	  branch = "harpoon2",
	  dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- ------------------------------------------------------------------------- --
	
	-- Interactive Git Interface
	
	-- {
	-- 	"NeogitOrg/neogit",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim", -- required
	-- 		"sindrets/diffview.nvim", -- optional - Diff integration
	-- 		"nvim-telescope/telescope.nvim", -- optional
	-- 	},
	-- 	config = true,
	-- },
})


