#!/bin/bash
#2. Crea un script llamado papelera, que al llamarlo tengamos que ponerle un parámetro
#que será el nombre de un archivo que lo copiará en una carpeta llamada /home/guardar

if [ $# -eq 0 ];then
    echo "Tienes que pasar 1 parámetro"
    exit 1
fi

sudo cp "$1" /home/guardar