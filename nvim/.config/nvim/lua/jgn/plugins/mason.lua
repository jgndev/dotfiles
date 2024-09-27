return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ansible-lint", -- ansible
        "bash-language-server", -- bash
        "black", -- python
        "codelldb", -- c, c++, rust, zig
        "clangd", -- c, c++
        "cmakelang", -- cmake
        "cpplint", -- c++
        "delve", -- debugger
        "eslint-lsp", -- javascript, typescript
        "goimports", -- go
        "gofumpt", -- go
        "gomodifytags", -- go
        "golangci-lint", -- go
        "staticcheck", -- go
        "hadolint", -- docker
        "impl", -- go
        "shellcheck", -- shell
        "shfmt", -- shell
        "stylelint", -- css
        "stylua", -- lua
        "tailwind-language-server", -- tailwind
        "taplo", -- toml
        "templ", -- go, html
        "terraform-ls", -- terraform
        "yamlfmt", -- yaml
        "yamllit", -- yaml
      },
    },
  },
}
