return {
  { -- Autocomplete
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = { 'rafamadriz/friendly-snippets' },
    opts = {
      -- preset 'default': <C-y> aceita, <C-n>/<C-p> navegam, <C-space> abre o menu
      keymap = { preset = 'default' },
      appearance = { nerd_font_variant = 'mono' },
      completion = { documentation = { auto_show = true, auto_show_delay_ms = 500 } },
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = { enabled = true },
    },
  },

  { -- Servidores de linguagem (LSP)
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'neovim/nvim-lspconfig',
      'saghen/blink.cmp',
    },
    config = function()
      -- Capabilities do blink.cmp para todos os servidores
      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      -- Vue: o ts_ls cuida do TypeScript dentro de arquivos .vue
      -- (vue_ls + @vue/typescript-plugin em "hybrid mode")
      local vue_language_server_path = vim.fn.stdpath 'data'
        .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'
      vim.lsp.config('ts_ls', {
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vue_language_server_path,
              languages = { 'vue' },
            },
          },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      })

      -- Instala e habilita os servidores automaticamente.
      -- Para gerenciar manualmente, use :Mason
      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',       -- Lua (inclusive esta config)
          'gopls',        -- Go
          'intelephense', -- PHP
          'basedpyright', -- Python
          'html',         -- HTML
          'ts_ls',        -- JavaScript / TypeScript
          'vue_ls',       -- Vue
          'sqlls',        -- SQL
        },
      }

      -- Keymaps ativados quando um servidor conecta no buffer.
      -- O Neovim 0.11 já tem por padrão: K (hover), grn (rename),
      -- gra (code action), grr (references), gri (implementation), gO (symbols).
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
        callback = function(event)
          local builtin = require 'telescope.builtin'
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        end,
      })
    end,
  },
}
