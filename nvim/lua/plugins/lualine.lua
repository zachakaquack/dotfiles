return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Modify the 'x' section to add a new component
    table.insert(opts.sections.lualine_x, {
      function()
        return os.date "%H:%M"
      end,
    })
  end,
}
