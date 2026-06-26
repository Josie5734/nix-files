return {
	{
		"neovim/nvim-lspconfig",

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,

				settings = {
					Lua = {
						diagnostics = {
							globals = {
								-- pico8 lifecycle
								"_init",
								"_update",
								"_update60",
								"_draw",

								-- graphics
								"cls",
								"spr",
								"sspr",
								"map",
								"mget",
								"mset",
								"fget",
								"fset",
								"sget",
								"sset",
								"pal",
								"palt",
								"camera",
								"clip",
								"color",
								"cursor",
								"circ",
								"circfill",
								"line",
								"rect",
								"rectfill",
								"oval",
								"ovalfill",
								"pset",
								"print",

								-- input
								"btn",
								"btnp",

								-- audio
								"sfx",
								"music",

								-- math/helpers
								"flr",
								"rnd",
								"mid",
								"min",
								"max",
								"sin",
								"cos",
								"atan2",
								"sqrt",
								"abs",

								-- table funcs
								"add",
								"del",
								"all",
								"foreach",

								-- misc
								"time",
								"stat",
								"peek",
								"poke",
								"memcpy",
								"reload",
							},
						},
					},
				},
			})
		end,
	},
}
