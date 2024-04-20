local M = {}
local map = vim.keymap.set

local excluded_servers = {
  "clangd",
  "tsserver",
}

local def_on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

-- export on_attach & capabilities
M.on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Lsp Go to declaration")
  map("n", "K", vim.lsp.buf.hover, opts "Lsp hover information")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Lsp Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Lsp Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Lsp Remove workspace folder")

  -- Glance
  map("n", "gd", ":Glance definitions<CR>", { silent = true, noremap = true, desc = "Lsp Go to definition" })
  map("n", "gr", ":Glance references<CR>", { silent = true, noremap = true, desc = "Lsp Go to references" })
  map("n", "gy", ":Glance type_definitions<CR>", { silent = true, noremap = true, desc = "Lsp Go to type definitions" })
  map("n", "gi", ":Glance implementations<CR>", { silent = true, noremap = true, desc = "Lsp Go to implementation" })

  -- Lsp-signature
  local signature = require "lsp_signature"
  local signature_setup = require("configs.lsp-signature").options
  signature.on_attach(signature_setup, bufnr)

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "Lsp List workspace folders")

  map("n", "<leader>ra", function()
    require "nvchad.lsp.renamer"()
  end, opts "Lsp NvRenamer")

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Lsp Code action")

  if client.supports_method "textDocument/inlayHint" and not vim.tbl_contains(excluded_servers, client.name) then
    vim.lsp.inlay_hint.enable(bufnr, true)
  end

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local diagnostic_opts = {
        virtual_text = false,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
          scope = "cursor",
        },
      }

      vim.diagnostic.config(diagnostic_opts)
    end,
  })
end

-- disable semanticTokens
M.on_init = function(client, _)
  def_on_init(client, _)
end

-- Ruff_lsp on_init custom function
M.ruff_lsp_on_init = function(client, _)
  def_on_init(client, _)
  client.server_capabilities.hoverProvider = false
end

M.tsserver_on_init = function(client, _)
  def_on_init(client, _)
  -- Change highglight group for parens in .ts[x] files
  local hi = vim.api.nvim_set_hl
  hi(0, "typescriptParens", { bg = "NONE" })
end

M.clangd_on_init = function(client, _)
  def_on_init(client, _)
  require("clangd_extensions.inlay_hints").setup_autocmd()
  require("clangd_extensions.inlay_hints").set_inlay_hints()
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.defaults = function()
  dofile(vim.g.base46_cache .. "lsp")
  require "nvchad.lsp"

  require("lspconfig").lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    on_init = M.on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }
end

return M
