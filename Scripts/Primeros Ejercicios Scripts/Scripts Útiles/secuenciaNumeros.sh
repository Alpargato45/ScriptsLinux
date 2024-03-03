#!/bin/bash

generar_secuencia() {
    local start=$1
    local end=$2
    for ((i=start; i<=end; i++)); do
        echo $i
    done
}