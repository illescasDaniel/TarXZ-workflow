#!/bin/bash

dir="`dirname "$1"`/"

cd "$dir"

# Decompress
if [[ "$@" == *.tar.xz ]]; then
	
	# Decompress files on the /private/tmp folder and check if the filename already exists
		
	mkdir /private/tmp/tarXZ
	tar -xJf "$@" -C /private/tmp/tarXZ/
	
	outputName=/private/tmp/tarXZ/*
	name="`basename "$(echo $outputName)"`" 
	
	if [[ -e $name ]]; then
		# It's a folder
		if [[ -d "$name" ]]; then
			
			number=2
			
			while [[ -e "${name%.*.*} $number" ]]; do
				((number ++))
			done
			
			mkdir "${name%.*.*} $number"
			mv /private/tmp/tarXZ/* "${name%.*.*} $number"
			
		else
			
			number=2
			
			while [[ -e "${oname%.*} $number.${namee##*.}" ]]; do
				((number ++))
			done
			
			mv /private/tmp/tarXZ/* "${name%.*} $number.${name##*.}"
		fi
	else
		mv /private/tmp/tarXZ/* .
	fi
	
	rm -rf /private/tmp/tarXZ

# Compress
else
	# One file to compress
	if [[ $# -eq 1 ]]; then
		
		# Check if compressed file already exist
		if [[ -e "$@.tar.xz" ]]; then
	
			number=2
			
			while [ -e "$@ $number.tar.xz" ]; do
				((number++))
			done
			
			COPYFILE_DISABLE=true XZ_OPT=-9e tar --exclude='.DS_Store' --exclude='__MACOSX' -cJf "$@ $number.tar.xz" "`basename "$@"`"
			
		else
			COPYFILE_DISABLE=true XZ_OPT=-9e tar --exclude='.DS_Store' --exclude='__MACOSX' -cJf "$@.tar.xz" "`basename "$@"`"
		fi
			
	else 
		if [[ -e Archive.tar.xz ]]; then
			number=2
			
			while [ -e "Archive $number.tar.xz" ]; do
				((number++))
			done
			
			# FIXME: when extracting a compressed file made with this line the result is... unwanted
			
			COPYFILE_DISABLE=true XZ_OPT=-9e tar --exclude='.DS_Store' --exclude='__MACOSX' -cJf "Archive $number.tar.xz" "$@"
			
		else
			COPYFILE_DISABLE=true XZ_OPT=-9e tar --exclude='.DS_Store' --exclude='__MACOSX' -cJf Archive.tar.xz "$@"
		fi
	fi
fi

afplay ~/Library/Sounds/Compress.aiff