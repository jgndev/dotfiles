vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.g.mapleader=" "


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- local plugins = {
--     { 
--         "catppuccin/nvim", 
--         name = "catppuccin", 
--         priority = 1000 
--     },
--     { 
--         "nvim-telescope/telescope.nvim", tag = '0.1.6',
--         dependencies = { "nvim-lua/plenary.nvim" }
--     },
--     { 
--         "nvim-treesitter/nvim-treesitter", 
--         build=":TSUpdate" 
--     },
--     {
--         "nvim-neo-tree/neo-tree.nvim",
--         branch = "v3.x",
--         dependencies = {
--             "nvim-lua/plenary.nvim",
--             "nvim-tree/nvim-web-devicons",
--             "MunifTanjim/nui.nvim",
--         }
--     },
--
-- }

local opts = {}

require("lazy").setup("plugins")
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = { "lua", "javascript", "typescript", "elixir", "erlang", "html", "css" },
    highlight = { enable = true },
    indent = { enabled = true },
})

require("neo-tree").setup({
    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                require("neo-tree.command").execute({ action = "close" })
            end
        },
    }
})

vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal float<CR>') 
