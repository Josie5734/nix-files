return {
	"CRAG666/code_runner.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local runner = require("code_runner")

		runner.setup({
			filetype = {
				python = {
					"python %",
				},
				lua = function()
					local filepath = vim.fn.expand("%:p")

					if filepath:match("love2d") then
						return "love " .. vim.fn.expand("%:p:h") -- for love2d
					else
						return "pwd"
					end
				end,
			},
		})

		vim.keymap.set("n", "<f5>", ":RunCode<cr>", { desc = "Run Code" })
	end,
}
