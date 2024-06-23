#!/bin/bash

# File containing the list of servers
SERVER_FILE="server.txt"

# File to output the results
OUTPUT_FILE="output.txt"

# Empty the output file if it exists
> "$OUTPUT_FILE"

# Loop through each server in the server file
while IFS= read -r server; do
    # Check if port 22 is open
    nc -z -w 3 "$server" 22
    if [ $? -eq 0 ]; then
        # If port 22 is open, write the server to the output file
        echo "Port 22 open: $server" >> "$OUTPUT_FILE"
    else
        # If port 22 is not open or there is an error, write the server to the output file
        echo "Port 22 not open or error: $server" >> "$OUTPUT_FILE"
    fi
done < "$SERVER_FILE"

echo "Check completed. Results listed in $OUTPUT_FILE."

