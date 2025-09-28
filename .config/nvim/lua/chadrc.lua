-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "eldritch",
  transparency = true,

  hl_override = require("custom.highlights").override,
}

M.ui = {
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "buffers", "tabs" },
    modules = nil,
    bufwidth = 15,
  },
}
return M
