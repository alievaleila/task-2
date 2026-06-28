#!/bin/bash

# ==============================================================================
# Script Name: simple-interest.sh
# Description: A Bash script to compute simple interest based on user input.
# Formula:     Simple Interest = (P * R * T) / 100
# ==============================================================================

echo "--------------------------------------------------"
echo "          Simple Interest Calculator              "
echo "--------------------------------------------------"

# Read Principal Amount
read -p "Enter the principal amount (P): " principal

# Read Rate of Interest
read -p "Enter the annual rate of interest in % (R): " rate

# Read Time Period
read -p "Enter the time period in years (T): " time

# Input Validation: Check if any input is empty
if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
    echo "Error: All fields (Principal, Rate, and Time) are required."
    exit 1
fi

# Calculate Simple Interest using 'bc' for floating-point precision
# Formula: SI = (P * R * T) / 100
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc -l)

# Calculate Total Amount (Principal + Interest)
total_amount=$(echo "scale=2; $principal + $interest" | bc -l)

echo "--------------------------------------------------"
echo "Calculation Results:"
echo "--------------------------------------------------"
echo "Principal Amount : $principal"
echo "Interest Rate    : $rate%"
echo "Time Period      : $time year(s)"
echo "--------------------------------------------------"
echo "Simple Interest  : $interest"
echo "Total Amount     : $total_amount"
echo "--------------------------------------------------"
