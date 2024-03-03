#!/bin/bash

sort_numbers() {
    local sorted_numbers=($(echo "$@" | tr ' ' '\n' | sort -n))
    echo "Números ordenados: ${sorted_numbers[@]}"
}