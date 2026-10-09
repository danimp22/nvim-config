-- All colorschemes
local Cs = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- Load this early
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
            })
        end,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require("tokyonight").setup({ style = "storm" })
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "moon", -- auto, main, moon, or dawn
            })
        end
    },
    {
        "EdenEast/nightfox.nvim", 
        name = "nightfox",
        priority = 1000,
        config = function()
            require("nightfox").setup({

            })
        end
    },
    {
        "scottmckendry/cyberdream.nvim",
        name = "cyberdream",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({

            })
        end
    },
}

-- Select the colorscheme
vim.cmd("colorscheme catppuccin")

return Cs
