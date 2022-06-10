#!/bin/sh
apt-get update -q -y
apt-get install -q -y jupyter-nbconvert gawk inkscape biber
make
