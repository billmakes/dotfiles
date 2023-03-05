-- Setup mason.
local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local nlspsettings = require("nlspsettings")

nlspsettings.setup({
	config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
	local_settings_dir = ".nlsp-settings",
	local_settings_root_markers_fallback = { ".git" },
	append_default_schemas = true,
	loader = "json",
})

local lspconfig = require("lspconfig")

local mason_lspconfig = require("mason-lspconfig")

-- Automatic server setups here
mason_lspconfig.setup_handlers({
	-- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = require("user.lsp.handlers").on_attach,
			capabilities = require("user.lsp.handlers").capabilities,
		})
	end,

	-- ["rust_analyzer"] = function()
	-- 	require("rust-tools").setup({})
	-- end,
})

mason_lspconfig.setup({
	ensure_installed = { "lua_ls", "rust_analyzer" },
	automatic_installation = true,
})

local servers = { "jsonls", "lua_ls" }

-- Then we set up manual servers
for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
