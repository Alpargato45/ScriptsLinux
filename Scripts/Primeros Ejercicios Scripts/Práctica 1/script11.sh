#!/bin/bash

for ((i=1; i<=5; i++)); do
	case $i in
		1)
			echo "Formato 1: $(date -d $1 +'%Y-%m-%d %H:%M:%S')"
			;;
		2)
			echo "Formato 2: $(date -d $1 +'%A, %d de %B de %Y')"
			;;
		3)
			echo "Formato 3: $(date -d $1 +'%Y%m%d_%H%M%S')"
			;;
		4)
			echo "Formato 4: $(date -d $1 + '%A %d %b %Y')"
			;;
		5)
			echo "Formato 5: $(date -d $1 +'%d/%m/%Y %H:%M')"
			;;
	esac
done