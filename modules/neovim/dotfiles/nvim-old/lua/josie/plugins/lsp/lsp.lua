return {
	"hrsh7th/cmp-nvim-lsp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
	},
	config = function()
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- ruff configs
		-- vim.lsp.config("ruff", {
		-- 	init_options = {
		-- 		settings = {
		-- 			lint = {
		-- 				preview = false,
		-- 			},
		-- 			lineLength = 10,
		-- 		},
		-- 	},
		-- })
		-- vim.lsp.enable("ruff", true)
	end,
}
