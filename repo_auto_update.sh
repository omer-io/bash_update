#!/bin/bash

echo -e "\nEnter local repo path"
read repo_path
cd "$repo_path"

# print repo status
echo -e "\nThese changes are going to be pushed to remote repo:\n"
git status

echo -e "\nEnter file names to stage or press y to stage all"
read 
# read commit message from user
echo -e "\nEnter commit message: "
read commit_msg

# add, commit and push
git add .
git commit -m "$commit_msg"
git push origin main