#!/usr/bin/bash

if [ -e '/usr/bin/ruby' ]; then
	echo "ruby installed"
else
	sudo apt install -y ruby-full
fi

check=$(gem list -i "^nomad")

if $check; then
	echo "Gem nomad installed"
else
	gem install nomad
fi
