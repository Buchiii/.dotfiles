return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ansiblels",
        "bashls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "lua_ls",
        "gopls",
        "html",
        "puppet",
        "pylsp",
        "solargraph",
        "texlab",
      },
    })
  end,
}
