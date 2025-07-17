return {
  "petertriho/nvim-scrollbar",
  event = "BufReadPost",
  opts = {},
  config = function(_, opts)
    require("scrollbar").setup(opts)
  end,
}
