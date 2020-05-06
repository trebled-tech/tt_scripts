#!/bin/bash

# script takes an input list of hosts and turns them into a cssh 'on-the-fly' command
# there are two pre-requisites: you have the full vim-common package installed, and you have clusterssh installed

# check to see that vim and cssh are present
is_vim_there=$(which vim |grep "which")

if [ "$is_vim_there" != "" ]
then
	echo "vim was not found in your PATH; please check $PATH and/or install vim-common"
	exit 1
fi

echo "This script takes a sequential list of hosts you provide, sorts, removes duplicates, and outputs both a sequential list and all hosts on a single line." >> hostlistfile
echo "Paste a sequential list of hosts, one per line, in this vi session, then save and quit." >> hostlistfile
echo \ >> hostlistfile
echo \ >> hostlistfile
vim +star +4 hostlistfile

str_hosts=$(tail -$(expr `cat hostlistfile |wc -l` - 3) hostlistfile |sort -u |grep ^[a-z] |sed ':a;N;$!ba;s/\n/ /g')
rm hostlistfile

printf "\n"
for i in $str_hosts; do echo $i; done
printf "\n"
echo $str_hosts

