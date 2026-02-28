-- Add scrolloff
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Set line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Snacks animations (I'm trying false for the moment)
vim.g.snacks_animate = false

-- Disable autoformatting
vim.g.autoformat = false

-- Synch with system clipboard
-- vim.opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"

-- Enable highlighting of the current line
vim.opt.cursorline = true

-- Show the signcolumn, otherwise it would shift the text each time
vim.opt.signcolumn = "yes"

-- Disable default ruler
vim.opt.ruler = false

-- Dont ingnore cases with capitals
vim.opt.smartcase = true

-- Insert indents automatically
vim.opt.smartindent = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Language spelling
vim.opt.spelllang = { "en" }

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
