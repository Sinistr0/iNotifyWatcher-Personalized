watchedDir="/etc/shadow"
 
inotifywait -m "$watchedDir" -e create -e access -e attrib |
    while read -r file; do
        name=$(stat --format %U $file 2>/dev/null) 
        date=$(stat --format %y $file 2>/dev/null)
        fileName=${file/* CREATE /}
        echo "File: '$fileName' Creator: $name Date: ${date%.*}"
    done

