require "nvchad.mappings"
local map = vim.keymap.set

-- Faster opening of vim-cli mode
map("n", ";", ":", { desc = "CMD enter command mode" })

-- More convenient escape
map("i", "jk", "<ESC>")

-- Dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { silent = true, expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { silent = true, expr = true })

-- Spider
map({ "n", "o", "x" }, "w", function()
  require("spider").motion "w"
end, { silent = true, noremap = true })
map({ "n", "o", "x" }, "e", function()
  require("spider").motion "e"
end, { silent = true, noremap = true })
map({ "n", "o", "x" }, "b", function()
  require("spider").motion "b"
end, { silent = true, noremap = true })
map({ "n", "o", "x" }, "ge", function()
  require("spider").motion "ge"
end, { silent = true, noremap = true })

map("n", "cw", "c<CMD>lua require('spider').motion('e')<CR>")

-- Hop
map("n", "gw", ":HopWordMW<CR>", { silent = true, noremap = true })
map("n", "<leader>k", ":HopLineMW<CR>", { silent = true, noremap = true })
map("n", "<leader>c", ":HopChar1MW<CR>", { silent = true, noremap = true })
map("n", "<leader>cc", ":HopChar2MW<CR>", { silent = true, noremap = true })

-- Trouble
map("n", "<leader>q", ":TroubleToggle<CR>", { silent = true, noremap = true })

-- TodoTrouble
map("n", "<leader>t", ":TodoTrouble<CR>", { silent = true, noremap = true })

-- Todojumping
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { silent = true, noremap = true, desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { silent = true, noremap = true, desc = "Previous todo comment" })

-- Neogit
map("n", "<leader>gn", ":Neogit<CR>", { silent = true, noremap = true })

-- Telescope
map(
  "n",
  "<leader>ff",
  ":Telescope find_files follow=true no_ignore=false hidden=true <CR>",
  { silent = true, noremap = true, desc = "Find all" }
)
map("n", "<leader>ft", ":TodoTelescope<CR>", { silent = true, noremap = true })
map("n", "<leader>fg", ":Telescope grep_string<CR>", { silent = true, noremap = true })
map("n", "<leader>fr", ":Telescope treesitter<CR>", { silent = true, noremap = true })

-- Oil
map("n", "<leader>o", ":Oil --float<CR>", { silent = true, noremap = true })

-- Bufdelete
map("n", "<leader>d", ":BufDel<CR>", { silent = true, noremap = true })

-- Toggle Inlay Hints
map(
  "n",
  "gh",
  ":lua require('configs.lspconfig').toggle_inlay_hints()<CR>",
  { silent = true, noremap = true, desc = "Toggle Inlay Hints" }
)

-- Auto-session
map("n", "<leader>sr", ":SessionRestore<CR>", { silent = true, noremap = true, desc = "Session restore" })
map("n", "<leader>ss", ":SessionSave<CR>", { silent = true, noremap = true, desc = "Session save" })
map("n", "<leader>fss", ":Autosession search<CR>", { silent = true, noremap = true, desc = "Auto-session search" })
map("n", "<leader>fsd", ":Autosession delete<CR>", { silent = true, noremap = true, desc = "Auto-session delete" })

-- Substitute
map("n", "s", function()
  require("substitute").operator()
end, { silent = true, noremap = true })
map("n", "ss", function()
  require("substitute").line()
end, { silent = true, noremap = true })
map("n", "S", function()
  require("substitute").eol()
end, { silent = true, noremap = true })
map("x", "s", function()
  require("substitute").visual()
end, { silent = true, noremap = true })

-- Spectre
map("n", "<leader>S", ':lua require("spectre").toggle()<CR>', { silent = true, desc = "Toggle Spectre" })
map(
  "v",
  "<leader>sw",
  '<esc>:lua require("spectre").open_visual()<CR>',
  { silent = true, desc = "Search current word" }
)
map(
  "n",
  "<leader>sw",
  ':lua require("spectre").open_visual({select_word=true})<CR>',
  { silent = true, desc = "Search current word" }
)
map(
  "n",
  "<leader>sf",
  ':lua require("spectre").open_file_search()<CR>',
  { silent = true, desc = "Search on current file" }
)
map(
  "n",
  "<leader>sp",
  ':lua require("spectre").open_file_search({select_word=true})<CR>',
  { silent = true, desc = "Search current word on current file" }
)

-- Noice
map("n", "<leader>nn", ":NoiceDismiss<CR>", { silent = true, noremap = true })
