local M = {}

-- if you want to find more things to override, do
-- :hi and then scroll and try to find a name that matches it

local background = "#0f0103"
local foreground = "#fd9bc4"

M.override = {
  LineNr = { fg = "#cb1a24" }, -- regular line numbers
  CursorLineNr = { fg = "#fd9bc4", bold = true }, -- current line number
  ["@comment"] = { fg = "#df84cf" },

  -- BOTTOM BAR STUFF
  -- these should all be the same, these are just for the modes
  St_NormalMode = { bg = background, fg = foreground },
  St_NormalModeSep = { bg = background, fg = background },

  St_InsertMode = { bg = background, fg = foreground },
  St_InsertModeSep = { bg = background, fg = background },

  St_VisualMode = { bg = background, fg = foreground },
  St_VisualModeSep = { bg = background, fg = background },

  St_CommandMode = { bg = background, fg = foreground },
  St_CommandModeSep = { bg = background, fg = background },

  -- idk but you need it
  St_EmptySpace = { bg = background, fg = background },

  -- FILE
  St_file = { bg = background, fg = foreground },
  St_file_sep = { bg = background, fg = background },

  -- LSP (same color as bg, so hidden)
  St_Lsp = { bg = background, fg = background },
  St_LspMsg = { bg = background, fg = background },

  -- CWD
  St_cwd_text = { bg = background, fg = foreground },
  St_cwd_icon = { bg = background, fg = foreground },
  St_cwd_sep = { fg = background },

  -- POS
  St_pos_text = { bg = background, fg = foreground },
  St_pos_icon = { bg = background, fg = foreground },
  St_pos_sep = { bg = background, fg = background },
}

return M
