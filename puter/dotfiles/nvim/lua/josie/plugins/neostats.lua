local local_path = vim.fn.expand("~/programming/nvim/plugins/neostats") --path to local version of plugin

if vim.loop.fs_stat(local_path) then --if that path exists
	return { --return the plugin as a local install
		{
			dir = local_path,
			name = "neostats",
			config = function()
				require("neostats").setup()
			end,
		},
	}
else
	return { --else return the plugin details for normal lazy install
		{
			"Josie5734/NeoStats.nvim",
			config = function()
				require("neostats").setup()
			end,
		},
	}
end
