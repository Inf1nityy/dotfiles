return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mfussenegger/nvim-jdtls" },
        opts = {
            setup = {
                jdtls = function(_, opts)
                    vim.api.nvim_create_autocmd("FileType", {
                        pattern = "java",
                        callback = function()
                            local config = {
                                cmd = { vim.fn.expand('$HOME') .. '/.local/share/nvim/mason/bin/jdtls' },
                                root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
                            }
                            require('jdtls').start_or_attach(config)
                        end,
                    })
                    return true
                end,
            },
        },
    },
}
