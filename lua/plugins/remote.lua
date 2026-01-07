return {
  "amitds1997/remote-nvim.nvim",
  version = "*",
  -- This ensures the plugin only loads if the OS is NOT Windows
  enabled = vim.fn.has("win32") == 0,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("remote-nvim").setup({})
  end,
}
