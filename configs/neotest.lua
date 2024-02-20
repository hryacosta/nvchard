local adapters = {
  require "neotest-jest" {
    jestCommand = "npx jest --coverage --maxWorkers=2 --forceExit",
    -- jestConfigFile = "jest.config.js",
    -- env = { CI = true },
    -- cwd = function(path)
    --   return vim.fn.getcwd()
    -- end,
    jestConfigFile = function()
      local file = vim.fn.expand "%:p"
      if string.find(file, "/packages/") then
        return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
      end

      return vim.fn.getcwd() .. "/jest.config.ts"
    end,
    env = { CI = true },
    cwd = function(path)
      return vim.fn.getcwd()
    end,
  },

  require "neotest-dart" {
    command = "flutter", -- Command being used to run tests. Defaults to `flutter`
    -- Change it to `fvm flutter` if using FVM
    -- change it to `dart` for Dart only tests
    use_lsp = true, -- When set Flutter outline information is used when constructing test name.
    -- Useful when using custom test names with @isTest annotation
    custom_test_method_names = {},
  },
  require "neotest-java" {
    ignore_wrapper = false,
  },
  require "neotest-rust" {
    args = { "--no-capture" },
    dap_adapter = "lldb",
  },
}

return adapters
