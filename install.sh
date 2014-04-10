#!/bin/bash

git submodule sync
git submodule update

shopt -s dotglob
cp -r files/* ~/.
