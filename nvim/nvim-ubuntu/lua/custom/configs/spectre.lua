local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
  vim.notify("spectre not found!")
  return
end

spectre.setup()

vim.keymap.set('n', '<leader>r', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>rw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>rp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
