require "nvchad.mappings"
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Spider
map({ "n", "v" }, "w", ":lua require('spider').motion('w')<CR>", { silent = true, noremap = true })
map({ "n", "v" }, "e", ":lua require('spider').motion('e')<CR>", { silent = true, noremap = true })
map({ "n", "v" }, "b", ":lua require('spider').motion('b')<CR>", { silent = true, noremap = true })
map({ "n", "v" }, "ge", ":lua require('spider').motion('ge')<CR>", { silent = true, noremap = true })

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
map("n", "<leader>ss", ":SessionSave<CR>", { silent = true, noremap = true, desc = "Session save" })
map("n", "<leader>sr", ":SessionRestore<CR>", { silent = true, noremap = true, desc = "Session restore" })
map("n", "<leader>fss", ":Autosession search<CR>", { silent = true, noremap = true, desc = "Auto-session search" })
map("n", "<leader>fsd", ":Autosession delete<CR>", { silent = true, noremap = true, desc = "Auto-session delete" })
