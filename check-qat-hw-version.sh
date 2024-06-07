#!/bin/bash

# Check if lspci is installed
if ! command -v lspci &> /dev/null
then
    echo "lspci command could not be found"
    exit 1
fi

# Run lspci command to check for QAT hardware version 1.x
QAT_HW_V1=$(lspci -nn | egrep -e '8086:37c8|8086:19e2|8086:0435|8086:6f54')
# Run lspci command to check for QAT hardware version 2.0
QAT_HW_V2=$(lspci -nn | egrep -e '8086:4940|8086:4942')

# Check and output the results
if [ -n "$QAT_HW_V1" ]; then
    echo "Intel® QAT Hardware Version 1.x detected:"
    echo "$QAT_HW_V1"
elif [ -n "$QAT_HW_V2" ]; then
    echo "Intel® QAT Hardware Version 2.0 detected:"
    echo "$QAT_HW_V2"
else
    echo "No Intel® QAT Hardware detected."
fi