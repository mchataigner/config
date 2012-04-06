#!/bin/bash

git_repos=$(cat ~/.git_repositories)
cd ~
mkdir -p usr
cd usr
for i in $git_repos;do
    if [ -d $i ];then
	cd $i
	bash config.sh
	cd -
    fi
done
