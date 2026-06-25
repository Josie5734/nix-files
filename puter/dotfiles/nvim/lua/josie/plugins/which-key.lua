return {
  "folke/which-key.nvim",
  event = "VeryLazy", --load later on 
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500 --how long until whichkey pops up
  end,
  opts = {
    --config here
    --emplty for defaults
  },
}
