#!/bin/bash

function identify_image() {
	if [[ $# -ne 1 ]]; then
		echo "USAGE: identify_image <prompt-path>"
	else
		echo $(basename $1)_$(sha1sum $1 | cut -d ' ' -f 1)_$(uuidgen)
	fi
}
