return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    -- Add the languages you program in to this list
    ensure_installed = { "cpp", "lua", "python"},

    -- Automatically install missing parsers when entering a buffer
    auto_install = true,

    highlight = {
      -- This enables the tree-sitter highlighting
      enable = true, 
      
      -- Disables standard vim highlighting to prevent conflicts and lag
      additional_vim_regex_highlighting = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
