-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nerd font
vim.g.have_nerd_font = true

-- Options
vim.opt.breakindent = true
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.wrap = false

vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move lines
vim.keymap.set('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })


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

require("lazy").setup("plugins")
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find buffers'})
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = 'Fuzzy search in current buffer' })

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

