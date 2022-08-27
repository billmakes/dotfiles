local M = {}

M.config = function()
  lvim.plugins = {
    { "nvim-treesitter/nvim-treesitter-context" },
    { "folke/tokyonight.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "simrat39/symbols-outline.nvim",
      config = function()
        require("user.symbols_outline").config()
      end,
      event = "BufReadPost",
      disable = lvim.builtin.tag_provider ~= "symbols-outline",
    },
    {
      "simrat39/rust-tools.nvim",
      config = function()
        require("user.rust_tools").config()
      end,
    },
    {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
        require("lsp_lines").setup()
      end,
      event = "BufRead",
      disable = not lvim.builtin.lsp_lines,

    },
  }
end

return M
