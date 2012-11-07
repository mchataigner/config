#!/usr/bin/env python

import os,subprocess as sub

home = os.environ['HOME']+os.sep

if not os.path.isdir(home+'usr'):
	os.mkdir(home+'usr')

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
