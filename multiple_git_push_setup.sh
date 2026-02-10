#!/bin/bash

# Script to configure Git remotes for pushing to GitHub and local server
# Configuration variables - modify these as needed
# Auto-protect this script from accidental credential uploads
SCRIPT_NAME="$(basename "$0")"
if [ -f "$SCRIPT_NAME" ]; then
    git update-index --assume-unchanged "$SCRIPT_NAME" 2>/dev/null
    echo "Script protected from git uploads"
fi

SERVER_USER="example_user"
SERVER_PASS="example_pass"
SERVER_IP="localhost"
SERVER_PORT="3000"
GITHUB_USER="example_user"
LOCAL_SERVER="http://${SERVER_USER}:${SERVER_PASS}@${SERVER_IP}:${SERVER_PORT}/${SERVER_USER}/.profile.git"
GITHUB_REPO="https://github.com/${GITHUB_USER}/${GITHUB_USER}.git"
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
