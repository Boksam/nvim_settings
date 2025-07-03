return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},

	vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<CR>");
	vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<CR>");
}
