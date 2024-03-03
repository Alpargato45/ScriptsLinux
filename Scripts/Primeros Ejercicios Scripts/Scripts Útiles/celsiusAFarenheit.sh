#!/bin/bash

celsius_a_fahrenheit() {
    local celsius=$1
    local fahrenheit=$(echo "scale=2; $celsius * 9/5 + 32" | bc)
    echo "$celsius°C es igual a $fahrenheit°F."
}