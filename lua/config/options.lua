-- Have nerd-font?
vim.g.have_nerd_font = true

-- Add scrolloff
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Set line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab and indent options
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.tabstop = 4         -- Number of spaces per tab
vim.opt.shiftwidth = 4      -- Number of spaces per indent
vim.opt.shiftround = true   -- Round indent
vim.opt.smartindent = true -- Insert indents automatically

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable autoformatting
vim.g.autoformat = false

-- Enable highlighting of the current line
vim.opt.cursorline = true

-- Show the signcolumn, otherwise it would shift the text each time
vim.opt.signcolumn = "yes"

-- Disable default ruler
vim.opt.ruler = false

-- Dont ingnore cases with capitals
vim.opt.smartcase = true

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Language spelling
vim.opt.spelllang = { "en" }

-- Snacks animations (I'm trying false for the moment)
vim.g.snacks_animate = false

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
