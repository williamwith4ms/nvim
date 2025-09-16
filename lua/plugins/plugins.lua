local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

local plugins = {
	-- Themes
	"navarasu/onedark.nvim",
  "catppuccin/nvim",
  "ellisonleao/gruvbox.nvim",
	"nvim-lualine/lualine.nvim",
	"goolord/alpha-nvim",
  "windwp/nvim-autopairs", 
	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"nvim-telescope/telescope-ui-select.nvim",
  "iamcco/markdown-preview.nvim",
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvimtools/none-ls-extras.nvim" },
	},
	-- Features
	--"nvim-tree/nvim-tree.lua",
	"nvim-treesitter/nvim-treesitter",
  {
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- autocomplete
	"hrsh7th/nvim-cmp",
  "github/copilot.vim",
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
  "mfussenegger/nvim-dap",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
  },
  "lervag/vimtex",
  -- Rust
  "mrcjkb/rustaceanvim",
  -- evertthing else
	"saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "MarcHamamji/runner.nvim",
  "ggandor/leap.nvim",
  "kdheepak/lazygit.nvim",

	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
}

require('plugins.show_keybinds')

local opts = {}

require("lazy").setup(plugins, opts)
