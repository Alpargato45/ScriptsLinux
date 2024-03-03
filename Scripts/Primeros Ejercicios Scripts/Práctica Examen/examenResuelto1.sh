#!/bin/bash

calcular_factorial() {
    local num=$1
    local fact=1

    for ((i = 2; i <= num; i++)); do
        fact=$((fact * i))
    done

    echo "El factorial de $num es: $fact"
}

seleccionesA=0
seleccionesB=0

while true; do
	echo "a) Factorial"
	echo "b) Descuento"
	echo "c) Salir"
	read -p "Introduzca la opción: " opcion
	case $opcion in
		a)
			
			seleccionesA=$((seleccionesA+1))
			read -p "Introduce un número para calcular su factorial: " num
			calcular_factorial "$num"
			;;
            	b)
            		read -p "Introduzca el valor de la prenda: " precio
            		while true; do
            			read -p "Introduzca el descuento: " desc
            			if [[ $desc -ge 10 ]] && [[ $desc -le 50 ]]; then
            				echo "a"
                    			break;
                		else
                    			echo "El descuento debe estar entrecomprendido entre 10 y 50."
                		fi
                	done
                	descPrenda=$((precio * desc / 100))
                	prendaConDesc=$((precio - $descPrenda))
                	echo "Descuento del $desc % de $precio = $prendaConDesc"
                	seleccionesB=$((seleccionesB+1))
                	;;
                c)
                	read -p "¿Estás seguro de que quieres salir? (s/n): " salir
            		if [ "$salir" == "s" ]; then
                		break
            		fi
            		;;
                	
        esac
done

echo "Veces seleccionada la opción Factorial: $seleccionesA"
echo "Veces seleccionada la opción Descuento: $seleccionesB" 