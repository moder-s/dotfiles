#!/usr/bin/env bash

########################
## vs code extesnions ##
########################

FILE="VSCodeExtension"

while read -r EXTENSION;
do
  if [[ $EXTENSION == *"#"* ]];
  then
    continue;
  fi;
  if code --install-extension "$EXTENSION" 2>/dev/null;
  then
    echo "$EXTENSION installed"
  else
    echo "Could not install $EXTENSION"
  fi;
done < $FILE
