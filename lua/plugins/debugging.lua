return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
    },
    config = function()
      local dap = require('dap')
      local ui = require('dapui')

      ui.setup({
        controls = {
          enabled = vim.fn.exists("+winbar") == 1,
          element = "repl",
          icons = {
            pause = " 1",
            play = " 1",
            step_into = " 2",
            step_over = " 3",
            step_out = " 4",
            step_back = " 5",
            run_last = " 6",
            terminate = " 7",
            disconnect = " 8",
          },
        },
        layouts = {
          {
            elements = {
              {
                id = 'scopes',
                size = 0.30
              },
              {
                id = 'stacks',
                size = 0.25
              },
              {
                id = 'watches',
                size = 0.25
              },
              {
                id = 'breakpoints',
                size = 0.13
              },
              {
                id = 'repl',
                size = 0.07
              }
            },
            position = 'left',
            size = 42
          }, {
            elements = {
              {
                id = 'console',
                size = 1
              }
            },
            position = 'bottom',
            size = 10
          }
        }
      })

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

      --require('nvim-dap-virtual-text').setup()

      vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
      vim.keymap.set('n', '<Leader>B', function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end, { desc = 'Create conditional breakpoint' })

      -- Eval under cursor/inspect current value
      vim.keymap.set('n', '<Leader>E', function()
        ui.eval(nil, { enter = true })
      end, { desc = 'Eval under cursor (for debugging)' } )

      vim.keymap.set('n', '<F1>', dap.continue)
      vim.keymap.set('n', '<F2>', dap.step_into)
      vim.keymap.set('n', '<F3>', dap.step_over)
      vim.keymap.set('n', '<F4>', dap.step_out)
      vim.keymap.set('n', '<F5>', dap.step_back)
      vim.keymap.set('n', '<F6>', dap.restart)
      vim.keymap.set('n', '<F7>', dap.terminate)
      vim.keymap.set('n', '<F8>', dap.disconnect)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end
  },
  {
    'mfussenegger/nvim-dap-python',
    ft = { 'python' },
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      local venv_dirs = { '.venv', 'venv' }

      local path = 'python'

      local cwd = vim.fn.getcwd()
      for _, venv_dir in ipairs(venv_dirs) do
        local exe_path = cwd .. '/' .. venv_dir .. '/bin/python'
        if vim.fn.executable(exe_path) == 1 then
          path = exe_path
          break
        end
      end

      require('dap-python').setup(path)
    end
  }
}
