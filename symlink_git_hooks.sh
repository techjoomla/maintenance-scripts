#!/bin/bash
# Author    : Manoj L
# Usage     : This script creates symlinks of git hook files into all git repos
# Step1     : Edit this file to specify eg: git_root_dir="/home/manoj/GIT";
# Step2     : Save and execute this file
# Assumption: It assumes all of your git repos are in git_root_dir folder

# $ HOME = eg. /home/manoj
# eg. git_root_dir=$HOME"/GIT";
git_root_dir=$HOME"/GIT";

# Jump to git repos folder
cd $git_root_dir

# If hooks repo not found, clone it first
if [ ! -d "phpcs-hooks" ]; then
	echo "PHPCS hooks repo not found"
	echo "Cloning PHPCS hooks repo"
git clone git@git.tekdi.net:techjoomla/phpcs-hooks.git phpcs-hooks
else
	echo "PHPCS hooks repo found"
	echo "Getting latest PHPCS hooks code"
	cd phpcs-hooks
	git pull
	cd ..
fi

# Define hooks paths to symlink
hook_path_commit_msg="${git_root_dir}/phpcs-hooks/commit-msg"
hook_path_pre_commit="${git_root_dir}/phpcs-hooks/pre-commit"
hook_path_config="${git_root_dir}/phpcs-hooks/config"

# Get all git repos in git repos folder
for repo in $(ls -d */);
do
	if [ $repo != "phpcs-hooks" ]; then
		echo '\033[0;33m';
		echo '>>> Setting up hooks in repo:' ${repo%%/} '\033[1;37m'

		# Do this for all hook files - rename existing hook, symlink latest hook, set new hook as excutable
		# Commit msg hook
		echo 'Copying commit msg hook from' $hook_path_commit_msg
		mv "$repo".git/hooks/commit-msg "$repo".git/hooks/commit-msg"_old"
		ln -sf $hook_path_commit_msg "$repo".git/hooks/commit-msg
		chmod +x "$repo".git/hooks/commit-msg

		# Pre-commit hook
		echo 'Copying pre-commit hook from' $hook_path_pre_commit
		mv "$repo".git/hooks/pre-commit "$repo".git/hooks/pre-commit"_old"
		ln -sf $hook_path_pre_commit "$repo".git/hooks/pre-commit
		chmod +x "$repo".git/hooks/pre-commit

		# Commit msg hook
		echo 'Copying config file from    ' $hook_path_config
		if [ -e "$repo".git/hooks/config ]; then
			mv "$repo".git/hooks/config "$repo".git/hooks/config"_old"
			ln -sf $hook_path_config "$repo".git/hooks/config
		else
			yes | cp -s $hook_path_config "$repo".git/hooks/config
		fi
		chmod +x "$repo".git/hooks/config
	fi
done

echo "\033[0;32m############  Done!  ############\033[0;39m"

