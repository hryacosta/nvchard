local overrides = require "custom.configs.overrides"

local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = "BufWritePre",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format { formatters = { "injected" } }
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
  },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
  },

  { "nvim-neotest/neotest-plenary" },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "sidlatau/neotest-dart",
      "rcasia/neotest-java",
      "rouge8/neotest-rust",
    },
    opts = {
      adapters = { "neotest-plenary" },
      status = { virtual_text = true },
      output = { open_on_run = true },
      quickfix = {
        open = function()
          require("trouble").open { mode = "quickfix", focus = false }
        end,
      },
    },
    config = function(_, opts)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            -- Replace newline and tab characters with space for more compact diagnostics
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      opts.consumers = opts.consumers or {}
      opts.consumers.trouble = function(client)
        client.listeners.results = function(adapter_id, results, partial)
          if partial then
            return
          end
          local tree = assert(client:get_position(nil, { adapter = adapter_id }))

          local failed = 0
          for pos_id, result in pairs(results) do
            if result.status == "failed" and tree:get_key(pos_id) then
              failed = failed + 1
            end
          end
          -- vim.schedule(function()
          --   local trouble = require "trouble"
          --   if trouble.is_open() then
          --     trouble.refresh()
          --     if failed == 0 then
          --       trouble.close()
          --     end
          --   end
          -- end)
          return {}
        end
      end
      opts.adapters = require "custom.configs.neotest"
      require("neotest").setup(opts)
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {},
    config = function()
      require "custom.configs.neodev"
    end,
    lazy = false,
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension "lazygit"
    end,
  },
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    lazy = false,
    config = function()
      require("tabnine").setup {
        disable_auto_comment = true,
        accept_keymap = "<C-g>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt", "NvimTree" },
        log_file_path = nil, -- absolute path to Tabnine log file
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- {
  --   "mbbill/undotree",
  --   lazy = false,
  -- },

  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension "lazygit"
    end,
    lazy = false,
  },

  {
    "f-person/git-blame.nvim",
    lazy = false,
  },

  { "tpope/vim-fugitive", lazy = false },

  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
    init = function()
      require("flutter-tools").setup {}
    end,
  },

  {
    "mortepau/codicons.nvim",
    config = function()
      require("codicons").setup()
    end,
  },

  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension "flutter"
        require("telescope").load_extension "fzf"
      end,
    },
  },

  {
    "andythigpen/nvim-coverage",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    rocks = { "lua-xmlreader" },
    config = function()
      require("coverage").setup()
    end,
    init = function()
      require("coverage").setup()
    end,
  },

  {
    "gelguy/wilder.nvim",
    config = function()
      require("wilder").setup { modes = { ":", "/", "?" } }
    end,
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
  },
  -- {
  --   "stevearc/oil.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   init = function()
  --     require "custom.configs.oil"
  --   end,
  -- },
}

return plugins
