#!/bin/bash

jugadas=0
aciertos=0

while true; do
	read -p "Introduce el nombre de la variable a comprobar: " var
	
	if [ -f "$var" ]; then
		intentos=2
		jugadas=$(($jugadas+1))
		
		while [ $intentos -gt 0 ]; do
			read -p "¿Cuántas líneas tiene el fichero? " numLineas

            		if [ "$numLineas" -eq "$(wc -l < "$var")" ]; then
                		echo "¡Correcto! Has adivinado el número de líneas."
                		aciertos=$((aciertos+1))
                		break;
            		else
                		echo "Incorrecto. Te quedan $((intentos-1)) intentos."
                		intentos=$((intentos-1))
            		fi
		done
	elif [ -d $var ]; then
		intentos=2
		jugadas=$(($jugadas+1))
		
		while [ $intentos -gt 0 ]; do
			read -p "¿Cuántos ficheros tiene el directorio? " numFich

            		if [ "$numFich" -eq "$(ls -l "$var" | grep -c '^-' )" ]; then
                		echo "Correcto."
                		aciertos=$((aciertos+1))
                		break;
            		else
                		echo "Incorrecto. Te quedan $((intentos-1)) intentos."
                		intentos=$((intentos-1))
            		fi
            		
		done
	else
		echo "Valor incorrecto"
	fi
	read -p "Desea continuar jugando (s/n): " resp
	if [ "$resp" != "s" ]; then
        	break;
        	
        fi
done

read -p "Desea ver los resultados de la partida? (s/n)" resp
if [ "$resp" != "s" ]; then
    	exit 0
else
	export jugadas
	export aciertos
	./ej2_2.sh 	
fi



Script 2.2
#!/bin/bash

echo "Ha jugado $jugadas veces"
echo "Ha acertado $aciertos veces"