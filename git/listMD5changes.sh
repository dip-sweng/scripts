#!/bin/bash

# for loop splits when it sees any whitespace like space, tab, or newline.
# So, you should use IFS (Internal Field Separator):
IFS=$'\n'

echo "Unstaged files : --------------------------------------------------------"
COMMAND=`git ls-files --others --exclude-standard`
for i in $COMMAND; do
	# echo item: $i $(md5sum) $i
	md5=`md5sum $i`
	echo ${md5}
done

echo "Staged files : ----------------------------------------------------------"
COMMAND=`git diff HEAD --name-only`
for i in $COMMAND; do
	# echo item: $i $(md5sum) $i
	md5=`md5sum $i`
	echo ${md5}
done
