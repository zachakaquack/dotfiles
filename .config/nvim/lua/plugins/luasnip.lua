return {
  "L3MON4D3/LuaSnip",
  lazy = false,
  config = function()
    require("luasnip.loaders.from_lua").lazy_load {
      paths = "~/.config/nvim/lua/custom/snippets",
    }
  end,
}
