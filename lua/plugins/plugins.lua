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
	-- Themes/UI
	"catppuccin/nvim",
	"ellisonleao/gruvbox.nvim",
	"goolord/alpha-nvim",
	"navarasu/onedark.nvim",
	"nvim-lualine/lualine.nvim",
	"windwp/nvim-autopairs",

	-- File Explorer & 
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons"
		},
	},

	-- Git
	"kdheepak/lazygit.nvim",

	-- LSP & Tools
	"iamcco/markdown-preview.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	"williamboman/mason.nvim",
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvimtools/none-ls-extras.nvim" },
	},

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"nvim-telescope/telescope-ui-select.nvim",

	-- Autocomplete & Snippets
	"github/copilot.vim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip",

	-- Debugging
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
	},

	-- LaTeX
	"lervag/vimtex",

	-- Rust
	"mrcjkb/rustaceanvim",

	-- Utility
	"folke/which-key.nvim",
	"MarcHamamji/runner.nvim",
}

require('plugins.show_keybinds')

local opts = {}

require("lazy").setup(plugins, opts)
