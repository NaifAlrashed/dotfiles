vim.pack.add({
  { src = 'https://github.com/stevearc/conform.nvim' },
})

require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    zig = { 'zigfmt' },
    ruby = { 'rubocop' },
    rust = { 'rustfmt' },
    javascript = { 'prettierd', 'prettier' },
    go = { 'gofumpt' },
    swift = { 'swiftFormat' },
    csharp = { 'csharpier' },
  },

  format_on_save = {
    lsp_fallback = true,
  },
})
