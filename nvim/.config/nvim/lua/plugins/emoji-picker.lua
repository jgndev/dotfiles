return {
  "xiyaowong/telescope-emoji.nvim",
  config = function()
    require("telescope").load_extension("emoji")
    vim.keymap.set("n", "<leader>pe", "<cmd>Telescope emoji<cr>")
  end,
}
