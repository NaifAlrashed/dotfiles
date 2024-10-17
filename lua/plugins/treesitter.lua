return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = {
        'lua',
        'zig',
        'rust',
        'vim',
        'sql',
        'swift',
        'elixir',
        'heex',
        'graphql',
        'go',
        'gomod',
        'gosum',
        'templ',
        'gleam',
        'c',
        'cmake',
        'odin',
        'terraform'
      },
      sync_install = true,
      highlight = {
        enable = true,
      }
    }
  end
}
