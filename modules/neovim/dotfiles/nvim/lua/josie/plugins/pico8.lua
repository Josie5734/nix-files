--pico8
--functions to be used in lua_ls config so it works with pico8
--uses https://github.com/Teajey/luacats-pico8

--module to return
local M = {}

--path to the definitions library folder
local pico8_defs_path = "/home/josie/nixos/modules/neovim/pico8/library"

--check if the library folder exists
local function does_library_exist()
	local stat = vim.uv.fs_stat(pico8_defs_path)
	return stat ~= nil and stat.type == "directory"
end

--check if directory of current lua file has a .p8 file as well, assume its a pico8 project if it does
local function is_pico8_project(root_dir)
	local entries = vim.fn.globpath(root_dir, "*.p8", false, true)
	return #entries > 0
end

--if the library exists then send attach function to module for lspconfig
if does_library_exist() then
	M.on_init = function(client)
		if is_pico8_project(client.config.root_dir) then
			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				workspace = { library = { pico8_defs_path } },
				diagnostics = {
					disable = { "lowercase-global", "unknown-symbol", "unicode-name" },
				},
				runtime = {
					version = "LuaJIT",
					nonstandardSymbol = { "!=", "+=", "-=", "*=", "/=", "%=", "^=", "|=", "&=", "<<=", ">>=", "//" },
					builtin = {
						basic = "disabled",
						bit = "disabled",
						bit32 = "disabled",
						builtin = "disabled",
						coroutine = "disabled",
						debug = "disabled",
						ffi = "disabled",
						io = "disabled",
						jit = "disabled",
						math = "disabled",
						os = "disabled",
						package = "disabled",
						string = "disabled",
						table = "disabled",
						["table.clear"] = "disabled",
						["table.new"] = "disabled",
						utf8 = "disabled",
					},
				},
			})
			client:notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
	end
else
	M.on_init = function() end -- no-op: library missing, do nothing
end

--find a root marker for the project using the directory containing the .p8
--so the lsp uses the same client for the whole project
M.find_root_dir = function(bufnr, on_dir)
	local fname = vim.api.nvim_buf_get_name(bufnr)
	local found = vim.fs.find(
		function(name) return name:match("%.p8$") ~= nil end,
		{ upward = true, path = vim.fs.dirname(fname) }
	)
	if #found > 0 then
		on_dir(vim.fs.dirname(found[1]))
	else
		on_dir(vim.fs.dirname(fname)) -- fallback: file's own directory
	end
end

return M
