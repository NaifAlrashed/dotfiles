vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' }
})

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'go',
    'gomod',
    'sql',
    'elixir',
  },
  sync_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
})
