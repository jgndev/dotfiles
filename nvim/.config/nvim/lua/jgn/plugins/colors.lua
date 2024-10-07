return {
  {
    "catppuccin/nvim",
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },

  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("kanagawa").setup {
  --       colors = {
  --         palette = {},
  --         theme = {
  --           all = {
  --             ui = {
  --               bg_gutter = "none",
  --             },
  --           },
  --         },
  --       },
  --     }
  --     vim.cmd.colorscheme "kanagawa-wave"
  --   end,
  -- },
}
