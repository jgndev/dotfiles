return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup {
        colors = {
          palette = {},
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      }
      vim.cmd.colorscheme "kanagawa-wave"
    end,
  },

  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme "catppuccin"
  --   end
  -- },

  --
  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme "gruvbox-material"
  --   end
  -- },
}
