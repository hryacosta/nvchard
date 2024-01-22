local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "dartls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
--
-- lspconfig.eslint.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   sourceName = "eslint",
--   command = "eslint_d",
--   rootPatterns = { ".eslintrc.js", ".eslintrc", "package.json" },
--   debounce = 100,
--   args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
--   parseJson = {
--     errorsRoot = "[0].messages",
--     line = "line",
--     column = "column",
--     endLine = "endLine",
--     endColumn = "endColumn",
--     message = "${message} [${ruleId}]",
--     security = "severity",
--   },
--   securities = { [2] = "error", [1] = "warning" },
-- }
lspconfig.eslint.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}
