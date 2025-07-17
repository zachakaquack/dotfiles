F = "%C%c%t"
return {
  "lazymaniac/wttr.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    location = "bella+vista",
    -- format = 1,
    custom_format = F,
    units = "u",
  },
}
