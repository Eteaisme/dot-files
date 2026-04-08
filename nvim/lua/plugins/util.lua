return {
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
		config = function()
			require("render-markdown").setup({})
		end,
	},
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		config = function()
			require("oil").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },

		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fw",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep",
			},
		},

		config = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = "🔍 ",
					file_ignore_patterns = {
						"%.exe$",
						"%.o$",
						"%.a$",
						"%.out$",
						"%.so$",
						"%.png$",
						"%.jpg$",
						"%.jpeg$",
						"%.gif$",
						"%.bmp$",
						"%.pdf$",
						"%.zip$",
						"%.tar$",
						"%.gz$",
						"%.7z$",
						"%.mp4$",
						"%.mp3$",
						"%.avi$",
						"%.mkv$",
						"%.mov$",
					},
				},
			})
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			require("nvim-tree").setup({
				view = {
					side = "right",
					width = 35,
				},
				filters = {
					dotfiles = false,
				},
				renderer = {
					highlight_opened_files = "name",
				},
				actions = {
					open_file = { quit_on_open = false },
				},
			})

			local api = require("nvim-tree.api")

			local function toggle_tree_focus()
				if vim.bo.filetype == "NvimTree" then
					vim.cmd("wincmd p")
					return
				end

				if api.tree.is_visible() then
					api.tree.focus()
					return
				end

				api.tree.open()
				api.tree.focus()
			end

			vim.keymap.set(
				"n",
				"<leader>e",
				toggle_tree_focus,
				{ noremap = true, silent = true, desc = "Toggle NvimTree focus" }
			)
		end,
	},
	{
		"kaarmu/typst.vim",
		ft = "typst",
		lazy = false,
	},
	{
		"chomosuke/typst-preview.nvim",
		lazy = false,
		version = "1.*",
		opts = {},
	},
}
