#!/bin/bash

# Función para comprobar si es un fichero y adivinar la última palabra
check_file() {
    fichero="$1"
    if [ ! -f "$fichero" ]; then
        echo "$fichero no es un fichero válido."
        return
    fi

    read -p "Adivine la última palabra en $fichero: " palabra_usuario
    ultima_palabra=$(awk '{print $NF}' "$fichero")

    if [ "$palabra_usuario" == "$ultima_palabra" ]; then
        echo "¡Acierto!"
    else
        echo "Respuesta incorrecta. La última palabra es $ultima_palabra."
    fi
}

# Función para comprobar si es un directorio y adivinar el tamaño del fichero más pequeño
check_directory() {
    directorio="$1"
    if [ ! -d "$directorio" ]; then
        echo "$directorio no es un directorio válido."
        return
    fi

    fichero_mas_pequeno=$(find "$directorio" -type f -exec du -b {} + | sort -n | head -n 1 | cut -f 2)
    read -p "Adivine el tamaño del fichero más pequeño en $directorio: " tamano_usuario

    if [ "$tamano_usuario" -eq $(du -b "$fichero_mas_pequeno" | cut -f 1) ]; then
        echo "¡Acierto!"
    else
        echo "Respuesta incorrecta. El tamaño del fichero más pequeño es $(du -h "$fichero_mas_pequeno" | cut -f 1)."
    fi
}

# Función para comprobar si es un número y mostrar menú correspondiente
check_number() {
    numero="$1"
    if [[ ! "$numero" =~ ^[0-9]+$ ]]; then
        echo "$numero no es un número válido."
        return
    fi

    while true; do
        echo "Menú"
        echo "a) Divisores"
        echo "b) Potencias"
        echo "c) Salir"
        read -p "Seleccione una opción: " opcion

        case $opcion in
            a)
                read -p "Adivine tres divisores de $numero (separados por espacio): " divisores_usuario
                divisores_correctos=($(factor "$numero" | cut -d ' ' -f 2-))
                if [ "${divisores_usuario[*]}" == "${divisores_correctos[*]}" ]; then
                    echo "¡Acierto!"
                    break
                else
                    echo "Respuesta incorrecta."
                fi
                ;;
            b)
                read -p "Introduzca el exponente para calcular $numero^exponente: " exponente
                resultado=$((numero ** exponente))
                echo "$numero^$exponente = $resultado"
                ;;
            c)
                echo "Saliendo del menú."
                break
                ;;
            *)
                echo "Opción no válida."
                ;;
        esac
    done
}

# Comprobar cada parámetro
for parametro in "$@"; do
    case $parametro in
        -f)
            read -p "Introduzca el nombre del fichero: " fichero
            check_file "$fichero"
            ;;
        -d)
            read -p "Introduzca el nombre del directorio: " directorio
            check_directory "$directorio"
            ;;
        -n)
            read -p "Introduzca un número: " numero
            check_number "$numero"
            ;;
        -w)
            read -p "Introduzca una palabra: " palabra
            # Función adicional para buscar la cantidad de veces que aparece la palabra
            cantidad_palabras=$(grep -o -w "$palabra" * | wc -l)
            echo "La palabra '$palabra' aparece $cantidad_palabras veces en los ficheros del directorio actual."
            ;;
        *)
            echo "Parámetro desconocido: $parametro"
            ;;
    esac
done