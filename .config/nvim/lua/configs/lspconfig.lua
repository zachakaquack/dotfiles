local default_lsp = require "nvchad.configs.lspconfig"

-- apply NvChad defaults
default_lsp.defaults()

-- Setup for tsserver (typescript-language-server)
vim.lsp.config["ts_ls"] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "javascript",
    "javascriptreact",
  },
  root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", ".git" }),
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}

-- Python (pyright)
vim.lsp.config["pyright"] = {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    default_lsp.on_attach(client, bufnr)
  end,
  root_dir = vim.fs.root(0, {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    ".git",
  }),
}

-- C/C++ (clangd)
vim.lsp.config["clangd"] = {
  cmd = { "clangd", "--compile-commands-dir=build" }, -- or full path
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = vim.fs.root(0, {
    "compile_commands.json",
    "compile_flags.txt",
    ".git",
  }),
}

-- Diagnostics config
vim.diagnostic.config {
  virtual_text = {
    prefix = "●",
  },
  update_in_insert = true,
  severity_sort = true,
}

-- Enable the LSPs
vim.lsp.enable { "html", "cssls", "ts_ls", "pyright", "clangd" }
