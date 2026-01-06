-- Remove ghost text
return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- This disables the ghost text/preview feature
      opts.experimental = {
        ghost_text = false,
      }
    end,
  },
}
