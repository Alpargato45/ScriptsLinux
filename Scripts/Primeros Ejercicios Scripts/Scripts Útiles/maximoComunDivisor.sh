#!/bin/bash

calculate_gcd() {
    local num1=$1
    local num2=$2
    while [ $num2 -ne 0 ]; do
        local temp=$num2
        num2=$((num1 % num2))
        num1=$temp
    done
    echo "El MCD es: $num1"
}