#!/usr/bin/env bash

####################
## dotfiles setup ##
####################

# vars
SUCCESS=0
FAILURE=1

DOTFILES=$(pwd)
ALACRITTY_TARGET="alacritty"

CONFIG_DIR="$HOME/.config"
ALACRITTY_CONFIG_DIR="$CONFIG_DIR/$ALACRITTY_TARGET"

# root guard
if [[ "$EUID" = 0 ]]
then
  echo "Please do not run as root" 1>&2
  exit $FAILURE 
fi

# Configs
if [[ ! -d "$CONFIG_DIR" ]]
then 
  mkdir "$CONFIG_DIR"
fi

if [[ ! -L $ALACRITTY_CONFIG_DIR ]]
then 
  if [[ ! -d $ALACRITTY_TARGET ]]
  then
    echo "Could not find alacritty configuration" 1>&2
  fi
  RESULT=$(ln -s "$DOTFILES/$ALACRITTY_TARGET" "$ALACRITTY_CONFIG_DIR")
  [[ $RESULT -ne 0 ]] && echo "Could not link alacritty" 1>&2
else
  echo "Alacritty config already linked"
fi

exit $SUCCESS
