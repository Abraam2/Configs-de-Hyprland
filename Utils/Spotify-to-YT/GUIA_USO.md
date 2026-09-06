# Guía: Migrar listas de canciones a YouTube Music

Esta guía explica paso a paso cómo preparar el entorno, obtener las credenciales necesarias de tu cuenta y ejecutar el script para importar tus canciones desde un archivo CSV a YouTube Music.

# Todo generado por una IA mitómana, puede estar mal y es lo más seguro que esté mal, pero con más peticiones a la IA se soluciona xD

---

## 1. Requisitos previos

- **Python 3.8 o superior** instalado en el sistema.
- Un navegador web (Chrome, Firefox, Brave, Edge, etc.).
- El archivo `.csv` con la lista de canciones que quieres importar (con columnas legibles como título y artista).

---

## 2. Preparar el entorno

1. Abre tu terminal o consola de comandos.
2. Clona el repositorio original (o sitúate en la carpeta del proyecto donde tengas tu script modificado):
   ```bash
   git clone <URL_DEL_REPOSITORIO_ORIGINAL>
   cd <NOMBRE_DE_LA_CARPETA>
   ```
3. _(Opcional pero muy recomendado)_ Crea y activa un entorno virtual para no mezclar librerías:
   ```bash
   # En Linux / macOS
   python3 -m venv venv
   source venv/bin/activate

   # En Windows
   python -m venv venv
   venv\Scripts\activate
   ```
4. Instala la librería principal necesaria para conectar con YouTube Music:
   ```bash
   pip install ytmusicapi
   ```
   _(Si el repositorio incluye un archivo `requirements.txt`, ejecuta directamente: `pip install -r requirements.txt`)_.

---

## 3. Obtener las credenciales (`browser.json`)

Para que el script pueda interactuar con tu cuenta (crear listas, buscar temas y añadirlos), YouTube Music necesita verificar tu sesión activa mediante tus cabeceras de navegación.

### Paso 3.1: Copiar las cabeceras desde el navegador

1. Entra en tu navegador a [music.youtube.com](https://music.youtube.com) y asegúrate de haber iniciado sesión con tu cuenta de Google.
2. Abre las **Herramientas de Desarrollador**:
   - Presiona `F12` (o haz clic derecho en cualquier parte de la página y selecciona **Inspeccionar**).
3. Ve a la pestaña **Red** (o **Network**).
4. En el buscador o explorador de YouTube Music, haz clic en cualquier sección (por ejemplo, "Explorar" o busca cualquier palabra) para que se generen peticiones de red.
5. En la lista de peticiones que aparece en la pestaña de red, busca una llamada que empiece por `browse` (o filtra por `browse` en la barra de búsqueda superior).
6. Haz clic sobre esa petición `browse`.
7. En el panel lateral derecho que se abre:
   - Ve a la subpestaña **Cabeceras** (o **Headers**).
   - Baja hasta encontrar la sección **Cabeceras de la solicitud** (o **Request Headers**).
   - Selecciona y copia todo el bloque de texto de las cabeceras de la solicitud (desde `accept:` o `:authority:` hasta el final de la lista).

---

### Paso 3.2: Generar el archivo `browser.json`

Tienes dos formas sencillas de generar este archivo:

#### Opción A: Mediante la terminal (recomendada)

Ejecuta el asistente oficial de `ytmusicapi` en tu consola:

```bash
ytmusicapi setup
```

1. La terminal te pedirá: _"Paste your raw request headers, press Enter, then press Ctrl-D (or Ctrl-Z on Windows) and Enter again:"_.
2. Pega directamente las cabeceras que copiaste en el navegador.
3. Pulsa `Enter`, luego `Ctrl+D` (en Linux/Mac) o `Ctrl+Z` seguido de `Enter` (en Windows).
4. El comando generará automáticamente un archivo llamado `browser.json` (o `oauth.json` según la versión) en tu carpeta actual.

#### Opción B: Crear el archivo manualmente con Python

Si prefieres hacerlo por código, crea un archivo temporal `crear_headers.py` con el siguiente contenido:

```python
from ytmusicapi import YTMusic

raw_headers = """
PEGA_AQUÍ_TODO_EL_TEXTO_DE_TUS_CABECERAS
"""

YTMusic.setup(filepath="browser.json", headers_raw=raw_headers)
print("Archivo browser.json creado correctamente.")
```

Ejecútalo una sola vez (`python crear_headers.py`) y borrará o ignorará las cabeceras viejas creando el nuevo `browser.json`.

---

## 4. Ejecutar el script

1. Asegúrate de colocar tu script modificado (por ejemplo `script_modificado.py`) y tu archivo `.csv` en la misma carpeta donde está `browser.json`.
2. Ejecuta el script:
   ```bash
   python tu_script_modificado.py
   ```
3. El proceso leerá las filas de tu archivo CSV, buscará las coincidencias en el catálogo de YouTube Music y las irá añadiendo a una lista de reproducción nueva en tu perfil.

---

## 5. ¡Aviso de Seguridad!

- **NUNCA subas `browser.json` a GitHub ni a ningún repositorio público.** Ese archivo contiene tus cookies de sesión activas de Google.
- Añade `browser.json` a tu `.gitignore`:
  ```text
  browser.json
  *.csv
  venv/
  __pycache__/
  ```
