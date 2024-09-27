#!/usr/bin/env bash

####################
## dotfiles setup ##
####################

# vars
SUCCESS=0
FAILURE=1

DOTFILES=$(pwd)

CONFIG_DIR="$HOME/.config"

# root guard
if [[ "$EUID" = 0 ]]; then
  echo "Please do not run as root" 1>&2
  exit $FAILURE
fi

# Configs
if [[ ! -d "$CONFIG_DIR" ]]; then
  mkdir "$CONFIG_DIR"
fi

install_target() {
  TARGET=${1%/}
  if [[ $TARGET = "" ]]; then
    echo -e "\r[✗]\t$TARGET not specified"
    exit $FAILURE
  fi
  echo -en "[ ]\t$TARGET..."
  sleep 1
  TARGET_CONFIG_DIR="$CONFIG_DIR/$TARGET"
  if [[ ! -L $TARGET_CONFIG_DIR ]]; then
    if [[ ! -d $TARGET ]]; then
      echo -en "\r[✗]\t$TARGET is missing?"
    fi
    if ln -s "$DOTFILES/$TARGET" "$TARGET_CONFIG_DIR" 2>/dev/null; then
      echo -e "\r[✓]\t$TARGET linked"
    else
      echo -e "\r[✗]\t$TARGET could not be linked"
    fi
  else
    echo -e "\r[✓]\t$TARGET config already linked"
  fi
}

# install_targets
for TARGET in */; do
  if [[ $TARGET = ".*" ]]; then
    exit $FAILURE
  fi
  if [[ ! -d $TARGET ]]; then
    exit $FAILURE
  fi
  install_target "$TARGET"
done

IFS="."
for FILE in config.*; do
  read -a FILE_PARTS <<<"$FILE"
  LINK_NAME=${FILE_PARTS[1]}
  CONFIG_FILE="$HOME/.$LINK_NAME"
  if [[ ! -L $CONFIG_FILE ]]; then
    if ln -s "$DOTFILES/$FILE" "$CONFIG_FILE" 2>/dev/null; then
      echo -e "\r[✓]\t$FILE linked"
    else
      echo -e "\r[✗]\t$FILE could not be linked"
    fi
  else
    echo -e "\r[✓]\t$FILE already linked"
  fi
done
unset IFS

exit $SUCCESS
