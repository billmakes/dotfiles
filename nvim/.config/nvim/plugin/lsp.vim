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

require'lspconfig'.efm.setup{
  root_dir = require'lspconfig'.util.root_pattern(".prettierrc", ".git"),
  on_attach = function(client)
    client.resolved_capabilities.goto_definition = false
  end,
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { ".git/", "remaxweb/", ".prettierrc" },
    languages = {
      javascript = { prettier, eslint },
      typescript = { prettier, eslint },
      json = { prettier },
  	  vue = { eslint },
    }
  },
  filetypes = {
    "javascript",
    "json",
    "vue",
  },
}

require'lspconfig'.clangd.setup{}

require'lspconfig'.gopls.setup{
  cmd = {"gopls", "serve"}
}

require'lspconfig'.tsserver.setup{
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.diagnostics = false
  end,
}

require'lspconfig'.vuels.setup{
  root_dir = require'lspconfig'.util.root_pattern(".prettierrc", ".git"),
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
            js = "prettier-eslint",
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
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>ff :lua vim.lsp.buf.formatting_sync(nil, 5000)<CR>
nnoremap <leader>ld :lua vim.lsp.diagnostic.set_loclist()<CR>
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
