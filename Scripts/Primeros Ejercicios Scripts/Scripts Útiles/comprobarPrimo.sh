#!/bin/bash

es_primo() {
    local num=$1
    for ((i=2; i<=num/2; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            echo "$num no es primo."
            return 1
        fi
    done
    echo "$num es primo."
}