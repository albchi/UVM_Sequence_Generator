#!/bin/bash

# Loop through all files with the .v extension in the current directory
for file in *.v; do
  # Extract the filename without the extension
  filename="${file%.*}"

  # Rename the file with the new .sv extension
  mv "$file" "$filename.sv"
done

echo "Converted all .v files to .sv in the current directory."
