return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "buffers",
			separator_style = "slant",

			-- (선택 사항) 왼쪽에 파일 탐색기(NvimTree 등)가 있을 때 겹치지 않게 밀어주는 설정
			offsets = {
				{
					filetype = "NvimTree",
					text = "Explorer",
					highlight = "Directory",
					separator = true,
				},
			},
		},
	},
	-- 키 매핑 설정을 여기에 추가하면 편합니다.
	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
	},
}
