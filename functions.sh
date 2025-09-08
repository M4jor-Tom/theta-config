#!/bin/bash

function identify_image() {
	if [[ $# -ne 1 ]]; then
		echo "USAGE: identify_image <prompt-path>"
	else
		echo $(basename $1)_$(sha1sum $1 | cut -d ' ' -f 1)_$(uuidgen)
	fi
}

function spread_dashboard() {
	if [[ $# -ne 1 ]]; then
		echo "USAGE: spread_dashboard <contents-dir>"
	else
		for sub_dir in $1/*; do
			if [[ -d $sub_dir ]]; then
				sub_dir_name="$(basename $sub_dir)"
				sub_dir_files_count="$(ls -1 $sub_dir | wc -l)"
				echo -e "$sub_dir_name\t $sub_dir_files_count"
			fi
		done
	fi
}
