---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<C-q>"] = { "<cmd> q <CR>", "Quit file" },
    -- resize buffer
    ["<Up>"] = { ":resize -5<CR>", "Move up buffer" },
    ["<Down>"] = { ":resize +5<CR>", "Move down buffer" },
    ["<Left>"] = { ":vertical resize -5<CR>", "Move left buffer" },
    ["<Right>"] = { ":vertical resize +5<CR>", "Move down buffer" },

    ["J"] = { "5j", "Move down faster" },
    ["K"] = { "5k", "Move up faster" },
    ["sv"] = { ":vsplit" },
  },
  v = {
    ["J"] = { "5j", "Move down faster" },
    ["K"] = { "5k", "Move up faster" },
    ["<"] = { "<gv", "Continue move left" },
    [">"] = { ">gv", "Continue move right" },
  },
  t = {
    ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Move down from term" },
    ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Move up from term" },
    ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Move left from term" },
    ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Move right from term" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<space>f"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<space>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<space>w"] = { "<cmd> Telescope live_grep_args <CR>", "Live grep" },
    ["<space>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<space>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<space>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<space>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<space>s"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Find document symbols" },
    ["<space>S"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "Find current document symbols" },
    ["<space>p"] = { "<cmd> SessionManager load_session<CR>", "session manager load sessions" },
    ["<space>d"] = { "<cmd> SessionManager delete_session<CR>", "session manager delete sessions"},

    -- -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>st"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>gb"] = { '<cmd> Telescope git_branches <CR>', "Git branches"},
    ["<leader>gf"] = { '<cmd> Telescope git_files <CR>', "Git find files"},

    -- pick a hidden term
    ["<space>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<space>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    -- bookmarks, seems useless for me
    ["<space>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}
-- more keybinds!
M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<space>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.lspconfig = {
  plugin = true,
  n = {
    ["<leader>t"] = { "<cmd> lua vim.lsp.buf.definition()<CR>" },
    ["<leader>dr"] = { "<cmd> lua vim.lsp.buf.declaration()<CR>" },
    ["<leader>u"] = { "<cmd> Telescope lsp_references<CR>" },
    ["<leader>c"] = { "<cmd> Telescope lsp_incoming_calls<CR> " },
    ["<leader>f"] = { "<cmd> lua vim.lsp.buf.format()<CR>" },
    ["<leader>d"] = { "<cmd> lua vim.lsp.buf.document_symbol()<CR>" },
    ["<leader>i"] = { "<cmd> lua vim.lsp.buf.document_symbol()<CR>" },
    -- ["<leader>ic"] = { "<cmd> lua vim.lsp.buf.incoming_calls()<CR>"},
    -- ["<leader>U"] = { ":lua require('custom.tools.utils').GtagsRefernce()<CR>" },
    -- ["<leader>T"] = { ":lua require('custom.tools.utils').GtagsText()<CR>" },
  },
  v = {
    ["<leader>f"] = { "<cmd> lua vim.lsp.buf.format()<CR>" },
  },
}

return M
