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

function mv_quick() {
	STATE_DIR=".local/state/mv_quick"
	mkdir -p "${STATE_DIR}"
	FROM_PATH_PATH="${STATE_DIR}/from.txt"
	TO_PATH_PATH="${STATE_DIR}/to.txt"
	if [ -e "${FROM_PATH_PATH}" ] && [ -e "${TO_PATH_PATH}" ]; then
		FROM_PATH="$(cat $FROM_PATH_PATH)"
		TO_PATH="$(cat $TO_PATH_PATH)"
		if [ -e "${FROM_PATH}" ] && [ -e "${TO_PATH}" ]; then
			mkdir -p "${TO_PATH}/"
			mv "${FROM_PATH}"/* "${TO_PATH}/"
		else
			echo "Check that ${FROM_PATH} and ${TO_PATH} exist."
		fi
	else
		echo "Check that ${FROM_PATH_PATH} and ${TO_PATH_PATH} exist and have content."
	fi
}

function quadiff() {
  if [[ $# -ne 4 ]]; then
    echo "USAGE quadiff <commit-start-1> <commit-end-1> <commit-start-2> <commit-end-2>"
  else
    OLD_DIFF_PATH="$HOME/old_diff.txt"
    NEW_DIFF_PATH="$HOME/new_diff.txt"
    git diff "$1" "$2" > "$OLD_DIFF_PATH"
    git diff "$3" "$4" > "$NEW_DIFF_PATH"
    diff "$OLD_DIFF_PATH" "$NEW_DIFF_PATH"
    rm "$OLD_DIFF_PATH" "$NEW_DIFF_PATH"
  fi
}
