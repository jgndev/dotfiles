# Neovim Configuration

A modern Neovim configuration optimized for C, Rails, Tailwind CSS, and JavaScript/TypeScript development.

## Features

- 🚀 Fast startup with lazy loading via [lazy.nvim](https://github.com/folke/lazy.nvim)
- 📦 Automatic LSP server and tool installation via [Mason](https://github.com/williamboman/mason.nvim)
- 🎨 Tailwind CSS support with color previews and class sorting
- 🔍 Fuzzy finding with [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- ✨ Advanced autocompletion with [blink.cmp](https://github.com/saghen/blink.cmp)
- 🎯 Code formatting on save with [conform.nvim](https://github.com/stevearc/conform.nvim)
- 🔎 Real-time linting with [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- 📝 File explorer with [oil.nvim](https://github.com/stevearc/oil.nvim)
- 🌳 Git integration with [LazyGit](https://github.com/kdheepak/lazygit.nvim), [gitsigns](https://github.com/lewis6991/gitsigns.nvim), and [diffview](https://github.com/sindrets/diffview.nvim)
- 🎨 Beautiful UI with [catppuccin](https://github.com/catppuccin/nvim) theme
- 📚 Code snippets with [LuaSnip](https://github.com/L3MON4D3/LuaSnip) and [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

## Requirements

- Neovim >= 0.10
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (recommended: JetBrainsMono Nerd Font, FiraCode Nerd Font, or Hack Nerd Font)
- [ripgrep](https://github.com/BurntSushi/ripgrep) - for Telescope live grep
- [fd](https://github.com/sharkdp/fd) - for faster file finding (optional but recommended)
- [LazyGit](https://github.com/jesseduffield/lazygit) - for git UI (optional)
- A C compiler (for Treesitter parsers)

### macOS Installation

```bash
brew install neovim ripgrep fd lazygit llvm
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

## Installation

1. **Backup your existing config (if any):**
```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

2. **Clone this config:**
```bash
git clone <your-repo-url> ~/.config/nvim
```

3. **Start Neovim:**
```bash
nvim
```

4. **Wait for plugins to install** - lazy.nvim will automatically install all plugins on first launch

5. **Restart Neovim** for all plugins to take effect

6. **Check health:**
```vim
:checkhealth
```

## Language Support

### LSP Servers (Auto-installed)

- **C/C++**: clangd
- **Ruby**: ruby_lsp
- **JavaScript/TypeScript**: ts_ls (TypeScript Language Server)
- **HTML**: html
- **CSS**: cssls
- **Tailwind CSS**: tailwindcss
- **Go**: gopls
- **Lua**: lua_ls
- **YAML**: yamlls
- **Docker**: dockerls
- **TOML**: taplo

### Formatters (Auto-installed)

- **C/C++**: clang-format
- **CMake**: cmakelang
- **CSS/HTML/JS/TS/YAML**: prettier
- **ERB**: erb-formatter (with Tailwind sorting via rustywind)
- **Go**: gofumpt, goimports
- **Lua**: stylua
- **Ruby**: rubocop
- **TOML**: taplo
- **Tailwind CSS**: rustywind (class sorter)

### Linters (Auto-installed)

- **JavaScript/TypeScript**: eslint_d
- **Ruby**: rubocop
- **C/C++**: clang-tidy (install via `brew install llvm`)

## Key Bindings

Leader key: `<Space>`

### General

| Key | Description |
|-----|-------------|
| `<Space>` | Show which-key menu |
| `<Esc>` | Clear search highlights |
| `<leader>q` | Open diagnostic quickfix list |

### File Navigation

| Key | Description |
|-----|-------------|
| `<leader>E` | Open Oil file explorer |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help tags |
| `<leader><leader>` | Quick buffer switcher |
| `<leader>/` | Fuzzy search in current buffer |

### Git

| Key | Description |
|-----|-------------|
| `<leader>gg` | Open LazyGit |
| `<leader>gd` | Git diff view |
| `<leader>gh` | Git file history |

### Search & Replace

| Key | Description |
|-----|-------------|
| `<leader>sr` | Search and replace (project-wide) |
| `<leader>sw` | Search current word |
| `<leader>sp` | Search in current file |
| `<leader>s/` | Search in open files |
| `<leader>sn` | Search Neovim config files |

### LSP

| Key | Description |
|-----|-------------|
| `grn` | Rename symbol |
| `gra` | Code action |
| `grr` | Find references |
| `gri` | Go to implementation |
| `grd` | Go to definition |
| `grD` | Go to declaration |
| `grt` | Go to type definition |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `K` | Hover documentation |
| `<leader>th` | Toggle inlay hints |

### Formatting

| Key | Description |
|-----|-------------|
| `<leader>F` | Format buffer manually |
| (auto) | Format on save (enabled by default) |

### Extras

| Key | Description |
|-----|-------------|
| `<leader>em` | Emoji picker |

### Window Management

| Key | Description |
|-----|-------------|
| `<C-h>` | Move to left window |
| `<C-l>` | Move to right window |
| `<C-j>` | Move to lower window |
| `<C-k>` | Move to upper window |

### Line Movement

| Key | Description |
|-----|-------------|
| `<A-j>` | Move line down |
| `<A-k>` | Move line up |

## Oil.nvim File Explorer

Oil allows you to edit your filesystem like a normal buffer.

### Usage

1. Press `<leader>E` to open Oil
2. Navigate with `j`/`k`
3. Press `<CR>` to enter directory or open file
4. Press `-` to go to parent directory

### Oil Commands

| Key | Description |
|-----|-------------|
| `g?` | Show help |
| `<CR>` | Open file/directory |
| `<C-v>` | Open in vertical split |
| `<C-x>` | Open in horizontal split |
| `<C-p>` | Preview file |
| `-` | Parent directory |
| `g.` | Toggle hidden files |
| `gs` | Change sort order |
| `gx` | Open with system default |

### Editing Filesystem

- **Create file/directory**: Press `o` to create new line, type name, `:w` to save
- **Delete**: Use `dd` to delete line(s), `:w` to apply
- **Rename**: Edit the filename directly, `:w` to apply
- **Move**: Delete line with `dd`, navigate to target, paste with `p`, `:w` to apply

**Important**: Changes don't take effect until you save with `:w`!

## Tailwind CSS Features

- **Autocomplete**: Intelligent class name suggestions
- **Color preview**: See colors inline next to class names
- **Hover docs**: Hover over classes to see CSS
- **Class sorting**: Automatically sorts classes on save
- **Conflict detection**: Warns about conflicting classes

## Customization

### Adding LSP Servers

Edit the `servers` table in `init.lua` around line 773:

```lua
local servers = {
  your_lsp = {},
}
```

### Adding Formatters

Edit the `formatters_by_ft` table in `init.lua` around line 324:

```lua
formatters_by_ft = {
  your_filetype = { 'your_formatter' },
}
```

### Adding Linters

Edit the `linters_by_ft` table in `init.lua` around line 350:

```lua
lint.linters_by_ft = {
  your_filetype = { 'your_linter' },
}
```

## Plugins

### Core

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Keybinding hints
- [catppuccin](https://github.com/catppuccin/nvim) - Color scheme

### LSP & Completion

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP/tool installer
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Mason-LSP bridge
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) - Auto-install tools
- [blink.cmp](https://github.com/saghen/blink.cmp) - Autocompletion
- [lazydev.nvim](https://github.com/folke/lazydev.nvim) - Lua LSP configuration
- [fidget.nvim](https://github.com/j-hui/fidget.nvim) - LSP progress UI

### Formatting & Linting

- [conform.nvim](https://github.com/stevearc/conform.nvim) - Formatting
- [nvim-lint](https://github.com/mfussenegger/nvim-lint) - Linting
- [guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim) - Indent detection

### Git

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git decorations
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) - LazyGit integration
- [diffview.nvim](https://github.com/sindrets/diffview.nvim) - Git diff viewer
- [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim) - Conflict resolution

### Navigation & Search

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - FZF sorter
- [nvim-spectre](https://github.com/nvim-pack/nvim-spectre) - Search and replace
- [oil.nvim](https://github.com/stevearc/oil.nvim) - File explorer

### Treesitter

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) - Context display

### Editing

- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto close brackets
- [mini.nvim](https://github.com/echasnovski/mini.nvim) - Mini modules (ai, surround, statusline)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Snippet collection

### UI Enhancements

- [nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua) - Color highlighter (Tailwind support)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - File icons
- [emoji.nvim](https://github.com/allaman/emoji.nvim) - Emoji picker
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - Highlight TODOs

### Ruby/Rails

- [vim-rails](https://github.com/tpope/vim-rails) - Rails support
- [vim-ruby](https://github.com/vim-ruby/vim-ruby) - Ruby support
- [vim-bundler](https://github.com/tpope/vim-bundler) - Bundler integration

## Troubleshooting

### Plugins not loading

```vim
:Lazy sync
```

### LSP not working

```vim
:Mason
:LspInfo
:checkhealth
```

### Formatters not working

```vim
:ConformInfo
```

### Clear cache and reinstall

```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
nvim
```

## License

This configuration is based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and is provided as-is for personal use.
