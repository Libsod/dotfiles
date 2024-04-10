local options = {
  alpha = 0.45,
  blend_color = "#414141",
  refresh_delay = 75, -- time in ms to wait after typing before refreshing diagnostics
  hide = {
    virtual_text = true,
    signs = false,
    underline = false,
  },
  priority = 80,
  disable = { "big_file_disabled_ft" },
}

return require("neodim").setup(options)
