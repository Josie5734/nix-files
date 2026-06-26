--shorteners
local keymap = vim.keymap                                    --keymap
local gh = function(x) return "https://github.com/" .. x end --github link

--add plugins
vim.pack.add {
  --appearance
  { src = gh("catppuccin/nvim"),                 name = "catppuccin" }, --colorscheme
  { src = gh("nvim-tree/nvim-web-devicons"),     name = "devicons" },   --icons, dependency for most stuff
  { src = gh("akinsho/bufferline.nvim"),         name = "bufferline" }, --tab bar
  { src = gh("nvim-lualine/lualine.nvim"),       name = "lualine" },    --status bar at the bottom

  --text
  { src = gh("folke/todo-comments.nvim"),        name = "todo-comments" }, --todo comment highlights
  { src = gh("windwp/nvim-autopairs"),           name = "autopairs" },     --auto pair on ({[ etc

  --utility
  { src = gh("rmagatti/auto-session"),           name = "auto-session" },
  { src = gh("folke/which-key.nvim"),            name = "whichkey" },

  --snacks.nvim - potentially replaces a couple plugins, will consider if i use enough of the plugins in it
  --would use: picker(ff find), explorer(file explorer), indent, scratch?, terminal,
  --mini.nvim - also a big library with a bunch of stuff
  --would use: surround, pick?(alternative to telescope), pairs(replace autopairs), snippets(for cmp)
  --live preview
  --multicursor
  --"gbprod/substitute.nvim"

  --lsp, formatter, linter stuff
  --mfussenegger/nvim-lint --runs linters by filetype
  { src = gh("nvim-treesitter/nvim-treesitter"), name = "treesitter" }, --treesitter parsing
  { src = gh("neovim/nvim-lspconfig"),           name = "lspconfig" },  --lspconfig for lsps
  { src = gh("stevearc/conform.nvim"),           name = "conform" },    --conform for formatters
  { src = gh("folke/trouble.nvim"),              name = "trouble" },    --diagnostic for errors
}

--set colorscheme
vim.cmd.colorscheme("catppuccin")

--bufferline
require("bufferline").setup({ options = { mode = "tabs", separator_style = "slant" } })

--lualine
local colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  red = "#FF4A4A",
  fg = "#c3ccdc",
  bg = "#112638",
  inactive_bg = "#2c3043",
}

local my_lualine_theme = {
  normal = {
    a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.green, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  visual = {
    a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  command = {
    a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  replace = {
    a = { bg = colors.red, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  inactive = {
    a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
    b = { bg = colors.inactive_bg, fg = colors.semilightgray },
    c = { bg = colors.inactive_bg, fg = colors.semilightgray },
  },
}
require("lualine").setup(
  {
    options = {
      theme = my_lualine_theme,
    },
  }
)

--autopairs
require("nvim-autopairs").setup()

--auto-session
require("auto-session").setup({
  auto_restore_enabled = false,
  auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
})
keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" })             -- restore last workspace session for current directory
keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

--which-key
require("which-key").setup({})

--todo comments
local todo = require("todo-comments")
keymap.set("n", "]t", function() todo.jump_next() end, { desc = "Next todo comment" })
keymap.set("n", "[t", function() todo.jump_prev() end, { desc = "Previous todo comment" })
todo.setup()

--treesitter
local parsers = { --parsers to install
  "json",
  "jsonc",
  "python",
  "javascript",
  "typescript",
  "tsx",
  "html",
  "css",
  "scss",
  "markdown",
  "markdown_inline",
  "bash",
  "lua",
  "yaml",
  "vim",
  "dockerfile",
  "gitignore",
  "query",
  "vimdoc",
}
require("nvim-treesitter").install(parsers) --install parsers
vim.api.nvim_create_autocmd("FileType", {   --start treesitter on filetypes
  pattern = parsers,
  callback = function()
    vim.treesitter.start()
  end,
})

--lspconfig
local servers = { --list of lsp servers to use - servers are installed manually through nix
  "lua_ls"
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
    Lua = {                --makes "vim" not show as an error in nvim config files
      diagnostics = { globals = { "vim" } },
    },
  },
})

--conform
local conform = require("conform")
conform.setup({
  formatters_by_ft = { --list of formatters to use and on which filestypes
    lua = { "stylua" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})

--keymap to format manually
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file" })

--trouble
require("trouble").setup()
keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Buffer Diagnostics (Trouble)" })
keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "LSP Definitions / references / ... (Trouble)" })
keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
