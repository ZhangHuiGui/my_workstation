-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
-- local config
local g = vim.g

g.mapleader = ";"

vim.cmd([[
  augroup _open_nvim_tree
    autocmd! * <buffer>
    autocmd SessionLoadPost * silent! lua require("nvim-tree").toggle(false, true)
  augroup end
]])
