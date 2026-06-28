--Render Markdown

require("render-markdown").setup({
	completions = { lsp = { enabled = true } }, --enable completions
	heading = { position = "inline" }, --keep headings to the left
})
