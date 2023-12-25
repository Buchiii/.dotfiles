-- Install lazylazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Fixes Notify opacity issues
vim.o.termguicolors = true

-- TODO: find more plugins

require("lazy").setup({
  -- theme
  { "catppuccin/nvim", as = "catppuccin", priority = 1000 },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        enabled = false,
      })
    end
  },
  -- Nicer Command Line for neovim
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        -- add any options here
        routes = {
          {
            filter = {
              event = 'msg_show',
              any = {
                { find = '%d+L, %d+B' },
                { find = '; after #%d+' },
                { find = '; before #%d+' },
                { find = '%d fewer lines' },
                { find = '%d more lines' },
              },
            },
            opts = { skip = true },
          }
        },
      })
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
  -- Database
  {
    "tpope/vim-dadbod",
    opt = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      require("plugins.dadbod").setup()
    end,
  },

  -- Fancier statusline
  'nvim-lualine/lualine.nvim',

  -- Fuzzy Finder
  { 'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },
 -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    }
  },

 -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  -- Dashboard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  -- which-key
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  },

  -- Better Tabs for Buffers
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- toggleterm
  {'akinsho/toggleterm.nvim', version = "*", config = true},

  -- surround
  'tpope/vim-surround',

  -- transparency
  'xiyaowong/transparent.nvim',

  -- show all the troubles the code causes
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
    end
  },

  -- better comments
  {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  },

  -- autopairs
  {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {} -- this is equalent to setup({}) function
  },

  -- Git Signs
  {
  'lewis6991/gitsigns.nvim',
  config = function ()
    require('gitsigns').setup()
  end
  },

  -- Neorg - Alternative to org mode
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Documents/neorg",
              },
            },
          },
        },
      }
    end,
   },

  -- Angry Reviewer - suggestions for better writing
  'anufrievroman/vim-angry-reviewer',

  -- Show correct Identation
  -- WARNING: Does not seaem to work
  'Bekaboo/deadcolumn.nvim',

  -- TODO: Configuration
  -- Translation
  'potamides/pantran.nvim',

  -- Scrollbar
  'petertriho/nvim-scrollbar',

  -- minimap
  -- TODO: configure keybindings
  {
  'gorbit99/codewindow.nvim',
  config = function()
    local codewindow = require('codewindow')
    codewindow.setup()
    codewindow.apply_default_keybinds()
  end,
  },

  -- Snippets for Many different things
  -- TODO: Add Snippets for Ansible, Puppet, Latex, etc...
  {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  },

  -- Email client
  {
  url = "https://git.sr.ht/%7Esoywod/himalaya-vim",
  config = function ()
    vim.g.himalaya_executable = "/usr/bin/himalaya"
    vim.g.himalaya_folder_picker = 'telescope'
  end,
  },


  -- Telescope Plugin for luasnip
  {
  "benfowler/telescope-luasnip.nvim",
  module = "telescope._extensions.luasnip",  -- if you wish to lazy-load
  },

  -- Telescope Plugin for tmux
  {
  "camgraff/telescope-tmux.nvim",
  },

  -- Telescope Plugin for finding repos
  {
  "cljoly/telescope-repo.nvim",
  },

  -- Telescope Plugin for Terraform
  {
    "angkeith/telescope-terraform-doc.nvim",
  },

  -- Telescope Plugin for cheat.sh
  -- NOTE: ~/.local/share/nvim/databases has to be created
  {
  "nvim-telescope/telescope-cheat.nvim",
  dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope.nvim"
    }
  },

  -- Telescope Plugin for file browser
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  -- oil.nvim - filesystem editing in a buffer
  {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- image preview in telescope
  {
  'nvim-telescope/telescope-media-files.nvim',
  dependencies = { "nvim-lua/popup.nvim" },
  },

  -- image preview directly in a file
  -- works only in Kitty / Wezterm
  -- sudo luarocks install magick --lua-version 5.1
  -- copy /root/.luarocks to user folder and chown to user permissions
  {
  'https://github.com/3rd/image.nvim',
  },
  
  -- ollama integration in nvim
  'David-Kunz/gen.nvim',
})
