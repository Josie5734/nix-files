--snacks
local snacks = require("snacks")
snacks.setup({
	explorer = { --file explorer
		enabled = true,
		replace_netrw = true, --replace netrw with snacks explorer
	},
	indent = { enabled = true }, --draw the lines in the indent
	picker = { --fuzzy finder / file picker
		enabled = true,
		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "n", "i" } }, --close picker on ESC rather than going to normal mode
				},
			},
		},
	},
	scratch = { enabled = true }, --scratchpad with code execution
	terminal = { enabled = true }, --terminal toggle sort of (might not need this)
})

--keybinds
local keymap = vim.keymap

keymap.set("n", "<leader>ee", "<cmd>lua Snacks.explorer()<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ff", "<cmd> lua Snacks.picker.files()<CR>", { desc = "Find Files" })
keymap.set("n", "<leader>fl", "<cmd> lua Snacks.picker.lines()<CR>", { desc = "Find Lines" })
keymap.set("n", "<leader>ss", "<cmd>lua Snacks.scratch()<CR>", { desc = "Open scratch window" })
keymap.set("n", "<leader>tt", "<cmd>lua Snacks.terminal.toggle()<CR>", { desc = "Toggle terminal" })
