local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "dart",
    "bash",
    "json",
    "python",
    "rust",
    "toml",
    "yaml",
    "json",
    "xml",
    "jsdoc",
    "gitignore",
    "gitattributes",
    "git_rebase",
    "gitignore",
    "git_config",
    "gitcommit",
    "graphql",
    "cpp",
    "cmake",
    "java",
  },
  indent = {
    enable = true,
    disable = {
      "dart",
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    "rust_analizer",
    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "eslint",
    "prettier",
    "prettierd",
    "eslint_d",
    "google-java-format",
    "standardjs",
    "gradle-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = false,
      },
    },
  },
}

return M
