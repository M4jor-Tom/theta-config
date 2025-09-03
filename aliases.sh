#!/bin/bash

alias vbash='vim ~/aliases.sh'
alias sbash='source ~/.bashrc'
alias vsbash='vbash; sbash'

alias grade='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'

for git_alias in branch push; do
	alias $git_alias="git $git_alias"
done

alias gs='git status'
alias g='git remote prune origin; git fetch --all; git log --decorate --graph --oneline --all'
alias co='git checkout'
alias ci="git commit -m"
alias ga='git add --all'
alias gr='git restore'
alias gd='git diff'
alias gds='git diff --staged'
alias gca='git commit --amend'
alias gcane='git commit --amend --no-edit'
alias force='git push --force'
alias quickForce='ga; gcane; force'
alias cwitch='git switch -c'

alias con='eval "$(/home/tom/anaconda3/bin/conda shell.bash hook)"'
alias cel='conda env list'
alias condhere="conda activate $(readlink python | rev | cut -d '/' -f 3- | rev)"
alias civitaikido='cd /home/tom/repos/prompt_unify/browser-interaction/playwright-manipulation; conda activate civitaikido'
alias hutils='cd /home/tom/repos/prompt_unify/hugging_face_utils; conda activate huggingface_space_utils'
