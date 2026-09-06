import csv
import os
import sys
import time
from ytmusicapi import YTMusic

auth_file = "browser.json"
if not os.path.exists(auth_file):
    print("Error: No se encuentra browser.json")
    sys.exit(1)

yt = YTMusic(auth_file)

csv_path = sys.argv[1] if len(sys.argv) > 1 else input("Nombre del archivo CSV: ").strip("'\"")
playlist_title = input("Nombre para la nueva playlist en YouTube Music: ")

print(f"\n[+] Creando playlist '{playlist_title}'...")
playlist_id = yt.create_playlist(playlist_title, "Importada desde CSV")

tracks_to_add = []
total_count = 0
found_count = 0
missing_tracks = []

with open(csv_path, mode="r", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    for row in reader:
        total_count += 1
        name = row.get("Track Name") or row.get("name") or row.get("Title")
        artist = row.get("Artist Name(s)") or row.get("artist") or row.get("Artist")

        if not name:
            continue

        query = f"{name} {artist}" if artist else name
        
        try:
            # 1. Buscar primero en canciones oficiales
            results = yt.search(query, filter="songs")
            
            # 2. Si no aparece, buscar en el catálogo general
            if not results:
                results = yt.search(query)

            if results and "videoId" in results[0]:
                track_id = results[0]["videoId"]
                tracks_to_add.append(track_id)
                found_count += 1
                print(f"[{found_count}] [OK] {name} - {artist}")
            else:
                print(f"[X] {name} - {artist}")
                missing_tracks.append(f"{name} - {artist}")
        except Exception as e:
            print(f"[Error buscando '{name}']: {e}")
            missing_tracks.append(f"{name} - {artist} (Error: {e})")
            time.sleep(1)

        # Enviar en bloques de 20 con duplicates=True
        if len(tracks_to_add) >= 20:
            try:
                yt.add_playlist_items(playlist_id, tracks_to_add, duplicates=True)
                tracks_to_add = []
                time.sleep(1)
            except Exception as e:
                print(f"[Error subiendo bloque]: {e}")
                time.sleep(2)

# Subir el lote restante
if tracks_to_add:
    yt.add_playlist_items(playlist_id, tracks_to_add, duplicates=True)

print(f"\n[✔] Migración terminada. {found_count}/{total_count} canciones añadidas a '{playlist_title}'.")

# Resumen de elementos no encontrados
if missing_tracks:
    print(f"\n[-] Canciones NO encontradas ({len(missing_tracks)}):")
    for track in missing_tracks:
        print(f"  • {track}")
    
    # Guardar en archivo de texto
    with open("no_encontradas.txt", "w", encoding="utf-8") as out:
        out.write("\n".join(missing_tracks))
    print("\n[i] Se ha guardado el listado completo en 'no_encontradas.txt'.")
else:
    print("\n[✔] ¡Se encontraron e importaron el 100% de las canciones!")