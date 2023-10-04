return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    conform.setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        zig = { 'zigfmt' },
        ruby = { 'rubocop' },
        rust = { 'rustfmt' },
      },

      format_on_save = {
        lsp_fallback = true,
      },
    }
  end
}
