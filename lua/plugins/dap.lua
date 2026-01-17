return {
  {
    'mfussenegger/nvim-dap',
    dependencies = { 'igorlfs/nvim-dap-view' },
    config = function()
      local dap = require('dap')
      local widgets = require('dap.ui.widgets')

      vim.fn.sign_define('DapBreakpoint', {
        text = '●',
        texthl = 'DapBreakpointSign',
      })
      vim.fn.sign_define('DapBreakpointCondition', {
        text = '●',
        texthl = 'DapBreakpointConditionSign',
      })
      vim.fn.sign_define('DapBreakpointRejected', {
        text = '○',
        texthl = 'DapBreakpointRejectedSign',
      })
      vim.fn.sign_define('DapStopped', {
        text = '→',
        texthl = 'DapStoppedSign',
        linehl = 'DapStoppedLine',
      })

      vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
      vim.keymap.set('n', '<Leader>B', function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end, { desc = 'Create conditional breakpoint' })

      vim.keymap.set('n', '<leader>jh', widgets.hover)
      vim.keymap.set('n', '<leader>jw', ':DapViewWatch<CR>', { desc = 'Add variable to watch' })

      vim.keymap.set('n', '<leader>jc', dap.continue)
      vim.keymap.set('n', '<leader>ji', dap.step_into)
      vim.keymap.set('n', '<leader>js', dap.step_over)
      vim.keymap.set('n', '<leader>jo', dap.step_out)
      vim.keymap.set('n', '<leader>jb', dap.step_back)
      vim.keymap.set('n', '<leader>jr', dap.restart)
      vim.keymap.set('n', '<leader>je', dap.terminate)
      vim.keymap.set('n', '<leader>jd', dap.disconnect)
      vim.keymap.set('n', '<leader>jl', dap.run_to_cursor)

      -- C#/.NET
      dap.adapters.coreclr = {
        type = 'executable',
        command = vim.fn.exepath('netcoredbg'),
        args = { '--interpreter=vscode' },
      }
      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'launch - netcoredbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end,
        }
      }
    end
  },
  {
    'igorlfs/nvim-dap-view',
    opts = {
      windows = {
        height = 0.3,
        terminal = {
          width = 0.5,
          position = "right",
        },
      },
      auto_toggle = true,
      follow_tab = true,
    },
  },
  {
    -- Python
    'mfussenegger/nvim-dap-python',
    ft = { 'python' },
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      local path = require('utils/python').get_python_path()
      require('dap-python').setup(path)
    end
  },
  {
    -- Go
    'leoluz/nvim-dap-go',
    ft = 'go',
    config = function()
      require('dap-go').setup()
    end,
  },
}
