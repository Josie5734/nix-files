--short the url for plugin src
local gh = function(x)
	return "https://github.com/" .. x
end

--table of all plugins, as would be given to vim.pack.add()
local plugins = { --name is used as the filename for that plugin
	--appearance
	{ src = gh("catppuccin/nvim"), name = "catppuccin" }, --colorscheme
	{ src = gh("nvim-tree/nvim-web-devicons"), name = "devicons" }, --icons, dependency for most stuff
	{ src = gh("akinsho/bufferline.nvim"), name = "bufferline" }, --tab bar

	{ src = gh("nvim-lualine/lualine.nvim"), name = "lualine" }, --status bar at the bottom

	--text
	{ src = gh("folke/todo-comments.nvim"), name = "todo-comments" }, --todo comment highlights
	{ src = gh("windwp/nvim-autopairs"), name = "autopairs" }, --auto pair on ({[ etc

	--utility
	{ src = gh("rmagatti/auto-session"), name = "auto-session" },
	{ src = gh("folke/which-key.nvim"), name = "whichkey" },
	{ src = gh("folke/snacks.nvim"), name = "snacks" }, --snacks, big utility plugin group

	--snacks.nvim - potentially replaces a couple plugins, will consider if i use enough of the plugins in it
	--would use: picker(ff find), explorer(file explorer), indent, scratch?, terminal,
	--mini.nvim - also a big library with a bunch of stuff
	--would use: surround, pick?(alternative to telescope), pairs(replace autopairs), snippets(for cmp)
	--live preview
	--multicursor
	--"gbprod/substitute.nvim"

	--lsp, formatter, linter stuff
	--mfussenegger/nvim-lint --runs linters by filetype
	{ src = gh("nvim-treesitter/nvim-treesitter"), name = "treesitter" }, --treesitter parsing
	{ src = gh("neovim/nvim-lspconfig"), name = "lspconfig" }, --lspconfig for lsps
	{ src = gh("stevearc/conform.nvim"), name = "conform" }, --conform for formatters
	{ src = gh("folke/trouble.nvim"), name = "trouble" }, --diagnostic for errors
}

--add all plugins through vim.pack
vim.pack.add(plugins)

--loopthrough plugin table and call the file for each plugin using its name value
for i, v in ipairs(plugins) do
	require("josie.plugins." .. v.name)
end
