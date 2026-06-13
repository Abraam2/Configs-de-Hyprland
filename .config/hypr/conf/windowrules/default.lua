-- 1. Flotar cualquier ventana modal
hl.window_rule({
  name = "float-modals",
  match = { modal = true },
  float = true,
  center = true
})

-- 2. Regla para el portal de escritorio GTK (Selector de archivos, etc.)
hl.window_rule({
  match = { class = "xdg-desktop-portal-gtk" },
  float = true,
  center = true,
  size = {1200, 700}
})

-- 3. Regla por títulos comunes de avisos y diálogos
hl.window_rule({
  match = { title = "(Open File|Confirm|Error|Warning|Settings|Preferences|Guardar como|Abrir|Confirmar)" },
  float = true,
  center = true
})

-- 4. Regla específica para Nemo (Propiedades de archivos)
hl.window_rule({
  match = { 
    class = "nemo", 
    title = ".*(Properties|Propiedades).*" 
  },
  float = true,
  center = true,
  size = {800, 600}
})

-- 5. Regla para FileRoller (Gestor de archivadores de GNOME)
hl.window_rule({
  match = { 
    class = "org.gnome.FileRoller", 
    title = ".*(Extraer|Comprimir|Añadir|Añadiendo|Creando).*" 
  },
  float = true,
  center = true,
  size = {450, 180}
})