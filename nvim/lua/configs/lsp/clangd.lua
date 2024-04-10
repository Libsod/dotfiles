local on_attach = require("configs.lspconfig").on_attach
local on_init = require("configs.lspconfig").clangd_on_init
local capabilities = require("configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.clangd.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "-j=12",
    "--enable-config",
    "--background-index",
    "--pch-storage=memory",
    "--query-driver=/opt/homebrew/opt/llvm/bin/clang++,/opt/homebrew/opt/llvm/bin/clang",
    "--clang-tidy",
    "--all-scopes-completion",
    "--completion-style=detailed",
    "--header-insertion-decorators",
    "--header-insertion=iwyu",
    "--limit-references=3000",
    "--limit-results=350",
  },
}
