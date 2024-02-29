#!/bin/bash
#4. Realizar un script llamado busca que busque los ficheros del directorio actual que
#contengan la palabra que se introduzca por teclado

read -p "Palabra que buscar: " palabra

#Se usa el comando grep para la busqueda. -l es para solo coger el nombre del archivo
#-R es para hacerlo recursivo (al ser recursivo entra en el texto también, cuidado)
archivos=$(grep -lR "$palabra" .) #El punto es la ruta, en este caso se pone . pq es donde esta el fichero

if [ -z "$archivos" ];then #-z es para que no sea nulo
    echo "No se encontraron archivos que contengan la palabra '$palabra'." 
    echo "No se encontraron archivos que contengan la palabra $palabra." #La de arriba esta mal, 
    #con solo poner la variable dentro de "" ya coje el texto, lo dejo como ejemplo
else 
    echo "Archivos que contienen la palabra '$palabra':" #Aquí tampoco haría falta
    echo "$archivos"
fi