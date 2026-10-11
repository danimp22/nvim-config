return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,                     -- Altura de la terminal en líneas
      hide_numbers = true,           -- Oculta números de línea en la terminal
      shade_terminals = true,
      direction = "float",      -- Se abre abajo. Puedes cambiar a 'float' o 'vertical'
      persist_size = true,           -- Recuerda el tamaño si lo modificas manualmente
      close_on_exit = false,         -- IMPORTANTE: Si el proceso muere, no cierra la ventana
    })
  end,
}

