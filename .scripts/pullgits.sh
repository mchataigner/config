#!/bin/bash

git_repos=$(cat ~/.git_repositories)
cd ~
mkdir -p usr
cd usr
for i in $git_repos;do
    if [ ! -d $i ];then
	git clone https://mootcube@github.com/mootcube/$i.git
    else
	cd $i
	git pull
	cd -
    fi
done
