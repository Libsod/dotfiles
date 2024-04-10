return function()
  require("nvim-ts-autotag").setup {
    filetypes = {
      "html",
      "astro",
      "svelte",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "xml",
    },
  }
end
