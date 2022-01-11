local M = {}

M.setup = function(on_attach, capabilities)
    require("lspconfig").gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
	cmd = {"gopls", "serve"}
    })
end

return M
