function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- KEYMAPS --

-- LEADER --
vim.g.mapleader = " "

-- OIL --

-- WRITING & QUITING --
Map("n", "<Leader>w", ":write<CR>")
Map("n", "<Leader>a", ":wqa!<CR>")
Map("n", "<Leader>o", ":so<CR>")
Map("n", "q", ":bd!<CR>")

-- REDO --
Map("n", "U", "<C-r>", {})

-- NEWLINE --
Map("n", "<S-CR>", "mzo<Esc>")

-- TERMINAL --
Map("n", "<Leader><CR>", ":term<CR>i")
Map("t", "<Esc>", [[<C-\><C-n>]])

-- BUFFERS --
Map("n", "<Tab>", ":bnext<CR>")
Map("n", "<S-Tab>", ":bprev<CR>")

-- SEARCH --
Map("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>")
Map("n", "i", "<cmd>nohlsearch<CR>i")
Map("n", "a", "<cmd>nohlsearch<CR>a")
Map("n", "o", "<cmd>nohlsearch<CR>o")
Map("n", "O", "<cmd>nohlsearch<CR>O")
Map("n", "I", "<cmd>nohlsearch<CR>I")
Map("n", "A", "<cmd>nohlsearch<CR>A")
Map("n", "v", "<cmd>nohlsearch<CR>v")
Map("n", "V", "<cmd>nohlsearch<CR>V")
Map("n", "<C-v>", "<cmd>nohlsearch<CR><C-v>")

-- TYPST PREVIEW --
vim.api.nvim_create_autocmd("FileType", {
	pattern = "typst",
	callback = function()
		vim.keymap.set("n", "<Leader>p", function()
			local file = vim.fn.expand("%:p")
			local pdf = vim.fn.fnamemodify(file, ":r") .. ".pdf"
			-- Compile typst file to PDF
			vim.fn.jobstart({ "typst", "compile", file, pdf }, {
				on_exit = function(_, exit_code)
					if exit_code == 0 then
						-- Open PDF with zathura
						vim.fn.jobstart({ "zathura", pdf }, { detach = true })
					else
						vim.notify("Typst compilation failed", vim.log.levels.ERROR)
					end
				end,
			})
		end, { buffer = true, silent = true, desc = "Preview Typst in Zathura" })
	end,
})
