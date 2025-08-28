return {
  { 'mason-org/mason.nvim', opts = {} },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = {
        'cssls',
        'gopls',
        'html',
        'jdtls',
        'lua_ls',
        'pyright',
        'ts_ls',
      },
      automatic_enable = {
        exclude = { 'jdtls' },
      },
    },
    config = function(_, opts)
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup(opts)

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Make LSP configs include blink capabilities by default
      for _, name in ipairs({ 'cssls', 'html', 'lua_ls', 'ts_ls' }) do
        vim.lsp.config(name, {capabilities = capabilities })
      end

      vim.lsp.config('gopls', {
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = { unusedparams = true, shadow = true },
            staticcheck = true,
            hints = {
              assignVariableTypes    = true,
              compositeLiteralFields = true,
              compositeLiteralTypes  = true,
              constantValues         = true,
              functionTypeParameters = true,
              parameterNames         = true,
              rangeVariableTypes     = true,
            },
          }
        }
      })

      vim.lsp.config('pyright', {
        capabilities = capabilities,
        settings = {
          python = {
            pythonPath = require('helpers.python').get_python_path(),
          }
        }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'saghen/blink.cmp',
    },
    opts = {
      inlay_hints = { enabled = true },
    },
    config = function()
      vim.diagnostic.config({
        float = { border = 'rounded' },
      })
      vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, cfg)
        cfg = cfg or {}
        cfg.border = "rounded"
        return vim.lsp.handlers.hover(_, result, ctx, cfg)
      end
      vim.lsp.handlers["textDocument/signatureHelp"] = function(_, result, ctx, cfg)
        cfg = cfg or {}
        cfg.border = 'rounded'
        return vim.lsp.handlers.signature_help(_, result, ctx, cfg)
      end

      -- Keymaps
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover({ border = 'rounded' })
      end, { desc = 'LSP hover' })
      vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Goto references' })
      vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'Goto implementation' })
      vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Goto definition' })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Goto declaration' })
      vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, { desc = 'LSP rename' })
      vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, { desc = 'Code action' })
      vim.keymap.set('n', '<leader>e', function()
        vim.diagnostic.open_float({ border = 'rounded' })
      end, { desc = 'Show code diagnostic (errors)' })
    end
  },
}
