local on_attach = require("configs.lspconfig").on_attach
local on_init = require("configs.lspconfig").on_init
local capabilities = require("configs.lspconfig").capabilities

vim.notify = require("noice").notify
require("lspconfig.ui.windows").default_options.border = "rounded"

local lspconfig = require "lspconfig"

-- File-based lsp configs
require "configs.lsp.clangd"
require "configs.lsp.tsserver"
require "configs.lsp.ruff_lsp"

local servers = {
  "html",
  "cssls",
  "zls",
  "astro",
  "svelte",
  "tailwindcss",
  "marksman",
  "eslint",
  "jsonls",
  "yamlls",
  "jdtls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
  },
}

lspconfig.neocmake.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "neocmakelsp", "--stdio" },
  root_dir = function(fname)
    return lspconfig.util.find_git_ancestor(fname)
  end,
  single_file_support = true, -- suggested
  init_options = {
    format = {
      enable = true,
    },
    scan_cmake_in_package = true, -- default is true
  },
}
