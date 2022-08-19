local u = require("utils")

local cmp = require("cmp")

cmp.setup({
    formatting = {
        format = require("lspkind").cmp_format(),
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    completion = {
        completeopt = "menu,menuone,noinsert",
        get_trigger_characters = function(trigger_characters)
            return vim.tbl_filter(function(char)
                return char ~= " " and char ~= "\t" and char ~= "\n"
            end, trigger_characters)
        end,
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i" }),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" },
        { name = "path" },
    },
})
