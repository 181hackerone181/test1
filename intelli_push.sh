#!/bin/sh
if [ $# -lt 3 ]
  then
    echo "Add arguments :\n \$1 -> master branch name \n \$2 -> new branch name \n \$3 -> folders to be ignored (separated by ,) \n \$4 -> git remote alias"
    exit 1
fi

git checkout $1
git checkout -b $2
echo "$3/" >> .gitignore
git rm -r $3 --cached
git add .
git commit -a -m'Add temp ignore'
git push $4
git reset --hard @{1}
