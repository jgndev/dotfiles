return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "css",
                    "elixir",
                    "eex",
                    "heex",
                    "html",
                    "javascript",
                    "ruby",
                    "typescript",
                    "yaml",
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
}
