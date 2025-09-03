#!/usr/bin/env bash
# Usage: ./set_conda_env.sh env_vars.txt my_env

# Exit if any command fails
set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <env_vars_file> <conda_env_prefix>"
    exit 1
fi

ENV_FILE="$1"
CONDA_ENV="$2"

if [ ! -f "$ENV_FILE" ]; then
    echo "Error: File '$ENV_FILE' not found!"
    exit 1
fi

# Loop through each line of the env file
while IFS='=' read -r key value; do
    # Skip empty lines and comments
    [[ -z "$key" || "$key" =~ ^# ]] && continue

    # Trim whitespace
    key=$(echo "$key" | xargs)
    value=$(echo "$value" | xargs)

    echo "Setting $key in conda env $CONDA_ENV"

    # Use conda's built-in mechanism for persistent env variables
    conda env config vars set "$key=$value" -p "$CONDA_ENV"
done < "$ENV_FILE"

echo "All variables set. To activate them, run:"
echo "    conda activate $CONDA_ENV"
