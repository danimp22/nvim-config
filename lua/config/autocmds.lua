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

-- Detect automatically the OpenFOAM files as C++
vim.filetype.add({
  -- 1. Match by Extension (for .foam files)
  extension = {
    foam = "cpp",
  },

  -- 2. Match by EXACT Filename (The most reliable method)
  filename = {
    -- Dictionaries
    ["controlDict"] = "cpp",
    ["blockMeshDict"] = "cpp",
    ["snappyHexMeshDict"] = "cpp",
    ["fvSchemes"] = "cpp",
    ["fvSolution"] = "cpp",
    ["transportProperties"] = "cpp",
    ["turbulenceProperties"] = "cpp",
    ["thermophysicalProperties"] = "cpp",
    ["sampleDict"] = "cpp",

    -- Fields (The files inside the "0" folder)
    ["U"] = "cpp", -- Velocity
    ["p"] = "cpp", -- Pressure
    ["T"] = "cpp", -- Temperature
    ["rho"] = "cpp", -- Density
    ["phi"] = "cpp", -- Flux
    ["nut"] = "cpp", -- Viscosity
    ["k"] = "cpp", -- Kinetic Energy
    ["epsilon"] = "cpp", -- Dissipation
    ["omega"] = "cpp", -- Specific Dissipation
    ["alphat"] = "cpp", -- Thermal Diffusivity
  },

  -- 3. Catch-all for other dictionaries
  pattern = {
    [".*Dict"] = "cpp",
    [".*Properties"] = "cpp",
  },
})
