-- ############################ BASE NVIM ############################ --
local map = vim.keymap.set

-- Map leader key
vim.g.mapleader = " "

-- Exit insert mode
map("i", "jj", "<Esc>")

-- Paste text and don't put the deleted text into the paste registry
-- Greatest remap ever!!
-- stylua: ignore
map("x", "<leader>p", "\"_dP")

-- Copy visual selection to clipboard
map('v', '<C-c>', '"+y')

-- Maintain visual mode after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Enter explore mode
map("n", "<leader>pv", vim.cmd.Ex)

-- Center screen after scrolling with <C-d> or <C-u>
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-b>", "<C-b>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Open terminal from leader
map("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Open terminal in new buffer" })
map("n", "<leader>tv", [[<cmd>vsplit | term<cr>A]], { desc = "Open terminal in vertical split" })
map("n", "<leader>th", [[<cmd>split | term<cr>A]], { desc = "Open terminal in horizontal split" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Use jj to enter in terminal normal mode" })



-- ############################# GIT ############################### --
local neogit = require('neogit')
local windowType = "floating"
-- vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })
vim.keymap.set( "n", "<leader>gg", function() neogit.open({ kind = windowType }) end,
    { desc = "Open Neogit UI" }
)
vim.keymap.set("n", "<leader>gs", function()
    local current_file_dir = vim.fn.expand("%:p:h")
    -- Fallback to the global current working directory if the buffer has no path
    if current_file_dir == "" then
        current_file_dir = vim.fn.getcwd()
    end

    neogit.open({ cwd = current_file_dir, kind = windowType })
    end, { desc = "Open Neogit in current file directory" })



-- ########################### DEBUGGER ############################ --
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Break Point" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or Continue Debugger" })



-- ############################ HARPOON ############################ --
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()

-- Reset harpoon list
vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() print("Harpoon list cleared") end)

-- Add and remove items to harpoon
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end)
vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() print("Cleared harpoon list") end)
vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Access harpooon files
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)


-- ############################## YAZI ############################### --
map("n", "<leader>e", "<cmd>Yazi<cr>", { desc = "Open File Explorer" })
map("n", "<leader>e", "<cmd>Yazi cdw<cr>", { desc = "Open File Exporer at CWD" })
map("n", "<leader>e", "<cmd>Yazi toggle<cr>", { desc = "Resume Last Yazi Session" })


-- ############################ TELESCOPE ############################ --
local tlcp = require("telescope.builtin")
map("n", "<leader>ff", tlcp.find_files, { desc = "Find files" })
map("n", "<leader>fg", tlcp.git_files, { desc = "Find git files" })
map("n", "<leader>fw", tlcp.grep_string, { desc = "Find words" })
map("n", "<leader><leader>", tlcp.buffers, { desc = "Find existing buffers" })
map("n", "<leader>fth", function()
  require("telescope.builtin").colorscheme({ enable_preview = true })
end, { desc = "Pick colorscheme" })

-- Shortcut for searching your Neovim configuration files
map("n", "<leader>fc", function()
	tlcp.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find config files" })


-- ################## LAZYVIM SETTINGS ##################
-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
