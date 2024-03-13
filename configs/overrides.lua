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

    "js-debug-adapter",
    "java-debug-adapter",
    "java-test",
    "prettier",
    "standardjs",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "prettierd",
    "eslint_d",
    "eslint-lsp",
    "gradle-language-server",
    "dart-debug-adapter",
    "swift-mesonlsp",
    "java-debug-adapter",
    "node-debug2-adapter",
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

M.copilot = {
  -- Possible configurable fields can be found on:
  -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
  suggestion = {
    enable = false,
  },
  panel = {
    enable = false,
  },
}

return M
