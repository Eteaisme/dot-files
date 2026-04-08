return {
	
	{ "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
	{ "neovim/nvim-lspconfig", event = { "VeryLazy", "BufReadPre", "BufNewFile" }},
	
	-- Typst live preview in browser (updates as you type)
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		build = function()
			require("typst-preview").update()
		end,
		opts = {
			debug = false,
			follow_cursor = true,
		},
	},

}
