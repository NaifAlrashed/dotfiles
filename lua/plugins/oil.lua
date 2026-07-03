vim.pack.add({
  { src = 'https://github.com/stevearc/oil.nvim' },
})

require('oil').setup({
  columns = { 'icon' },
  keymaps = {
    ['<C-h>'] = false,
    ['<M-h>'] = 'actions.select_split',
  },
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
