local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("title", {
    t 'print("snippet stuff")',
  }),
  s("snippet", {
    t {
      'local ls = require "luasnip"',
      "local s = ls.snippet",
      "local t = ls.text_node",
      "",
      "return {",
      '  s("title", {',
      "  t{'print(\"print\")'},",
      "  })",
      "}",
    },
  }),
}
