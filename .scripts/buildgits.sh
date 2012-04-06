#!/bin/bash

git_repos=$(cat ~/.git_repositories)
cd ~
mkdir -p usr
cd usr
for i in $git_repos;do
    if [ -d $i ];then
	cd $i
	git pull
	bash build.sh
	cd -
    fi
done
