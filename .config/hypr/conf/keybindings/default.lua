-- Configuración
---@diagnostic disable: undefined-global
local mainMod = "SUPER"

-- ==========================================
-- TO DO
-- ==========================================

-- Atajo para mover todo lo de un workspace a otro
-- Hacer que bloq mayus sea escape

-- ==========================================
-- CAPTURAS
-- ==========================================

hl.bind(
	mainMod .. " + ALT + S",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"),
	{ description = "Script selector de capturas de pantalla con Rofi" }
)
hl.bind(
	mainMod .. " + SHIFT + P",
	hl.dsp.exec_cmd(
		'grim -g "$(slurp)" - | tee ~/Imágenes/$(date +"%Y-%m-%d_%H-%M-%S").png | wl-copy && notify-send "Captura completada" "Guardada en ~/Imágenes y copiada al portapapeles"'
	),
	{ description = "Guardar y copiar captura de pantalla" }
)
hl.bind(
	mainMod .. " + SHIFT + S",
	hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy && notify-send "Captura copiada"'),
	{ description = "Copiar captura de pantalla" }
)
hl.bind(
	mainMod .. " + P",
	hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy && notify-send "Captura copiada"'),
	{ description = "Copiar captura de pantalla" }
)

-- ==========================================
-- SNAPPY SWITCHER
-- ==========================================
hl.bind(
	"ALT + Tab",
	hl.dsp.exec_cmd("snappy-switcher next"),
	{ description = "Snappy-switcher next", repeating = false }
)
hl.bind(
	"ALT + SHIFT + Tab",
	hl.dsp.exec_cmd("snappy-switcher prev"),
	{ description = "Snappy-switcher prev", repeating = false }
)

-- ==========================================
-- APLICACIONES Y TERMINAL
-- ==========================================
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"), { description = "Abrir la terminal" })
hl.bind(
	mainMod .. " + W",
	hl.dsp.exec_cmd("brave --force-device-scale-factor=1.1 --password-store=basic"),
	{ description = "Abrir el navegador" }
)
hl.bind(
	mainMod .. " + E",
	hl.dsp.exec_cmd("nemo --tabs ~ ~/Descargas/ /home/abraham/.mydotfiles/com.ml4w.dotfiles/.config"),
	{ description = "Abrir el gestor de archivos" }
)

-- hl.bind(
-- 	mainMod .. " + Y",
-- 	hl.dsp.exec_cmd("env EDITOR=$HOME/.local/bin/nv kitty -e yazi ~ ~/.mydotfiles/com.ml4w.dotfiles/.config ~/.config"),
-- 	{ description = "Abrir Yazi" }
-- )

hl.bind(
	mainMod .. " + Y",
	hl.dsp.exec_cmd("env EDITOR=$HOME/.local/bin/nv kitty -e yazi"),
	{ description = "Abrir Yazi" }
)

hl.bind(mainMod .. " + n", hl.dsp.exec_cmd("$HOME/.local/bin/nv "), { description = "Abrir Nvim" })
hl.bind(
	mainMod .. " + CTRL + E",
	hl.dsp.exec_cmd("~/.config/ml4w/settings/emojipicker.sh"),
	{ description = "Abrir selector de emojis" }
)
hl.bind(
	mainMod .. " + CTRL + C",
	hl.dsp.exec_cmd("~/.config/ml4w/settings/calculator.sh"),
	{ description = "Abrir la calculadora" }
)
hl.bind("ALT + W", hl.dsp.exec_cmd("~/.local/bin/nv"), { description = "Abrir NVIM" })

hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("spotify"), { description = "Abrir Spotify" })

-- ==========================================
-- MENÚS Y SCRIPTS DEL SISTEMA
-- ==========================================
hl.bind(
	mainMod .. " + CTRL + Q",
	hl.dsp.exec_cmd("~/.mydotfiles/com.ml4w.dotfiles/.config/custom_Scripts/wlogout.sh"),
	{ description = "Iniciar wlogout" }
)
hl.bind(
	mainMod .. " + V",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-cliphist"),
	{ description = "Abrir gestor de portapapeles" }
)

-- ==========================================
-- WIDGET SIDEPAD (PANEL LATERAL)
-- ==========================================
hl.bind(
	mainMod .. " + right",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-sidepad"),
	{ description = "Abrir Sidepad" }
)
hl.bind(
	mainMod .. " + left",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-sidepad --hide"),
	{ description = "Cerrar Sidepad" }
)
hl.bind(
	mainMod .. " + SHIFT + Z",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-sidepad --init"),
	{ description = "Inicializar Sidepad" }
)
hl.bind(
	mainMod .. " + Z",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-sidepad --init && sleep 0.1 && ~/.config/ml4w/scripts/ml4w-sidepad"),
	{ description = "Mostrar Sidepad forzado" }
)
hl.bind(
	mainMod .. " + CTRL + Z",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-sidepad --select"),
	{ description = "Seleccionar Sidepad" }
)

-- ==========================================
-- ESCRITORIOS (WORKSPACES) Y NAVEGACIÓN
-- ==========================================
hl.bind(
	mainMod .. " + Tab",
	hl.dsp.focus({ workspace = "previous" }),
	{ description = "Alternar al escritorio anterior" }
)
hl.bind("CTRL + SHIFT + Tab", hl.dsp.focus({ workspace = "m-1" }), { description = "Abrir escritorio anterior" })
hl.bind("CTRL + Tab", hl.dsp.focus({ workspace = "m+1" }), { description = "Abrir siguiente escritorio" })
hl.bind(
	mainMod .. " + CTRL + down",
	hl.dsp.focus({ workspace = "empty" }),
	{ description = "Abrir el siguiente escritorio vacío" }
)

-- Bucle automático para enfocar y mover ventanas en escritorios [1-10]
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Enfocar escritorio " .. i })
	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = i }),
		{ description = "Mover ventana al escritorio " .. i }
	)
end

-- Navegación de escritorios con la rueda del ratón
hl.bind(
	mainMod .. " + mouse_down",
	hl.dsp.focus({ workspace = "e+1" }),
	{ description = "Cambiar al siguiente escritorio" }
)
hl.bind(
	mainMod .. " + mouse_up",
	hl.dsp.focus({ workspace = "e-1" }),
	{ description = "Cambiar al escritorio anterior" }
)

-- ==========================================
-- GESTIÓN DE VENTANAS
-- ==========================================
hl.bind(
	mainMod .. " + Q",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/killactive.sh"),
	{ description = "Cerrar ventana activa" }
)
hl.bind(
	mainMod .. " + SHIFT + Q",
	hl.dsp.exec_cmd("hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"),
	{ description = "Matar proceso de la ventana activa" }
)
hl.bind(
	mainMod .. " + F",
	hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
	{ description = "Alternar Pantalla Completa" }
)
hl.bind(
	mainMod .. " + S",
	hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
	{ description = "Maximizar Ventana (Tiled)" }
)
hl.bind(mainMod .. " + A", hl.dsp.window.float({ action = "toggle" }), { description = "Alternar ventana flotante" })
hl.bind(
	mainMod .. " + SHIFT + A",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-toggle-allfloat"),
	{ description = "Hacer flotantes todas las ventanas del escritorio" }
)
hl.bind(
	mainMod .. " + ALT + A",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-toggle-float-pin"),
	{ description = "Fijar ventana activa en modo flotante" }
)
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"), { description = "Alternar división (split)" })

-- Mover el foco de las ventanas con H, L, K, J
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }), { description = "Mover foco a la izquierda" })
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }), { description = "Mover foco a la derecha" })
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }), { description = "Mover foco arriba" })
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }), { description = "Mover foco abajo" })

-- Redimensionar ventanas con el teclado (SHIFT + H, L, K, J)
hl.bind(
	mainMod .. " + SHIFT + L",
	hl.dsp.window.resize({ x = 100, y = 0 }),
	{ description = "Aumentar ancho de la ventana" }
)
hl.bind(
	mainMod .. " + SHIFT + H",
	hl.dsp.window.resize({ x = -100, y = 0 }),
	{ description = "Reducir ancho de la ventana" }
)
hl.bind(
	mainMod .. " + SHIFT + J",
	hl.dsp.window.resize({ x = 0, y = 100 }),
	{ description = "Aumentar alto de la ventana" }
)
hl.bind(
	mainMod .. " + SHIFT + K",
	hl.dsp.window.resize({ x = 0, y = -100 }),
	{ description = "Reducir alto de la ventana" }
)

-- Intercambiar posición de ventanas (ALT + H, L, K, J)
hl.bind(
	mainMod .. " + ALT + H",
	hl.dsp.window.swap({ direction = "l" }),
	{ description = "Intercambiar ventana a la izquierda" }
)
hl.bind(
	mainMod .. " + ALT + L",
	hl.dsp.window.swap({ direction = "r" }),
	{ description = "Intercambiar ventana a la derecha" }
)
hl.bind(
	mainMod .. " + ALT + K",
	hl.dsp.window.swap({ direction = "u" }),
	{ description = "Intercambiar ventana arriba" }
)
hl.bind(
	mainMod .. " + ALT + J",
	hl.dsp.window.swap({ direction = "d" }),
	{ description = "Intercambiar ventana abajo" }
)

-- Grupos y arrastre con el ratón
hl.bind(mainMod .. " + G", hl.dsp.group.toggle(), { description = "Alternar grupo de ventanas" })
hl.bind(mainMod .. " + K", hl.dsp.layout("swapsplit"), { description = "Intercambiar división (swapsplit)" })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Mover ventana con el ratón" })
hl.bind(
	mainMod .. " + mouse:273",
	hl.dsp.window.resize(),
	{ mouse = true, description = "Redimensionar ventana con el ratón" }
)

-- ==========================================
-- ACCIONES E INTERFAZ ML4W
-- ==========================================
hl.bind(
	mainMod .. " + CTRL + R",
	hl.dsp.exec_cmd("hyprctl reload"),
	{ description = "Recargar configuración de Hyprland" }
)
hl.bind(
	mainMod .. " + SHIFT + A",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-animations.sh"),
	{ description = "Alternar animaciones" }
)
hl.bind(
	mainMod .. " + ALT + A",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/text-extractor.sh"),
	{ description = "Extraer texto de un área" }
)
hl.bind(
	mainMod .. " + CTRL + P",
	hl.dsp.exec_cmd("qs ipc call power toggle"),
	{ description = "Abrir menú de apagado" }
)
hl.bind(
	mainMod .. " + SHIFT + W",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-wallpaper-app --random"),
	{ description = "Cambiar fondo de pantalla al azar" }
)
hl.bind(
	mainMod .. " + CTRL + W",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-wallpaper-app"),
	{ description = "Abrir selector de fondos de pantalla" }
)
hl.bind(
	mainMod .. " + ALT + W",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-wallpaper-automation"),
	{ description = "Iniciar script de fondos automáticos" }
)
hl.bind(
	mainMod .. " + SPACE",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/launcher.sh"),
	{ description = "Abrir lanzador de aplicaciones" }
)
hl.bind(
	mainMod .. " + CTRL + K",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/keybindings.sh"),
	{ description = "Mostrar lista de atajos" }
)
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("~/.config/waybar/launch.sh"), { description = "Recargar Waybar" })
hl.bind(
	mainMod .. " + CTRL + B",
	hl.dsp.exec_cmd("~/.config/waybar/toggle.sh"),
	{ description = "Ocultar/Mostrar Waybar" }
)
hl.bind(
	mainMod .. " + SHIFT + R",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/loadconfig.sh"),
	{ description = "Recargar perfiles de configuración" }
)
hl.bind(
	mainMod .. " + CTRL + T",
	hl.dsp.exec_cmd("~/.config/waybar/themeswitcher.sh"),
	{ description = "Abrir selector de temas de Waybar" }
)
hl.bind(
	mainMod .. " + SHIFT + M",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-toggle-theme"),
	{ description = "Alternar entre modo claro y oscuro" }
)
-- hl.bind(
-- 	mainMod .. " + CTRL + S",
-- 	hl.dsp.exec_cmd("qs ipc call sidebar toggle"),
-- 	{ description = "Abrir la barra lateral de widgets" }
-- )
hl.bind(
	mainMod .. " + CTRL + C",
	hl.dsp.exec_cmd("qs ipc call calendar toggle"),
	{ description = "Abrir el widget del calendario" }
)
hl.bind(
	mainMod .. " + ALT + G",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/gamemode.sh"),
	{ description = "Alternar modo juego" }
)
hl.bind(
	mainMod .. " + CTRL + L",
	hl.dsp.exec_cmd("~/.mydotfiles/com.ml4w.dotfiles/.config/custom_Scripts/power.sh lock"),
	{ description = "Bloquear pantalla" }
)
hl.bind(
	"CTRL + ALT + T",
	hl.dsp.exec_cmd("~/.config/ml4w/themes/themes.sh"),
	{ description = "Abrir menú de temas globales" }
)

hl.bind(
	mainMod .. " + SHIFT + H",
	hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-toggle-hyprsunset"),
	{ description = "Alternar modo noche (Hyprsunset)" }
)

-- ==========================================
-- CONTROL DE HARDWARE Y MULTIMEDIA
-- ==========================================

-- Laptop
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true, description = "Raise volume" }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true, description = "Lower volume" }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true, description = "Mute audio" }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true, description = "Mute microphone" }
)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
	{ locked = true, repeating = true, description = "Increase brightness" }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
	{ locked = true, repeating = true, description = "Decrease brightness" }
)

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, description = "Next track" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Pause audio" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play audio" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "Previous track" })

-- F
hl.bind(
	mainMod .. " + F11",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true, description = "Raise volume" }
)
hl.bind(
	mainMod .. " + F10",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true, description = "Lower volume" }
)
hl.bind(
	mainMod .. " + F9",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true, description = "Mute audio" }
)
hl.bind(
	mainMod .. " + F2",
	hl.dsp.exec_cmd("ddcutil setvcp 10 + 5"),
	{ locked = true, repeating = true, description = "Increase brightness" }
)
hl.bind(
	mainMod .. " + F1",
	hl.dsp.exec_cmd("ddcutil setvcp 10 - 5"),
	{ locked = true, repeating = true, description = "Decrease brightness" }
)

-- F
hl.bind(mainMod .. " + F8", hl.dsp.exec_cmd("playerctl next"), { locked = true, description = "Next track" })
hl.bind(
	mainMod .. " + F7",
	hl.dsp.exec_cmd("playerctl -p spotify play-pause"),
	{ locked = true, description = "Pause audio" }
)
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "Previous track" })
