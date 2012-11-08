#!/usr/bin/env python3

import os,subprocess as sub


home = os.environ['HOME']+os.sep

if not os.path.isdir(home+'usr'):
	os.mkdir(home+'usr')

os.chdir(home)

def depend():
	dependencies = ['git','git-core','wget','encfs']
	sub.call(['sudo','apt-get','install']+dependencies)

def git_init():
	sub.call(['git','clone','https://github.com/mootcube/config.git'])
	sub.call(['rsync','-av',home+'config/',home+'/'])
	sub.call(['rm','-rf',home+'/config'])

def install_packages():
	if os.path.isfile(home+'.packages'):
		f = open(home+'.packages')
		packages = [i.strip() for i in f.readlines() if len(i.strip())>0]
		f.close()
		print(' '.join(packages))

		sub.call(['sudo','apt-get','update','-y'])
		sub.call(['sudo','apt-get','dist-upgrade','-y'])
		sub.call(['sudo','apt-get','install','-y']+packages)

def config_ssh():
	if os.path.isdir(home+'tmp'):
		sub.call(['rm','-rf',home+'tmp'])
	os.mkdir('tmp')
	if not os.path.isdir(home+'.ssh'):
		os.mkdir('.ssh')
	sub.call(['encfs',home+'..ssh',home+'tmp'])
	sub.call(['rsync','-av',home+'tmp/',home+'.ssh/'])
	sub.call(['chmod','700','-R',home+'.ssh'])
	sub.call(['fusermount','-u',home+'tmp'])
	sub.call(['ssh-add'])
	sub.call(['rsync','-av',home+'.gitconfig_config',home+'.git/config'])

def git_repo():
	os.chdir(home+'usr')
	f = open(home+'.git_repositories')

	for i in f.readlines():
		cur = os.getcwd()
		if os.path.isdir(cur+os.sep+i.strip()):
			os.chdir(cur+os.sep+i.strip())
			sub.call(['git','pull'])
		else:
			sub.call(['git','clone','git@github.com:mootcube/'+i.strip()+'.git'])
		os.chdir(cur+os.sep+i.strip())
		if os.path.isfile('dependencies'):
			d=open('dependencies')
			a=d.readlines()
			d.close()
			dep = list(map(lambda i: i.strip(),a))
			sub.call(['sudo','apt-get','install']+dep)
		sub.call(['python','setup.py'])
		os.chdir(cur)
	f.close()

def apps():
	sub.call(['wget','http://apt.typesafe.com/repo-deb-build-0002.deb'])
	sub.call(['sudo','dpki','-i','repo-deb-build-0002.deb'])

if __name__ == "__main__":
	depend()
	git_init()
	install_packages()
	config_ssh()
	git_repo()
