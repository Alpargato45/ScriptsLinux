#!/bin/bash

calcular_promedio() {
    local sum=0
    local count=0
    for num in "$@"; do
        sum=$((sum + num))
        count=$((count + 1))
    done
    local average=$(echo "scale=2; $sum / $count" | bc)
    echo "El promedio es: $average"
}