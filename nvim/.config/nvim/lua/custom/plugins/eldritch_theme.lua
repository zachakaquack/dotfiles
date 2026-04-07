return {
  'eldritch-theme/eldritch.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('eldritch').setup {
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
      on_colors = function(colors)
        colors.comment = '#6a9955'
      end,
    }
    vim.cmd.colorscheme 'eldritch'
  end,
}
