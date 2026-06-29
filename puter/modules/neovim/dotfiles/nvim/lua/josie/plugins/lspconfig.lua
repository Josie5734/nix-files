--lspconfig
local servers = { --list of lsp servers to use - servers are installed manually through nix
	"lua_ls",
	"basedpyright",
}
for _, server in ipairs(servers) do --go through list of servers and enable
	vim.lsp.enable(server)
end

--enable completion natively
vim.opt.completeopt = { "menuone", "noinsert", "popup" } --options for completion, stops from autoinserting first suggestion
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.lsp.config("lua_ls", { --lua ls config
	settings = {
		Lua = { --makes "vim" not show as an error in nvim config files
			diagnostics = { globals = { "vim" } },
		},
	},
})
