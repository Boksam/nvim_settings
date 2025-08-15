return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		-- mason 설정
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- mason-tool-installer를 사용해 포매터, 린터 등 설치
		-- LSP 서버 목록은 lspconfig.lua에서 관리합니다.
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier 포매터
				"stylua", -- lua 포매터
				"isort", -- python 포매터
				"black", -- python 포매터
				"eslint_d", -- eslint 린터
			},
		})
	end,
}
