# ~/.config/nvim

Minha configuração pessoal do Neovim, escrita em Lua e organizada em módulos.
Gerenciador de plugins: [lazy.nvim](https://github.com/folke/lazy.nvim).
Tema: OneDark (com transparência opcional).

## Requisitos

- **Neovim >= 0.11**
- **Nerd Font** instalada e ativada no terminal (para os ícones)
- `git`, `unzip`, `curl`
- `make` + compilador C (`gcc`/`cc`) — telescope-fzf-native e parsers do Treesitter
- `ripgrep` — busca por conteúdo do Telescope
- **Clipboard**: `wl-clipboard` (Wayland) ou `xclip`/`xsel` (X11)
- Para os servidores LSP:
  - `node` + `npm` — TypeScript, HTML, Vue, PHP, SQL
  - `go` — gopls
  - `python3` + `pip` — basedpyright

## Instalação

```bash
git clone <url-deste-repo> ~/.config/nvim
nvim
```

Na primeira abertura o lazy.nvim instala todos os plugins e o Mason instala
todos os servidores LSP automaticamente. Aguarde alguns minutos e reinicie.

### install.sh

O `install.sh` baixa a versão mais recente do Neovim para `/opt/apps`,
registra `nvim` como `editor`/`vim`/`vi` via `update-alternatives` e instala
os providers de linguagem (Node, Python, Ruby) e ferramentas úteis
(`ripgrep`, `fd-find`, `tree-sitter-cli`, `luarocks`). É específico para
Debian/Ubuntu e exige `sudo`.

## Estrutura

```
init.lua                  ponto de entrada, carrega os módulos abaixo
install.sh                instala o Neovim + dependências do sistema
lazy-lock.json            versões exatas dos plugins (lockfile)
lua/
  core/
    basics.lua            opções do editor (números, busca, clipboard...)
    keymaps.lua           atalhos gerais (leader = espaço)
  plugins.lua             bootstrap do lazy.nvim + lista de módulos de plugins
  plugins/
    lsp.lua               Mason, servidores LSP e autocomplete (blink.cmp)
    treesitter.lua        highlight/indentação via tree-sitter
    neotree.lua           explorador de arquivos
    fuzzyfinder.lua       Telescope (busca fuzzy de tudo)
    bufferline.lua        linha de buffers no topo
  theme.lua               carrega o tema ativo
  themes/onedark.lua      configuração do OneDark
docs/
  keymaps.md              referência completa de atalhos
  lsp.md                  servidores LSP, como adicionar linguagens
```

## Plugins

| Plugin | Função |
|---|---|
| lazy.nvim | gerenciador de plugins |
| nvim-treesitter | highlight e indentação por sintaxe real (AST) |
| neo-tree.nvim | explorador de arquivos com git status |
| telescope.nvim | busca fuzzy: arquivos, grep, buffers, LSP... |
| bufferline.nvim | abas de buffers no topo |
| vim-bbye | fechar buffer sem quebrar o layout (`:Bdelete`) |
| mason.nvim | instala/gerencia servidores LSP (`:Mason`) |
| nvim-lspconfig | configurações padrão dos servidores LSP |
| blink.cmp | autocomplete (LSP, caminhos, snippets, buffer) |
| friendly-snippets | coleção de snippets |
| onedark.nvim | tema |

## Atalhos essenciais

A tecla líder é `<Espaço>`. Referência completa em [docs/keymaps.md](docs/keymaps.md).

| Atalho | Ação |
|---|---|
| `<leader>e` | abrir/fechar o explorador de arquivos |
| `\` | revelar o arquivo atual no explorador |
| `<leader>sf` | buscar arquivos |
| `<leader>sg` | buscar texto no projeto (live grep) |
| `<leader><leader>` | alternar entre buffers abertos |
| `<Tab>` / `<S-Tab>` | próximo buffer / buffer anterior |
| `<leader>x` | fechar buffer atual |
| `<C-h/j/k/l>` | mover entre splits |
| `<leader>v` / `<leader>h` | split vertical / horizontal |
| `gd` / `grr` | ir para definição / referências (LSP) |
| `K` | documentação do símbolo (LSP) |
| `grn` / `gra` | renomear / code action (LSP) |
| `<C-y>` | aceitar sugestão do autocomplete |
| `<leader>bg` | alternar transparência do tema |
| `<leader>th` | trocar estilo do tema (dark, cool, warm...) |

## Truques

- **Editar esta config em segundos**: `<leader>sn` abre o Telescope apontando
  para `~/.config/nvim`.
- **Busca sempre centralizada**: `n` e `N` centralizam o resultado na tela e
  abrem folds automaticamente (`zzzv`).
- **Colar sem perder o yank**: no modo visual, `p` substitui a seleção sem
  sobrescrever o registrador.
- **Indentação persistente**: `<` e `>` no modo visual indentam sem perder a
  seleção.
- **Navegação centralizada**: `<C-d>` e `<C-u>` rolam meia página mantendo o
  cursor no centro.
- **Clipboard do sistema**: selecione e use `<leader>ccc`. Yanks comuns (`y`)
  não vão para o clipboard do sistema por padrão; para mudar isso, descomente
  `vim.opt.clipboard = 'unnamedplus'` em `lua/core/basics.lua`.
- **Parsers sob demanda**: ao abrir um arquivo de uma linguagem nova, o
  Treesitter baixa e compila o parser automaticamente.
- **Fechar buffer sem fechar a janela**: `<leader>x` usa `:Bdelete!`
  (vim-bbye), que mantém o layout dos splits.
- **Repita a última busca do Telescope** com `<leader>sr` (resume).
- **Descobrir atalhos na hora**: dentro de qualquer janela do Telescope,
  `?` (modo normal) ou `<C-/>` (modo inserção) lista os atalhos do picker.

## Manutenção

| Comando | Ação |
|---|---|
| `:Lazy` | painel dos plugins (atualizar: `U`) |
| `:Lazy sync` | instalar/remover conforme a config + lockfile |
| `:Mason` | painel dos servidores LSP, linters e formatadores |
| `:TSUpdate` | atualizar parsers do Treesitter |
| `:checkhealth` | diagnóstico geral da instalação |
| `:checkhealth vim.lsp` | estado dos servidores LSP |

Para adicionar suporte a uma nova linguagem, veja [docs/lsp.md](docs/lsp.md).
