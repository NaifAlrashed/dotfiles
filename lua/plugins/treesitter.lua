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
      },
      sync_install = true,
      highlight = {
        enable = true,
      }
    }
  end
}
