-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

vim.g.autoformat = true
opt.relativenumber = true -- Relative line numbers
opt.spelllang = "en_us"
opt.spell = true
