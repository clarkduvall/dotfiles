#!/bin/bash

git submodule init
git submodule sync
git submodule update

shopt -s dotglob
cp -r files/* ~/.
