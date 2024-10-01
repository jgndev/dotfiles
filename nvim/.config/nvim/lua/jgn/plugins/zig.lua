return {
  {
    "ziglang/zig.vim",
    lazy = true,
    opts = {},
    config = function()
      require("zig").setup {}
    end,
  },
}
