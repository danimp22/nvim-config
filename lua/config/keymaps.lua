-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Exit insert mode
vim.keymap.set("i", "jj", "<Esc>")

-- Paste text and don't put the deleted text into the paste registry
-- Greatest remap ever!!
-- stylua: ignore
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Center screen after scrolling with <C-d> or <C-u>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Default keymaps
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

-- Open terminal from leader
local wk = require("which-key")
wk.add({ "<leader>t", group = "Terminal" })
vim.keymap.set("n", "<leader>tt", ":terminal<cr>A", { desc = "Open terminal in new buffer" })
vim.keymap.set("n", "<leader>tv", [[<cmd>vsplit | term<cr>A]], { desc = "Open terminal in vertical split" })
vim.keymap.set("n", "<leader>th", [[<cmd>split | term<cr>A]], { desc = "Open terminal in horizontal split" })
vim.keymap.set("t", "jj", "<C-\\><C-n>", { desc = "Use jj to enter in terminal normal mode" })

-- Set keymaps for the undo-tree
vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "Toggle Undo Tree" })
