#!/bin/bash

contador_juego=0
contador_aciertos=0

while true; do
    read -p "Introduce un directorio o un archivo válido: " cadena

    if [ -f "$cadena" ]; then
        lineas=$(wc -l < "$cadena")
        formato="líneas"
    elif [ -d "$cadena" ]; then
        lineas=$(find "$cadena" -maxdepth 1 -type f | wc -l)
        formato="archivos"
    else
        echo "Entrada no válida. Introduce un directorio o un archivo válido."
        continue
    fi

    ((contador_juego++))
    echo "Intenta adivinar cuántos $formato tiene el $cadena (tienes 2 intentos):"

    for i in {1..2}; do
        read -p "Intento $i: " aciertos

        if [ "$aciertos" -eq "$lineas" ]; then
            echo "¡Adivinaste! El $input tiene $lineas $formato."
            ((contador_aciertos++))
            break
        elif [ "$i" -eq 2 ]; then
            echo "Lo siento, has agotado tus intentos. El $cadena tiene $lineas $formato."
        else
            echo "Incorrecto. Intenta de nuevo."
        fi
    done

    read -p "¿Quieres seguir jugando? (s/n): " repetir
    if [ "$repetir" != "s" ]; then
        break
    fi
done

echo "Jugaste $contador_juego veces. Lograste adivinar correctamente $contador_aciertos veces."

