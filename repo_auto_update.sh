#!/bin/bash

#repo_url="git@github.com:omer-io/bash_update.git"

#echo "Cloning into $repo_url"

#git clone git@github.com:omer-io/bash_update.git
echo -e "/nThese changes are going to be pushed to remote repo:\n"
git status


echo -e "/nEnter commit message: "
read commit_msg

git add .
git commit -m "$commit_msg"
git push