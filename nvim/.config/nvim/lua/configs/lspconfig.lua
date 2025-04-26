require("nvchad.configs.lspconfig").defaults()

local servers = { "gopls", "pyright", "ansiblels" }
vim.lsp.enable(servers)
