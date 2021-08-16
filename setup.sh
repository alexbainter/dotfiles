#!/usr/bin/env bash

{
  mkdir -p ~/source
  mkdir -p ~/.config
  git clone --depth=1 https://github.com/metalex9/dotfiles.git ~/.source/dotfiles
  ln -s ~/source/dotfiles/nvim ~/.config/nvim
}
