return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black.with({
					-- venv 환경을 고려하여, 현재 환경의 black을 우선 사용하도록 설정
					extra_args = { "--fast" },
					prefer_local = "venv",
				}),
				null_ls.builtins.formatting.isort.with({
					prefer_local = "venv",
				}),

				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.eslint_d,
			},

			-- LSP 포매팅과 충돌하지 않도록, none-ls가 포매팅을 담당하도록 설정
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					-- pcall을 사용하여 LspFormatOnSave 그룹이 존재하지 않을 때 무시
					pcall(vim.api.nvim_clear_autocmds, { group = "LspFormatOnSave", buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("NullLsFormatOnSave", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(c)
									return c.name == "null-ls"
								end,
								bufnr = bufnr,
								async = true,
							})
						end,
					})
				end
			end,
		})
	end,
}
