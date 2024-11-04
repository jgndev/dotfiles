return {
  {
    "jgndev/kanabox.nvim",
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
  --   "ellisonleao/gruvbox.nvim",
  --   config = function()
  --     vim.cmd.colorscheme "gruvbox"
  --   end
  -- },
}
