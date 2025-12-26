#!/bin/sh

OUTPUT_FILE="project_dump.txt"

# Clear output file
> "$OUTPUT_FILE"

# Iterate over all tracked files
git ls-files | while read -r file; do
  # Skip binary files
  if file "$file" | grep -q binary; then
    echo "Skipping binary file: $file"
    continue
  fi

  echo "===============================" >> "$OUTPUT_FILE"
  echo "FILE: $file" >> "$OUTPUT_FILE"
  echo "===============================" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"

  cat "$file" >> "$OUTPUT_FILE"
  echo -e "\n\n" >> "$OUTPUT_FILE"
done

echo "Done. Output written to $OUTPUT_FILE"

