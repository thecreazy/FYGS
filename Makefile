#==========================================
#	Makefile: makefile for fygs 1.0
#			@thecreazy
#	(https://github.com/thecreazy)
#	Last Modified: 2020/02/25
#==========================================


all: install

install:
	cp ./script.sh /usr/local/bin/fygs
	chmod +x /usr/local/bin/fygs
	echo Install completed