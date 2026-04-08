return {
	{
		"ellisonleao/gruvbox.nvim",
	},
	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		config = function()
			vim.cmd("colorscheme onedark")
		end,
	},
	{
		"catppuccin/nvim",
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"stevearc/resession.nvim",
		},
		config = function()
			require("cokeline").setup()
		end,
	},
}
