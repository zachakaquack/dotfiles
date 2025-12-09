return {
  "vyfor/cord.nvim",
  lazy = false,
  build = ":Cord update",
  opts = {
    editor = {
      -- client = "nvchad",
      client = "neovim",
    },
    display = {
      theme = "catppuccin",
    },
    idle = {
      -- timeout - this is 5 min (in ms)
      timeout = 300000,
    },
    text = {
      editing = function(opts)
        return string.format("Editing %s - %s:%s", opts.filename, opts.cursor_line, opts.cursor_char)
      end,
    },
  },
}
