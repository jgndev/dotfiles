return {
  {
    "stevearc/conform.nvim",
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "goimports", "gofumpt" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terrform-vars"] = { "terrform_fmt" },
        toml = { "taplo" },
        sh = { "shellcheck", "shfmt" },
        javascript = { "prettier" },
      },
    },
  },
}
