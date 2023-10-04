return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')

    mason.setup {}

    mason_lspconfig.setup {
      ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'elixirls',
        'solargraph',
        'tailwindcss',
        'zls',
        'html',
        'graphql',
        'gopls',
      },
      automatic_installation = true,
    }
  end
}
