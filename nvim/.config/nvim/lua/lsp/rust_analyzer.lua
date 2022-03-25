local M = {}

M.setup = function(on_attach, capabilities)
    require("lspconfig").rust_analyzer.setup({
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "by_self",
                },
                cargo = {
                    loadOutDirsFromCheck = true
                },
                procMacro = {
                    enable = true
                },
            }
        },
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
