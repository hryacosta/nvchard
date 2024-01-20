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
