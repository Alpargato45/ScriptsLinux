#!/bin/bash

suma_rango() {
    local start=$1
    local end=$2
    local sum=0
    for ((i=start; i<=end; i++)); do
        sum=$((sum + i))
    done
    echo $sum
}