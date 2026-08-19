# Servidores LSP

O suporte a linguagens usa a API nativa do Neovim 0.11 (`vim.lsp.config`) com
três plugins, todos configurados em `lua/plugins/lsp.lua`:

- **mason.nvim** — instala os binários dos servidores (`:Mason`)
- **mason-lspconfig.nvim** — liga o Mason ao lspconfig e instala/habilita os
  servidores da lista `ensure_installed` automaticamente
- **nvim-lspconfig** — configurações padrão de cada servidor
- **blink.cmp** — autocomplete alimentado pelos servidores

## Servidores instalados

| Linguagem | Servidor | Pacote Mason |
|---|---|---|
| Lua | lua_ls | lua-language-server |
| Go | gopls | gopls |
| PHP | intelephense | intelephense |
| Python | basedpyright | basedpyright |
| HTML | html | html-lsp |
| JavaScript/TypeScript | ts_ls | typescript-language-server |
| Vue | vue_ls | vue-language-server |
| SQL | sqlls | sqlls |

### Vue + TypeScript (hybrid mode)

Arquivos `.vue` ativam dois servidores ao mesmo tempo: o `vue_ls` cuida do
template e o `ts_ls` cuida do `<script>` através do plugin
`@vue/typescript-plugin` (configurado no `init_options` do `ts_ls` em
`lua/plugins/lsp.lua`). Não é necessário fazer nada além de abrir o arquivo.

## Adicionar uma linguagem

1. Encontre o nome do servidor na lista do
   [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim#available-lsp-servers).
2. Adicione o nome em `ensure_installed` em `lua/plugins/lsp.lua`:

   ```lua
   ensure_installed = {
     'lua_ls',
     -- ...
     'cssls', -- exemplo
   },
   ```
3. Reinicie o Neovim. O Mason instala e habilita o servidor sozinho.

Para instalar algo fora da lista, use `:MasonInstall <pacote>` ou abra o
painel com `:Mason`.

## Comandos úteis

| Comando | Ação |
|---|---|
| `:Mason` | painel de instalação/atualização dos servidores |
| `:LspInfo` | servidores anexados ao buffer e config ativa |
| `:LspRestart` | reiniciar os servidores do buffer |
| `:LspLog` | abrir o log dos servidores |
| `:checkhealth vim.lsp` | diagnóstico do subsistema LSP |
| `:lua vim.lsp.buf.format()` | formatar o buffer via LSP |

## Solução de problemas

- **Servidor não anexa ao buffer**: confira `:LspInfo`. Se o servidor não
  aparecer, abra `:Mason` e veja se a instalação terminou sem erros.
- **ts_ls/html/vue/intelephense/sqlls** precisam de `node` e `npm` no PATH.
- **gopls** precisa de `go` no PATH.
- **basedpyright** é instalado via `pip`; confira `python3 -m pip --version`.
- **intelephense**: a licença gratuita já cobre autocomplete, navegação e
  diagnósticos; recursos premium (rename avançado, etc.) exigem chave
  (veja https://intelephense.com).
- **Diagnósticos não aparecem**: texto virtual de diagnósticos vem ligado por
  padrão; os sinais na lateral usam os ícones definidos em
  `lua/plugins/neotree.lua` (`vim.diagnostic.config`).
