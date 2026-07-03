vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('pack-build-hooks', { clear = true }),
  callback = function(event)
    if event.data.spec.name == 'telescope-fzf-native.nvim'
        and (event.data.kind == 'install' or event.data.kind == 'update') then
      vim.system({ 'make' }, { cwd = event.data.path }):wait()
    end
  end,
})

vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
})

local telescope = require('telescope')
telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
})
telescope.load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Fuzzy find files and open them' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help tags' })
