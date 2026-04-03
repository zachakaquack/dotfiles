CPP_COMMAND = 'g++ *.cpp -std=c++20 -Wall -g && ./a.out '
-- CPP_COMMAND = 'make run'
PYTHON_COMMAND = 'python main.py'

return {
  'ej-shafran/compile-mode.nvim',
  version = 'latest',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.g.compile_mode = {
      input_word_completion = true,

      default_command = {
        cpp = CPP_COMMAND,
        python = PYTHON_COMMAND,
      },

      cpp = CPP_COMMAND,
      python = PYTHON_COMMAND,

      -- if there is no :Recompile, do not fail, just run :Compile instead
      recompile_no_fail = true,

      -- auto focus the window when compiling
      focus_compilation_buffer = true,

      -- use nvim diagnostics when you hit enter on an error in the opened window
      -- use_diagnostics = true,

      -- don't show up in the bufferline
      hidden_buffer = true,

      -- going to next and prev error will loop around the buffer
      -- use_circular_error_navigation = true,

      -- if true, the buffer would automatically scroll along side the output
      auto_scroll = false,
    }
  end,
}
