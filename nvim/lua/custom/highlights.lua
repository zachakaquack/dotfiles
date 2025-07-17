local M = {}

M.override = {
  LineNr = { fg = "#7aa2f7" }, -- regular line numbers
  CursorLineNr = { fg = "white", bold = true }, -- current line number
  Comment = { fg = "#b2b2b2" },
  ["@comment"] = { fg = "#b2b2b2" },
}

return M
