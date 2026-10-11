return {
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                -- C++
                "clangd",
                "clang-format",
                "codelldb",

                -- Python
                "basedpyright",
                "ruff",

                -- Lua
                "lua-language-server",

            },
        }
    },

    -- Manager for the debbuger
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "mason-org/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        }
    }

}
