return {
  -- Completion
  {
    "saghen/blink.cmp",
    version = "1.*", -- uses prebuilt binaries, no need to compile anything
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = { preset = "default" }, -- see "Completion keys" below
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      completion = { documentation = { auto_show = true } },
    },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      require("mason").setup()

      -- Installs the servers and enables them automatically
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "basedpyright", "ruff", "lua_ls" },
      })

      -- Tell every server that the completion plugin exists
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -- C++
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
        },
      })

      -- Diagnostics appearance
      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = { border = "rounded" },
      })

      -- Keymaps, only active in buffers with an LSP attached
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(ev)
          local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = "LSP: " .. desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("<leader>ld", vim.diagnostic.open_float, "Show diagnostic")
          map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format")

          -- Ruff is only for linting/formatting; let basedpyright handle hover
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end
        end,
      })
    end,
  },
}
