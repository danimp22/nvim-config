return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          -- This is the critical part to stop ALL messages (errors + hints)
          handlers = {
            ["textDocument/publishDiagnostics"] = function() end,
          },
          settings = {
            python = {
              analysis = {
                -- We turn these off as a second layer of defense
                typeCheckingMode = "off",
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
        ruff = {}, -- Ensure Ruff stays on to give you the real errors
      },
    },
  },
}
