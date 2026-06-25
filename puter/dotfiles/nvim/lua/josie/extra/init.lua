--command for hot reloading plugin
vim.api.nvim_create_user_command("ReloadNeostats", function()
	--call close_window to make sure windows are closed on exit
	local ok, mod = pcall(require, "neostats")
	if ok and mod.close_window then
		mod.exit()
	end

	--unload plugin module
	for k, _ in pairs(package.loaded) do
		if k:match("^neostats") then
			package.loaded[k] = nil
		end
	end

	--reload plugin
	require("neostats").setup()

	print("Neostats reloaded")
end, {})
