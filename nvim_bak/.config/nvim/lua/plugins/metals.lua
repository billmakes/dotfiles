metals_config = {}
metals_config.handlers = {}
metals_config.init_options = {}

metals_config.on_attach = function()
  require 'completion'.on_attach();
end

metals_config.init_options.statusBarProvider = 'on'

vim.api.nvim_command([[
    au FileType scala lua require('metals').initialize_or_attach(metals_config)
]])
