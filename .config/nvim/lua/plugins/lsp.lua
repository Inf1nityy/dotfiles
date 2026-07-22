return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "windwp/nvim-autopairs"
    },

    config = function()
        require("nvim-autopairs").setup({})

        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
        vim.keymap.set("n", "gy", vim.lsp.buf.type_definition)
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation)
        vim.keymap.set("n", "cd", vim.lsp.buf.rename)
        vim.keymap.set("n", "gA", vim.lsp.buf.references)
        vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol)
        vim.keymap.set("n", "gS", vim.lsp.buf.workspace_symbol)
        vim.keymap.set("n", "g]", vim.diagnostic.goto_next)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "g[", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "gh", vim.lsp.buf.hover)
        vim.keymap.set({ "n", "v" }, "g.", vim.lsp.buf.code_action)

        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
                ["clangd"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.clangd.setup {
                        capabilities = capabilities,
                        cmd = { "clangd" },
                        filetypes = { "c", "cpp", "objc", "objcpp" },
                        root_dir = require('lspconfig').util.root_pattern("compile_commands.json", ".git"),
                        on_attach = function ()
                            vim.keymap.set("n", "<leader>th", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch between Source/Header" })
                        end
                    }
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Enter>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
