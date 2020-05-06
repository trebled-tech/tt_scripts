#!/bin/bash

# script to allow easy swap of SSH config file between default and OMCv1-specific version

case $1 in
  "omc")
	cd ~/.ssh && unlink config && ln -s config-omc config;;
  "default")
	cd ~/.ssh && unlink config && ln -s config-default config;;
  "alt")
	cd ~/.ssh && unlink config && ln -s config-default_alt config;;
  "*")
	echo "Please re-run the script with argument of 'omc', 'default', or 'alt'."
esac

