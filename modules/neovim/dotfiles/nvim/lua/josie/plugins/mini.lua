--mini.nvim

--icons
require("mini.icons").setup() --icon set

--text editing
require("mini.move").setup() --move selections in any directions
require("mini.pairs").setup() --pairs for brackets and stuff
require("mini.surround").setup() --for surrounded objects e.g "a". not sure if i really need this

--general workflow
require("mini.files").setup() --file explorer. currently installed alongside snacks.explorer,trying out both
require("mini.jump2d").setup() --jump to anywhere on screen using <CR> (enter)

--keymaps

--open mini.files
vim.keymap.set("n", "<leader>mf", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open MiniFiles explorer" })
