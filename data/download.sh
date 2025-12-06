#!/bin/bash

# This script downloads the NOAA OISST v2 High-Resolution sea surface
# temperature files for a specified range of years (1986-2024).
# It uses 'curl' to download each file and saves it with its original name.

# 'set -e' will cause the script to exit immediately if any command fails.
# set -e

# Define the base URL. The year will be appended inside the loop.
BASE_URL="https://downloads.psl.noaa.gov//Datasets/noaa.oisst.v2.highres"

# Define the start and end years
START_YEAR=1994
END_YEAR=2024

echo "Starting download for years $START_YEAR to $END_YEAR..."

# Loop through each year from START_YEAR to END_YEAR
for year in $(seq $START_YEAR $END_YEAR)
do
    # Construct the full filename and URL for the current year
    FILENAME="sst.day.mean.${year}.nc"
    URL="${BASE_URL}/${FILENAME}"

    echo "----------------------------------------"
    echo "Downloading: $FILENAME (from $URL)"
    
    # Use curl to download the file:
    # -L: Follow redirects (important for this server)
    # -o: Specify the output filename
    curl -L -o "$FILENAME" "$URL"
    
    echo "Finished: $FILENAME"
done

echo "----------------------------------------"
echo "All downloads complete."