local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    html = { "prettierd" },
    sh = { "shfmt" },
    dart_format = {
      command = "~/flutter/bin/dart",
    },
    markdown = { "prettierd" },
    python = { "isort", "black" },
    yaml = { "prettierd" },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  format_on_save = function(bufnr)
    local ignore_filetypes = {}
    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      return
    end
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    -- Disable autoformat for files in a certain path
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match "/node_modules/" then
      return
    end
    return {
      timeout_ms = 500,
      lsp_fallback = true,
      async = true,
    }
  end,

  format_after_save = {
    lsp_fallback = true,
  },

  notify_on_error = true,
}

require("conform").setup(options)
