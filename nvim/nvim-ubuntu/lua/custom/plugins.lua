local overrides = require "custom.configs.overrides"

--@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  "ahmedkhalf/project.nvim",
  {
    "phaazon/hop.nvim",
    lazy = false,
    config = function()
      require "custom.configs.hop"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      -- require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
    lazy = false,
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded",
        },
      }
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    lazy = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        -- exclude = { vim.fn.stdpath "config" .. "" },
      },
    },
    lazy = false,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "tami5/sqlite.lua" }, -- NOTE: need to install sqlite lib
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "Telescope",
    init = function()
      require("core.utils").load_mappings "telescope"
    end,
    opts = function()
      return require "custom.configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
    lazy = false,
  },

  { "nvim-telescope/telescope-ui-select.nvim", lazy = true },
  { "nvim-telescope/telescope-rg.nvim", lazy = true },
  -- { "nvim-telescope/telescope-dap.nvim", laze = true },
  { "nvim-telescope/telescope-live-grep-args.nvim", lazy = false },
  { "nvim-telescope/telescope-fzf-native.nvim", lazy = true },
  { "nvim-telescope/telescope-project.nvim", lazy = false },
  { "jedrzejboczar/possession.nvim", lazy = false },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    lazy = false,
  },
  -- {
  --   "nvim-telescope/telescope-fzf-native.nvim",
  --   run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  -- },
  --
  {
    "Shatur/neovim-session-manager",
    config = function()
      require "custom.configs.session-manager"
    end,
    lazy = false,
  },

  {
    "rmagatti/auto-session",
    config = function()
      require "custom.configs.auto-session"
      -- require("auto-session").setup {
      --   log_level = "error",
      --   auto_session_suppress_dirs = { "~/.cache/nvim/" },
      --   auto_session_enable_last_session = false,
      --   cwd_change_handling = {
      --     restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
      --     pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
      --     post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
      --       require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
      --     end,
      --   },
      -- }
    end,
    lazy = false,
  },

  -- session manager
  {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    init = function()
      local possession = require "nvim-possession"
      vim.keymap.set("n", "<leader>sl", function()
        possession.list()
      end)
      vim.keymap.set("n", "<leader>sn", function()
        possession.new()
      end)
      vim.keymap.set("n", "<leader>su", function()
        possession.update()
      end)
      vim.keymap.set("n", "<leader>sd", function()
        possession.delete()
      end)
    end,
    config = function()
      require("nvim-possession").setup {
        auto_save = true,
        auto_load = true,
      }
    end,
  },

  {
    "tanvirtin/vgit.nvim",
    lazy = false,
    config = function()
      require "custom.configs.vgit"
    end,
  },

  {
    "nvim-pack/nvim-spectre",
    lazy = false,
    config = function ()
      require "custom.configs.spectre"
    end,
  },

  -- {
  --   "ldelossa/litee.nvim",
  --   -- require('litee.lib').setup({})
  --   "ldelossa/litee-calltree.nvim",
  --   require('litee.calltree').setup({}),
  --   lazy = false,
  -- }

  -- {
  --   'crusj/hierarchy-tree-go.nvim',
  --   -- requires='neovim/nvim-lspconfig',
  --   require("hierarchy-tree-go").setup({
  --     icon = {
  --         fold = "", -- fold icon
  --         unfold = "", -- unfold icon
  --         func = "₣", -- symbol
  --         last = '☉', -- last level icon
  --     },
  --     hl = {
  --         current_module = "guifg=Green", -- highlight cwd module line
  --         others_module = "guifg=Black", -- highlight others module line
  --         cursorline = "guibg=Gray guifg=White" -- hl  window cursorline
  --     },
  --     keymap = {
  --         --global keymap
  --         incoming = "<space>fi", -- call incoming under cursorword
  --         outgoing = "<space>fo", -- call outgoing under cursorword
  --         open = "<space>ho", -- open hierarchy win
  --         close = "<space>hc", -- close hierarchy win
  --         -- focus: if hierarchy win is valid but is not current win, set to current win
  --         -- focus: if hierarchy win is valid and is current win, close
  --         -- focus  if hierarchy win not existing,open and focus
  --         focus = "<space>fu",
  --
  --         -- bufkeymap
  --         expand = "o", -- expand or collapse hierarchy
  --         jump = "<CR>", -- jump
  --         move = "<space><space>" -- switch the hierarchy window position, must be current win
  --     }
  --   })
  --
  -- }
  -- use {
  --   "nvim-telescope/telescope-frecency.nvim",
  --   requires = {"tami5/sqlite.lua"}   -- NOTE: need to install sqlite lib
  -- }
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
