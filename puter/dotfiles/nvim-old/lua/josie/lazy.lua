--install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--setup with plugins
require("lazy").setup({
	spec = {
		{ import = "josie.plugins" },
		{ import = "josie.plugins.lsp" },
	},
	checker = {
		enabled = true, --check if plugins need updates
		notify = false,
	},
	change_detection = {
		notify = false, --disable pop up whenever a plugin file is saved/changed
	},
})
