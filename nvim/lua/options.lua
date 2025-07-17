require "nvchad.options"

vim.wo.number = true
vim.wo.relativenumber = true

vim.api.nvim_create_user_command("EditMappings", "edit ~/AppData/Local/nvim/lua/mappings.lua", {})
vim.api.nvim_create_user_command("EditOptions", "edit ~/AppData/Local/nvim/lua/options.lua", {})
vim.api.nvim_create_user_command("EditWezterm", "edit ~/.config/wezterm/wezterm.lua", {})

vim.api.nvim_create_user_command("WordCount", "g<C-g>", { desc = "Word count" })

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 500 }
  end,
})

vim.api.nvim_create_user_command("LuaSnipPrint", function()
  local ft = vim.bo.filetype
  local ls = require "luasnip"
  local snippets = ls.snippets[ft] or {}
  print("Snippets for filetype:", ft)
  for _, snip in ipairs(snippets) do
    print(" - " .. snip.trigger)
  end
end, {})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format { async = true, lsp_format = "fallback", range = range }
end, { range = true })
