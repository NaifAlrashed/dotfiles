return {
  'neovim/nvim-lspconfig',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    {
      'antosha417/nvim-lsp-file-operations',
      config = true
    },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local configs = require('lspconfig.configs')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local util = require("lspconfig.util")
    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }

    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      opts.desc = 'Show LSP references'
      keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

      opts.desc = 'Show LSP declarations'
      keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

      opts.desc = 'Show LSP definitions'
      keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

      opts.desc = 'Show LSP implementations'
      keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

      opts.desc = 'Show LSP type definitions'
      keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

      opts.desc = 'See available code actions'
      keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

      opts.desc = 'Show LSP smart rename'
      keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

      opts.desc = 'Show buffer diagnostics'
      keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

      opts.desc = 'Show line diagnostics'
      keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
    end
    -- enable auto completion
    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig['html'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['rust_analyzer'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    configs.templ = {
      default_config = {
        cmd = { "templ", "lsp", },
        filetypes = { "templ" },
        root_dir = util.root_pattern("go.mod", ".git"),
        settings = {},
      }
    }

    lspconfig['templ'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['lua_ls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath('config') .. '/lua'] = true,
            },
          },
        },
      },
    }

    lspconfig['elixirls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { '/opt/homebrew/bin/elixir-ls' },
    }

    lspconfig['solargraph'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['tailwindcss'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ", "swift" }
    }

    lspconfig['zls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['graphql'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['gopls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        gopls = {
          gofumpt = true
        }
      }
    }

    lspconfig['tsserver'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['gleam'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig.sourcekit.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = lspconfig.util.root_pattern(
        '.git',
        'Package.swift'
      ),
    }

    lspconfig['clangd'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['ols'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['terraformls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end
}
