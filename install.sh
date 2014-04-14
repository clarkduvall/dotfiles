#!/bin/bash

git submodule update --init --recursive

shopt -s dotglob
cp -r files/* ~/.
