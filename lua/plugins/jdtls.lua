return {
  'mfussenegger/nvim-jdtls',
  dependencies = {
    'mason-org/mason.nvim',
    'mfussenegger/nvim-dap',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  ft = { 'java' },
  config = function()
    -- Get data paths for all necessary mason packages
    local data = vim.fn.stdpath('data')
    local jdtls_path = data .. '/mason/packages/jdtls'
    local dap_path = data .. '/mason/packages/java-debug-adapter'
    local test_path = data .. '/mason/packages/java-test'

    -- Store jdtls workspace under Neovim data (~/.local/share/nvim/ on Linux)
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = data .. '/jdtls-workspaces/' .. project_name

    -- Java path
    -- WARNING: This just uses the default java right now, so it might not work
    -- if a project uses a different Java version or if the default version is
    -- not correct.
    local java_path = vim.fn.exepath('java')

    local config = {
      cmd = {
        java_path, -- Depends on Java version

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',

        -- Points to the jdtls installation
        '-jar',
        vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),

        '-configuration',
        jdtls_path .. '/config_' .. require('helpers.os').get_os(),

        -- See `data directory configuration` section in the README
        '-data',
        workspace_dir,
      },

      -- This is the default if not provided, you can remove it. Or adjust as needed.
      -- One dedicated LSP server & client will be started per unique root_dir
      root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),

      -- Here you can configure eclipse.jdt.ls specific settings
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- for a list of options
      settings = {
        java = {},
      },

      -- Language server `initializationOptions`
      -- You need to extend the `bundles` with paths to jar files
      -- if you want to use additional eclipse.jdt.ls plugins.
      --
      -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
      --
      -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
      init_options = {
        bundles = {},
      },
    }
    local bundles = {
      vim.fn.glob(dap_path .. '/extension/server/com.microsoft.java.debug.plugin-*.jar', 1)
    }
    vim.list_extend(bundles, vim.split(vim.fn.glob(test_path .. '/extension/server/*.jar', 1), '\n'))
    config.init_options.bundles = bundles
    require('jdtls').start_or_attach(config)
  end
}
