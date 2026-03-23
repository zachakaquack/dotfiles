return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
  },
  keys = {
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'DAP: Toggle Breakpoint',
    },
    {
      '<leader>dh',
      function()
        require('dap.ui.widgets').hover()
      end,
      desc = 'DAP: Hover Value',
    },
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'DAP: Start/Continue',
    },
    {

      '<F10>',
      function()
        require('dap').step_over()
      end,
      desc = 'DAP: Step Over',
    },
    {
      '<F11>',
      function()
        require('dap').step_into()
      end,
      desc = 'DAP: Step Into',
    },
    {
      '<F12>',
      function()
        require('dap').step_out()
      end,
      desc = 'DAP: Step Out',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('nvim-dap-virtual-text').setup {
      commented = true, -- prefix virtual text with a comment string
    }

    dapui.setup()

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      -- Using the verified path from your ls output
      command = vim.fn.expand '$HOME/.local/share/nvim/mason/bin/OpenDebugAD7',
    }

    dap.configurations.cpp = {
      {
        name = 'Launch file',
        type = 'cppdbg',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = false,
        -- NECESSARY FOR LINUX/ARCH:
        MIMode = 'gdb',
        miDebuggerPath = '/usr/bin/gdb',
        setupCommands = {
          {
            text = '-enable-pretty-printing',
            description = 'enable pretty printing',
            ignoreFailures = false,
          },
        },
      },
    }
  end,
}
