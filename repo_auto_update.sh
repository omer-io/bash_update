#!/bin/bash

# read local repo path from user
#echo -e "\nEnter local repo path"
#read repo_path
#cd "$repo_path" || exit

# print repo status
echo -e "\nThese files are modified/untracked/deleted:\n"
changed_files=$(git status --porcelain | sed s/^...//)

if [ -n "$changed_files" ]; then
    echo "$changed_files"
    echo -e "\nEnter file names to stage seperated by space or press y to stage all"
    read -r files

    if [ "$files" == "y" ]; then
        git add .
    else
        for file in $files; do
            git add "$file"
        done
    fi
    # read commit message from user
    echo -e "\nEnter commit message: "
    read commit_msg

    # commit and push
    git commit -m "$commit_msg"
    git push origin main
else
    echo -e "\nNo changes to commit"
fi