return {
  { 'mason-org/mason.nvim',
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },
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
        'clangd',
      },
      automatic_enable = {
        exclude = { 'jdtls' },
      },
    },
    config = function(_, opts)
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup(opts)

      -- Update capabilities to use include blink
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      --- Individual language server config below ---

      -- C/C++
      vim.lsp.config('clangd', {
        capabilities = capabilities,
        cmd = { 'clangd', '--background-index', '--clang-tidy=false' },
        init_options = {
          clangdFileStatus = true,
        },
      })
      -- C#
      vim.lsp.config("roslyn", {
        settings = {
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = false,
            csharp_enable_inlay_hints_for_implicit_variable_types = false,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = false,
            dotnet_enable_tests_code_lens = false,
          },
          ["csharp|code_style"] = {

          }
        },
      })
      -- CSS
      vim.lsp.config('cssls', { capabilities = capabilities })
      -- Go
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
      -- HTML
      vim.lsp.config('html', { capabilities = capabilities })
      -- Javascript/Typescript
      vim.lsp.config('ts_ls', { capabilities = capabilities })
      -- Lua
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = {
          Lua = {
            format = { enable = false }
          },
        },
      })
      -- Python
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
      -- Diagnostics

      vim.diagnostic.config({
        float = { border = 'single' },
      })

      --- Keymaps ---

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP hover' })
      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover({ border = 'single' })
      end, { desc = 'LSP hover' })
    end
  },
}
