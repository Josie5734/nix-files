return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls", --lua
				"pyright", --python
				"html", --html
				"cssls", --css
				"tailwindcss", --css tailwind
				"ts_ls", --javascript
				"eslint", --javascript
			},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{ --formatters to install
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"ruff", -- python format+lint
				"black", -- python formatter
				"pylint", -- python lint
				"eslint_d", --javascript lint
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
