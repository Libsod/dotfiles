local M = {}

M.cfg = {
  hint_enable = false,
  wrap = false,
  max_width = 115,
  floating_window_off_x = 5, -- adjust float windows x position.
  floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
    local pumheight = vim.o.pumheight
    local winline = vim.fn.winline() -- line number in the window
    local winheight = vim.fn.winheight(0)

    -- window top
    if winline - 1 < pumheight then
      return pumheight
    end

    -- window bottom
    if winheight - winline < pumheight then
      return -pumheight
    end
    return 0
  end,
}

M.on_attach = {
  bind = true,
  handler_opts = {
    border = "border",
  },
}

return M
