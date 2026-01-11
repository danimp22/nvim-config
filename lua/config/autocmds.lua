-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Remove the auto comments on new lines
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Do a git pull every time we open nvim to sync settings
local config_path = vim.fn.stdpath("config")

-- Run git pull silently in the background
vim.fn.jobstart({ "git", "-C", config_path, "pull", "--rebase" }, {
  on_exit = function(_, exit_code)
    if exit_code == 0 then
      -- Optional: Notify only if there were actual changes
      vim.notify("Config synced successfully!", vim.log.levels.INFO)
    elseif exit_code ~= 0 then
      vim.notify("Git pull failed. Check your config repo.", vim.log.levels.WARN)
    end
  end,
})
