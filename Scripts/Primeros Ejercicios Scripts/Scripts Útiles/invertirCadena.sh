#!/bin/bash

reverse_string() {
    local input=$1
    echo "$input" | rev
}