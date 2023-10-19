local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
  -- { "numToStr/Comment.nvim"},
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "moll/vim-bbye" },
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/toggleterm.nvim" },
  { "ahmedkhalf/project.nvim" },
  { "lewis6991/impatient.nvim" },
  { "goolord/alpha-nvim" },
  { "folke/which-key.nvim" },

  -- Colorschemes

  { "ayu-theme/ayu-vim" },
  { "lunarvim/darkplus.nvim" },
  { "rktjmp/lush.nvim" },
  { "metalelf0/jellybeans-nvim" },

  -- cmp plugins
  { "hrsh7th/nvim-cmp" }, -- The completion plugin,
  { "hrsh7th/cmp-buffer" }, -- buffer completions,
  { "hrsh7th/cmp-path" }, -- path completions,
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions,
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },

  -- snippets
  --   { "L3MON4D3/LuaSnip" }, --snippet engine,
  { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use,

  -- LSP
  -- ({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
  { "tamago324/nlsp-settings.nvim" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },

  -- Godot
  { "habamax/vim-godot" },

  -- DAP
  -- ({ "puremourning/vimspector" })
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },

  -- Jest testing
  { "David-Kunz/jester" },

  -- Nav
  { "kevinhwang91/rnvimr" },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter"
  },
  { "nvim-treesitter/nvim-treesitter-context" },

  -- Git
  { "lewis6991/gitsigns.nvim" },
  { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
  { "ThePrimeagen/git-worktree.nvim" },
}

local opts = {
  defaults = {
    lazy = false,
  }
}
require("lazy").setup(plugins, opts)

--   -- Automatically set up your configuration after cloning packer.nvim
--   -- Put this at the end after all plugins
--   if PACKER_BOOTSTRAP then
--     require("packer").sync()
--   end
-- end)
