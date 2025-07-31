return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.mix,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.rubocop,
                    null_ls.builtins.formatting.surface,
                    -- null_ls.builtins.diagnostics.credo,
                    null_ls.builtins.diagnostics.erb_lint,
                    null_ls.builtins.diagnostics.rubocop,
                    null_ls.builtins.diagnostics.semgrep,
                },
            })

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end
    },
}
