--lspconfig
local servers = { --list of lsp servers to use - servers are installed manually through nix
	"lua_ls",
	"pyright",
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

--Configs

--checks for library of pico8 definitions, returns lua_ls config options for pico8 projects
local pico8 = require("josie.plugins.pico8")

--lua ls
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
	root_dir = pico8.find_root_dir, --find root dir of .p8 files
	on_init = pico8.on_init, --sets a bunch of rules if pico8 definitions exist, else does nothing
})
