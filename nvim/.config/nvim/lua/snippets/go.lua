local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = require('luasnip').insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  s('scout', {
    desc = 'println',
    t { 'fmt.Println(' },
    i(1),
    t { ')' },
  }),
}
