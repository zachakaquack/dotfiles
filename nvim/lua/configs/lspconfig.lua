local default_lsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

default_lsp.defaults()

-- Setup for ts_ls (typescript-language-server)
lspconfig.ts_ls.setup {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "javascript",
    "javascriptreact",
  },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}

lspconfig.pyright.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    default_lsp.on_attach(client, bufnr)
  end,
  root_dir = lspconfig.util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git"),
}

lspconfig.clangd.setup {
  cmd = { "clangd" }, -- can also specify a full path if needed
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}

vim.diagnostic.config {
  virtual_text = {
    prefix = "●",
  },
  update_in_insert = true,
  severity_sort = true,
}
-- Enable the LSPs
vim.lsp.enable { "html", "cssls", "ts_ls" }
