return {
	"akinsho/toggleterm.nvim",
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			size = 20,
			open_mapping = [[<c-`>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			vim.keymap.set("t", "<C-=>", "<C-\\><C-n>:resize +2<CR>i", opts)
			vim.keymap.set("t", "<C-->", "<C-\\><C-n>:resize -2<CR>i", opts)
		end
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		vim.cmd("command! -count=1 ToggleTerm lua require'toggleterm'.toggle(<count>, 12)")
		vim.cmd([[command! -count=1 TermGitPush lua require'toggleterm".exec("git push", <count>, 12)]])
		vim.cmd([[command! -count=1 TermGitPushF lua require'toggleterm'.exec("git push -f", <count>, 12)]])
	end,
}
