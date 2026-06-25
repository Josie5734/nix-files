return {
  "folke/tokyonight.nvim",
  priority = 1000, --load first
  config = function()
    require("tokyonight").setup {
      styles = {
        comments = { italic = false }, --disable italics in comments
      },
    }

    vim.cmd("colorscheme tokyonight-night")
  end
}
