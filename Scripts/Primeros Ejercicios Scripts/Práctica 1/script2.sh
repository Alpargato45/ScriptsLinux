#!/bin/bash
#2. Supongamos que el ejercicio anterior lo queremos ejecutar hasta que el usuario nos diga
#que no desea continuar. Realizar el script necesario.

seguir="si"

while [ "$seguir" != "no" ];do

    echo "Nombre del usuario: $(whoami)"
    echo "Directorio de trabajo: $(pwd)"
    read -p "¿Desea continuar? (si/no): " seguir
done