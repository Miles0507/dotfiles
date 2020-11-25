#!/usr/bin/env bash

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "README.md" \
		--exclude "bootstrap.sh" \
		--exclude "install.sh" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

doIt;
