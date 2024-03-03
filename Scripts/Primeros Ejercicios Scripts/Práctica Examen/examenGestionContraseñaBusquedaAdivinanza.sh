#!/bin/bash

# Función para comprobar la contraseña
check_password() {
    read -s -p "Introduzca la contraseña: " password
    echo
    if [ "$password" == "tu_contraseña" ]; then
        return 0
    else
        echo "Contraseña incorrecta. Inténtelo de nuevo."
        return 1
    fi
}

# Inicialización de variables
aciertos_lineas=0
aciertos_ficheros=0

# Comprobar contraseña
check_password
while [ $? -ne 0 ]; do
    check_password
done

# Menú principal
while true; do
    echo "Menú Principal"
    echo "a) Líneas"
    echo "b) Ficheros"
    echo "c) Salir"
    read -p "Seleccione una opción: " opcion

    case $opcion in
        a)
            read -p "Introduzca el nombre de un fichero a buscar: " fichero1
            if [ ! -e "$fichero1" ]; then
                read -p "El fichero no existe. Introduzca un segundo fichero: " fichero2
                if [ ! -e "$fichero2" ]; then
                    echo "Ninguno de los ficheros existe."
                    continue
                fi
            fi

            # Búsqueda satisfactoria
            read -p "¿El número de filas de $fichero1 es par o impar? (p/i): " respuesta_lineas
            filas=$(wc -l < "$fichero1")
            paridad_filas=""
            if [ $((filas % 2)) -eq 0 ]; then
                paridad_filas="p"
            else
                paridad_filas="i"
            fi

            if [ "$respuesta_lineas" == "$paridad_filas" ]; then
                echo "¡Acierto!"
                aciertos_lineas=$((aciertos_lineas + 1))
            else
                echo "Respuesta incorrecta."
            fi
            ;;
        b)
            read -p "Introduzca el nombre de un directorio a buscar: " directorio1
            if [ ! -d "$directorio1" ]; then
                read -p "El directorio no existe. Introduzca un segundo directorio: " directorio2
                if [ ! -d "$directorio2" ]; then
                    echo "Ninguno de los directorios existe."
                    continue
                fi
            fi

            # Búsqueda satisfactoria
            read -p "¿Cuántos ficheros tiene $directorio1? " respuesta_ficheros
            cantidad_ficheros=$(find "$directorio1" -type f | wc -l)
            
            if [ "$respuesta_ficheros" -eq "$cantidad_ficheros" ]; then
                echo "¡Acierto!"
                aciertos_ficheros=$((aciertos_ficheros + 1))
            else
                echo "Respuesta incorrecta."
            fi
            ;;
        c)
            read -p "¿Está seguro de salir? (s/n): " salir_confirmacion
            if [ "$salir_confirmacion" == "s" ]; then
                break
            fi
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac
done

echo "Aciertos en la opción Líneas: $aciertos_lineas"
echo "Aciertos en la opción Ficheros: $aciertos_ficheros"