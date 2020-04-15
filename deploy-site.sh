#!/bin/sh

# If a command fails then the deploy stops
set -e

echo "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Remove the old files in project
rm -rf public/*

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="Publish: $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master