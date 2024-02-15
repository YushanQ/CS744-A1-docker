#!/bin/bash

string=$(hostname)

# Set the IFS to dot (.)
IFS='.' read -ra parts <<< "$string"

# Print each part
for part in "${parts[@]}"; do
  echo "$part"
done