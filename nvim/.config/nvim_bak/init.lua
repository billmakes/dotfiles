require "user.options"
require "user.keymaps"
require "user.colorscheme"
--require "user.cmp"
--require "user.lsp"
--require "user.telescope"
--require "user.treesitter"
--require "user.comment"
--require "user.gitsigns"
--require "user.lualine"
--require "user.toggleterm"
--require "user.project"
--require "user.impatient"
--require "user.alpha"
--require "user.whichkey"
--require "user.autocommands"

require("lazy").setup {
  spec = { import = "user.plugins" },
  defaults = { lazy = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}
