# Referência de atalhos

A tecla líder (`<leader>`) é `<Espaço>`. Salvo indicação contrária, os atalhos
valem para o modo normal (`n`), visual (`v`) ou inserção (`i`).

## Geral (lua/core/keymaps.lua)

| Atalho | Modo | Ação |
|---|---|---|
| `<leader>ccc` | v | copiar seleção para o clipboard do sistema |
| `<C-d>` / `<C-u>` | n | rolar meia página, cursor centralizado |
| `n` / `N` | n | próximo/anterior resultado de busca, centralizado e sem fold |
| `<C-Up>` / `<C-Down>` | n | redimensionar altura da janela |
| `<C-Left>` / `<C-Right>` | n | redimensionar largura da janela |
| `<leader>lw` | n | ligar/desligar quebra de linha |
| `<` / `>` | v | indentar mantendo a seleção |
| `p` | v | colar sobre a seleção sem perder o yank |

## Buffers

| Atalho | Ação |
|---|---|
| `<Tab>` | próximo buffer |
| `<S-Tab>` | buffer anterior |
| `<leader>x` | fechar buffer atual (mantém o layout, via vim-bbye) |
| `<leader>b` | novo buffer vazio |
| `<leader><leader>` | listar buffers abertos (Telescope) |

## Janelas (splits) e tabs

| Atalho | Ação |
|---|---|
| `<leader>v` | split vertical |
| `<leader>h` | split horizontal |
| `<leader>se` | equalizar tamanho dos splits |
| `<leader>xs` | fechar split atual |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | mover entre splits |
| `<leader>to` | nova tab |
| `<leader>tx` | fechar tab |
| `<leader>tn` / `<leader>tp` | próxima tab / tab anterior |

## Neo-tree (explorador de arquivos)

| Atalho | Ação |
|---|---|
| `<leader>e` | abrir/fechar o painel |
| `\` | abrir revelando o arquivo atual |

Dentro do painel:

| Tecla | Ação |
|---|---|
| `<Espaço>` | expandir/recolher diretório |
| `<CR>` | abrir arquivo |
| `P` | preview flutuante |
| `l` | focar o preview |
| `S` / `s` | abrir em split horizontal / vertical |
| `t` | abrir em nova tab |
| `w` | abrir escolhendo a janela (window-picker) |
| `a` / `A` | novo arquivo / novo diretório |
| `d` | apagar |
| `r` | renomear |
| `c` / `m` | copiar / mover |
| `y` / `x` / `p` | copiar / recortar / colar (dentro da árvore) |
| `C` | fechar nó |
| `z` | recolher tudo |
| `R` | atualizar |
| `i` | detalhes do arquivo |
| `?` | ajuda com todos os atalhos |
| `<` / `>` | fonte anterior / próxima (filesystem, buffers, git) |
| `q` / `<Esc>` | fechar painel / cancelar |

Somente na fonte **filesystem**:

| Tecla | Ação |
|---|---|
| `<BS>` | subir um diretório |
| `.` | tornar o diretório a raiz |
| `H` | mostrar/ocultar arquivos ocultos |
| `/` | busca fuzzy |
| `D` | busca fuzzy de diretórios |
| `f` | filtrar ao confirmar |
| `<C-x>` | limpar filtro |
| `[g` / `]g` | anterior/próximo arquivo modificado no git |
| `o` + letra | ordenar (`oc` criação, `om` modificação, `on` nome, `os` tamanho, `ot` tipo, `og` git) |

## Telescope (busca fuzzy)

| Atalho | Ação |
|---|---|
| `<leader>sf` | arquivos do projeto |
| `<leader>sg` | texto no projeto (live grep) |
| `<leader>sw` | palavra sob o cursor |
| `<leader>sh` | páginas de ajuda |
| `<leader>sk` | atalhos de teclado |
| `<leader>sd` | diagnósticos |
| `<leader>ss` | seletor de pickers do Telescope |
| `<leader>sr` | reabrir último picker |
| `<leader>s.` | arquivos recentes |
| `<leader>sn` | arquivos desta config |
| `<leader><leader>` | buffers abertos |
| `<leader>/` | busca fuzzy no buffer atual |
| `<leader>s/` | live grep apenas nos arquivos abertos |

Dentro de um picker:

| Tecla | Modo | Ação |
|---|---|---|
| `<C-n>` / `<C-p>` | i/n | item seguinte / anterior |
| `<CR>` | i/n | abrir seleção |
| `<C-x>` / `<C-v>` / `<C-t>` | i | abrir em split / vsplit / tab |
| `<C-u>` / `<C-d>` | i | rolar o preview |
| `<Esc>` | i | sair para modo normal (segundo `<Esc>` fecha) |
| `q` | n | fechar |
| `?` | n | listar atalhos do picker |
| `<C-/>` | i | listar atalhos do picker |

## LSP

Nativos do Neovim 0.11 (ativos em qualquer buffer com servidor anexado):

| Atalho | Modo | Ação |
|---|---|---|
| `K` | n | documentação do símbolo (hover) |
| `grn` | n | renomear símbolo |
| `gra` | n/v | code action |
| `grr` | n | listar referências |
| `gri` | n | ir para implementação |
| `gO` | n | símbolos do documento |
| `<C-s>` | i | assinatura da função |

Definidos nesta config (lua/plugins/lsp.lua, via Telescope):

| Atalho | Ação |
|---|---|
| `gd` | ir para definição |
| `gD` | ir para declaração |
| `<leader>ds` | símbolos do documento |
| `<leader>ws` | símbolos do workspace |

Diagnósticos (nativos):

| Atalho | Ação |
|---|---|
| `[d` / `]d` | diagnóstico anterior / próximo |
| `[D` / `]D` | primeiro / último diagnóstico |
| `<C-w>d` | abrir diagnóstico da linha em janela flutuante |

## Autocomplete (blink.cmp)

| Tecla | Modo | Ação |
|---|---|---|
| `<C-espaço>` | i | abrir menu (ou a documentação) |
| `<C-n>` / `<C-p>` ou setas | i | sugestão seguinte / anterior |
| `<C-y>` | i | aceitar sugestão |
| `<C-e>` | i | fechar menu |
| `<C-b>` / `<C-f>` | i | rolar a documentação |
| `<Tab>` / `<S-Tab>` | i | próximo/anterior placeholder do snippet |
| `<C-k>` | i | mostrar/ocultar assinatura da função |

## Tema (themes/onedark.lua)

| Atalho | Ação |
|---|---|
| `<leader>bg` | alternar fundo transparente/opaco |
| `<leader>th` | alternar estilo: dark → darker → cool → deep → warm → warmer → light |
