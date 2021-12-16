set completeopt=menuone,noselect

lua << EOF
require'compe'.setup({
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
})
EOF


lua << EOF
local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
}

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}

local null_ls = require("null-ls")
null_ls.config({
    sources = {
      null_ls.builtins.diagnostics.eslint, -- eslint or eslint_d
      null_ls.builtins.code_actions.eslint, -- eslint or eslint_d
      null_ls.builtins.formatting.prettier -- prettier, eslint, eslint_d, or prettierd
    },
})

require("lspconfig")["null-ls"].setup({})

require'lspconfig'.efm.setup{
  root_dir = require'lspconfig'.util.root_pattern(".prettierrc", ".git"),
  on_attach = function(client)
    client.resolved_capabilities.goto_definition = false
  end,
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { ".git/", ".prettierrc" },
    languages = {
      html = { prettier },
      javascript = { prettier, eslint },
      typescript = { eslint, prettier },
      json = { prettier },
  	  vue = { prettier, eslint },
    }
  },
  filetypes = {
    "html",
    "javascript",
    "json",
    "vue",
  },
}

require'lspconfig'.clangd.setup{}

require'lspconfig'.gopls.setup{
  cmd = {"gopls", "serve"}
}

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

require'lspconfig'.tsserver.setup{
on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
}

require'lspconfig'.vuels.setup{
  root_dir = require'lspconfig'.util.root_pattern(".eslintrc.js", ".prettierrc", ".git"),
  init_options = {
    config = {
      vetur = {
        completion = {
          useScaffoldSnippets = true,
          tagCasing = "pascal",
        },
        format = {
          defaultFormatter = {
            html = "prettier",
            css = "prettier", 
            js = "prettier",
            sass = "sass-formatter",
          },
          options = {
            useTabs = false,
          },
          experimental = {
            templateInterpolationService = true,
          },
          dev = {
            logLevel = "DEBUG",
          },
        }
      }
    }
  }
}
EOF

nnoremap <leader>k :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>ff :lua vim.lsp.buf.formatting_sync(nil, 5000)<CR>
nnoremap <leader>ld :lua vim.lsp.diagnostic.set_loclist()<CR>
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
