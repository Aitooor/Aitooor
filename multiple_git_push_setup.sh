#!/bin/bash

# Script to configure Git remotes for pushing to GitHub and local server
# Configuration variables - modify these as needed

GITHUB_REPO="https://github.com/example_user/example_user.git"
SERVER_USER="example_user"
SERVER_PASS="example_password"
LOCAL_SERVER="http://${SERVER_USER}:${SERVER_PASS}@localhost:3000/${SERVER_USER}/.profile.git"
GITHUB_USER="example_user"
BRANCH="main"

echo "Configuring Git remotes..."

# Clear all existing URLs and set fresh configuration
git remote remove origin 2>/dev/null
git remote add origin "$GITHUB_REPO"

# Set push URLs
git remote set-url --add --push origin "$GITHUB_REPO"
git remote set-url --add --push origin "$LOCAL_SERVER"

# Configure user
git config user.name "$GITHUB_USER"

echo "Configuration completed:"
git remote -v
echo ""
echo "User configured: $(git config user.name)"
echo ""
echo "Now you can use 'git push origin $BRANCH' to push to both destinations"
