for d in */; do
    (
        cd "$d" || exit
        zip_file=$(ls *.zip 2>/dev/null | head -n 1)
        if [ -n "$zip_file" ]; then
            unzip -q "$zip_file"
            extracted_dir=$(find . -mindepth 1 -maxdepth 1 -type d)
            if [ -n "$extracted_dir" ]; then
                mv "$extracted_dir"/* . 2>/dev/null
                mv "$extracted_dir"/.* . 2>/dev/null
                rmdir "$extracted_dir" 2>/dev/null
            fi
            rm "$zip_file"
        fi
    )
done
