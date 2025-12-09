local ls = require 'luasnip'
local rep = require('luasnip.extras').rep
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = require('luasnip').insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  s('print', {
    desc = 'print var',
    t { 'std::cout << "' },
    rep(1),
    t { ': " << ' },
    i(1),
    t { " << '\\n';" },
  }),
  s('scout', {
    desc = 'std::cout snippet',
    t { 'std::cout << ' },
    i(1),
    t { " << '\\n';" },
  }),
  s('scin', {
    desc = 'std::scin snippet',
    t { 'std::cin >> ' },
    i(1),
    t { ';' },
  }),
  s('sline', {
    desc = 'std::scin snippet',
    t { 'std::getline(std::cin >> std::ws, ' },
    i(1),
    t { ');' },
  }),
  s('cppmain', {
    t {
      '#include <iostream>',
      '',
      'int main(){',
      '',
      '  ',
    },
    i(1),
    t {
      '',
      '',
      '  return 0;',
      '}',
    },
  }),
  s(
    'prog1024',
    fmt(
      [[
 // 1024-{}
 // PROG 1024
 // Zach Allen
 // Ch{}
]],
      {
        f(function()
          return vim.fn.expand '%:t'
        end),
        i(2, ''),
      }
    )
  ),
}
