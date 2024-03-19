#!/bin/bash

# Get the 6 numbers from command line arguments
numbers=("$@")

# Function to perform subtraction
perform_subtraction() {
    result=$((${numbers[0]} - ${numbers[1]} - ${numbers[2]} - ${numbers[3]} - ${numbers[4]} - ${numbers[5]}))
    echo "Subtraction result: $result"
}

# Function to perform multiplication and store result in a JSON file
perform_multiplication() {
    result=$((${numbers[0]} * ${numbers[1]} * ${numbers[2]} * ${numbers[3]} * ${numbers[4]} * ${numbers[5]}))
    json="{\"InputNumber1\": ${numbers[0]}, \"InputNumber2\": ${numbers[1]}, \"InputNumber3\": ${numbers[2]}, \"InputNumber4\": ${numbers[3]}, \"InputNumber5\": ${numbers[4]}, \"InputNumber6\": ${numbers[5]}, \"Multiplication\": $result}"
    echo $json > result.json
    echo "Multiplication result stored in result.json"
}

# Function to pick a random number
pick_random_number() {
    index=$((RANDOM % 6))
    echo "Random number: ${numbers[$index]}"
}

# Function to print sorted array in descending order
print_sorted_descending() {
    sorted_numbers=($(printf "%s\n" "${numbers[@]}" | sort -nr))
    echo "Sorted (highest to lowest) numbers: ${sorted_numbers[*]}"
}

# Function to print sorted array in ascending order
print_sorted_ascending() {
    sorted_numbers=($(printf "%s\n" "${numbers[@]}" | sort -n))
    echo "Sorted (lowest to highest) numbers: ${sorted_numbers[*]}"
}

# Present the choice menu to the user
echo "Please choose an option:"
echo "1. Perform subtraction and show output on screen"
echo "2. Perform multiplication and store result in a JSON file"
echo "3. Pick a random number"
echo "4. Print sorted (highest to lowest) numbers"
echo "5. Print sorted (lowest to highest) numbers"

# Read user's choice
read choice

# Perform the chosen operation
case $choice in
    1) perform_subtraction ;;
    2) perform_multiplication ;;
    3) pick_random_number ;;
    4) print_sorted_descending ;;
    5) print_sorted_ascending ;;
    *) echo "Invalid choice" ;;
esac