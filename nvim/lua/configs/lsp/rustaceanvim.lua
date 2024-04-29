local on_attach = require("configs.lspconfig").on_attach
local on_init = require("configs.lspconfig").rust_analyzer_on_init
local capabilities = require("configs.lspconfig").capabilities

vim.g.rustaceanvim = {
  tools = {
    hover_actions = {
      replace_builtin_hover = false,
    },
  },

  server = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    default_settings = {
      ["rust-analyzer"] = {
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
      },
    },
  },
}
