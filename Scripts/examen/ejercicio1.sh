#!/bin/bash

contador_factorial=0
contador_descuento=0
contador_salida=0

while true; do
    echo "Menú:"
    echo "a) Factorial"
    echo "b) Descuento"
    echo "c) Salida"

    read -p "Seleccione una opción (a/b/c): " opcion

    case $opcion in
        a)
            ((contador_factorial++))
            read -p "Introduzca un número para calcular su factorial: " numero

            if ! [[ "$numero" =~ ^[0-9]+$ ]]; then
                echo "Error: Por favor, ingrese un número válido."
                continue
            fi
            
            numeros=""
            for (( i = numero; i > 1; i-- )); do
            	numeros+=${i}"*"
            done
            numeros+="1"

            factorial=1
            for (( i = 1; i <= numero; i++ )); do
                factorial=$((factorial * i))
            done

            echo "El factorial de $numero es $numeros = $factorial"
            ;;
        b)
            ((contador_descuento++))
            read -p "Introduzca el valor de la prenda: " precio_prenda

            while true; do
                read -p "Introduzca el descuento (entre 10 y 50): " descuento

                if ((descuento >= 10 && descuento <= 50)); then
                    break
                else
                    echo "Error: El descuento debe estar entre 10 y 50."
                fi
            done

            precio_con_descuento=$(echo "scale=2; $precio_prenda * (1 - $descuento/100)" | bc)

            echo "El precio con descuento del $descuento% es: $precio_con_descuento"
            ;;
        c)
            ((contador_salida++))
            read -p "¿Está seguro de que desea salir? (s/n): " salir

            if [ "$salir" == "s" ]; then
                echo "Resumen de selecciones:"
                echo "a) Factorial: $contador_factorial veces"
                echo "b) Descuento: $contador_descuento veces"
                echo "c) Salida: $contador_salida veces"
                exit 0
            fi
            ;;
        *)
            echo "Error: Opción no válida. Por favor, seleccione a, b, o c."
            ;;
    esac
done

