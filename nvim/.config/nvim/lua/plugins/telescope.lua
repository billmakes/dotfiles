local telescope = require("telescope")
local actions = require("telescope.actions")

local api = vim.api

local u = require("utils")

telescope.setup({
    extensions = {
        fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true },
    },
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--ignore",
            "--hidden",
            "-g",
            "!.git",
        },
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<Esc>"] = actions.close,
                ["<M-u>"] = actions.preview_scrolling_up,
                ["<M-d>"] = actions.preview_scrolling_down,
            },
        },
    },
})

telescope.load_extension("fzf")

global.telescope = {
    -- try git_files and fall back to find_files
    find_files = function()
        local set = require("telescope.actions.set")
        local builtin = require("telescope.builtin")

        local opts = {
            attach_mappings = function(_, map)
                map("i", "<C-v>", function(prompt_bufnr)
                    set.edit(prompt_bufnr, "vsplit")
                end)
                return true
            end,
        }

        local is_git_project = pcall(builtin.git_files, opts)
        if not is_git_project then
            builtin.find_files(opts)
        end
    end,
}

u.lua_command("Files", "global.telescope.find_files()")
u.command("Rg", "Telescope live_grep")
u.command("BLines", "Telescope current_buffer_fuzzy_find")
u.command("History", "Telescope oldfiles")
u.command("Buffers", "Telescope buffers")
u.command("BCommits", "Telescope git_bcommits")
u.command("Commits", "Telescope git_commits")
u.command("HelpTags", "Telescope help_tags")
u.command("ManPages", "Telescope man_pages")
u.command("E", "Explore")

u.nmap("<C-p>", "<cmd>Files<CR>")
u.nmap("<Leader>fe", "<cmd>Rg<CR>")
u.nmap("<Leader>fo", "<cmd>History<CR>")
u.nmap("<Leader>fh", "<cmd>HelpTags<CR>")
u.nmap("<Leader>fl", "<cmd>BLines<CR>")
u.nmap("<Leader>fc", "<cmd>BCommits<CR>")
u.nmap("<Leader>fb", "<cmd>Buffers<CR>")

-- lsp
u.command("LspRef", "Telescope lsp_references")
u.command("LspDef", "Telescope lsp_definitions")
u.command("LspSym", "Telescope lsp_workspace_symbols")
u.command("LspAct", "Telescope lsp_code_actions")
u.command("LspRangeAct", "Telescope lsp_range_code_actions")
