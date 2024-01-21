---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- neotree--
    ["<leader>e"] = {
      vim.cmd.NvimTreeToggle,
      "toggle nvimTree",
    },
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    ["<C-s>"] = { "<cmd>w<cr><esc>", "Save file" },
    ["<C-q>"] = { "<cmd>qa<cr>", "Quit all" },
    ["<leader>rd"] = { vim.lsp.buf.references, "references" },

    -- harpoon mark ---
    ["<leader>a"] = {
      function()
        local mark = require "harpoon.mark"
        mark.add_file()
      end,
      "mark file",
    },
    ["<C-e>"] = {
      function()
        local ui = require "harpoon.ui"
        ui.toggle_quick_menu()
      end,
    },
    ["<C-n>"] = {
      function()
        local ui = require "harpoon.ui"
        ui.nav_file(1)
      end,
    },
    ["<C-b>"] = {
      function()
        local ui = require "harpoon.ui"
        ui.nav_file(2)
      end,
    },

    --undotree ---
    ["<leader>u"] = {
      vim.cmd.UndotreeToggle,
      "Undo tree",
    },

    --- neotest ---
    ["<leader>tt"] = {
      function()
        local neotest = require "neotest"
        neotest.run.run(vim.fn.expand "%")
      end,
      "Run File",
    },
    ["<leader>tT"] = {
      function()
        local neotest = require "neotest"
        neotest.run.run(vim.loop.cwd())
      end,
      "Run All Test Files",
    },
    ["<leader>tr"] = {
      function()
        local neotest = require "neotest"
        neotest.run.run()
      end,
      "Run Nearest",
    },
    ["<leader>ts"] = {
      function()
        local neotest = require "neotest"
        neotest.summary.toggle()
      end,
      "Toggle Summary",
    },
    ["<leader>to"] = {
      function()
        local neotest = require "neotest"
        neotest.output.open { enter = true, auto_close = true }
      end,
      "Show Output",
    },
    ["<leader>tO"] = {
      function()
        local neotest = require "neotest"
        neotest.output_panel.toggle()
      end,
      "Toggle Output Panel",
    },
    ["<leader>tS"] = {
      function()
        local neotest = require "neotest"
        neotest.run.stop()
      end,
      "Stop",
    },

    -- tabnine --
    ["<leader>c1"] = {
      function()
        require("tabnine.chat").open()
      end,
      desc = "to open Tabnine Chat",
    },

    -- git --
    ["<leader>gg"] = { vim.cmd.LazyGit, "lazygit" },
    ["<leader>gc"] = { "<cmd>GitBlameOpenCommitURL<cr>", "open commit" },
    ["<leader>gf"] = { "<cmd>GitBlameOpenFileURL<cr>", "open the file" },
    ["<leader>gs"] = { vim.cmd.Git, "git status" },

    --- export ---
    ["<leader>pv"] = { vim.cmd.Ex },

    -- trouble --
    ["<leader>lx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
    ["<leader>lX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)" },
    ["<leader>lL"] = { "<cmd>TroubleToggle loclist<cr>", "Location List (Trouble)" },
    ["<leader>lQ"] = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix List (Trouble)" },
    ["[q"] = {
      function()
        if require("trouble").is_open() then
          require("trouble").previous { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      "Previous trouble/quickfix item",
    },
    ["]q"] = {
      function()
        if require("trouble").is_open() then
          require("trouble").next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      "Next trouble/quickfix item",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<C-s>"] = { "<cmd>w<cr><esc>", "Save file" },

    --tabnine ---
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
