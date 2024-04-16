#!/bin/bash

cd ~/Downloads
miniconda_url=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
miniconda_filename=$(basename ${miniconda_url})
wget ${miniconda_url}

printf "\nQyes\n\nyes\n" | bash ./${miniconda_filename}  # TODO jump the agreement part

