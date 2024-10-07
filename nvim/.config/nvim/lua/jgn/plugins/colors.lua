return {
  -- {
  --   "catppuccin/nvim",
  --   config = function()
  --     vim.cmd.colorscheme "catppuccin-mocha"
  --   end,
  -- },

  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    opts = ...,
    config = function()
      vim.cmd.colorscheme "gruvbox-material"
    end,
  },
}
