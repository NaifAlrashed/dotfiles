return {
  'nvim-telescope/telescope.nvim',
  tag = "0.1.3",
  dependencies = { 
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case", 
        }
      }
    }
    require('telescope').load_extension('fzf')
    local builtin = require('telescope.builtin')
    vim.keymap.set("n", '<leader>ff', builtin.find_files, { desc = "Fuzzy find files and open them" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end,
}
