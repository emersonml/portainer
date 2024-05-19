#!/bin/bash

# Check if a commit message was provided as an argument
if [ -z "$1" ]; then
    echo "You need to provide a commit message."
    exit 1
fi

# Run git commands
git add .
git commit -m "$1"
git push

