#!/usr/bin/env python

import os,subprocess as sub


home = os.environ['HOME']+os.sep

if not os.path.isdir(home+'usr'):
	os.mkdir(home+'usr')

os.chdir(home)

def install_packages():
	if os.path.isfile(home+'.packages'):
		f = open(home+'.packages')
		packages = list(map(lambda i: i.strip(),f.readlines()))
		f.close()
		sub.call(['sudo','apt-get','update'])
		sub.call(['sudo','apt-get','install']+packages)

install_packages()