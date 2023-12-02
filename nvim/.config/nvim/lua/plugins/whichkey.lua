local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {

  -- nvim-tree
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  -- hide searches
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  -- getting out of files
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },

  -- Angry Reviewer
  a = {
    name = "AngryReviwer",
    r = { "<cmd>AngryReviewer<cr>", "AngryReviewer" },
    n = { "<cmd>cnext<cr>", "Next"},
    p = { "<cmd>cprev<cr>", "Previous"},
    c = { "<cmd>cclose<cr>", "Close"},
    o = { "<cmd>copen<cr>", "Open"},
  },

  -- comments
  c = {
    name = "Comments",
    n = { "<cmd>lua require('todo-comments').jump_next()<cr>", "Next Comment" },
    p = { "<cmd>lua require('todo-comments').jump_prev()<cr>", "Previous Comment" },
  },

  -- mostly telescope
  f = {
    name = "Files",
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
    c = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer Grep" },
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep" },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" },
    n = { "<cmd>Telescope notify<cr>", "Notifications"},
  },

  -- git
  g = {
    name = "Git",
    g = { "<cmd>LazyGit<cr>", "Lazygit" },
  },

  -- mail / himalaya
  m = {
    name = "Mail",
    c = { "<cmd>HimalayaCopy<cr>", "Copy Mail" },
    m = { "<cmd>HimalayaMove<cr>", "Move Mail" },
    n = { "<cmd>HimalayaNextPage<cr>", "Next Page"},
    p = { "<cmd>HimalayaPreviousPage<cr>", "Previous Page"},
    g = { "<cmd>HimalayaFolders<cr>", "Folders" },
    w = { "<cmd>HimalayaWrite<cr>" , "Write Mail" },
    r = { "<cmd>HimalayaReply<cr>", "Reply" },
    R = { "<cmd>HimalayaReplyAll<cr>", "Reply All" },
    f = { "<cmd>HimalayaForward<cr>", "Forward" },
    a = { "<cmd>HimalayaAttachments<cr>", "Download Attachments" },
    D = { "<cmd>HimalayaDelete<cr>", "Delete Mail" },
  },

  -- snippets
  s = {
    name = "Snippets",
    s = { "<cmd>Telescope luasnip<cr>", "Search" },
  },

  -- toggleterm tmux
   t = {
    name = "Terminal/tmux",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _BTOP_TOGGLE()<cr>", "Btop" },
    P = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    s = { "<cmd>Telescope tmux sessions<cr>", "Tmux Sessions" },
    w = { "<cmd>Telescope tmux windows<cr>", "Tmux windows" },
    p = { "<cmd>Telescope tmux pane_contents<cr>", "Tmux Panes" },
  },

  -- trouble
  x = {
    name = "Trouble",
    x = { "<cmd>TroubleToggle<cr>", "Toggle" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
    l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
  }
}

which_key.setup(setup)
which_key.register(mappings, opts)
