#!/bin/bash

function spread_dashboard() {
	if [[ $# -ne 1 ]]; then
		echo "USAGE: spread_dashboard <contents-dir>"
	else
		for sub_dir in $1/*; do
			if [[ -d $sub_dir ]]; then
				sub_dir_name="$(basename $sub_dir)"
				let "sub_dir_files_count=$(ls -1 $sub_dir | wc -l) - 1"
				echo -e "$sub_dir_name\t $sub_dir_files_count"
			fi
		done
	fi
}
