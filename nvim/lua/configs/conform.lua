local conform = require "conform"

--type conform.options
local options = {
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    cpp = { "clang_format" },
    c = { "clang_format" },
    sh = { "shfmt" },
    yaml = { "prettier" },
    json = { "prettier" },
  },
}

conform.setup(options)
