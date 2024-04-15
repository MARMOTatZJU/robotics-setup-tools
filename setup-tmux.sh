#!/bin/bash

tmux_dir=$HOME/Installations/tmux-resurrect
mkdir -p $(dirname tmux_dir)

git clone https://github.com/tmux-plugins/tmux-resurrect $(dirname tmux_dir)
cp ./.tmux.conf $HOME/
tmux source-file ~/.tmux.conf
