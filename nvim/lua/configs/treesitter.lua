local options = {
  ensure_installed = { "lua", "vim", "vimdoc" },

  highlight = {
    enable = true,
    disable = function(ft, bufnr)
      if vim.tbl_contains({ "vim" }, ft) then
        return true
      end

      local ok, is_large_file = pcall(vim.api.nvim_buf_get_var, bufnr, "bigfile_disable_treesitter")
      return ok and is_large_file
    end,
    additional_vim_regex_highlighting = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
