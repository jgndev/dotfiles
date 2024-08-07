return {
  -- configure colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      -- colorscheme = "kanagawa",
    },
  },

  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  -- },

  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     require("kanagawa").setup({
  --       colors = {
  --         theme = {
  --           all = {
  --             ui = {
  --               bg_gutter = "none",
  --             },
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
}
