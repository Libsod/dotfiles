return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig").defaults()
      require "configs.lsp.lspconfig"
    end,
    dependencies = {
      {
        "ray-x/lsp_signature.nvim",
        config = function()
          local opts = require("configs.lsp-signature").cfg
          require("lsp_signature").setup(opts)
        end,
      },
    },
  },

  {
    "dnlhc/glance.nvim",
    cmd = { "Glance" },
    config = function()
      require "configs.glance"
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble", "TroubleRefresh" },
    config = function()
      require "configs.trouble"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
    dependencies = {
      "lukas-reineke/cmp-under-comparator",
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = function()
      return require "configs.blankline"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

      require("ibl").setup(opts)
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      dofile(vim.g.base46_cache .. "treesitter")
      require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require "configs.ts-autotag"
        end,
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
    cmd = "Telescope",
    opts = function()
      return require "configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },

    config = function()
      require "configs.neoscroll"
    end,
  },

  {
    "phaazon/hop.nvim",
    cmd = { "HopWordMW", "HopLineMW", "HopChar1MW", "HopChar2MW" },
    branch = "v2", -- optional but strongly recommended
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },

  {
    "chrisgrieser/nvim-spider",
    keys = { "w", "e", "b", "ge" },
  },

  {
    "kylechui/nvim-surround",
    keys = { "ys", "ds", "cs" },
    version = "*",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufWritePre" },
    config = function(_, opts)
      require("colorizer").setup(opts)
    end,
  },

  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "h", "hpp" },
    config = function()
      require "configs.clangd"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.noice"
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          require "configs.notify"
        end,
      },
    },
  },

  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    config = function()
      require "configs.oil"
    end,
  },

  {
    "NeogitOrg/neogit",
    branch = "nightly",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
  },

  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    config = function()
      require "configs.neodim"
    end,
  },

  {
    "LunarVim/bigfile.nvim",
    lazy = false,
    config = function()
      require "configs.bigfile"
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        comments_only = false, -- uses treesitter to match keywords in comments only
      },
    },
  },

  {
    "folke/paint.nvim",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require "configs.paint"
    end,
  },

  {
    "ojroques/nvim-bufdel",
    cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
  },

  {
    "tzachar/local-highlight.nvim",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require "configs.local-highlight"
    end,
  },

  {
    "rmagatti/auto-session",
    cmd = { "SessionSave", "SessionRestore", "Autosession" },
    config = function()
      require "configs.auto-session"
    end,
  },

  {
    "gbprod/substitute.nvim",
    keys = { "s", "ss", "S" },
    opts = function()
      return require "configs.substitute"
    end,
  },

  {
    "nvim-pack/nvim-spectre",
    cmd = { "Spectre" },
  },

  {
    "abecodes/tabout.nvim",
    event = "InsertCharPre",
    config = function()
      require "configs.tabout"
    end,
  },
}
