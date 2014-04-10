#!/bin/bash

git submodule update

shopt -s dotglob
cp -r files/* ~/.
