#!/bin/sh
cd ~/.vim
git pull origin master
git submodule foreach git pull origin master

