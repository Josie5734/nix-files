--conform
local conform = require("conform")
conform.setup({
	formatters_by_ft = { --list of formatters to use and on which filestypes
		lua = { "stylua" },
		python = { "ruff" },
	},
	formatters = { --custom stuff for each formatter
		stylua = {
			--point to a stylua.toml file in .config/nvim/ for global style rules
			prepend_args = { "--config-path", vim.fn.stdpath("config") .. "/stylua.toml" },
		},
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
})

--keymap to format manually
vim.keymap.set(
	{ "n", "v" },
	"<leader>mp",
	function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		})
	end,
	{ desc = "Format file" }
)
