#!/usr/bin/env bash

# Define the path to your file containing the list of repository URLs
REPO_LIST_FILE=".repos"

# Check if the file exists
if [[ ! -f $REPO_LIST_FILE ]]; then
    echo "File $REPO_LIST_FILE does not exist."
    exit 1
fi

# Loop over each line in the file
while IFS= read -r repo_url; do
    # Skip empty lines
    [[ -z "$repo_url" ]] && continue

    # Clone the repository
    echo "Cloning repository: $repo_url"
    git clone "$repo_url"

    # Check if the cloning was successful
    if [[ $? -ne 0 ]]; then
        echo "Failed to clone $repo_url"
    else
        echo "Successfully cloned $repo_url"
    fi

done <"$REPO_LIST_FILE"

echo "Finished cloning repositories."
