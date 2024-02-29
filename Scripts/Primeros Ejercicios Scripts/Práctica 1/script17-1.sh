#!/bin/bash
#17. Utilizar en un script algunas variables y, a continuación, llamar a un segundo script
#permitiendo que algunas variables sean utilizadas por el segundo

variable1="hola"
variable2="buenas"

echo "Primer Script"
echo "Variable 1: $variable1"
echo "Variable 2: $variable2"

./script17-2.sh "$variable1" "$variable2" #Esta es la forma de llamar un segundo script desde otro