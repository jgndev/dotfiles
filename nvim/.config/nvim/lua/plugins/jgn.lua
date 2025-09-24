return {
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    opts = {
      use_diagnostic_signs = true,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "bash",
        "elixir",
        "erlang",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
