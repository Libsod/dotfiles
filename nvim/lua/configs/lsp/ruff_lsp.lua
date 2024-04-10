local on_attach = require("configs.lspconfig").on_attach
local on_init = require("configs.lspconfig").ruff_lsp_on_init
local capabilities = require("configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.ruff_lsp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
