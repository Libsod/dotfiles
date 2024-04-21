local cmp = require "cmp"

dofile(vim.g.base46_cache .. "cmp")

local cmp_ui = require("nvconfig").ui.cmp

local filetype = vim.fn.expand "%:e"

local compare = require "cmp.config.compare"
compare.lsp_scores = function(entry1, entry2)
  local diff
  if entry1.completion_item.score and entry2.completion_item.score then
    diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
  else
    diff = entry2.score - entry1.score
  end
  return (diff < 0)
end

local formatting_style = {
  fields = { "abbr", "kind" },

  format = function(_, item)
    local icons = require "nvchad.icons.lspkind"
    local icon = (cmp_ui.icons and icons[item.kind]) or ""

    icon = "" .. icon .. "  "
    item.kind = (icon .. item.kind) or ""
    item.menu = ""

    return item
  end,
}

comparators = {
  compare.offset, -- Items closer to cursor will have lower priority
  compare.exact,
  compare.scopes,
  compare.lsp_scores,
  compare.recently_used,
  compare.sort_text,
  compare.score,
  function()
    if filetype == "cpp" or "c" or "h" or "hpp" then
      require "clangd_extensions.cmp_scores"
    end
  end,
  require("cmp-under-comparator").under,
  compare.kind,
  compare.length,
  compare.order,
}

local options = {
  completion = {
    completeopt = "menu,menuone",
  },

  window = {
    completion = {
      border = "rounded",
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,FloatBorder:FloatBorder,Search:None",
      scrollbar = false,
      col_offset = -3,
      side_padding = 1,
      behavior = {
        insert = "always",
      },
    },
    documentation = {
      border = "rounded",
      winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
      scrollbar = false,
    },
  },
  experimental = {
    ghost_text = false,
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = formatting_style,

  matching = {
    disallow_partial_fuzzy_matching = false,
  },

  performance = {
    async_budget = 1,
  },

  mapping = {
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-q>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<C-n>"] = cmp.mapping(function(fallback)
      require("luasnip").expand_or_jumpable()
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
    end, {
      "i",
      "s",
    }),
    ["<C-p>"] = cmp.mapping(function(fallback)
      require("luasnip").jumpable(-1)
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
    end, {
      "i",
      "s",
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      fallback()
    end, {
      "i",
      "s",
    }),
  },

  comparators = {},

  sources = {
    {
      name = "nvim_lsp",
      max_item_count = 100,
      entry_filter = function(entry, ctx)
        local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
        if kind == "Snippet" and ctx.prev_context.filetype == "java" then
          return false
        end
        if kind == "Text" then
          return false
        end
        return true
      end,
    },
    { name = "luasnip" },
    { name = "luasnip_choice" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "buffer" },
    { name = "spell" },
    { name = "crates" },
    { name = "treesitter" },
    { name = "orgmode" },
    { name = "nvim_lsp_signature_help" },
    { name = "git" },
    { name = "tmux" },
    { name = "latex_symbols" },
  },
}

return options
