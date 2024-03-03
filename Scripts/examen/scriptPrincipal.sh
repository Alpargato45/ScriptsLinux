while true; do
  echo "Menú:"
  echo "1. Ejercicio 1."
  echo "2. Ejercicio 2."
  echo "3. Salir."

  read -p "Selecciona una opción (1/2/3): " opcion

  case $opcion in
    1)
      echo "Ejecutando ejercicio 1"
      ./ejercicio1.sh
      ;;
    2)
      echo "Ejecutando ejercicio 2"
      ./ejercicio2.sh
      ;;
    3)
      echo "Saliendo del menú."
      exit 0
      ;;
    *)
      echo "Opción no válida. Por favor, selecciona 1, 2 o 3."
      ;;
  esac
done
