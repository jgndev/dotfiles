vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Toggle Trouble
vim.keymap.set("n", "<leader>t", "<cmd>Trouble document_diagnostics<cr>", { desc = "Trouble" })

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
-- vim.api.nvim_set_keymap("n", "bb", ":bnext<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "bd", ":bdelete<enter>", { noremap = false })

-- Go
vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>",
  { silent = true, noremap = true }
)

-- Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { noremap = true })

-- LazyGit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Toggle LazyGit", noremap = true })
