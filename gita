#!/bin/sh

for dir in $(cat git.list); do
	echo $dir
	cd $dir
	git $@
	cd -
done

