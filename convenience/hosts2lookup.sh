#!/bin/bash

# script takes an input list of hosts and turns them into a cssh 'on-the-fly' command
# there are two pre-requisites: you have the full vim-common package installed, and you have clusterssh installed

# check to see that vim and cssh are present
is_vim_there=$(which vim |grep "which")
is_cssh_there=$(which vim |grep "which")

if [ "$is_vim_there" != "" ]
then
	echo "vim was not found in your PATH; please check $PATH and/or install vim-common"
	exit 1
fi

vim +star hostlistfile

cat hostlistfile |sort -u > cleanfile
rm hostlistfile

for i in `cat cleanfile`; do
	echo $(host $i |awk '{print $1,$4}')
done

rm cleanfile
