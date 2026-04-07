-- CPP_COMMAND = 'g++ *.cpp -std=c++20 -Wall && ./a.out'
CPP_COMMAND = 'g++ *.cpp -std=c++20 -Wall && ./a.out'
PYTHON_COMMAND = 'python main.py'

return {
  'ej-shafran/compile-mode.nvim',
  version = 'latest',
  -- you can just use the latest version:
  -- branch = "latest",
  -- or the most up-to-date updates:
  -- branch = "nightly",
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- if you want to enable coloring of ANSI escape codes in
    -- compilation output, add:
    -- { 'm00qek/baleia.nvim', tag = 'v1.3.0' },
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
      input_word_completion = true,

      default_command = {
        cpp = CPP_COMMAND,
        python = PYTHON_COMMAND,
      },

      cpp = CPP_COMMAND,
      python = PYTHON_COMMAND,
      recompile_no_fail = true,
      focus_compilation_buffer = true,

      -- don't show up in the bufferline
      hidden_buffer = true,
    }
  end,
}
