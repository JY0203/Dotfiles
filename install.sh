#!/bin/bash
mkdir -p ~/.config
for d in ghostty nvim tmux; do
  ln -sfn ~/dotfiles/$d ~/.config/$d
done
