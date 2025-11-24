return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		routes = {
			{
				filter = { event = "msg_show" },
				view = "notify",
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				background_colour = "#000000",
			},
		},
	},
	config = function(_, opts)
		require("noice").setup(opts)
		vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<CR>")
		vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<CR>")
	end,
}
