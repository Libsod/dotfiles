require "nvchad.mappings"
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

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

map("n", "cw", "c<cmd>lua require('spider').motion('e')<CR>")

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
map("n", "<leader>n", ":Neogit<CR>", { silent = true, noremap = true })

-- Telescope
map(
  "n",
  "<leader>ff",
  ":Telescope find_files follow=true no_ignore=false hidden=true <CR>",
  { silent = true, noremap = true, desc = "Find all" }
)
map("n", "<leader>ft", ":TodoTelescope<CR>", { silent = true, noremap = true })

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
map("n", "<leader>ws", ":SessionSave<CR>", { silent = true, noremap = true, desc = "Session save" })
map("n", "<leader>wr", ":SessionRestore<CR>", { silent = true, noremap = true, desc = "Session restore" })
map("n", "<leader>fss", ":Autosession search<CR>", { silent = true, noremap = true, desc = "Auto-session search" })
map("n", "<leader>fsd", ":Autosession delete<CR>", { silent = true, noremap = true, desc = "Auto-session delete" })

-- Substitute
map("n", "s", require("substitute").operator, { noremap = true })
map("n", "ss", require("substitute").line, { noremap = true })
map("n", "S", require("substitute").eol, { noremap = true })
map("x", "s", require("substitute").visual, { noremap = true })
map("n", "<leader>s", require("substitute.range").operator, { noremap = true })
map("x", "<leader>s", require("substitute.range").visual, { noremap = true })
map("n", "<leader>ss", require("substitute.range").word, { noremap = true })
