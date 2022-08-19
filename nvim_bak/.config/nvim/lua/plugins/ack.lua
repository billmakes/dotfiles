local u = require("utils")

-- use ripgrep
vim.g['ackprg'] = 'rg --vimgrep --type-not sql --smart-case'

-- any empty ack search will search for the work the cursor is on
vim.g['ack_use_cword_for_empty_search'] = 1


u.nmap("<Leader>/", ":Ack!<Space>")
