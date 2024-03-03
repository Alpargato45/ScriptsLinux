#!/bin/bash

clave_correcta="clave123"

for intento in {1..3}; do
    read -s -p "Introduzca la palabra clave para acceder: " clave_ingresada
    echo

    if [ "$clave_ingresada" == "$clave_correcta" ]; then
        echo "Acceso concedido."
        
        fichero="alumnos.txt"
        contador=1

        while true; do
            read -p "Introduzca un nombre (o 'salir' para finalizar): " nombre
            if [ "$nombre" == "salir" ]; then
                break
            fi

            echo "$nombre:$contador:" >> "$fichero"
            contador=$((contador + 1))
        done

        while true; do
            echo "Menú"
            echo "1. Nombres"
            echo "2. Clave"
            echo "3. Finalizar"
            read -p "Seleccione una opción: " opcion_menu

            case $opcion_menu in
                1)
                    echo "Nombres introducidos:"
                    cat "$fichero" | cut -d ':' -f 1
                    ;;
                2)
                    read -p "Introduzca una clave: " clave_buscar
                    nombre_asociado=$(grep ":$clave_buscar:" "$fichero" | cut -d ':' -f 1)
                    echo "Nombre asociado a la clave $clave_buscar: $nombre_asociado"
                    ;;
                3)
                    echo "Finalizando el programa."
                    exit 0
                    ;;
                *)
                    echo "Opción no válida."
                    ;;
            esac
        done
    else
        echo "Palabra clave incorrecta. Intento $intento de 3."
    fi
done

echo "Demasiados intentos fallidos. Saliendo del programa."