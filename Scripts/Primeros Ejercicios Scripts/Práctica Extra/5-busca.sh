#!/bin/bash
#5. Realiza un script llamado busca, que al llamarlo tengamos que ponerle la dirección
#absoluta de un archivo. El script debe responder si el archivo existe y tiene un
#tamaño mayor que cero 

if [ $# -eq 0 ];then
    echo "Tienes que pasar 1 parámetro"
    exit 1
fi

if [ -e $1 ];then
    echo "El archivo si existe"
else
    echo "El archivo no existe"
fi

tamano=$(stat -c %s "$1") #El comando stat muestra información y -c %s hace que solo salga el tamaño

if [ "$tamano" -gt 0 ]; then
    echo "El tamaño del archivo $1 es $tamano bytes y es mayor que 0."
else
    echo "El archivo $1 está vacío o tiene un tamaño de 0 bytes."
fi