#!/bin/bash

# Start date
START_DATE="2024-01-10"

# End date (today)
END_DATE=$(date +"%Y-%m-%d")

# Number of commits to add
NUM_COMMITS=10

# Loop through dates and add commits
current_date="$START_DATE"
while [ "$current_date" != "$END_DATE" ]; do
    # Generate random commit message
    commit_message=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

    # Commit changes
    echo "Committing changes for date: $current_date"
    touch dummy.txt
    git add dummy.txt
    git commit --date="$current_date" -m "$commit_message"

    # Move to the next date
    current_date=$(date -d "$current_date + 1 day" +"%Y-%m-%d")
done
