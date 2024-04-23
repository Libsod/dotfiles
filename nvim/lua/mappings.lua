local map = vim.keymap.set

-- Faster opening of vim-cli mode
map("n", ";", ":", { desc = "CMD enter command mode" })

-- More convenient escape
map("i", "jk", "<ESC>")

-- Navigation in insert mode
map("i", "<C-b>", "<ESC>^i", { desc = "Move Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move End of line" })

-- Allow moving the cursor through wrapped lines with <Up> and <Down>
map({ "n", "v", "x" }, "<Down>", "v:count == 1 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "v", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move lines up/down
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Clear highlights
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

-- Window management
map("n", "<C-h>", "<C-w>h", { desc = "Switch Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch Window up" })

-- File maps
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })
map("n", "<C-p>", "G$vgg0", { desc = "Select whole file" })

-- Formatting
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format Files" })

-- Global lsp mappings
map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "Lsp floating diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Lsp prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Lsp next diagnostic" })

-- Tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Buffer New" })
map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })
map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })
map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })

-- Comment
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle" })
map(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment Toggle" }
)

-- NvimTree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })

-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "Terminal New horizontal term" })
map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "Terminal New vertical window" })
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Terminal Toggleable vertical term" })
map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Terminal New horizontal term" })
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })
map("t", "<ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })

-- Which-key
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Whichkey all keymaps" })
map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "Whichkey query lookup" })

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

-- Todo-jumping
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
map("n", "<leader>fd", ":Telescope lsp_document_symbols<CR>", { silent = true, noremap = true })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope Help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Telescope Find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope Find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Telescope Git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "Telescope Pick hidden term" })
map("n", "<leader>fc", "<cmd>Telescope themes<CR>", { desc = "Telescope Nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })

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
map("n", "<leader>fss", ":Telescope session-lens<CR>", { silent = true, noremap = true, desc = "Session search" })

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

-- Tabout
map("i", "<C-f>", "<Tab>", { silent = true, noremap = true })
