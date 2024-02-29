#!/bin/bash
#4. Realiza un script llamado pitagoras, que al llamarlo nos pida primero un valor, y
#después de introducirlo nos pedirá otro valor. Luego realizará el teorema de Pitágoras con esos valores

read -p "Primer número: " valor1
read -p "Segundo número: " valor2

if [[ ! "$valor1" =~ ^[0-9]+$ || ! "$valor2" =~ ^[0-9]+$ ]]; then #Esto es una expresión regular
#Que comprueba si los valores son numéricos o no
    echo "Lo siento, solo se admiten números"
    exit 1
fi

h=$(echo "sqrt(($valor1*$valor1)+($valor2*$valor2))" | bc)
h=$(echo "scale=2; sqrt(($valor1*$valor1)+($valor2*$valor2))" | bc) #Esta seria la forma para hacerlo con decimales

echo "El teorema de Pitágoras de $valor1 y $valor2 es $h"