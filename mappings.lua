---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    ["<C-s>"] = { "<cmd>w<cr><esc>", "Save file" },
    ["q"] = { "<cmd>qa<cr>", "Quit all" },

    -- git --
    ["<leader>gg"] = {
      ":LazyGit<CR>",
      "open lazygitj",
    },

    --- neotest ---
    ["<leader>tt"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      "Run File",
    },
    ["<leader>tT"] = {
      function()
        require("neotest").run.run(vim.loop.cwd())
      end,
      "Run All Test Files",
    },
    ["<leader>tr"] = {
      function()
        require("neotest").run.run()
      end,
      "Run Nearest",
    },
    ["<leader>ts"] = {
      function()
        require("neotest").summary.toggle()
      end,
      "Toggle Summary",
    },
    ["<leader>to"] = {
      function()
        require("neotest").output.open { enter = true, auto_close = true }
      end,
      "Show Output",
    },
    ["<leader>tO"] = {
      function()
        require("neotest").output_panel.toggle()
      end,
      "Toggle Output Panel",
    },
    ["<leader>tS"] = {
      function()
        require("neotest").run.stop()
      end,
      "Stop",
    },
    ["<leader>ut"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },

    ["<leader>c1"] = {
      function()
        require("tabnine.chat").open()
      end,
      desc = "to open Tabnine Chat",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<C-s>"] = { "<cmd>w<cr><esc>", "Save file" },
    ["<leader>c2"] = {
      function()
        require("tabnine.chat.codelens").run_under_cursor "/explain-code"
      end,
      "to open Tabnine ExplainCode",
    },

    ["<leader>c3"] = {
      function()
        require("tabnine.chat.codelens").run_under_cursor "/generate-test-for-code"
      end,
      "to open Tabnine TestCode",
    },

    ["<leader>c4"] = {
      function()
        require("tabnine.chat.codelens").run_under_cursor "/fix-code"
      end,
      desc = "to open Tabnine FixCode",
    },
  },
  i = {
    ["<C-s>"] = { "<cmd>w<cr><esc>", "Save file" },
  },
}
-- more keybinds!

return M
