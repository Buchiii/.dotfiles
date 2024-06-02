return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        bash = { "shellcheck", "shellharden", "beautysh" },
        bibtex = { "bibtex-tidy" },
        latex = { "latexindent" },
        lua = { "stylua" },
        puppet = { "puppet-lint" },
        python = { "isort", "black" },
        ruby = { "rubyfmt" },
        sql = { "sql_formatter", "sqlfluff" },
        yaml = { "yamlfix" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
