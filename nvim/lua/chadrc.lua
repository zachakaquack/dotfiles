-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

-- M.plugins = "custom.plugins"

M.base46 = {
  theme = "carbonfox",
  transparency = true,

  hl_override = require("custom.highlights").override,
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

vim.api.nvim_set_hl(0, "Comment", { fg = "#b2b2b2" })
vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
return M
