#!/bin/bash

git_repos=$(cat ~/.git_repositories)
cd ~
mkdir -p usr
cd usr
for i in $git_repos;do
    if [ -d $i ];then
	cd $i
	bash setup.sh
	if [ $? -eq 0 ];then bash config.sh;fi
	cd -
    fi
done

cd ~
chown $USER:$USER -R usr

