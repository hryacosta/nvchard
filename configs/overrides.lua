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
    "cpp",
    "dart",
    "bash",
    "python",
    "yaml",
    "sql",
    "gitignore",
    "java",
    "json",
    "jsdoc",
    "gitattributes",
    "rust",
    "cmake",
    "luadoc",
    "kotlin",
    "c",
    "go",
  },
  auto_install = true,

  highlight = {
    enable = false,
  },
  indent = {
    enable = true,
    disable = {
      "dart",
      "json",
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
    "prettierd",
    "eslint_d",
    "eslint_lsp",
    "gradle-language-server",
    "dart-debug-adapter",
    "swift-mesonlsp",
    "java-debug-adapter",
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
