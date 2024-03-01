#!/bin/bash
#6. Realiza un script llamado compara, que al llamarlo nos pida que introduzcamos una
#palabra, y una vez introducida nos pedirá otra. Luego comparará y nos indicará si las
#palabras introducidas son iguales o no

read -p "Introduce una palabra: " palabra1
read -p "Introduce otra palabra: " palabra2

if [ "$palabra1" == "$palabra2" ];then
    echo "Las palabras son iguales"
else
    echo "Las palabras no son iguales"
fi