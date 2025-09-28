return {
  "stevearc/conform.nvim",
  opts = {
    require("conform").setup {
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "jq" },
        jsonc = { "jq" },
        python = { "black" },
        markdown = { "mdformat" },
        html = { "prettier" },
        typescript = { "prettier" },
        cpp = { "clang-format" },
        ["*"] = { "trim_whitespace", "trim_newlines" },
      },
    },
  },
}
