vim.g.mapleader = " "
vim.g.maplocalleader = ";"

local u = require("utils")

vim.opt.completeopt = { "menuone", "noinsert" }
vim.opt.showcmd = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 2
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 500
vim.opt.shortmess:append("cA")
vim.opt.clipboard:append("unnamedplus")
vim.opt.autoindent = true
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"

-- Go syntax highlighting
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_operators = 1

-- auto formatting and importing
vim.g.go_fmt_autosave = 1
vim.g.go_fmt_command = "goimports"

-- status line types/signatures
vim.g.go_auto_type_info = 1

-- theme
vim.opt.termguicolors = true
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_italic = 1
vim.api.nvim_command([[
    augroup ChangeBackgroudColour
        autocmd colorscheme * :hi normal guibg=#121212
    augroup END
]])
vim.cmd("colorscheme gruvbox")

-- initialize global object for config
global = {}

-- maps
-- make useless keys useful
u.nmap("<Esc>", ":nohl<CR>")

u.nmap("<Tab>", "%", { noremap = false })
u.xmap("<Tab>", "%", { noremap = false })
u.omap("<Tab>", "%", { noremap = false })

u.imap("<S-Tab>", "<Esc>A")
u.nmap("<S-CR>", ":wqall<CR>")

u.nmap("H", "^")
u.omap("H", "^")
u.xmap("H", "^")
u.nmap("L", "$")
u.omap("L", "$")
u.xmap("L", "$")

-- automatically add jumps > 1 to jump list
u.nmap("k", [[(v:count > 1 ? "m'" . v:count : '') . 'k'"]], { expr = true })
u.nmap("j", [[(v:count > 1 ? "m'" . v:count : '') . 'j'"]], { expr = true })

-- gm for marks
u.nmap("gm", "m")

-- misc
u.xmap(">", ">gv")
u.xmap("<", "<gv")

-- autocommands
-- highlight on yank
vim.cmd('autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })')

-- source remaining config
require("plugins")
require("lsp")
