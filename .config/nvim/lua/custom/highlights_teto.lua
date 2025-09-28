local M = {}

-- if you want to find more things to override, do
-- :hi and then scroll and try to find a name that matches it

M.override = {
  LineNr = { fg = "#f00005" }, -- regular line numbers
  CursorLineNr = { fg = "white", bold = true }, -- current line number
  Comment = { fg = "#b2b2b2" },
  ["@comment"] = { fg = "#b2b2b2" },

  -- BOTTOM BAR STUFF
  -- these should all be the same, these are just for the modes
  St_NormalMode = { bg = "#262642", fg = "#f00005" },
  St_NormalModeSep = { bg = "#262642", fg = "#262642" },

  St_InsertMode = { bg = "#262642", fg = "#f00005" },
  St_InsertModeSep = { bg = "#262642", fg = "#262642" },

  St_VisualMode = { bg = "#262642", fg = "#f00005" },
  St_VisualModeSep = { bg = "#262642", fg = "#262642" },

  St_CommandMode = { bg = "#262642", fg = "#f00005" },
  St_CommandModeSep = { bg = "#262642", fg = "#262642" },

  -- idk but you need it
  St_EmptySpace = { bg = "#262642", fg = "#262642" },

  -- FILE
  St_file = { bg = "#262642", fg = "#f00005" },
  St_file_sep = { bg = "#262642", fg = "#262642" },

  -- LSP (same color as bg, so hidden)
  St_Lsp = { bg = "#11181e", fg = "#11181e" },
  St_LspMsg = { bg = "#11181e", fg = "#11181e" },

  -- CWD
  St_cwd_text = { bg = "#262642", fg = "#f00005" },
  St_cwd_icon = { bg = "#262642", fg = "#f00005" },
  St_cwd_sep = { fg = "#262642" },

  -- POS
  St_pos_text = { bg = "#262642", fg = "#f00005" },
  St_pos_icon = { bg = "#262642", fg = "#f00005" },
  St_pos_sep = { bg = "#262642", fg = "#262642" },
}

return M
