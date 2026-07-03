vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
})

vim.filetype.add({
  extension = {
    templ = 'templ',
    tf = 'terraform',
    tfvars = 'terraform-vars',
  },
})

vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('native-lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client == nil then
      return
    end

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
      if not vim.b[event.buf].native_lsp_completion_autotrigger then
        vim.b[event.buf].native_lsp_completion_autotrigger = true
        vim.api.nvim_create_autocmd('InsertCharPre', {
          buffer = event.buf,
          callback = function()
            vim.lsp.completion.get()
          end,
        })
      end
    end

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
      buffer = event.buf,
      desc = 'Go to definition',
    })
  end,
})

vim.lsp.config('gopls', {
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
    },
  },
})

vim.lsp.config('elixirls', {
  cmd = { '/opt/homebrew/bin/elixir-ls' },
})

vim.lsp.config('tailwindcss', {
  filetypes = {
    'aspnetcorerazor',
    'astro',
    'astro-markdown',
    'blade',
    'clojure',
    'django-html',
    'htmldjango',
    'edge',
    'eelixir',
    'elixir',
    'ejs',
    'erb',
    'eruby',
    'gohtml',
    'gohtmltmpl',
    'haml',
    'handlebars',
    'hbs',
    'html',
    'html-eex',
    'heex',
    'jade',
    'leaf',
    'liquid',
    'markdown',
    'mdx',
    'mustache',
    'njk',
    'nunjucks',
    'php',
    'razor',
    'slim',
    'twig',
    'css',
    'less',
    'postcss',
    'sass',
    'scss',
    'stylus',
    'sugarss',
    'javascript',
    'javascriptreact',
    'reason',
    'rescript',
    'typescript',
    'typescriptreact',
    'vue',
    'svelte',
    'templ',
    'swift',
  },
})

vim.lsp.config('sourcekit', {
  root_markers = { 'Package.swift', '.git' },
})

vim.lsp.enable({
  'lua_ls',
  'rust_analyzer',
  'elixirls',
  'tailwindcss',
  'zls',
  'html',
  'gopls',
  'ts_ls',
  'templ',
  'clangd',
  'ols',
  'terraformls',
  'sourcekit',
})
