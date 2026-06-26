--for setting keymaps easier
local keymap = vim.keymap

--add plugins
vim.pack.add {
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/windwp/nvim-autopairs", name = "autopairs" },
  { src = "https://github.com/rmagatti/auto-session", name = "auto-session" }
}

--set colorscheme
vim.cmd.colorscheme("catppuccin")

--autopairs
require("nvim-autopairs").setup()

--auto-session
require("auto-session").setup({
  auto_restore_enabled = false,
  auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
})
keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
