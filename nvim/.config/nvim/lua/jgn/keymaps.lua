vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Toggle Trouble
vim.keymap.set("n", "<leader>t", "<cmd>Trouble document_diagnostics<cr>", { desc = "Trouble" })

-- Telescope
-- See `:help telescope.builtin`
-- local builtin = require "telescope.builtin"
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
-- vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search Diagnotics" })
-- vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent Files" })
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>fs", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "Fuzzy search current buffer" })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Buffers
vim.api.nvim_set_keymap("n", "bk", ":blast<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "bj", ":bfirst<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "bh", ":bprev<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "bl", ":bnext<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "bd", ":bdelete<enter>", { noremap = false })

-- Go
vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>",
  { silent = true, noremap = true }
)
