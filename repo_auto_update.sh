#!/bin/bash

# read local repo path from user
echo -e "\nEnter local repo path"
read repo_path
cd "$repo_path" || exit

# check repo status
changed_files=$(git status --porcelain | sed s/^...//)

# condition to check if changes occurred
if [ -n "$changed_files" ]; then
    echo -e "\nThese files are modified/untracked/deleted:\n"
    echo "$changed_files"
    echo -e "\nEnter file names to push seperated by space or press y to push all"
    read -r user_files

    #if input is y then add all
    if [ "$user_files" == "y" ]; then
        git add .
    #else add files entered by user
    else
        for filename in $user_files; do
            git add "$filename"
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
echo "hello"