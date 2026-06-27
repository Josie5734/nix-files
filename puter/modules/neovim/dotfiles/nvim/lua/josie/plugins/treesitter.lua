--treesitter
local parsers = { --parsers to install
	"json",
	"python",
	"javascript",
	"typescript",
	"tsx",
	"html",
	"css",
	"scss",
	"markdown",
	"markdown_inline",
	"bash",
	"lua",
	"yaml",
	"vim",
	"dockerfile",
	"gitignore",
	"query",
	"vimdoc",
}
require("nvim-treesitter").install(parsers) --install parsers
vim.api.nvim_create_autocmd("FileType", { --start treesitter on filetypes
	pattern = parsers,
	callback = function()
		vim.treesitter.start()
	end,
})
