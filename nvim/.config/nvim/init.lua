--[[
=====================================================================
==================== Neovim Configuration ===========================
=====================================================================

A modern Neovim configuration optimized for:
  • Elixir, Phoenix, and Ash Framework
  • Ruby on Rails (with ERB templating)
  • HTML, CSS, and Tailwind CSS
  • JavaScript/TypeScript
  • C development with Raylib
  • CMake build system

Key Features:
  • LSP servers auto-installed via Mason
  • Format on save with conform.nvim
  • Real-time linting with nvim-lint
  • Git integration (LazyGit, gitsigns, diffview)
  • Fuzzy finding with Telescope
  • File explorer with Neo-tree
  • Tailwind CSS color previews and class sorting
  • Emoji picker for commits and docs

See README.md for full documentation.

Helpful Commands:
  :checkhealth       - Check configuration health
  :Lazy              - Manage plugins
  :Mason             - Install LSP servers and tools
  :ConformInfo       - Check formatter status
  :LspInfo           - Check LSP status
  <Space>            - Show keybinding menu (which-key)

--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Indentation: 4 spaces for all file types
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Clear search highlights on <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Open diagnostic quickfix list
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Navigate between windows with Ctrl+hjkl
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move lines up/down with Alt+jk
vim.keymap.set('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- Exit terminal mode with double Esc
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Plugin Configuration ]]
-- Plugins are managed by lazy.nvim and installed automatically on first launch
-- Commands: :Lazy (plugin manager UI), :Lazy update (update plugins), :Lazy sync (install/update/clean)

require('lazy').setup({
  -- Git signs in the gutter with smooth colored bars
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '▎' },
        topdelete = { text = '▎' },
        changedelete = { text = '▎' },
      },
    },
  },

  -- Code formatting with auto-format on save
  -- Manual format: <leader>F | Check status: :ConformInfo
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>F',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true, -- Show errors when formatting fails
      notify_no_formatters = true, -- Show message when no formatters available
      format_on_save = function(bufnr)
        return {
          timeout_ms = 2000, -- Increased from 500ms
          lsp_format = 'fallback',
        }
      end,
      formatters_by_ft = {
        c = { 'clang-format' },
        cmake = { 'cmake_format' },
        cpp = { 'clang-format' },
        css = { 'prettier' },
        elixir = { 'mix' },
        eelixir = { 'mix' },
        eruby = { 'erb_format' },
        heex = { 'mix' },
        html = { 'rustywind', 'prettier' },
        javascript = { 'rustywind', 'prettier' },
        javascriptreact = { 'rustywind', 'prettier' },
        json = { 'prettier' },
        lua = { 'stylua' },
        ruby = { 'rubocop' },
        scss = { 'prettier' },
        toml = { 'taplo' },
        typescript = { 'rustywind', 'prettier' },
        typescriptreact = { 'rustywind', 'prettier' },
        yaml = { 'prettier' },
      },
      -- Define custom formatters
      formatters = {
        ['clang-format'] = {
          prepend_args = {
            '--style={BasedOnStyle: LLVM, BreakBeforeBraces: Linux, IndentWidth: 4, TabWidth: 4, UseTab: Never, ColumnLimit: 80}',
          },
        },
        mix = {
          command = 'mix',
          args = { 'format', '-' },
          stdin = true,
        },
        rubocop = {
          prepend_args = { '--autocorrect-all', '--stderr', '--force-exclusion' },
          exit_codes = { 0, 1 }, -- Accept exit code 1 (offenses found but corrected)
        },
      },
    },
  },

  -- Real-time linting for code quality
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        c = { 'clangtidy' },
        cpp = { 'clangtidy' },
        eruby = { 'erb_lint' },
        javascript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        ruby = { 'rubocop' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
      }

      -- Auto-lint on save and text change
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- Git conflict resolution
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = true,
  },

  -- Advanced git diff viewer
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iff View' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it File [H]istory' },
    },
  },

  -- Project-wide search and replace
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        '<leader>sr',
        function()
          require('spectre').open()
        end,
        desc = '[S]earch and [R]eplace',
      },
      {
        '<leader>sw',
        function()
          require('spectre').open_visual { select_word = true }
        end,
        desc = '[S]earch current [W]ord',
      },
      {
        '<leader>sp',
        function()
          require('spectre').open_file_search()
        end,
        desc = '[S]earch in current file (s[p]ectre)',
      },
    },
  },

  -- LazyGit integration
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Lazy[G]it' },
    },
  },

  -- Rails Support
  {
    'tpope/vim-rails',
    ft = { 'ruby', 'eruby' },
  },

  -- Ruby/Rails Helpers
  {
    'vim-ruby/vim-ruby',
    ft = { 'ruby', 'eruby' },
  },

  -- Bundler integration
  {
    'tpope/vim-bundler',
    ft = { 'ruby', 'eruby' },
  },

  -- Auto-add 'end' in Ruby, Lua, etc.
  {
    'tpope/vim-endwise',
    ft = { 'ruby', 'eruby', 'lua', 'elixir' },
  },

  -- Elixir support
  {
    'elixir-editors/vim-elixir',
    ft = { 'elixir', 'eelixir', 'heex', 'surface' },
  },

  -- Auto-pairs for brackets
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  -- Auto close/rename HTML tags
  {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },

  -- Flash.nvim - Fast navigation with search labels
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
      { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
    },
    opts = {},
  },

  -- Trouble.nvim - Better diagnostics list
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>xs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
      { '<leader>xq', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
    },
    opts = {},
  },

  -- Session management - auto-save and restore
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    keys = {
      { '<leader>qs', function() require('persistence').load() end, desc = 'Restore Session' },
      { '<leader>ql', function() require('persistence').load({ last = true }) end, desc = 'Restore Last Session' },
      { '<leader>qd', function() require('persistence').stop() end, desc = "Don't Save Current Session" },
    },
    opts = {},
  },

  -- Projectionist - Jump between related files (Rails: model <-> test, controller <-> view)
  {
    'tpope/vim-projectionist',
    event = 'VeryLazy',
  },

  -- CMake build integration
  {
    'Civitasv/cmake-tools.nvim',
    ft = { 'cmake', 'c', 'cpp' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>cg', '<cmd>CMakeGenerate<cr>', desc = '[C]Make [G]enerate' },
      { '<leader>cb', '<cmd>CMakeBuild<cr>', desc = '[C]Make [B]uild' },
      { '<leader>cr', '<cmd>CMakeRun<cr>', desc = '[C]Make [R]un' },
      { '<leader>cd', '<cmd>CMakeDebug<cr>', desc = '[C]Make [D]ebug' },
      { '<leader>cc', '<cmd>CMakeClean<cr>', desc = '[C]Make [C]lean' },
      { '<leader>cs', '<cmd>CMakeSelectBuildType<cr>', desc = '[C]Make [S]elect Build Type' },
      { '<leader>ct', '<cmd>CMakeSelectBuildTarget<cr>', desc = '[C]Make Select [T]arget' },
    },
    opts = {
      cmake_build_directory = 'build/${variant:buildType}',
      cmake_generate_options = { '-DCMAKE_EXPORT_COMPILE_COMMANDS=1' },
    },
  },

  -- Emoji picker
  {
    'allaman/emoji.nvim',
    ft = { 'markdown', 'text', 'gitcommit', 'eruby', 'html' },
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      { '<leader>em', '<cmd>Telescope emoji<cr>', desc = '[Em]oji Picker' },
    },
    config = function()
      require('telescope').load_extension 'emoji'
    end,
  },

  -- Show current code context
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = { max_lines = 3 },
  },

  -- Color highlighter for Tailwind and CSS
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = {
        tailwind = true, -- Enable tailwind colors
        css = true,
        css_fn = true,
        mode = 'background', -- 'background' | 'foreground' | 'virtualtext'
        names = false, -- Disable color names like "Red"
      },
    },
  },

  -- Neo-tree - File explorer sidebar
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>n', '<cmd>Neotree toggle<cr>', desc = 'Toggle [N]eo-tree' },
      { '<leader>N', '<cmd>Neotree reveal<cr>', desc = 'Reveal file in [N]eo-tree' },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },
      window = {
        position = 'left',
        width = 35,
        mappings = {
          ['<space>'] = 'none', -- Disable space to avoid conflict with leader
          ['<cr>'] = 'open',
          ['<C-v>'] = 'open_vsplit',
          ['<C-x>'] = 'open_split',
          ['<C-t>'] = 'open_tabnew',
          ['P'] = { 'toggle_preview', config = { use_float = true } },
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['a'] = { 'add', config = { show_path = 'relative' } },
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['c'] = 'copy',
          ['m'] = 'move',
          ['R'] = 'refresh',
          ['?'] = 'show_help',
          ['q'] = 'close_window',
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = '',
          expander_expanded = '',
        },
        git_status = {
          symbols = {
            added = '',
            modified = '',
            deleted = '',
            renamed = '',
            untracked = '',
            ignored = '',
            unstaged = '󰄱',
            staged = '',
            conflict = '',
          },
        },
      },
    },
  },

  -- Keybinding hints popup - shows available commands as you type
  -- Press <Space> to see all leader key commands instantly (delay=0)
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0, -- Show menu immediately when pressing leader key
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]Make' },
        { '<leader>e', group = '[E]xtras' },
        { '<leader>f', group = '[F]ind/Files' },
        { '<leader>g', group = '[G]it' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>q', group = '[Q]uit/Session' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>x', group = 'Diagnostics (Trouble)' },
      },
    },
  },

  -- Fuzzy finder for files, text, LSP symbols, and more
  -- Main keybinds: <leader>ff (files), <leader>fg (grep), <leader>fb (buffers)
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },

      {
        'nvim-telescope/telescope-ui-select.nvim',
      },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      {
        'nvim-tree/nvim-web-devicons',
        enabled = vim.g.have_nerd_font,
      },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      -- vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      -- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      -- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      -- vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      -- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = '[B]uffer [B]rowser' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = 'Fuzzy search in current buffer' })

      -- -- Slightly advanced example of overriding default behavior and theme
      -- vim.keymap.set('n', '<leader>/', function()
      --   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      --   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      --     winblend = 10,
      --     previewer = false,
      --   })
      -- end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP configuration for Neovim Lua development
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- LSP servers auto-installed via Mason
    -- Provides go-to-definition, hover docs, autocompletion, diagnostics, and more
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} }, -- LSP/tool installer UI
      'mason-org/mason-lspconfig.nvim', -- Bridge between Mason and lspconfig
      'WhoIsSethDaniel/mason-tool-installer.nvim', -- Auto-install tools on startup
      { 'j-hui/fidget.nvim', opts = {} }, -- LSP progress notifications
      'saghen/blink.cmp', -- Autocompletion engine
    },
    config = function()
      -- LSP keymaps are set when an LSP attaches to a buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          -- Helper function to set LSP keymaps
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- LSP Navigation Keymaps
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          -- Helper function for version compatibility (Neovim 0.10 vs 0.11)
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- Highlight references of symbol under cursor
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- Toggle inlay hints (if supported by LSP)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic icons and formatting
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          prefix = '●',
          format = function(diagnostic)
            local icons = {
              [vim.diagnostic.severity.ERROR] = '󰅚',
              [vim.diagnostic.severity.WARN] = '󰀪',
              [vim.diagnostic.severity.INFO] = '󰋽',
              [vim.diagnostic.severity.HINT] = '󰌶',
            }
            return string.format('%s %s', icons[diagnostic.severity], diagnostic.message)
          end,
        },
      }

      -- Get LSP capabilities from blink.cmp for autocompletion
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- LSP servers to auto-install via Mason
      -- Add/remove servers as needed - they'll be installed automatically on startup
      local servers = {
        -- C/C++ (with Raylib support via clangd)
        clangd = {
          cmd = {
            'clangd',
            '--background-index',
            '--clang-tidy',
            '--header-insertion=iwyu',
            '--completion-style=detailed',
            '--function-arg-placeholders',
            '--fallback-style=llvm',
          },
          filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
        },
        -- CMake
        neocmake = {},
        -- CSS
        cssls = {},
        -- Docker
        dockerls = {},
        -- Elixir
        elixirls = {
          cmd = { vim.fn.expand '~/.local/share/nvim/mason/bin/elixir-ls' },
          settings = {
            elixirLS = {
              dialyzerEnabled = true,
              fetchDeps = false,
              enableTestLenses = true,
              suggestSpecs = true,
            },
          },
        },
        -- Emmet (HTML/CSS snippets)
        emmet_ls = {
          filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'eruby', 'erb', 'heex', 'eelixir' },
        },
        -- HTML
        html = {
          filetypes = { 'html', 'eruby', 'erb', 'heex', 'eelixir' },
        },
        -- JavaScript/TypeScript
        ts_ls = {},
        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
              diagnostics = { globals = { 'vim' } },
            },
          },
        },
        -- Ruby (Shopify's ruby-lsp)
        ruby_lsp = {
          init_options = {
            formatter = 'rubocop',
            linters = { 'rubocop' },
            enabledFeatures = {
              'codeActions',
              'diagnostics',
              'documentHighlights',
              'documentLink',
              'documentSymbols',
              'foldingRanges',
              'formatting',
              'hover',
              'inlayHint',
              'onTypeFormatting',
              'selectionRanges',
              'semanticHighlighting',
            },
            featuresConfiguration = {
              inlayHint = {
                enableAll = true,
              },
            },
            experimentalFeaturesEnabled = true,
            -- Add-on configuration (Ruby LSP Rails, etc.)
            addonSettings = {
              ['Ruby LSP Rails'] = {
                enablePendingMigrationsPrompt = true,
              },
            },
          },
        },
        -- Stimulus LSP (Rails Hotwire)
        stimulus_ls = {},
        -- Tailwind CSS
        tailwindcss = {
          filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte', 'erb', 'eruby', 'heex', 'eelixir', 'elixir' },
        },
        -- TOML
        taplo = {},
        -- YAML
        yamlls = {},
      }

      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      --
      -- `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      --
      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        -- Formatters
        'stylua', -- Lua
        'clang-format', -- C/C++
        'cmakelang', -- CMake (cmake_format)
        'prettier', -- JS/TS/HTML/CSS/YAML
        'rubocop', -- Ruby (formatter & linter)
        'rustywind', -- Tailwind CSS class sorter
        'erb-formatter', -- ERB formatting
        -- Linters
        'eslint_d', -- JS/TS
        'erb-lint', -- ERB linting
        -- Note: clang-tidy comes with clangd or install via: brew install llvm
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      -- Keybindings: <Tab> accept, <C-n>/<C-p> navigate, <C-Space> toggle docs
      keymap = { preset = 'super-tab' },
      appearance = { nerd_font_variant = 'mono' },
      completion = { documentation = { auto_show = false, auto_show_delay_ms = 500 } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'lua' },
      signature = { enabled = true },
    },
  },

  -- Color scheme (Catppuccin Mocha variant)
  {
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },

  -- Highlight TODO, FIXME, NOTE, etc. in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- Collection of useful mini plugins (textobjects, surround, statusline)
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better text objects (va), yinq, ci', etc.)
      require('mini.ai').setup { n_lines = 500 }

      -- Surround actions (saiw), sd', sr)')
      require('mini.surround').setup()

      -- Simple statusline
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
  -- Treesitter for advanced syntax highlighting and code understanding
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'cmake',
        'cpp',
        'css',
        'csv',
        'diff',
        'dockerfile',
        'editorconfig',
        'eex', -- Elixir EEx templates
        'elixir', -- Elixir language
        'embedded_template', -- ERB support
        'git_config',
        'gitignore',
        'heex', -- Phoenix HEEx templates
        'html',
        'javascript',
        'jq',
        'json',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'regex',
        'ruby',
        'scss',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
