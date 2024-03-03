#!/bin/bash

calculate_circle_area() {
    local radius=$1
    local area=$(echo "scale=2; 3.14 * $radius * $radius" | bc)
    echo "El área del círculo con radio $radius es: $area"
}