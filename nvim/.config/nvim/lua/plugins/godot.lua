return {
  "habamax/vim-godot",
  version = "*",
  lazy = false,
  config = function()
    require("lspconfig").gdscript.setup {
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }

    local cmp = require "cmp"

    cmp.setup {
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
      },

      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
      },
    }
  end,
}
