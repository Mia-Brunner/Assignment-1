#!/bin/sh

# make a distribution directory
mkdir -p dist

# copy Ruby files to the distribution directory
cp ./My_health_app.rb ./dist

# install required gems
gem install tty-spinner
gem install tty-prompt
gem install tty-font
gem install pastel 

#if they dont nred to update permissions just build, but if they need ro update permission chmod it then build
