return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      doc = {
        inline = false, -- Apaga la foto fija gigante en medio del código
        float = true, -- Hace que solo se abra una ventanita flotante
        max_width = 40, -- Controla el ancho máximo (en columnas de texto)
        max_height = 20, -- Controla el alto máximo (en filas de texto)
      },
    },
  },
}
