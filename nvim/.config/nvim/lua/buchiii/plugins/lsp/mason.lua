return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- import mason-tool-installer
    local mason_tool_installer = require("mason-tool-installer")

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

    mason_tool_installer.setup({
      ensure_installed = {
        "shellcheck",
        "shellharden",
        "beautysh",
        "latexindent",
        "stylua",
        "isort",
        "black",
        "rubocop",
        "rubyfmt",
        "pyink",
        "sqlfluff",
        "yamlfix",
        "yamlfmt",
      },
    })
  end,
}
