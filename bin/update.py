#!/usr/bin/env python3

import os,subprocess as sub


home = os.environ['HOME']+os.sep

if not os.path.isdir(home+'usr'):
	os.mkdir(home+'usr')

os.chdir(home)

def install_packages():
	if os.path.isfile(home+'.packages'):
		f = open(home+'.packages')
		packages = [i.strip() for i in f.readlines() if len(i.strip())>0]
		f.close()
		print(' '.join(packages))

		sub.call(['sudo','apt-get','update','-y'])
		sub.call(['sudo','apt-get','dist-upgrade','-y'])
		sub.call(['sudo','apt-get','install','-y']+packages)

install_packages()
